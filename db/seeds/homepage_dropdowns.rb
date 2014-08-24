# Set all suggested searches to be tag searches

inputs = [['Support groups', 'wellbeing+recovery'],
          ['Keeping safe', 'safety'],
          ['Safe housing', 'safety'],
          ['Dealing with emotions', 'recovery+wellbeing'],
          ['Getting therapy', 'recovery+wellbeing'],
          ['What can I do to help a victim', 'volunteer'],
          ['Finding medical help', 'wellbeing'],
          ['Financial assistance', 'justice'],
          ['Legal advice', 'justice'],
          ['Reporting a crime', 'justice']]

inputs.each do |sugg_query|
  SearchDropdown.find_or_create_by(shown_query: sugg_query[0]) do |dd|
    dd.ran_query = sugg_query[1]
    dd.ran_query_type = 'tag'
    dd.save
  end
end
