local Basic2, super = Class(Wave)

function Basic2:onStart()
    local arena = Game.battle.arena
    
    local attackers = self:getAttackers()
    
    local bullets = {}
    
    self.timer:every(1/3, function()
        local x = SCREEN_WIDTH + 32
        local y = Utils.random(arena:getTop(), arena:getBottom())
        
        local bullet = self:spawnBullet("yeet", x - Utils.random(1, 2), y - Utils.random(1, 2) + Utils.random(2, 3), math.rad(179), Utils.random(2, 10))
        table.insert(bullets, bullet)
        
        bullet.remove_offscreen = false
        
        for i, attacker in ipairs(self:getAttackers()) do
    		attacker:setAnimation("throw") -- Fix me!
        end
    end)
end

function Basic2:onArenaExit()
    for i, attacker in ipairs(self:getAttackers()) do
        attacker:setAnimation("idle")
    end
end

return Basic2
