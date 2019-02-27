tell application "Tunnelblick"
	tell me to activate
	display alert "Do you want to connect to VPN with Tunnelblick?" buttons {"Yes", "No"}
	if button returned of result = "Yes" then
		
		get state of first configuration where name = "vpn_configuration_name"
		if result = "CONNECTED" then
			display alert "You're already connected to VPN"
		else
			connect "vpn_configuration_name"
			get state of first configuration where name = "vpn_configuration_name"
			repeat until result = "CONNECTED"
				delay 1
				get state of first configuration where name = "vpn_configuration_name"
			end repeat
			display alert "Connected to VPN configuration vpn_configuration_name"
		end if
	end if
end tell

do shell script "open -na /Applications/Google\\ Chrome.app --args --incognito --profile-directory='Profile 2'"
