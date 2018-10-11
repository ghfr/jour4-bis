require 'nokogiri'
require 'open-uri'

def tradeur_de_l_obscur
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
price = page.xpath('//a[@class = "price"]').map{|e|e.text}
name = page.xpath('//a[@class = "currency-name-container link-secondary"]').map{|e|e.text}
x = 0
y = price.length
tab = []
while (x < y)
result = Hash.new
result[name[x]] = price[x]
tab[x] = result
x = x + 1
end
return tab
end

print tradeur_de_l_obscur
