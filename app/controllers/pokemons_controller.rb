class PokemonsController < ApplicationController

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.create pokemon_params
		@pokemon.trainer = current_trainer
		@pokemon.health = 100
		@pokemon.level = 1
		if @pokemon.save
			redirect_to @pokemon.trainer
		else
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			render "new"
		end
	end

	def damage
		@pokemon = Pokemon.find_by_id params[:id]
		if (@pokemon == nil)
			redirect_to current_trainer
			return
		end
		@pokemon.health -= 10
		@pokemon.save
		if (@pokemon.health <= 0)
			@pokemon.destroy
		end
		redirect_to @pokemon.trainer
	end

	def pokemon_params
		params.require(:pokemon).permit(:name)
	end

end
