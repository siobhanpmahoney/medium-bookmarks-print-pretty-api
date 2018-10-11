# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'

# page_1 = open("file:///Users/siobhanpmahoney/Desktop/medium-export/bookmarks/bookmarks-0001.html")
# page_1 = File.read("file:///Users/siobhanpmahoney/Desktop/medium-export/bookmarks/bookmarks-0001.html")
page_1 = File.read("../bookmarks-0001.html")
page_2 = File.read("../bookmarks-0002.html")
page_3 = File.read("../bookmarks-0003.html")
page_4 = File.read("../bookmarks-0004.html")
page_5 = File.read("../bookmarks-0005.html")
all_links = []

[page_1, page_2, page_3, page_4, page_5].map do |page|
   all_links.concat(Nokogiri::HTML(page).css("a.h-cite").map { |link| link['href'] })
end

first_page = all_links[0]

Nokogiri::HTML(open(first_page)).css("div.section-inner .sectionLayout--insetColumn")

all_links.length

# doc_1 = Nokogiri::HTML(page_1)
