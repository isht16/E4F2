FlashLightEnhancement <-
{
	__enabled = false

	function OnCommandEvent_e__fls_light_enab(e)
	{
		__enabled = true;

		Convars.SetValue("r_flashlightfov", "95");
	}

	function OnCommandEvent_e__fls_light_disab(e)
	{
		__enabled = false;

		Convars.SetValue("r_flashlightfov", "45");
	}
}

__CollectEventCallbacks(FlashLightEnhancement, "OnCommandEvent_", "CommandEventCallbacks", null);
