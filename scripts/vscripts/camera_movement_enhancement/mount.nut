__Add(

	"e__cam_mv_enabled",

	function(params)
	{
		Convars.SetValue("sv_rollangle", "2");
	}
);

__Add(

	"e__cam_mv_disabled",

	function(params)
	{
		Convars.SetValue("sv_rollangle", "0");
	}
);
