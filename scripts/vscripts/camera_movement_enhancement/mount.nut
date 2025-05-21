ScriptHandler.Mount(

	"camera_movement_enhancement", "enabled",

	function ()
	{
		Convars.SetValue("sv_rollangle", "2");
	}
);

ScriptHandler.Mount(

	"camera_movement_enhancement", "disabled",

	function ()
	{
		Convars.SetValue("sv_rollangle", "0");
	}
);
