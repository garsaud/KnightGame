require './core/Core.rb'

print "--- creating the player\n"
p = Player.new

p.debug

print "--- adding a new job\n"
p.addJob("Knight")

p.debug

print "--- giving a sword hit\n"
p.doAction("Knight", "hitWithSword")
