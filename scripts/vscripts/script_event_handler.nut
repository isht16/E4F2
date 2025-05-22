::__listeners <- {};
::__index <- {};

::__count <- 0;

::__Add <- function(id, func)
{
	__listeners[__count] <- func;
	__index[__count] <- id;

	__count++;
}

::__Remove <- function(id)
{
	foreach (i, v in __index)
	{
		if (v == id)
		{
			__listeners[i] <- null;
			__index[i] <- null;

			break;
		}
	}
}

::__Sent <- function(id, event)
{
	foreach (i, v in __index)
	{
		if (v == id)
		{
			__listeners[i](event);

			break;
		}
	}
}
