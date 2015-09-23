class Knight < Job
	def jobSpecifications
		player.health += 20
		player.strength += 50
	end

	def hitWithSword
		damages = player.strength
		print "Shlack! Hit with #{damages} damages.\n"
	end
end
