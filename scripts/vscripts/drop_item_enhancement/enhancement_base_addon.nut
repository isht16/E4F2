Handler.Mount("drop_item_enhancement",
	{
		function OnHandlerEvent_enabled ()
		{
			__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
		}

		function OnHandlerEvent_updated ()
		{
			// La idea es que se pueda actualizar las config del script sin tener que reiniciar el juego.
		}

		function OnHandlerEvent_disabled ()
		{
			// No tengo ni puta idea de como eliminar el evento, pero no se puede eliminar el evento de la misma manera que se agrega.
		}

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
);
