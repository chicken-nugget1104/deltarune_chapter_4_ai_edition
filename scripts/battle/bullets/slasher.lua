local BranchSlasher, super = Class(Bullet)

function BranchSlasher:init()
    -- Create the head segment of the branch
    super.init(self, Game.battle.soul.x, Game.battle.arena.y - 100, "bullets/woodsegment")

    self:setScale(2, 1)

    -- Initialize segments
    self.segments = {}
    self.segment_count = 5 -- Number of segments

    -- Alternate between "woodsegment" and "woodsegmentalt"
    for i = 1, self.segment_count do
        local sprite = (i % 2 == 0) and "bullets/woodsegmentalt" or "bullets/woodsegment"
        local segment = Sprite(sprite, self.x, self.y + (i * 32))
        segment:setOrigin(0.5, 0.5)
        segment:setScale(2, 1)
        Game.battle:addChild(segment)

        table.insert(self.segments, segment)
    end

    self.destroy_on_hit = false
    self.timer = Utils.random(2, 4) -- Randomized 2-4 second interval for branch slashing
end

function BranchSlasher:update()
    self.timer = self.timer - DT

    if self.timer <= 0 then
        -- Move the branch segments to the SOUL's position
        local soul_y = Game.battle.soul.y
        self.y = soul_y - 20
        self.physics.speed = 5

        -- Move all the segments down
        for i, segment in ipairs(self.segments) do
            segment.x = self.x
            segment.y = self.y + (i * 32)
        end

        -- Reset the branch position once it reaches the bottom
        if self.y > Game.battle.arena:getBottom() then
            self.y = Game.battle.arena.y - 100
            self.timer = Utils.random(2, 4)
        end
    end

    super.update(self)
end

return BranchSlasher
