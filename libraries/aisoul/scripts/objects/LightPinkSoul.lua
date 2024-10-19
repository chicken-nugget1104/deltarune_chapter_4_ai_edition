local LightPinkSoul, super = Class(Soul)

function LightPinkSoul:init(x, y, angle)
    super:init(self, x, y)
    
    -- Do not modify these variables
    self.color = {1, 0.8, 0.8}  -- Light pink color
    self.can_dash = true          -- Can the light pink soul dash?
    self.can_parry = true         -- Can the light pink soul parry attacks?
    
    -- Variables that can be changed
    self.dash_distance = 10       -- How far the soul can dash
    self.dash_cooldown = 15       -- Cooldown for dashing
    self.parry_window = 10        -- Time window for parrying
    self.is_dashing = false       -- Is the soul currently dashing?
    self.dash_timer = 0           -- Timer for the dash
    self.parry_timer = 0          -- Timer for the parry
end

function LightPinkSoul:update()
    super:update(self)
    
    -- Update dash and parry states
    if self.is_dashing then
        self.dash_timer = self.dash_timer - 1
        if self.dash_timer <= 0 then
            self.is_dashing = false
        end
    end
    
    -- Handle input for dashing
    if Input.pressed("cancel") and self.can_dash and not self.is_dashing then
        self:doDash()
    end

    -- Handle parry timing
    if self.can_parry and self.parry_timer > 0 then
        self.parry_timer = self.parry_timer - 1
    end

    -- Handle input for parrying
    if Input.pressed("confirm") and self.can_parry and self.parry_timer == 0 then
        self:doParry()
    end
end

function LightPinkSoul:doDash()
    self.is_dashing = true
    self.dash_timer = self.dash_cooldown
    local dash_direction = self.direction
    
    if dash_direction == "down" then
        self:move(0, self.dash_distance, DT)
    elseif dash_direction == "up" then
        self:move(0, -self.dash_distance, DT)
    elseif dash_direction == "left" then
        self:move(-self.dash_distance, 0, DT)
    elseif dash_direction == "right" then
        self:move(self.dash_distance, 0, DT)
    end
    
    Assets.playSound("dash")  -- Play a sound effect for dashing
end

function LightPinkSoul:doParry()
    if self.can_parry and self.parry_timer <= 0 then
        self.parry_timer = self.parry_window
        -- Code to parry an attack (e.g., blocking or reflecting it)
        Assets.playSound("parry")  -- Play a sound effect for parrying
    end
end

function LightPinkSoul:draw()
    local r, g, b, a = self:getDrawColor()
    super:draw(self)
    
    -- Additional drawing code (if needed)
end

return LightPinkSoul
