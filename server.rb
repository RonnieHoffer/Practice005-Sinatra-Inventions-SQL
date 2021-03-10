require 'sinatra'
require_relative 'invention'

# alpha = Invention.create(:name => "Steam Pump", :inventor => "Thomas Savery", :year => 1712)
# bravo = Invention.create(:name => "High-pressure piston steam engine", :inventor => "Jacob Leupold", :year => 1720)
# charlie = Invention.create(:name => "Electrical defibrillator", :inventor => "Dr. Albert Hyman", :year => 1933)
# delta = Invention.create(:name => "Ball bearing", :inventor => "Philip Vaughan", :year => 1794)


get '/inventions' do
    @inventions = Invention.all
    erb :inventions
end




get '/addInvention' do
    erb :add_invention
end

post '/createInvention' do
    Invention.create(name: params["name"], inventor: params["inventor"], year: params["year"])
    redirect to ("/inventions")
end




get '/editInvention' do
    id = params["inventionID"]
    @invention = Invention.find(id)
    erb :edit_invention
end

post '/updateInvention/:id' do
    invention_to_update = Invention.find(params[:id])
    invention_to_update.name = params["name"]
    invention_to_update.inventor = params["inventor"]
    invention_to_update.year = params["year"]
    invention_to_update.save
    
    redirect to ("/inventions")
end




get '/deleteInvention' do
    id = params["inventionID"]
    invention_to_delete = Invention.find(id)
    invention_to_delete.destroy

    redirect to ("/inventions")
end