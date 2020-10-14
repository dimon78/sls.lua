function rgb(color) 
	local red = 0
	local green = 0
	local blue = 0

	if color <= 255 then
		red = 255 - color
		green = color
		blue = 0
	elseif color <= 511 then
		red = 0
		green = 255 - (color - 256)
		blue = (color - 256)
	else -- if color >= 512
		red = (color - 512)
		green = 0
		blue = 255 - (color - 512)
	end

	gpio.pwm(0, red)
	gpio.pwm(1, green)
	gpio.pwm(2, blue)
end
  
for x = 1, 3 do
	for i = 0, 767 do
   		rgb(i)
   		os.delay(10)
    end
end