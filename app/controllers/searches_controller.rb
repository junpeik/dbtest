require 'open-uri'
require 'uri'
require 'rexml/document'

class SearchesController < ApplicationController

  def home
    @searched_words = Search.all
  end

  def result
    @search_word = params[:search_word]
    @suggestions = create_suggestions(params[:search_word])
  end

  def saverecord
    searched_word = params[:searched_word]
    @words = params[:suggested_words].split("/")
    Search.create(search_word: searched_word, rel1: @words[0], rel2: @words[1], rel3: @words[2], rel4: @words[3], rel5: @words[4])
  end

  private

    def create_suggestions(query)
      encoded_query = URI.encode(query)
      url = "http://www.google.com/complete/search?h1=ja&output=toolbar&q=#{encoded_query}"
      REXML::Document.new(open(url).read.encode('UTF-8'))
    end
end