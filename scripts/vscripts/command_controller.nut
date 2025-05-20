printl("Loading command_controller.nut...");

::CommandHandler <-
{
	_itChatFunction = {}
	_itChatTextIndex = {}

	_itChatCount = 0
}

function CommandHandler::AddCommand(id, func)
{
	local index = "!" + id;

	_itChatTextIndex[_itChatCount] <- index;
	_itChatFunction[_itChatCount] <- func;

	_itChatCount++;
}

function CommandHandler::RemoveCommand(id)
{
	local index = "!" + id;

	foreach (i, v in _itChatTextIndex)
	{
		if (v == index)
		{
			_itChatFunction[i] <- null;
			_itChatTextIndex[i] <- null;

			break;
		}
	}
}

if (!("InterceptChat" in getroottable()))
{
	printl("InterceptChat not found in root table, creating it.");

	::InterceptChat <- function (str, srcEnt)
	{
		if (srcEnt != null)
		{
			// Strip the name from the chat text
			local name = srcEnt.GetPlayerName() + ": ";

			local text = strip(str.slice(str.find(name) + name.len()));

			local startTrigger = ( text.find("!") == 0 );

			if (startTrigger)
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

				// Execute the removable trigger (if it is a trigger).
				foreach (i, trigger in ::CommandHandler._itChatTextIndex)
				{
					if (trigger == cmd || trigger.tolower() == cmd.tolower())
					{
						::CommandHandler._itChatFunction[i](args, text);

						break;
					}
				}
			}
		}

		if ("ModeInterceptChat" in g_ModeScript )
		{
			if (g_ModeScript.ModeInterceptChat(str, srcEnt) == false)
			{
				return false;
			}
		}

		if ("MapInterceptChat" in g_ModeScript)
		{
			if (g_ModeScript.MapInterceptChat(str, srcEnt) == false)
			{
				return false;
			}
		}
	}
}

if (("InterceptChat" in g_ModeScript) && (g_ModeScript.InterceptChat != getroottable().InterceptChat))
{
	g_ModeScript.ModeInterceptChat <- g_ModeScript.InterceptChat;
	g_ModeScript.InterceptChat <- getroottable().InterceptChat;
}
else if (("InterceptChat" in g_MapScript) && (g_MapScript.InterceptChat != getroottable().InterceptChat))
{
	g_ModeScript.MapInterceptChat <- g_MapScript.InterceptChat;
	g_ModeScript.InterceptChat <- getroottable().InterceptChat;
}
else
{
	g_ModeScript.InterceptChat <- getroottable().InterceptChat;
}
