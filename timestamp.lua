function timestamp(t)
	monthtable={Jan=1,Feb=2,Mar=3,Apr=4,May=5,Jun=6,Jul=7,Aug=8,Sep=9,Oct=10,Nov=11,Dec=12}
	daytable={Sun=1,Mon=2,Tue=3,Wed=4,Thu=5,Fri=6,Sat=7}

  	formatpattern = '^(%a+),%s+(%d+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+) GMT([-+]*%d*)$'
	day_t, day, month_t, year, hour, minute, second, gmt = t:match(formatpattern)
	month=monthtable[month_t]

	return os.time({month=month, day=day, year=year, hour=hour, min=minute, sec=second, isdst=false}), daytable[day_t], tonumber(gmt)
end  

print(timestamp('Wed, 1 Mar 2019 00:00:00 GMT+3'))
