::Handler <-
{
	_itScriptEvent = {}
	_itScriptIndex = {}

	_itScriptCount = 0

	function Mount (id, event)
	{
		// __CollectEventCallbacks(event, "OnHandlerEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

		_itScriptEvent[_itScriptCount] <- event;
		_itScriptIndex[_itScriptCount] <- id;

		_itScriptCount++;

		// Una vez se agrega el comando, debe llamarse una funcion de CommandHandler que registre los comandos.
	}

	function Enable (id) {

		foreach (i, v in _itScriptIndex)
		{
			if (v == id)
			{
				local Event = _itScriptEvent[i];

				if (Event.OnHandlerEvent_enabled) {

					Event.OnHandlerEvent_enabled();
				}

				break;
			}
		}
	}

	function Update () {

	}

	function Disable () {

	}
}
