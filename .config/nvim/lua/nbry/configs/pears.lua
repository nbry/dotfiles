local status_ok, pears = pcall(require, "pears")
if not status_ok then
	return
end

pears.setup(function(conf)
	conf.remove_pair_on_inner_backspace(false)
	conf.remove_pair_on_outer_backspace(false)
end)
