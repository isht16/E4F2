/**
 * CONFIGURATION
 */

// IncludeScript("command_controller");

// function JuanLuis (args, text) {

// 	printl("HELLO WORLDDDDDDDDDDDD");
// }

// ::CommandHandler.AddCommand("hello", JuanLuis);

/**
 * HANDLER
 */

::ScriptHandler <-
{
	_itScriptEvent = {}
	_itScriptIndex = {}

	_itScriptCount = 0

	function Mount (id, Event)
	{
		_itScriptEvent[_itScriptCount] <- Event;
		_itScriptIndex[_itScriptCount] <- id;

		_itScriptCount++;

		// Una vez se agrega el comando, debe llamarse una funcion de CommandHandler que registre los comandos.
	}

	function Enable (id)
	{
		printl("E4F2: Enabled " + id + ".nut script");

		foreach (i, v in _itScriptIndex)
		{
			if (v == id)
			{
				local Event = _itScriptEvent[i];

				if (Event.Enabled) {

					Event.Enabled();
				}

				break;
			}
		}
	}

	function Update (id)
	{
		printl("E4F2: Updated " + id + ".nut script");

		foreach (i, v in _itScriptIndex)
		{
			if (v == id)
			{
				local Event = _itScriptEvent[i];

				if (Event.Updated) {

					Event.Updated();
				}

				break;
			}
		}
	}

	function Disable (id)
	{
		printl("E4F2: Disabled " + id + ".nut script");

		foreach (i, v in _itScriptIndex)
		{
			if (v == id)
			{
				local Event = _itScriptEvent[i];

				if (Event.Disabled) {

					Event.Disabled();
				}

				break;
			}
		}
	}
}

/**
 * LOADER
 */

IncludeScript("drop_item_enhancement/handler_base_controller");

ScriptHandler.Enable("drop_item_enhancement");
