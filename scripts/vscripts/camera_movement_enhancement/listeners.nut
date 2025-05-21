EventListeners <-
{
	function OnScriptEvent_enabled ()
	{
		Convars.SetValue("sv_rollangle", "2");
	}

	function OnScriptEvent_disabled ()
	{
		Convars.SetValue("sv_rollangle", "0");
	}
}

Mount("camera_movement_enhancement", EventListeners);
