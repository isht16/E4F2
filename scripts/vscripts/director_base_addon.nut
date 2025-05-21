// ******************** SCRIPT HANDLER

::ScriptHandler <-
{
	__listeners = {}
	__index = {}

	__count = 0

	function Mount(name, listener, func) {

		local id = name + "_" + listener;

		__listeners[__count] <- func;
		__index[__count] <- id;

		__count++;
	}

	function Sent(name, listener) {

		local id = name + "_" + listener;

		foreach (i, v in __index)
		{
			if (v == id)
			{
				__listeners[i]();

				break;
			}
		}
	}
}

IncludeScript("camera_movement_enhancement/mount");
IncludeScript("drop_item_enhancement/mount");

// ******************** CONFIGURATION FILE HANDLER

// ******************** SCRIPT COMMAND HANDLER

EventListeners <-
{
		function OnGameEvent_player_say (event)
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

				local id = 0;

				foreach (k, v in split(event["text"], " "))
				{
					if (v != null && v != "")
					{
						arr[id] <- v;

						id++;
					}
				}

				if (arr[0] == "!e")
				{
					ScriptHandler.Sent(arr[1], "enabled");
				}

				if (arr[0] == "!u")
				{
					ScriptHandler.Sent(arr[1], "updated");
				}

				if (arr[0] == "!d")
				{
					ScriptHandler.Sent(arr[1], "disabled");
				}
			}
		}
}

__CollectEventCallbacks(EventListeners, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
