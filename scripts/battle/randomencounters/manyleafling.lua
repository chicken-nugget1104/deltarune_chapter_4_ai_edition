local EncGroup, super = Class(RandomEncounter, "manyleafling")

function EncGroup:init()
    super.init(self)
    
    self.population = nil
    self.use_population_factor = true
    
    -- Table with the encounters that can be triggered by this random encounter
    self.encounters = {"leafling", "leafling", "leafling"}

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* A leaf-outbreak occurs!"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true
end

return EncGroup