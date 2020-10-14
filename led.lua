function led(color)
	local r,g,b = 0,0,0
	if color == 1 then
		r = 1
	elseif color == 2 then
    	g = 1
	elseif color == 3 then
		r = 1
		g = 1
	elseif color == 4 then
		b = 1
	elseif color == 5 then
		r = 1
    	b = 1
	elseif color == 6 then
		g = 1
		b = 1
	elseif color == 7 then
		r = 1
		g = 1
		b = 1
	end
  
	gpio.mode(27, 2)
	gpio.write(27, r) 
	gpio.mode(5, 2)
	gpio.write(5, g) 
	gpio.mode(21, 2)
	gpio.write(21, b) 
end  

--[[
0 - выключен
1 - красный
2 - зеленый
3 - желтый
4 - синий
5 - сиреневый
6 - голубой
7 - белый
]]--

for b=1,2 do for a=1,7 do led(a) os.delay(100) end end