function Mod:init()
    print("Loaded "..self.info.name.."!")
end

function Mod:postLoad(newsave) 
    if not newsave then 
	Game:setFlag("fun",Utils.random(1,100,1)) 
    end 
end