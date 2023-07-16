-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Copyright 2011 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

local fs = require "nixio.fs"
local sys = require "luci.sys"

m = Map("system", translate("Reset Total Bandwidth Usage"),
	translate("Reset total Bandwidth usage to a specified amount"))

s = m:section(TypedSection, "_dummy", "")
s.addremove = false
s.anonymous = true

pw1 = s:option(Value, "pw1", translate("New Amount in Megabytes"))
pw1.datatype = "uinteger"

function s.cfgsections()
	return { "_pass" }
end

function m.parse(map)
	local v1 = pw1:formvalue("_pass")

	if v1 then
		sys.call("/usr/lib/bwmon/reset.sh %s" % v1)
		m.message = translate("Amount successfully changed!")
	else
			m.message = translate("No new amount given!")
	end

	Map.parse(map)
end

return m