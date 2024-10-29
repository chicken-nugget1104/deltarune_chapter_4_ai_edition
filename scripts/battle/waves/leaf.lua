local wave, super = Class(Wave)

function wave:onStart()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    self.timer:every(1, function()
        local axis = Utils.pick({"hori","vert"})
        local side = Utils.pick({"left","right"})
        local i = 1
        local bullets = 3
        self.timer:every(0.05, function()
            Assets.playSound("noise")
            local leaf = self:spawnBullet("lef",
                axis == "hori" and (side == "left" and arena:getLeft() - 50 or arena:getRight() + 50) or arena:getLeft() + (arena.width / (bullets + 1) + (arena.width / (bullets + 1))) * ((i - 1) * 2),
                axis == "vert" and (side == "left" and arena:getTop() - 50 or arena:getBottom() + 50) or arena:getBottom() - (arena.height / (bullets + 1) - (arena.height / (bullets + 1))) * ((i - 1) * 2)
            )
            self.timer:after(0.5, function()
                leaf.physics.match_rotation = true
                leaf.rotation = Utils.angle(leaf.x,leaf.y,soul.x,soul.y)
                leaf.physics.speed = 5.5
            end)
            i = i + 1
        end, bullets)
    end)
end

return wave