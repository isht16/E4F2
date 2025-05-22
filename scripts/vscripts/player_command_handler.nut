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
			local text = split(event["text"], " ");

			if (text.len() < 2)
			{
				return;
			}

			local command = text[0];
			local listener = text[1];

			local params = {};

			local id = 0;

			foreach (k, v in text)
			{
				if (k != 0 && k != 1 && v != null && v != "")
				{
					params[id] <- v;

					id++;
				}
			}

			if (command == "@")
			{
				if (listener == "::")
				{
					foreach (k, v in params)
					{
						__Sent(v, null);
					}
				}
				else
				{
					__Sent(listener, params);
				}
			}
		}
	}
}

__CollectEventCallbacks(EventListeners, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
