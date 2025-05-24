EventListeners <-
{
	__enabled = false;

	function OnCommandEvent_dp_item_e_enabled(e)
	{
		if (__enabled)
		{
			return;
		}

		printl("enabled drop_item_enhancement.nut script");

		__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", ::RegisterScriptGameEventListener);
	}

	function OnCommandEvent_dp_item_e_disabled(e)
	{
		if (!__enabled)
		{
			return;
		}

		printl("disabled drop_item_enhancement.nut script");

		// __CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", ::RegisterScriptGameEventListener);
	}

	function OnGameEvent_entity_shoved(e)
	{
		local player = GetPlayerFromUserID(e.attacker);

		local weapon = player.GetActiveWeapon().GetClassname();

		if (player.GetButtonMask() & (1 << 5))
		{
			player.DropItem(weapon);
		}
	}
}

__CollectEventCallbacks(EventListeners, "OnCommandEvent_", "CommandEventCallbacks", ::RegisterScriptCommandEventListener);
