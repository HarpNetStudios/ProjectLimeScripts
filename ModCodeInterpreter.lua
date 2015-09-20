local lp = game.Players.LocalPlayer

func = Instance.new("BindableFunction", script.Parent)
func.Name = "codeChange"
m = script.Parent

while not lp:FindFirstChild("ModCode") do wait() end
mc = lp.ModCode

function modCodeChanged()
	local code = mc.Value
	
	local mc1 = tonumber(string.sub(code,1,4))
	local mc2 = tonumber(string.sub(code,6,9))
	local mc3 = tonumber(string.sub(code,11,14))
	local mc4 = tonumber(string.sub(code,16,19))
	local mc5 = tonumber(string.sub(code,21,21))
	local mc6 = tonumber(string.sub(code,23,23))

	for i,v in pairs(m:GetChildren()) do
		if v:isA("BasePart") then
			if v.Name == "Color1" then
				v.BrickColor = BrickColor.new(mc1)
			elseif v.Name == "Color2" then
				v.BrickColor = BrickColor.new(mc2)
			elseif v.Name == "Color3" then
				v.BrickColor = BrickColor.new(mc3)
			elseif v.Name == "Color4" then					
				v.BrickColor = BrickColor.new(mc4)
			elseif v.Name == "Team" then
				v.BrickColor = lp.TeamColor				
			else
				v.BrickColor = lp.TeamColor
			end
				
			if v.BrickColor == BrickColor.new(24) then
				v.Reflectance = 0.25
			elseif v.BrickColor == BrickColor.new(217) then
				v.Material = Enum.Material.Wood
			elseif v.BrickColor == BrickColor.new(102) then
				v.Material = Enum.Material.Ice
			elseif v.BrickColor == BrickColor.new(2) then
				v.Material = Enum.Material.Slate
			elseif v.BrickColor == BrickColor.new(40) then
				v.Transparency = 0.5					
			elseif v.BrickColor == BrickColor.new(141) then
				v.Material = Enum.Material.Pebble
			else
				v.Material = Enum.Material.Plastic
				v.Transparency = 0
				v.Reflectance = 0
			end
		
			if mc5 == 0 then
				--placeholder
				v.Transparency = 0
				v.Reflectance = 0
			elseif mc5 == 1 then
				v.Transparency = 0.75
				v.Reflectance = 0
			elseif mc5 == 2 then
				v.Transparency = 0
				v.Reflectance = 0.25
			end
		
			if mc6 == 0 then
				if v:FindFirstChild("PointLight") then
					v.PointLight:remove()
				end
			elseif mc6 == 1 then
				if v:FindFirstChild("Light") and v.Light:isA("Accoutrement") and not v:FindFirstChild("PointLight") then
					local l = Instance.new("PointLight", v)
					l.Color = v.BrickColor.Color
					l.Brightness = 1.5
					l.Range = 12
				end
			end
		end
	end
	wait()
end

function balls()
    if true then
       print("balls")
    end
end

lp.ModCode.Changed:connect(modCodeChanged)
lp.Backpack.ChildRemoved:connect(modCodeChanged)
