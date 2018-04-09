require 'open-uri'
# require 'J-SON'

class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10)
  end

  def score
    @word = (params[:word]).upcase
    @letters = params[:letters]
    @dico = dico(@word)
    @from_grid = from_grid(@word, @letters)

  end

  private

  def dico(word)
    dixo = open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(dixo.read)
    json["found"] == true
  end

  def from_grid(word, letters)
    # @letters.include?@word.split("")
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

end
