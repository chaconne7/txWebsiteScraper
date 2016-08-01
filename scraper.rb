require 'rubygems'
require 'nokogiri'
require 'open-uri'

city_html = Nokogiri::HTML(open('http://www.tml.org/links_cities'))
puts city_html.class
