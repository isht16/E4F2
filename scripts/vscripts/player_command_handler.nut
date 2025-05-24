EventListeners <-
{
	function OnGameEvent_player_say(event)
	{
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
			local arr = {};

			local i = 0;

			foreach (k, v in split(event["text"], " "))
			{
				if (v != null && v != "")
				{
					arr[i] <- v;

					i++;
				}
			}

			if (arr.len() < 2)
			{
				return;
			}

			if ('@' in arr[0])
			{
				__RunEventCallbacks(arr[1], null, "OnCommandEvent_", "CommandEventCallbacks", true);
			}
		}
	}
}

__CollectEventCallbacks(EventListeners, "OnGameEvent_", "GameEventCallbacks", ::RegisterScriptGameEventListener);
