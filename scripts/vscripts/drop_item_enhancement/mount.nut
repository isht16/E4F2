__Add(

	"e__dp_item_enabled",

	function(params)
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

// __Add(

// 	"e__dp_item_disabled",

// 	function(params)
// 	{

// 	}
// );
