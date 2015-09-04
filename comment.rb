require 'open-uri'
require 'nokogiri'

class Comment

  attr_reader :user, :body

  def initialize(user, body)
    @user = user
    @body = body
  end
end

