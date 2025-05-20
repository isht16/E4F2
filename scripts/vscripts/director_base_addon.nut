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

::Handler <- {

	_itScriptEvent = {}
	_itScriptIndex = {}

	_itScriptCount = 0

	function AddScript (id, Event) {

		if (Event.Add) {

			Event.Add();
		}

		_itScriptEvent[_itScriptCount] <- Event;
		_itScriptIndex[_itScriptCount] <- id;

		_itScriptCount++;

		// Una vez se agrega el comando, debe llamarse una funcion de CommandHandler que registre los comandos.
	}

	function RemoveScript (id) {

		local i = FindScriptById(id);

		local Event = _itScriptEvent[i];

		if (Event.Remove) {

			Event.Remove();
		}

		_itScriptEvent[i] <- null;
		_itScriptIndex[i] <- null;

		// Una vez se agrega el comando, debe llamarse una funcion de CommandHandler que elimine los comandos.
	}

	function EnableScript (id) {

		local i = FindScriptById(id);

		local Event = _itScriptEvent[i];

		if (Event.Enable) {

			Event.Enable();
		}
	}

	function DisableScript (id) {

		local i = FindScriptById(id);

		local Event = _itScriptEvent[i];

		if (Event.Disable) {

			Event.Disable();
		}
	}

	function FindScriptById (id) {

		foreach (i, v in _itScriptIndex)
		{
			if (v == id)
			{
				return i;
			}
		}
	}
}

/**
 * LOADER
 */

IncludeScript("drop_item_enhancement/handler_base_controller");
