::ScriptListeners <- {}
::ScriptIndex <- {}

::ScriptCount <- 0;

::Mount <- function (id, listeners)
{
	ScriptListeners[ScriptCount] <- listeners;
	ScriptIndex[ScriptCount] <- id;

	ScriptCount++;
}

::Pulse <- function(id, listener)
{
	foreach (i, v in ScriptIndex)
	{
		if (v == id)
		{
			local listeners = ScriptListeners[i];

			if (listeners["OnScriptEvent_" + listener])
			{
				listeners["OnScriptEvent_" + listener]();
			}

			break;
		}
	}
}
