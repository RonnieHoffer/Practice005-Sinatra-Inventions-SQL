gem 'activerecord', '=4.2.10' #specify this if you are not using the latest version ( the whole line)
require 'active_record'
require 'mini_record'

puts "Hello-1"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'inventions.sqlite3') #establish the connection

puts "Hello-2"

class Invention < ActiveRecord::Base
    field :name, as: :string
    field :inventor, as: :string
    field :year, as: :integer
end

Invention.auto_upgrade!

# alpha = Invention.create(:name => "Steam Pump", :inventor => "Thomas Savery", :year => 1712)
# bravo = Invention.create(:name => "High-pressure piston steam engine", :inventor => "Jacob Leupold", :year => 1720)
# charlie = Invention.create(:name => "Electrical defibrillator", :inventor => "Dr. Albert Hyman", :year => 1933)
# delta = Invention.create(:name => "Ball bearing", :inventor => "Philip Vaughan", :year => 1794)
