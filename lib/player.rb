require "pry"

class Player

attr_accessor :name, :hitpoints
#@@enemies = []

def initialize (namen)
@name = namen
@hitpoints = hitpoints
@hitpoints = 10
#@@enemies << self
end # def init


def show_state
	"#{name} a #{@hitpoints} rouleaux" 
end #def show

def gets_damage(damage)
	@hitpoints = @hitpoints - damage
end #def gets


def attacks(namen)
	attack = compute_damage

	puts "X #{self.name} attaque #{namen.name}" #(#{attack})
	namen.gets_damage(attack)
	p "Rouleaux detruits par #{self.name} #{attack}"

end #def atta


def compute_damage
	return rand(1..6)
end #def comp


end #class



class HumanPlayer < Player
	attr_accessor :weapon_level

def initialize(name)
	@name = name
	@hitpoints = hitpoints
	@hitpoints = 100
	@weapon_level = 1
end #def init

def compute_damage
	return rand(1..6) * @weapon_level
end #def comp

def show_state
	p "#{name} a #{@hitpoints} rouleaux et une baguette de niveau #{@weapon_level}"
end # def show


def search_weapon
	p "On va tâter les baguettes!"
	@weapon_level = @weapon_level.to_i
	@new_weapon = rand(1..6)
	if @new_weapon > @weapon_level then @weapon_level = @new_weapon #&& (p "Cette baguette parrait plus solide")
	p "Cette baguette parrait plus solide"
	else p "Pas de baguette plus solide dans ce panier"
	end #if
end #def sear

def search_health_pack

	health_pack = rand(1..6)
	if health_pack == 1 
		then puts "Plus de lait dans les rayons" 
	elsif health_pack >= 2 && health_pack <= 5 && @hitpoints <= 50
		then  @hitpoints = @hitpoints + 50 #&& (puts "Ah! Voila du premier prix!")
		p "Ah! Voila du premier prix!"
	elsif health_pack >= 2 && health_pack <= 5 && @hitpoints >= 50
		then @hitpoints = 100 #&& (puts "Ah! Voila du premier prix!")
		p "Ah! Voila du premier prix!"
	elsif health_pack == 6 && @hitpoints <= 20 
		then @hitpoints = @hitpoints + 80 #&& (puts "C'est du bio je crois")
		p "C'est du bio je crois"
	elsif health_pack == 6 && @hitpoints >= 20
		then @hitpoints = 100 #&& (puts "C'est du bio je crois")
		p "C'est du bio je crois"
	end #if

end #def search_h


end #class


# binding.pry
# "kaput"