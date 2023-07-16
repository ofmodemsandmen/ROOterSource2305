local utl = require "luci.util"

local sys   = require "luci.sys"
local zones = require "luci.sys.zoneinfo"
local fs    = require "nixio.fs"
local conf  = require "luci.config"

m = Map("ttl", translate("Hotspot Data Settings"), translate("Set TTL so some is Hotspot data"))

m.on_after_save = function(self)
	luci.sys.call("/usr/lib/bwmon/hotspotm.sh &")
end

s = m:section(TypedSection, "hotspot", " ")

c1 = s:option(ListValue, "enable", "Enable Hotspot Data");
c1:value("0", translate("Disabled"))
c1:value("1", translate("Enabled"))
c1.default=0

pw1 = s:option(Value, "amt", "Maximum Hotspot Data in Megabytes", translate("Maximum amount sent as Hotspot data"))
pw1.datatype = "uinteger"
pw1.default = 10000
pw1:depends("enable", "1")

pw2 = s:option(DummyValue, "total", "Total Hotspot Data in Megabytes", translate("Total amount sent as Hotspot data this month"))
pw2:depends("enable", "1")

return m
