module("luci.controller.country", package.seeall)

I18N = require "luci.i18n"
translate = I18N.translate

function index()
	local page
	local multilock = luci.model.uci.cursor():get("custom", "multiuser", "multi") or "0"
	local rootlock = luci.model.uci.cursor():get("custom", "multiuser", "root") or "0"
	if (multilock == "0") or (multilock == "1" and rootlock == "1") then
		page = entry({"admin", "modem", "country"}, template("country/edit"), _(translate("Edit ISP Database")), 46)
		page.dependent = true
	end
	
	entry({"admin", "country", "get_list"}, call("action_get_list"))
	entry({"admin", "country", "set_select"}, call("action_set_select"))
	entry({"admin", "country", "set_change"}, call("action_set_change"))
	entry({"admin", "country", "savecfg"}, call("action_savecfg"))
	entry({"admin", "country", "loadcfg"}, call("action_loadcfg"))
	entry({"admin", "country", "clearcfg"}, call("action_clearcfg"))
	entry({"admin", "country", "movecfg"}, call("action_movecfg"))
	entry({"admin", "country", "modrestart"}, call("action_modrestart"))
	entry({"admin", "country", "savecm"}, call("action_savecm"))
	entry({"admin", "country", "saveglob"}, call("action_saveglob"))
end

function action_get_list()
	local rv = {}
	local list = {}
	
	file = io.open("/usr/lib/country/mccdata", "r")
	k = file:read("*line")
	rv['k'] = k
	for i=0, k-1 do
		line = file:read("*line")
		list[i] = line
	end
	file:close()
	rv['list'] = list
	
	rv['selected'] = luci.model.uci.cursor():get("country", "general", "selected")
	rv['country'] = luci.model.uci.cursor():get("country", "general", "country")
	rv['isp'] = luci.model.uci.cursor():get("country", "general", "isp")
	
	rv['simpin'] = luci.model.uci.cursor():get("country", "global", "simpin")
	rv['roaming'] = luci.model.uci.cursor():get("country", "global", "roaming")
	rv['mcc'] = luci.model.uci.cursor():get("country", "global", "mcc")
	rv['mnc'] = luci.model.uci.cursor():get("country", "global", "mnc")
	rv['ttl'] = luci.model.uci.cursor():get("country", "global", "ttl")
	rv['mtu'] = luci.model.uci.cursor():get("country", "global", "mtu")
	rv['autoset'] = luci.model.uci.cursor():get("country", "global", "autoset")
	rv['status'] = luci.model.uci.cursor():get("country", "global", "status")
	rv['interval'] = luci.model.uci.cursor():get("country", "global", "interval")
	rv['timeout'] = luci.model.uci.cursor():get("country", "global", "timeout")
	rv['check'] = luci.model.uci.cursor():get("country", "global", "check")
	rv['ip1'] = luci.model.uci.cursor():get("country", "global", "ip1")
	rv['ip2'] = luci.model.uci.cursor():get("country", "global", "ip2")
	rv['ip3'] = luci.model.uci.cursor():get("country", "global", "ip3")
	rv['password'] = luci.model.uci.cursor():get("country", "general", "password")

	luci.http.prepare_content("application/json")
	luci.http.write_json(rv)
end

function action_set_select()
	local set = luci.http.formvalue("set")
	os.execute("/usr/lib/country/select.sh " .. set)
end

function action_set_change()
	local set = luci.http.formvalue("set")
	os.execute("/usr/lib/country/update.sh " .. "\"" .. set .. "\"")
end

function action_savecfg()
	local set = luci.http.formvalue("set")
	os.execute('/usr/lib/country/savecfg.sh ' .. set)
end

function action_movecfg()
	os.execute('/usr/lib/country/movecfg.sh')
end

function action_loadcfg()
	local set = luci.http.formvalue("set")
	local tfile = io.open("/tmp/mccdata", "a")
	tfile:write(set)
	tfile:close()
end

function action_clearcfg()
	 os.remove("/tmp/mccdata")
end

function action_modrestart()
	 os.execute('/usr/lib/country/modrestart.sh &')
end

function action_savecm()
	local set = luci.http.formvalue("set")
	os.execute("/usr/lib/country/cm.sh " .. "\"" .. set .. "\"")
end

function action_saveglob()
	local set = luci.http.formvalue("set")
	os.execute("/usr/lib/country/glob.sh " .. "\"" .. set .. "\"")
end