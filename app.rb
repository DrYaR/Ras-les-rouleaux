require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("Jose")

player1.show_state
player2.show_state

while player1.hitpoints > 0 && player2.hitpoints > 0 do

puts "______Le combat commence!_______"
if player1.hitpoints > 0 then
player1.attacks(player2)
end #if
if player2.hitpoints > 0 then
player2.attacks(player1)
end #if

puts "_________Etat des lieux_________"
player1.show_state
player2.show_state

if player1.hitpoints <= 0 then p "#{player1.name} a perdu tous ses rouleaux" end #if

if player1.hitpoints < 0 then p "Dur-dur: #{player1.name} a pas perdu que des rouleaux"
end #if

if player2.hitpoints <= 0 then p "#{player2.name} a perdu tous ses rouleaux" end #if

if player2.hitpoints < 0 then p "Dur-dur: #{player2.name} a pas perdu que des rouleaux"
end #if



end #while

# binding.pry
# "Zog zog"