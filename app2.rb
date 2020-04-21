require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def menu
puts" -----------------------------------------------------------"
puts"|Bienvenue sur 'ILS VEULENT TOUS MES ROULEAUX' !            |"
puts"|Le but du jeu est d'être le dernier detenteur de rouleaux !|"
puts" -----------------------------------------------------------"
end #def menu

def player_init
	p "Qui est-on?"
	player_name = gets.chomp
	$player0 = HumanPlayer.new("#{player_name}")

	$player0.show_state
end #def play

def opponent_init
$player1 = Player.new("Josiane")
$player2 = Player.new("Jose")

end #def oppo

def choose_action
	p "_________On fait quoi?__________"
	p "t - Tâter les baguettes"
	p "r - Regarder si il y a du lait"

	p "Tenter de detruire les rouleaux de:"
	puts "0 - #{$player1.show_state}"
	puts "1 - #{$player2.show_state}"
	$choice = gets.chomp.to_s
end #def choose


def combat
enemies = []
enemies << $player1
enemies << $player2



while $player0.hitpoints > 0 && ($player1.hitpoints > 0 || $player2.hitpoints > 0) do

if $choice == "t"
	then $player0.search_weapon
elsif $choice == "r"
	then $player0.search_health_pack
elsif $choice == "0" #&& $player0.hitpoints > 0 
	then $player0.attacks($player1)
elsif $choice == "1" #&& $player0.hitpoints > 0 
	then $player0.attacks($player2)
end # if if ifif

puts "______Contrataque!_______" #pourquoi que JOsiane et pas Jose avec ?
enemies.each do |enem| 
		if enem.hitpoints > 0 
			enem.attacks($player0)
		end #do
		
	end #if
	return $choose_action

end #while

end #def combat


def perform
menu
player_init
opponent_init
while $player0.hitpoints > 0 && $player1.hitpoints > 0 || $player2.hitpoints > 0 do
choose_action
combat
$player0.show_state
puts "_________________________________________"
end #do

if $player0.hitpoints > 0 then
puts" -----------------------------------------------------------"
puts"|Bravo! Tu es le dernier detenteur de rouleaux!            |"
puts"|                                                          !|"
puts" -----------------------------------------------------------"
end #if win

if $player0.hitpoints < 0 then
puts" -----------------------------------------------------------"
puts"|T'as perdu tous tes rouleaux...                           |"
puts"|                  C'est la merde!                         !|"
puts" -----------------------------------------------------------"
end #if win
end #def perform

perform


#ne plus jamais mettre de def dans un app