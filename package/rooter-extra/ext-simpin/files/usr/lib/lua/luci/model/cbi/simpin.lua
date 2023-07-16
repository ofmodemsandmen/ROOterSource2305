local utl = require "luci.util"

local sys   = require "luci.sys"
local zones = require "luci.sys.zoneinfo"
local fs    = require "nixio.fs"
local conf  = require "luci.config"

m = Map("custom", translate("SIM PIN"), translate("Set PIN to unlock SIM"))

d = m:section(TypedSection, "simpin", " ")
d.anonymous = true

pin = d:option(Value, "pin", translate("SIM Pin :"), translate("Pin to unlock SIM at connection time")); 
pin.rmempty = true;
pin.optional=false;

c1 = d:option(ListValue, "block", translate("Block SIM without Pin : "), translate("Block usage of SIMs without any Pin. A SIM Pin must be set for this to work."));
c1:value("0", translate("No"))
c1:value("1", translate("Yes"))
c1.default=0

return m