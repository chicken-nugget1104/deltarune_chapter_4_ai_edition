local ArenaRotate, super = Class(Bullet)

function ArenaRotate:init()
    -- Invisible bullet to rotate the arena
    super.init(self, Game.battle.arena.x, Game.battle.arena.y)

    self.rotation_speed = 0.05 -- Speed at which the arena rotates
    self.destroy_on_hit = false
end

function ArenaRotate:update()
    -- Rotating the arena over time
    Game.battle.arena.rotation = Game.battle.arena.rotation + self.rotation_speed

    super.update(self)
end

return ArenaRotate
