createDialog "PistolMenu";
ctrlSetText[11168,format["Money: %1",(player getVariable "mymoney")]];
if(side player == west) then
{
	lbAdd[11169,"Tazer : 5000/500"];
};
if(side player == civilian) then
{
	lbAdd[11169,"Rook : 15000/3000"];
	lbAdd[11169,"P07 : 17500/3000"];
};