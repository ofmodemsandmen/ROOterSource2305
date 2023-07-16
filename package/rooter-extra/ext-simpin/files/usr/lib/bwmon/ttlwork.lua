#!/usr/bin/lua

cmd = arg[1]
arg1 = arg[2] -- total
arg2 = arg[3] -- max

if cmd == "cmp" then
	os.execute("rm -f /tmp/ttlcmp")
	total = tonumber(arg1)
	maximum = tonumber(arg2)
	if total < maximum then
		os.execute("echo '0' > /tmp/ttlcmp")
	end
end

if cmd == "add" then
	total = tonumber(arg1) * 1000
	amt = tonumber(arg2)
	totalamt = tostring((total + amt) / 1000)
	totalvar =  "TOTALVAR='" .. totalamt .. "'"
	os.execute("echo '" .. totalvar .. "' > /tmp/ttlvar")
end