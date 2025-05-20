Handler.Mount("construction_worker_consistency_fix",
	{
		function OnHandlerEvent_enabled ()
		{
			__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
		}

		function OnHandlerEvent_updated ()
		{

		}

		function OnHandlerEvent_disabled ()
		{

		}

		function OnGameEvent_round_start (event)
		{
			for (local common; common = Entities.FindByClassname(common, "infected"); )
			{
				if (NetProps.GetPropInt(common, "m_Gender") == 13 && !IsAnyoneBiled())
				{
					local goal = GetTarget(common);

					if (goal)
					{
						CommandABot(
							{
								bot = common,
								cmd = 0,
								target = goal
							}
						);
					}
				}
			}
		}

		function GetTarget (who)
		{
			local possibles = [];

			for (local goal; goal = Entities.FindByClassnameWithin(goal, "info_goal_infected_chase", who.GetOrigin(), 4096); )
			{
				if ((NetProps.GetPropInt(goal, "m_iEFlags") & (1 << 22)) == 0)
				{
					if (!Entities.FindByClassnameWithin(null, "pipe_bomb_projectile", goal.GetOrigin(), 64))
					{
						possibles.append(goal);
					}
				}
			}

			if (possibles.len() > 0)
			{
				return possibles[possibles.len() - 1];
			}
			else
			{
				return;
			}
		}

		function IsAnyoneBiled ()
		{
			for (local player; player = Entities.FindByClassname(player, "player"); )
			{
				if (player.IsIT())
				{
					return true;
				}
			}

			return false;
		}
	}
);
