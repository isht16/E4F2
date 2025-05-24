::DropItemEnhancementEventListeners <-
{
	__enabled = false

	function OnCommandEvent_dp_item_e_enabled(e)
	{
		__enabled = true;

		__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", ::RegisterScriptGameEventListener);
	}

	function OnCommandEvent_dp_item_e_disabled(e)
	{
		__enabled = false;
	}

	function OnGameEvent_entity_shoved(e)
	{
		if (!__enabled)
		{
			return;
		}

		local player = GetPlayerFromUserID(e.attacker);

		local weapon = player.GetActiveWeapon().GetClassname();

		if (player.GetButtonMask() & (1 << 5))
		{
			player.DropItem(weapon);
		}
	}
}

__CollectEventCallbacks(::DropItemEnhancementEventListeners, "OnCommandEvent_", "CommandEventCallbacks", null);
