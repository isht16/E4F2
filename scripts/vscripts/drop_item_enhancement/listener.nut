EventListeners <-
{
	function OnScriptEvent_enabled ()
	{
		__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
	}

	function OnScriptEvent_disabled ()
	{

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

Mount("drop_item_enhancement", EventListeners);
