function sound_on()
	gpio.mode(32, 2)
	gpio.write(32, 0) 
	gpio.mode(26, 2)
end

function sound_off()
	gpio.mode(32, 2)
	gpio.write(32, 1)
end

function sound_play(f)
	local PI_2 = math.pi * 2
	local SAMPLE_FREQUENCY = 1000
  
	for i = 1, 100 do	  
   		for z = 1, 3 do 
      		gpio.write(26, math.floor(math.sin(PI_2 * i * f / SAMPLE_FREQUENCY)))     
    	end
    	os.delay(1)
	end
end  

sound_on()

for x = 1, 3 do
  	sound_play(697)
  	sound_play(1209)

  	sound_play(697)
  	sound_play(1336)

  	sound_play(697)
  	sound_play(1477)
  
  	sound_play(770)
  	sound_play(1209)
 
  	sound_play(770)
  	sound_play(1336)
  
  	sound_play(770)
  	sound_play(1477)
  
  	sound_play(852)
  	sound_play(1209)
 
  	sound_play(852)
  	sound_play(1336)
  
  	sound_play(852)
  	sound_play(1477)
end

sound_off()
