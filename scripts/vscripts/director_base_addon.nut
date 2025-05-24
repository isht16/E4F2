::CommandEventCallbacks <-
{

}

::__idxxx <- 0;

::RegisterScriptCommandEventListener <- function(name) {

	printl(name);

	CommandEventCallbacks[__idxxx] <- name;

	__idxxx++;
}

IncludeScript("drop_item_enhancement/mount");

IncludeScript("configuration_file_handler");
IncludeScript("player_command_handler");
