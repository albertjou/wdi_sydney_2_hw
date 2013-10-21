class GamesController < ApplicationController

    def start
    end

    def magicball
    end

    def magicanswer
      # Random answer
      answers = [
        "It is certain",
        "Ask again later",
        "My reply is no",
        "You are not ready for the answer",
        "I have insufficient wisdom to answer that",
        "Most likely",
        "Yes",
        "No"]
      @answer = answers.sample
    end


  def magicredirect
    redirect_to "/magicball/#{params[:question].to_s.gsub(" ","%20")}"
  end

  def numberanswer
    if  Array(1..2).sample == params[:guess].to_i
      @answer = "correct"
    else
      @answer = "not correct"
    end
  end

  def rockpaper
  end

  def rockpaperselect
    @user_select = params[:answer]
    @computer_select = ["rock", "paper", "scissors"].sample
    if @user_select == @computer_select
      @result = "It's a draw"
    elsif (@user_select == "rock" && @computer_select == "scissors") || (@user_select == "paper" && @computer_select == "rock") || (@user_select == "scissors" && @computer_select == "paper")
      @result = "You win"
    else
      @result = "You lose"
    end

  end

end