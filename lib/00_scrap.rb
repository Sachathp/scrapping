require 'nokogiri'
require 'open-uri'

page=Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


names = page.xpath('//a[contains(@class, "cmc-table__column-name--name")]').map(&:text)
prices = page.xpath('//td[contains(@class, "cmc-table__cell--sort-by__price")]//div/span').map(&:text)




def array (names, prices)
    result = Hash[names.zip(prices)]
    result.each do |names, prices|
        puts "#{names}: #{prices}"
    end
end 

array(names, prices) 