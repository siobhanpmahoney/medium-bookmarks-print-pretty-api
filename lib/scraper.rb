require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def create_url_array
    page_1 = File.read("../../bookmarks-0001.html")
    page_2 = File.read("../../bookmarks-0002.html")
    page_3 = File.read("../../bookmarks-0003.html")
    page_4 = File.read("../../bookmarks-0004.html")
    page_5 = File.read("../../bookmarks-0005.html")
    @all_links = []
    [page_1, page_2, page_3, page_4, page_5].map do |page|
      @all_links.concat(Nokogiri::HTML(page).css("a.h-cite").map { |link| link['href'] })
    end
  end

  def print_first_uri
    first_page = @all_links[0]
    Nokogiri::HTML(open(first_page)).css("div.sectionLayout--insetColumn").inner_html
  end

  def run
    create_url_array
    print_first_uri
    binding.pry
    puts "hi"
  end

end

Scraper.new.run
