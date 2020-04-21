require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

class Game

	attr_accessor :human_player, :enemies
	@@enemies = []

def initialize
	@human_player = HumanPlayer.new(human_player)

	@@enemies << Player.new("Jose", "Josiane", "Gilbert", "Gertrude")
	my_game = Game.new("Albert")

	p "Qui est-on?"
	player_name = gets.chomp
	@player0 = HumanPlayer.new("#{player_name}")

	@player0.show_state
end #def init

# def player_init
# 	p "Qui est-on?"
# 	player_name = gets.chomp
# 	$player0 = HumanPlayer.new("#{player_name}")

# 	$player0.show_state
# end #def play

def kill_player(isdead)
	@@enemies.delete(isdead)
end #def kill

def is_still_going?
	if @human_player.hitpoints > 0
		then true
	end #if
end #def is_still

def show_players
	@human_player.show_state
	p @@enemies.count
end



def menu
puts" -----------------------------------------------------------"
puts"|Bienvenue sur 'ILS VEULENT TOUS MES ROULEAUX' !            |"
puts"|Le but du jeu est d'être le dernier detenteur de rouleaux !|"
puts" -----------------------------------------------------------"
	p "_________On fait quoi?__________"
	p "t - Tâter les baguettes"
	p "r - Regarder si il y a du lait"

	p "Tenter de detruire les rouleaux de:"
	puts "0 - #{@player1.show_state}"
	puts "1 - #{@player2.show_state}"

end #def menu

def choose_action
	@choice = gets.chomp.to_s
end #def choose


def enemies_attack
puts "______Contrataque!_______" #pourquoi que JOsiane et pas Jose avec ?
@@enemies.each do |enem| 
		if enem.hitpoints > 0 
			enem.attacks(@player0)
		end #do
		
	end #if
	return $choose_action
end #def enemi


def the_end
	if @player0.hitpoints > 0 then
puts" -----------------------------------------------------------"
puts"|Bravo! Tu es le dernier detenteur de rouleaux!            |"
puts"|                                                          !|"
puts" -----------------------------------------------------------"
end #if win

	if @player0.hitpoints < 0 then
puts" -----------------------------------------------------------"
puts"|T'as perdu tous tes rouleaux...                           |"
puts"|                  C'est la merde!                         !|"
puts" -----------------------------------------------------------"
end #if win
end #def the_end




# def opponent_init
# @player1 = Player.new("Josiane")
# @player2 = Player.new("Jose")

# end #def oppo




def combat
enemies = []
enemies << @player1
enemies << @player2



while @player0.hitpoints > 0 && (@player1.hitpoints > 0 || @player2.hitpoints > 0) do

if @choice == "t"
	then @player0.search_weapon
elsif @choice == "r"
	then @player0.search_health_pack
elsif @choice == "0" #&& $player0.hitpoints > 0 
	then @player0.attacks(@player1)
elsif @choice == "1" #&& $player0.hitpoints > 0 
	then @player0.attacks(@player2)
end # if if ifif

end #while

end #def combat


# def perform
# menu
# player_init
# opponent_init
# while @player0.hitpoints > 0 && @player1.hitpoints > 0 || @player2.hitpoints > 0 do
# choose_action
# combat
# @player0.show_state
# puts "_________________________________________"
# end #do


end #def perform


end #class Game
