local function time_background()
	local timer = vim.loop.new_timer()
	local last_time = ""
	timer:start(
		0,
		600,
		vim.schedule_wrap(function()
			-- local hour = tonumber(os.date('%H'))
			local hour_minute = tostring(os.date("%H:%M"))
			print(hour_minute)
			if last_time ~= hour_minute then
				last_time = hour_minute
				print(hour_minute)
			end
			-- local bg = (hour > 6 and hour < 18) and 'light' or 'dark'
			-- if vim.o.bg ~= bg then vim.o.bg = bg end
		end)
	)
end
-- time_background()
