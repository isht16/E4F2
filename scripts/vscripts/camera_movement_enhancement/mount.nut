CameraMovementEnhancement <-
{
	__enabled = false

	function OnCommandEvent_e__cam_mv_enab(e)
	{
		__enabled = true;

		Convars.SetValue("sv_rollangle", "2");
	}

	function OnCommandEvent_e__cam_mv_disab(e)
	{
		__enabled = false;

		Convars.SetValue("sv_rollangle", "0");
	}
}

__CollectEventCallbacks(CameraMovementEnhancement, "OnCommandEvent_", "CommandEventCallbacks", null);
