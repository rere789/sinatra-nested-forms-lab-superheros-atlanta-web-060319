
require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :super_hero
    end 

    post '/team' do
        super_team = params[:team] 
        @team = Team.new(super_team[:name], super_team[:motto])

        super_heros = params[:team][:members]
        super_heros.each do |hero|
            # hero == {"name"=>"ccc", "power"=>"ddd", "bio"=>"eee"}
            name = hero[:name]
            power = hero[:power]
            bio = hero[:bio]
            SuperHero.new(name, power, bio)
        end
        redirect  '/test'
    end 

    get '/test' do
        @superheros = SuperHero.all
        erb :team
    end

end
