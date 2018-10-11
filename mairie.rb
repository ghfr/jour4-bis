require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


def get_all_the_urls_of_val_doise_townhalls (url)
page = Nokogiri::HTML(open(url))
x = 0
j = 185
tab = [""]
tab2 = [""]
while (x < j)
	adresse = page.css('a.lientxt')[x]['href']
	tab[x] = adresse
	tab [x] = tab[x].sub(".", "http://annuaire-des-mairies.com")
	x = x + 1
end
return tab
end



def get_the_email_of_a_townhal_from_its_webpage (url)
	x = 0
	tab2 = get_all_the_urls_of_val_doise_townhalls (url)
	tab = []
while (x < 185)
	email = Nokogiri::HTML(open(tab2[x]))
	tab[x] = email.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
	puts tab[x]
	x = x + 1
end
return tab
end

url = "http://annuaire-des-mairies.com/val-d-oise.html"
puts get_the_email_of_a_townhal_from_its_webpage(url)
