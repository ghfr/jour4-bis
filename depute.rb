require 'nokogiri'
require 'open-uri'

def depute (url)
@tab = []
@tab2 = []
page = Nokogiri::HTML(open(url))
i = 0
j = 577

while (i < j)
@tab[i] = page.xpath("/html/body/div[1]/main/div/div/div/ul[#{i}]/li[5]/a[1]").text
@tab2[i] = @tab[i].split("@")[0]
i = i + 1
end
return @tab2
end

def affichage
i = 0
j = 577
tab3 = @tab2.zip(@tab)
while (i < j)
puts tab3[i]
i = i + 1
end
return tab3
end
url = "https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"
depute(url)
print affichage
