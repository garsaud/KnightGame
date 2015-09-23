module Debugable
	def debug
		instance_variables.each do |item|
			print "> #{item} = #{instance_variable_get(item)}\n"
		end
	end
end

class Player
	# à enlever en mode production
	include Debugable

	attr_accessor :health
	attr_accessor :strength
	attr_accessor :position
	attr_accessor :jobs

	def initialize
		@health = 50
		@strength = 10
		@position = [25, 5]
		@jobs = []
	end

	def walk(direction)
		position[0] += direction[0]
		position[1] += direction[1]
	end
	def addJob(job)
		require "./jobs/#{job}.rb"
		jobs.push(Object.const_get(job).new(self))
	end
	def doAction(job, action)
		@jobs.each do |item|
			return item.send(action) if item.class.name == job
		end
	end

end

class Job
	attr_accessor :player

	def initialize(player)
		@player = player
		jobSpecifications
	end
end
