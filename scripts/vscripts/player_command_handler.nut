EventListeners <-
{
	function OnGameEvent_player_say(event)
	{
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

			if (i < 2)
			{
				return;
			}

			if (arr[0] == "@")
			{
				__RunEventCallbacks(arr[1], arr, "OnCommandEvent_", "CommandEventCallbacks", true);
			}
		}
	}
}

__CollectEventCallbacks(EventListeners, "OnGameEvent_", "GameEventCallbacks", ::RegisterScriptGameEventListener);
