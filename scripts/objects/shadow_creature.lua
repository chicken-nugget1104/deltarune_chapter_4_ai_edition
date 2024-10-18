local ShadowCreature, super = Class(Object)

function ShadowCreature:init(x, y)
    super.init(self, x, y)

    -- Load the sprite for the Shadow Creature
    self.sprite = Sprite("objects/shadow_creature")
    self.speed = 50  -- Movement speed (pixels per second)
    self.direction = Utils.random(0, 360)  -- Random initial direction in degrees
    self.timer = 0  -- Timer for movement
end

function ShadowCreature:update()
    super.update(self)

    -- Update the timer to create a wandering effect
    self.timer = self.timer + DT

    -- Calculate new position based on a wandering pattern
    local offset_x = math.sin(self.timer * 0.05) * 5  -- Small horizontal oscillation
    local offset_y = math.cos(self.timer * 0.05) * 5  -- Small vertical oscillation

    -- Move the creature in its current direction
    self.x = self.x + (self.speed * math.cos(math.rad(self.direction)) + offset_x) * DT
    self.y = self.y + (self.speed * math.sin(math.rad(self.direction)) + offset_y) * DT

    -- Randomly change direction occasionally
    if Utils.random() < 0.02 then  -- Chance to change direction
        self.direction = Utils.random(0, 360)
    end
end

return ShadowCreature
