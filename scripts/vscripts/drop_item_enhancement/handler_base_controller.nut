Event <-
{
	Enhancement =
	{
		function OnGameEvent_entity_shoved (event)
		{
			local player = GetPlayerFromUserID(event.attacker);

			local weapon = player.GetActiveWeapon().GetClassname();

			if (player.GetButtonMask() & (1 << 5))
			{
				player.DropItem(weapon);
			}
		}
	}

	function Enabled ()
	{
		__CollectEventCallbacks(Enhancement, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
	}

	function Updated ()
	{
		// La idea es que se pueda actualizar las config del script sin tener que reiniciar el juego.
	}

	function Disabled ()
	{
		// No tengo ni puta idea de como eliminar el evento, pero no se puede eliminar el evento de la misma manera que se agrega.
	}
}

ScriptHandler.Mount("drop_item_enhancement", Event);
