require 'rubygems'
require 'Nokogiri'
require 'open-uri'
require 'csv'

city_html = Nokogiri::HTML(open('http://www.tml.org/links_cities'))

cities = city_html.css('p').css('a')
CSV.open("txIssuerWebsites.csv", "wb") do |csv|
  csv << ["type", "name", "link"]
  cities.each do |city|
    puts city.text
    puts city['href']
    csv << ["city", city.text, city['href']]
  end
end


