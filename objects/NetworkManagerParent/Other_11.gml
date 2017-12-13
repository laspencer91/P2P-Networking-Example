/// @description Spawn Me And Everyone Else!

with (Client)
{
	if (variable_instance_exists(id, "myTeam"))
	{
		pawn = instance_create_layer(mySpawnX, mySpawnY, "Instances", ClientPawn);
		pawn.image_blend = (myTeam == NetworkManagerParent.myTeam) ? c_blue : c_red;
		pawn.owner = id;
		pawn.displayName = myClientName;
		pawn.myTeam = myTeam;
	}
}

with (instance_create_layer(mySpawnX, mySpawnY, "Instances", Player))
{
	owner  = other;
	myTeam = other.myTeam;
	other.pawn = id;
}