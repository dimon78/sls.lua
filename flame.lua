local SMOOTH_K = 0.02
local TIME_CHANGE = 50
local prevTime = 0
local val = 20

gpio.pwm(0, 0)
gpio.pwm(1, 0)
gpio.pwm(2, 0)

for i = 1, 5000 do
	if (os.millis() - prevTime > TIME_CHANGE) then
	    rndVal = (math.random(26) - 1) * 10;
	    prevTime = os.millis()
	end
  
	val = val * (1 - SMOOTH_K) + rndVal * SMOOTH_K

	gpio.pwm(0, math.floor(val))
	if val < 20 then
	    gpio.pwm(1, 0)
	else
	    gpio.pwm(1, 10)
	end    
	gpio.pwm(2, 0)
	os.delay(10)
end