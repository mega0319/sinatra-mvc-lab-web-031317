require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    user_phrase = params["user_phrase"]
    instance = PigLatinizer.new
    @final = instance.to_pig_latin(user_phrase)
    erb :results
  end
end
