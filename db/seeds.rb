# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_u = User.find_or_create_by(email: 'admin@me.com') do |u|
  u.password='admin123'
  u.admin=true
end

u2 = User.find_or_create_by(email: 'just_u@me.com') do |u|
  u.password='userme123'
  u.admin=false
end

navbar_entries = [{title: "Home", url: "/"}, {title: "About Us", url: "/cms/pages/about"}, {title: "FAQ", url: "/"}, {title: "For Developers", url: "/"}]
navbar_entries.each do |entry|
  NavbarEntry.find_or_create_by(title: entry[:title]) do |rec|
    rec.url=entry[:url]
  end
end

ServiceUseMode.find_or_create_by(name: "app")
ServiceUseMode.find_or_create_by(name: "service")
ServiceUseMode.find_or_create_by(name: "web")

tag_names = %w(safety justice wellbeing)
tag_names.each do |t_name|
  Tag.find_or_create_by(name: t_name) do |t|
    t.slug="/#{t_name}"
  end
end

apps = [{title: 'Guardly', description: 'Guardly is designed to turn your mobile phone into a personal emergency device. Whether you\'re working late alone in your office, walking to your car at night or even taking a run on your college campus, Guardly provides you nearly instant access to emergency services.<p/>If you\'re in a crisis situation, you simply tap your Guardly app and your phone turns into a GPS system - allowing your predetermined safety group of friends, family, neighbors, police or campus security to track your location and assist you.<p/>Guardly can also be used as an emergency beacon and to locate emergency contacts that are close to you during a crisis.<p/>The Guardly app not only allows you to feel safe in dangerous situations, but also provides opportunities for you to be a good neighbor to your loved ones.'},
        {title: 'Circle of 6', description: 'Designed to prevent violence before it happens, Circle of 6 connects you to a group of your closest friends to keep you safe.<p/>If you\'re feeling unsafe on a date, afraid of riding home with a drunk driver or just feeling nervous about walking to your car alone at night, you can alert your Circle of 6 friends to your location and ask for their help.<p/>The app is designed discreetly so that icons representing its functions do not alert those around you that you\'re reaching out for assistance.<p/>Circle of 6 was the winner of the White House/Health and Human Services Resources Against Abuse Technology Challenge and the Winner of the Institute of Medicine/Avon Foundation for Women\'s End Violence @Home Challenge.<p/>Including friends in your Circle and being willing to be a part of theirs is a great way to love your neighbor!'},
        {title: 'Watch Over Me', description: 'If you\'ve ever called a friend while walking home alone, Watch Over Me is for you. You simply tell the app how long you would liked to be watched over and the app will track your location every minute during that timeframe.<p/>If you don\'t engage with the app when the time you\'ve set is up, the app notifies your friends immediately with your location and sends them a video capture from your smartphone so they can be aware of your situation. You can also trigger an alarm by shaking your phone when the app is launched to immediately alert your emergency contacts.<p/>Watch Over Me provides an easy option for those who want an extra dose of comfort when walking alone or who frequently run alone at night or early in the morning.'},
        {title: 'MyForce', description: 'MyForce is a personal safety app that connects you instantly to a trained security agent if you\'re ever feeling unsafe.<p/>You simply activate your MyForce app when you\'re in an unsettling situation and press the alert button if you\'re in crisis. The app immediately informs a live MyForce security agent who activates the microphone and camera on your phone and can listen, record and track you in order to send you the proper help.<p/>Though the app is paid, it provides a 30 day free trial and offers continual peace of mind to its subscribers who know that help is only a tap away on their phones.'},
        {title: "RAINN", description: 'The Rape, Abuse & Incest National Network (RAINN) operates national hotlines for victims of sexual violence but has also created an online application that allows victims to quickly search for resources and help available where they live.<p/?RAINN links to resources that can provide support and information about individual or group counseling, medical attention, reporting a crime to law enforcement and many other services. The application also includes a map that contains the locations of each service.'},
        {title: 'OnWatch', description: 'OnWatch is an app that lets you share critical information by phone, email, text and social media to your support network. You can check in with friends to let them know you\'re safe after walking home, call 911 or campus police and set timers that send emergency communications to your loved ones if you don\'t arrive on time.<p/>OnWatch also provides resources for individuals dealing with sexual assault, dating violence or domestic abuse.<p/>OnWatch was also a winner of the White House/Health and Human Services Apps Against Abuse Technology Challenge.'},
        {title: 'bSafe', description: 'bSafe uses GPS tracking and emergency contacts to help you feel safe in nearly any situation. By adding friends to your list of “guardians,” you automatically become one of their guardians as well and can do everything from ask them to virtually walk you home by tracking your GPS location to having them fake call to get you out of an awkward date.<p/>bSafe allows you to set timers while you\'re walking or jogging and alerts your loved ones if you haven\'t arrived safely to your destination by the time you listed. Once an alarm is triggered, the app immediately shares your location with your guardians and begins recording video of your situation.<p/>The app also has a useful check-in feature that allows you to tell your friends where you are without posting to social media.'},
        {title: 'KiteString', description: 'KiteString is a mobile website that sends you free text messages to make sure you\'re safe in any situation. All you have to do is create an account on the website with your full name and phone number, add an emergency contact and respond to the text message sent to your phone with the length of time you would like to be watched over.<p/>Once that time has elapsed, KiteString will send you another text message asking you to check in and will send a text message to your emergency contact if you are unable to do so. It\'s quick, free and doesn\'t even require a smartphone!'},
        {title: '1800 Victims', description: 'A product of The Victims of Crime Resource Center in Sacramento, 1800 Victims is a mobile website and hotline that connects victims with McGeorge law students and links to resources around California that can help victims get the help they need.<p/>The website allows users to input their zip code or select their county and then view a list of resources available in their area. The site provides links and phone numbers to these services and also has a live online chat that can be used to direct you to the right resources.'},
        {title: 'Crime Push', description: 'Crime Push allows users to report crimes with included evidence directly to local authorities. If you witness a crime, you simply click an icon, enter a description of the crime and include whatever photo, video or audio evidence you may have collected. This ensures that police and law enforcement officials have direct access to evidence that can help in their investigations.<p/>The app also includes safety features like check-ins with family and friends, distress messaging to emergency contacts and shake alerts that connect you directly to 911 emergency services.'},
        {title: 'Live Safe', description: 'Live Safe is designed to keep both you and your community safe. The app provides opportunities for you to report crime tips, call emergency services if you\'re in danger, view crime reports in your community, receive safety broadcasts in your area or ask friends or loved ones to watch over you while you walk home alone.<p/>The app also includes features to allow you to report specific crimes and take photo, video or audio evidence of those crimes to send directly to law enforcement officials. Some colleges and universities even use the app to send safety alerts to their students!'},
        {title: 'Vine Link', description: 'Vine (Victim Information and Notification Everyday) Link is the online version of the National Victim Notification Network. This website and mobile app allows victims to obtain information about criminal cases and custody statuses of their offenders 24 hours a day.<p/>Both the mobile app and website allow you to select your state, the name or identification number of the offender you want to track and register to receive alerts as soon as their legal status changes.'},
        {title: 'California Victims Services (CalVCP)', description: 'The California Victim Compensation Program (CalVCP) offers financial help to victims of certain violent crimes. Victims of crime who have been injured or have been threatened with injury may be eligible for help and can access CalVCP\'s resources through their web application.<p/>he app allows you to choose your county, view the resources available, access phone numbers and email addresses for certain services and even view documents designed to walk you through the process of getting the help you need.'},
        {title: 'DoD Safe Helpline', description: 'The DoD Safe Helpline app gives members of the military community access to resources and tools to help manage the short- and long-term effects of sexual assault.<p/>The app helps you create an individualized self-care plan that includes exercises that aid in reducing stress, tools to help you transition to civilian life. You can store your customized plans and exercises so you can refer back to them and you can chat online or via phone with trained sexual assault professionals at any time.'},
        {title: 'PTSD Coach', description: 'PTSD Coach was designed for individuals who have, or may have, Posttraumatic Stress Disorder (PTSD). This app provides users with education about PTSD, information about professional care, a self-assessment for PTSD, opportunities to find support, and tools that can help users manage the stresses of daily life with PTSD.<p/>Tools range from relaxation skills and positive self-talk to anger management and other common self-help strategies. Users can customize tools based on their preferences and can integrate their own contacts, photos, and music. This app can be used by people who are in treatment as well as those who are not.'},
        {title: 'Homeless REACH', description: 'The Homeless REACH app was designed to assist caregivers as they provide information about social services and free resources to the homeless. The app and accompanying website contain information about transportation, housing, food, employment, legal and health resources available to the homeless.<p/>Created in partnership with the VA, the app also includes resources available to those who served in the US armed forces.'},
        {title: 'Safe Night', description: 'Still in its early stages, Safe Night is an application that gives donors an opportunity to give victims of domestic violence a safe place to stay when local crisis centers or shelters are out of beds.<p/>Once donors download the app and set up their profiles, they receive alerts when someone needs a safe place to stay. The app lets them make an immediate donation to pay for a hotel room for the person in need.<p/>Donors have the ability to choose which shelters they would like to support and how often they are comfortable being contacted.'},
        {title: 'Link SF', description: 'Link-SF is San Francisco\'s first mobile-optimized website that connects homeless and low-income residents with critical and life-saving resources nearby. The app focuses on basic services such as food, shelter, medical care, hygiene services, and technology access and ensures that the information it provides is up-to-date to ensure people seeking help are directed to the right places.<p/>This web application allows service providers to collect data about which services are most important to people in need and neighbors to access the right information when directing others to help.'},
        {title: 'Aunt Bertha', description: 'Developed by our friends at Code for America, Aunt Bertha has been making human services information accessible to people and programs since 2010.<p/>This mobile application allows you to input your zip code, then select from the available resources in your area based on topics. Aunt Bertha pulls together health, financial, housing, food, emergency, legal, care and many other resources and, through tagging, allows you to quickly access the the services you\'re looking for.'}]


apps.each do |a|
  WebService.find_or_create_by(title: a[:title]) do |row|
    row.description = a[:description]
  end
end

# Build the related resources

relationships =
  {
  'Guardly' => {rr: ['MyForce', 'Watch Over Me'], tags: ['safety'], st: ['app']},
  'Circle of 6' => {rr: ['KiteString', 'bSafe', 'OnWatch', 'Watch Over Me'], tags: ['safety'], st: ['app']},
  'Watch Over Me' => {rr: ['KiteString', 'Circle of 6', 'OnWatch', 'bSafe'], tags: ['safety'], st: ['app']},
  "MyForce" => {rr: ['KiteString', 'Circle of 6', 'OnWatch', 'bSafe'], tags: ['safety'], st: ['app', 'service']},
  'OnWatch' => {rr: ['KiteString', 'Circle of 6', 'OnWatch', 'bSafe'], tags: ['safety'], st: ['app']},
  'bSafe' => {rr: ['KiteString', 'Circle of 6', 'OnWatch', 'bSafe'], tags: ['safety'], st: ['app']},
  'KiteString' => {rr: ['MyForce', 'Circle of 6', 'OnWatch', 'bSafe', 'Guardly'], tags: ['safety'], st: ['web']},
  '1800 Victims' => {rr: ['California Victims Services (CalVCP)', 'RAINN'], tags: ['justice'], st: ['app']},
  'Crime Push' => {rr: ['Live Safe', 'Guardly', 'bSafe', 'OnWatch', 'Watch Over Me'], tags: ['safety', 'justice'], st: ['app']},
  'Live Safe' => {rr: ['Crime Push', 'Guardly', 'bSafe', 'OnWatch', 'Watch Over Me'], tags: ['safety', 'justice'], st: ['app']},
  'Vine Link' => {rr: ['Crime Push', 'Live Safe'], tags: ['justice'], st: ['app']},
  'California Victims Services (CalVCP)' => {rr: ['RAINN', '1800 Victims'], tags: ['justice'], st: ['app']},
  'RAINN' => {rr: ['1800 Victims', 'California Victims Services (CalVCP)'],  tags: ['justice'], st: ['app']},
  'DoD Safe Helpline' => {rr: ['PTSD Coach', 'Aunt Bertha'],  tags: ['wellbeing'], st: ['app']},
  'PTSD Coach' => {rr: ['Homeless REACH'], tags: ['wellbeing'], st: ['app']},
  'Homeless REACH' => {rr: ['Link SF', 'Safe Night'], tags: ['wellbeing'], st: ['app']},
  'Safe Night' => {rr: ['Link SF', 'Homeless REACH'], tags: ['wellbeing'], st: ['app']},
  'Link SF' => {rr: ['Safe Night', 'Homeless REACH', 'Aunt Bertha'], tags: ['wellbeing'], st: ['app']},
  'Aunt Bertha' => {rr: ['Safe Night', 'Homeless REACH', 'Aunt Bertha', 'Link SF']}
}

# Load up all the relationships from the keys in the above array

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
