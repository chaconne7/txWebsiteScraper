require 'rubygems'
require 'Nokogiri'
require 'open-uri'
require 'csv'


city_html = Nokogiri::HTML(open('http://www.tml.org/links_cities'))

county_html = Nokogiri::HTML(open('https://www.county.org/about-texas-counties/county-websites/Pages/default.aspx'))


cities = city_html.css('p').css('a')
counties = county_html.css('.underlinelink')

CSV.open("txIssuerWebsites.csv", "wb") do |csv|
  csv << ["type", "name", "link"]
  
  cities.each do |city|
    csv << ["city", city.text, city['href']]
  end

  counties.each do |county|
    csv << ["county", county.text, county['href']]
  end
end


