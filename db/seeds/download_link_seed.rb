x=WebService.find_by_title('Guardly')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/guardly/id400742014?mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=ca.mobicartel.guardly&hl=en', link_type: 'Google Play')
x=WebService.find_by_title('Circle of 6')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/circleof6/id507735256?mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=com.circleof6&hl=en', link_type: 'Google Play')
x=WebService.find_by_title('Watch Over Me')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/watch-over-me-personal-safety/id431208868?mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=com.secqme.client.andrioid&hl=en', link_type: 'Google Play')
x=WebService.find_by_title('MyForce')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/myforce/id405578714?mt=8', link_type: 'iOS')
x=WebService.find_by_title('OnWatch')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/onwatch-personal-safety-app/id473517240?mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=com.onwatch&hl=en', link_type: 'Google Play')
x=WebService.find_by_title('bSafe')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/bsafe-personal-safety-app/id459709106?mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=com.bipper.app.bsafe&hl=en', link_type: 'Google Play')
x=WebService.find_by_title('KiteString')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'http://www.kitestring.io/', link_type: 'Website')
x=WebService.find_by_title('1800 Victims')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'http://www.1800victims.org/', link_type: 'Website')
x=WebService.find_by_title('Crime Push')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=crimepush.security&hl=en', link_type: 'Google Play')
x=WebService.find_by_title('Live Safe')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/livesafe/id653666211?ls=1&mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=com.livesafe.activities&hl=en', link_type: 'Google Play')
x=WebService.find_by_title('Vine Link')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/vinemobile/id625472495?mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=com.appriss.vinemobile', link_type: 'Google Play')
x=WebService.find_by_title('RAINN')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'http://centers.rainn.org/', link_type: 'Website')
x=WebService.find_by_title('DoD Safe Helpline')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/dod-safe-helpline/id536773115?mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=org.rainn.SafeHelpline', link_type: 'Google Play')
x=WebService.find_by_title('PTSD Coach')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/ptsd-coach/id430646302?mt=8&ign-mpt=uo%3d2', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=gov.va.ptsd.ptsdcoach&hl=en', link_type: 'Google Play')
x=WebService.find_by_title('Homeless REACH')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/us/app/homeless-reach/id566299385?ls=1&mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=com.qbase.reach.android', link_type: 'Google Play')
x.download_urls << DownloadUrl.new(url: 'http://www.homelessreach.info/reach/webapp/public/web/search.xhtml', link_type: 'Website')
x=WebService.find_by_title('Safe Night')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'https://itunes.apple.com/US/app/id835672659?mt=8', link_type: 'iOS')
x.download_urls << DownloadUrl.new(url: 'https://play.google.com/store/apps/details?id=com.caravan.safenight', link_type: 'Google Play')
x=WebService.find_by_title('Link SF')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'http://www.link-sf.com/', link_type: 'Website')
x=WebService.find_by_title('Aunt Bertha')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'http://www.auntbertha.com/', link_type: 'Website')
x=WebService.find_by_title('California Victims Services (CalVCP)')
x.download_urls.each { |du| du.delete }
x.download_urls << DownloadUrl.new(url: 'http://vcgcb.ca.gov/victims/', link_type: 'Website')
