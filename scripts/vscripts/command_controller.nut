printl("Loading command_controller.nut...");

::CommandHandler <-
{
	_itChatFunction = {}
	_itChatTextIndex = {}

	_itChatCount = 0

	_interceptCount = 0

	_interceptList = {}
	OnInterceptChat = {}
}

/**
 * Valve forward: Used by EasyLogic to implement chat triggers
 */
if (!("InterceptChat" in getroottable()))
{
	::InterceptChat <- function (str, srcEnt)
	{
		if (srcEnt != null)
		{
			// Strip the name from the chat text
			local name = srcEnt.GetPlayerName() + ": ";
			local text = strip(str.slice(str.find(name) + name.len()));

			if (startTrigger || hideTrigger)
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

				foreach (i, id in ::CommandHandler._itChatTextIndex)
				{

				printl(id);

				printl(cmd);
				printl("---------------------");

					if (id == cmd)
					{
						::CommandHandler._itChatFunction[i](srcEnt, args, text);

						break;
					}
				}
			}
		}

		if ("ModeInterceptChat" in g_ModeScript)
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

function CommandHandler::AddInterceptChat(func)
{
	foreach (v in _interceptList)
	{
		if (v == func)
			return;
	}

	_interceptList[_interceptCount] <- func;
	_interceptCount++;
}

function CommandHandler::RemoveInterceptChat(func)
{
	foreach(i, v in _interceptList)
	{
		if (v == func)
		{
			_interceptList[i] <- null;
			break;
		}
	}
}
