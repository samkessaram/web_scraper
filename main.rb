require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'post'
require_relative 'comment'

# doc = Nokogiri::HTML(File.open('post.html'))
url = ARGV[0]

post = Post.new(url)

puts "Title: #{post.title[0]}".colorize(:red)
puts "Points: #{post.points[0]}".colorize(:blue)
puts "Comments: #{post.comments.length}".colorize(:green)



