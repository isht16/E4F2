EventListeners <-
{
	function OnGameEvent_player_say (event)
	{
		printl("OnGameEvent_player_say");

		local client = null;

		if ("userid" in event)
		{
			client = GetPlayerFromUserID(event["userid"]);
		}

		if (!client)
		{
			return;
		}

		if ("text" in event)
		{
			local param = {};

			local id = 0;

			foreach (k, v in split(event["text"], " "))
			{
				if (v != null && v != "") // k != 0 &&
				{
					param[id] <- v;

					id++;
				}
			}

			printl("param: " + param[0]);
			printl("param: " + param[1]);

			if (param[0] == "!e")
			{
				printl("ENABLED");
			}

			if (param[0] == "!u")
			{
				printl("UPDATED");
			}

			if (param[0] == "!d")
			{
				printl("DISABLED");
			}
		}
	}
}

__CollectEventCallbacks(EventListeners, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
