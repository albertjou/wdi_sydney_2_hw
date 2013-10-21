Routegame::Application.routes.draw do

  root :to => 'games#start'

  get '/magicball' => 'games#magicball'

  get '/magicball/:question' => 'games#magicanswer'

  post '/magicball/answer' => 'games#magicredirect'

  get '/numbergame' => 'games#numbergame'

  get '/numbergame/:guess' => 'games#numberanswer'

  get '/rockpaperscissors' => 'games#rockpaper'

  get 'rockpaperscissors/:answer' => 'games#rockpaperselect'


end
