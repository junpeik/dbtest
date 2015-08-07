require 'open-uri'
require 'uri'
require 'rexml/document'

class SearchesController < ApplicationController

  def home
  end

  def result
    @suggestions = create_suggestions(params[:search_word])
  end

  def saverecord
    #データベースに保存
  end

  private

    def create_suggestions(query)
      encoded_query = URI.encode(query)
      url = "http://www.google.com/complete/search?h1=ja&output=toolbar&q=#{encoded_query}"
      REXML::Document.new(open(url).read.encode('UTF-8'))
    end
end