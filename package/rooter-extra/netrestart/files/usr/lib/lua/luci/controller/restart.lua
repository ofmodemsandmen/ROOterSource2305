module("luci.controller.restart", package.seeall)

I18N = require "luci.i18n"
translate = I18N.translate

function index()
	local fs = require "nixio.fs"
	local lock = luci.model.uci.cursor():get("custom", "menu", "full")
	local multilock = luci.model.uci.cursor():get("custom", "multiuser", "multi") or "0"
	local rootlock = luci.model.uci.cursor():get("custom", "multiuser", "root") or "0"
	if (multilock == "0") or (multilock == "1" and rootlock == "1") then
		if lock == "1" then
			local page
			if (multilock == "1" and rootlock == "1") then
				page = entry({"admin", "adminmenu", "restart"}, template("restart/restartm"), translate("Network Restart"), 10)
					page.dependent = true
				else
					page = entry({"admin", "adminmenu", "restart"}, template("restart/restartm"), translate("---Network Restart"), 70)
					page.dependent = true
			end
		end
	end

	entry({"admin", "restart", "getdata"}, call("action_getdata"))
	entry({"admin", "restart", "enable"}, call("action_enable"))
	entry({"admin", "restart", "settime"}, call("action_settime"))
end

function action_getdata()
	local rv = {}
	
	rv['enabled'] = luci.model.uci.cursor():get("restart", "info", "enabled")
	rv['time'] = luci.model.uci.cursor():get("restart", "info", "time")
	
	luci.http.prepare_content("application/json")
	luci.http.write_json(rv)
end

function action_enable()
	local set = luci.http.formvalue("set")
	
	os.execute("/usr/lib/restart/enable.sh " .. set)
end

function action_settime()
	local set = luci.http.formvalue("set")
	
	os.execute("/usr/lib/restart/settime.sh " .. set)
end