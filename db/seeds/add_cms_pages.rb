# Reset the CMS

Page.all.each { |p| p.delete } 
PageAttribute.all.each { |p| p.delete } 

attr = PageAttribute.create(key: 'main_content', value: 'Get Through This is a project of Serving California and Californians for Safety and Justice, two organizations that seek to create this partnership between technologists and people in need.')
p = Page.create(slug: 'about')
p.page_attributes << attr

attr = PageAttribute.create(key: 'main_content', value: 'More details about trauma.')
p = Page.create(slug: 'what-is-trauma')
p.page_attributes << attr
