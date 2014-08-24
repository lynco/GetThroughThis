tag_names = %w(safety justice wellbeing trauma stress ptsd volunteer recovery)
tag_names.each do |t_name|
  Tag.find_or_create_by(name: t_name) do |t|
    t.slug="/#{t_name}"
    t.save
  end
end

# Build the related resources

relationships =
  {
  'Guardly' => {rr: ['MyForce', 'Watch Over Me'], tags: ['safety'], st: ['app']},
  'Circle of 6' => {rr: ['KiteString', 'bSafe', 'OnWatch', 'Watch Over Me'], tags: ['safety', 'stress', 'trauma'], st: ['app']},
  'Watch Over Me' => {rr: ['KiteString', 'Circle of 6', 'OnWatch', 'bSafe'], tags: ['safety'], st: ['app']},
  "MyForce" => {rr: ['KiteString', 'Circle of 6', 'OnWatch', 'bSafe'], tags: ['safety', 'stress', 'trauma'], st: ['app', 'service']},
  'OnWatch' => {rr: ['KiteString', 'Circle of 6', 'OnWatch', 'bSafe'], tags: ['safety'], st: ['app']},
  'bSafe' => {rr: ['KiteString', 'Circle of 6', 'OnWatch', 'bSafe'], tags: ['safety', 'stress', 'trauma'], st: ['app']},
  'KiteString' => {rr: ['MyForce', 'Circle of 6', 'OnWatch', 'bSafe', 'Guardly'], tags: ['safety'], st: ['web']},
  '1800 Victims' => {rr: ['California Victims Services (CalVCP)', 'RAINN'], tags: ['justice', 'ptsd', 'stress', 'trauma'], st: ['app']},
  'Crime Push' => {rr: ['Live Safe', 'Guardly', 'bSafe', 'OnWatch', 'Watch Over Me'], tags: ['safety', 'justice', 'stress', 'trauma'], st: ['app']},
  'Live Safe' => {rr: ['Crime Push', 'Guardly', 'bSafe', 'OnWatch', 'Watch Over Me'], tags: ['safety', 'justice'], st: ['app']},
  'Vine Link' => {rr: ['Crime Push', 'Live Safe'], tags: ['recovery', 'justice'], st: ['app']},
  'California Victims Services (CalVCP)' => {rr: ['RAINN', '1800 Victims'], tags: ['justice', 'ptsd', 'stress', 'trauma'], st: ['app']},
  'RAINN' => {rr: ['1800 Victims', 'California Victims Services (CalVCP)'],  tags: ['justice', 'ptsd', 'stress', 'trauma'], st: ['app']},
  'DoD Safe Helpline' => {rr: ['PTSD Coach', 'Aunt Bertha'],  tags: ['recovery', 'wellbeing', 'ptsd', 'stress', 'trauma'], st: ['app']},
  'PTSD Coach' => {rr: ['Homeless REACH'], tags: ['wellbeing', 'volunteer', 'ptsd'], st: ['app']},
  'Homeless REACH' => {rr: ['Link SF', 'Safe Night'], tags: ['volunteer', 'wellbeing', 'ptsd', 'stress', 'trauma'], st: ['app']},
  'Safe Night' => {rr: ['Link SF', 'Homeless REACH'], tags: ['wellbeing', 'volunteer'], st: ['app']},
  'Link SF' => {rr: ['Safe Night', 'Homeless REACH', 'Aunt Bertha'], tags: ['wellbeing', 'ptsd', 'stress', 'trauma'], st: ['app']},
  'Aunt Bertha' => {rr: ['Safe Night', 'Homeless REACH', 'Aunt Bertha', 'Link SF'], tags: ['ptsd', 'stress', 'trauma']}
}

# Load up all the relationships from the keys in the above array - this loop is idempotent.

relationships.each do |key, relationships_list|
  w1 = WebService.find_by title: key
  relationships_list.each do |rel_type, rel_info_list|
    if rel_type == :rr then
      rel_info_list.each do |res_name|
        w2 = WebService.find_by title: res_name
        unless w1.related_resources and w1.related_resources.include?(w2) 
          w1.related_resources << w2
        end
      end
    elsif rel_type == :tags then
      rel_info_list.each do |tag_name| 
        w2 = Tag.find_by name: tag_name
        unless w1.tags and w1.tags.include?(w2) 
          w1.tags << w2
        end
      end
    elsif rel_type == :st then
      rel_info_list.each do |st_name|
        w2 = ServiceUseMode.find_by name: st_name
        unless w1.service_use_modes and w1.service_use_modes.include?(w2) 
          w1.service_use_modes << w2
        end
      end
    end        
  end
end
