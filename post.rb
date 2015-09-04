require 'open-uri'
require 'nokogiri'
require_relative 'comment.rb'

class Post

  attr_reader :title, :points, :item_id, :comments, :noko_url, :users, :fusion

  @@comments_with_users = []

  def initialize(url)
    @noko_url = Nokogiri::HTML(open(url))
    @title = @noko_url.css('.title > a:nth-child(2)').map { |x| x.inner_text}
    @points = @noko_url.search('.subtext > span:first-child').map { |span| span.inner_text}
    @item_id = @noko_url.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
    @comments = extract_comments
    @users = extract_users
    @fusion = fusion
  end 

  

  def extract_users
    users = @noko_url.search('.comhead > a:first-child').map do |element|
    element.inner_text
    end
    return users
  end



  def extract_comments
    comments = @noko_url.search('.c00').map do |com|
    com.inner_text
    end
  end

  def add_comment(comment_obj)
    @comments << comment_object
  end

  def fusion
    @comments.each_with_index do |comment, i|
      @users[i]
      com_obj = Comment.new(@users[i],comment)
      @@comments_with_users<<com_obj
    end
      @@comments_with_users
  end
end



