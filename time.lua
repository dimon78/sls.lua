function time()
	gmt = 3 
	m = {[1]=31,[2]={28,29},[3]=31,[4]=30,[5]=31,[6]=30,[7]=31,[8]=31,[9]=30,[10]=31,[11]=30,[12]=31}
	t = os.time() + 3600 * gmt
	
	year = math.modf(t / 31556736) + 1970
	extra, f = math.modf((year - 1969) / 4)
	eroch2 = math.modf(t / 86400)
	eroch = eroch2 - extra 
	day = eroch%365
	
	second = t - eroch2 * 86400
	hour = math.modf(second / 3600)
	minute2 = second - hour * 3600
	minute = math.modf(minute2 / 60)
	second = minute2 - (minute * 60)
	
	e_days = 0
	for i = 1, 12 do
	  	b_days = e_days
  		if i == 2 then
	    	if f == 0.75 then 
	      		e_days = e_days + m[i][2]
	      	else 
	      		e_days = e_days + m[i][1]
	      	end
		else
	    	e_days = e_days + m[i]
	    end
	 	if day >= b_days and day < e_days then 
	    	month = i
	    	day = day - b_days + 1
	    	break 
	  	end
	end

	return year, month, day, hour, minute, second
end

y, mo, d, h, mi, s = time()

print(y ..' '.. mo ..' '.. d ..' '.. h .. ' '.. mi ..' '.. s)
