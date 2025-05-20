::CommandHandler <-
{
	_itChatFunction = {}
	_itChatTextIndex = {}

	_itChatCount = 0

	function Mount (id, func) {

		local index = "!" + id;

		_itChatTextIndex[_itChatCount] <- index;
		_itChatFunction[_itChatCount] <- func;

		_itChatCount++;
	}
}

::CommandHandlerListeners <-
{
	function OnGameEvent_player_say (event)
	{
		local client = null;

		if ("userid" in event)
		{
			client = GetPlayerFromUserID(event["userid"]);
		}

		if (client == null)
		{
			return;
		}

		local chat_result = null;

		if ("text" in event)
		{
			chat_result = event["text"];
		}

		// Strip the name from the chat text
		local name = event.GetPlayerName() + ": ";

		local text = strip(str.slice(str.find(name) + name.len()));

		if (text.find("!") == 0)
		{
			// Separate the commands and arguments
			local arr = split(text, " ");

			// Identify the command
			local cmd = arr[0];

			// Build an argument array
			local args = {};
			local idx = 0;

			foreach (k, v in arr)
			{
				if (k != 0 && v != null && v != "")
				{
					args[idx] <- v;

					idx++;
				}
			}

			foreach (i, trigger in CommandHandler._itChatTextIndex)
			{
				if (trigger == cmd)
				{
					CommandHandler._itChatFunction[i](args, text);

					break;
				}
			}
		}
	}
}

__CollectEventCallbacks(CommandHandlerListeners, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
