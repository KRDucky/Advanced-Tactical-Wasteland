if ("ACE_DogTag" in magazines player) then
{
_pos = getpos player;
_dir = getdir player;
_object = "ACE_ConcertinaWireCoil" createvehiclelocal (_pos);
_object setdir (getdir player);
_object setpos (player modelToWorld [0,1, ((position player) select 2)]);
hint "Pulling out concertina wire...";
sleep 2;
hint "";
player removemagazine "ACE_DogTag";
}
else
{
hint "You need materials(Dogtags) to build!";
sleep 3;
};