DropItemEnhancement <-
{
	__enabled = false

	function OnCommandEvent_e__dp_item_enab(e)
	{
		__enabled = true;

		__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", ::RegisterScriptGameEventListener);
	}

	function OnCommandEvent_e__dp_item_disab(e)
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

__CollectEventCallbacks(DropItemEnhancement, "OnCommandEvent_", "CommandEventCallbacks", null);
