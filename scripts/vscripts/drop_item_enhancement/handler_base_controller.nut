local __ENABLED = false;

Enhancement <-
{
	function OnGameEvent_entity_shoved(event)
	{
		if (!__ENABLED)
		{
			return;
		}

		local player = GetPlayerFromUserID(event.attacker);

		local playerweapon = player.GetActiveWeapon().GetClassname();

		local flags = player.GetButtonMask();

		if (flags & (1 << 5))
		{
			player.DropItem(playerweapon);
		}
	}
}

__CollectEventCallbacks(Enhancement, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

//

::Event <- {

	function Add () {

		printl("Adding camera movement enhancement script");
	}

	function Enable () {

		printl("Enabling camera movement enhancement script");

		__ENABLED = true;
	}

	function Disable () {

		printl("Disabling camera movement enhancement script");

		__ENABLED = false;
	}

	function Remove () {

		printl("Removing camera movement enhancement script");
	}
}

::Handler.AddScript("drop_item_enhancement", ::Event);
::Handler.EnableScript("drop_item_enhancement");
