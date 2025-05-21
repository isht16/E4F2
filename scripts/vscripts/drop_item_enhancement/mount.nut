ScriptHandler.Mount(

	"drop_item_enhancement", "enabled",

	function ()
	{
		EventListeners <-
		{
			function OnGameEvent_entity_shoved(event)
			{
				local player = GetPlayerFromUserID(event.attacker);

				local weapon = player.GetActiveWeapon().GetClassname();

				if (player.GetButtonMask() & (1 << 5))
				{
					player.DropItem(weapon);
				}
			}
		}

		__CollectEventCallbacks(EventListeners, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
	}
);

ScriptHandler.Mount(

	"drop_item_enhancement", "disabled",

	function ()
	{

	}
);
