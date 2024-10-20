-- Simply plop this into Tiled!
-- [IMPORTANT] Remember to shrink it a bit when you put it over a tileset so that it doesn't look weird!
local IceArea, super = Class(Event, "icearea")

function IceArea:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    local properties = data.properties or {}
    
    self.sound = properties["sound"] or nil -- sound property to play when you enter the icearea. string in Tiled.
end

function IceArea:onCollide(chara)
    if (chara.last_y or chara.y) < self.y + self.height and chara.is_player then
        if chara.state ~= "ICESLIDE" then
            if self:checkAgainstWall(chara) then return end

            Assets.stopAndPlaySound("noise")
        end

        chara:setState("ICESLIDE", false)

        chara.current_iceslide_area = self
    end
end

function IceArea:onEnter(chara)
    if chara.is_player then
        if chara.state ~= "ICESLIDE" and self.sound then
            Assets.playSound(self.sound)
        end

        chara:setState("ICESLIDE", false)

        chara.current_iceslide_area = self

        chara.iceslide_x = 0
        chara.iceslide_y = 0
        
        if Input.down("right") or chara.facing == "right" then
            chara.iceslide_x = 1
        end
        if Input.down("left") or chara.facing == "left" then
            chara.iceslide_x = -1
        end
        if Input.down("up") or chara.facing == "up" then
            chara.iceslide_y = -1
        end
        if Input.down("down") or chara.facing == "down" then
            chara.iceslide_y = 1
        end
    end
end

function IceArea:onExit(chara)
    if chara.is_player and chara.state == "ICESLIDE" then
        chara:setState("WALK")
        chara.current_iceslide_area = nil
    end
end

function IceArea:update()
    if not Game.world.player then return end

    local stopped = false

    Object.startCache()

    if Game.world.player.y > self.y + self.height and not Game.world.player:collidesWith(self.collider) then
        self.solid = true

        if Game.world.player.state == "ICESLIDE" and Game.world.player.current_iceslide_area == self then
            stopped = true
        end
    else
        self.solid = false
    end

    if not stopped and Game.world.player.state == "ICESLIDE" and Game.world.player.current_iceslide_area == self then
        stopped = self:checkAgainstWall(Game.world.player)
    end

    Object.endCache()

    if stopped then
        Game.world.player:setState("WALK")

        Game.world.player.current_iceslide_area = nil
    end

    super.update(self)
end

function IceArea:checkAgainstWall(chara)
    local hb = chara.collider

    if hb and hb:includes(Hitbox) then
        local extended_hitbox = Hitbox(chara, hb.x + 0.25, hb.y + 0.25, hb.width - 0.5, (hb.height - 0.5) * 1.5)

        if self.world:checkCollision(extended_hitbox) then
            return true
        end
    end

    return false
end

return IceArea