player switchMove "TestSurrender";
null = [[player], "TazerFunction", nil, false] spawn BIS_fnc_MP;
null = [player] execVM "restrain\restrain.sqf";
disableUserInput true;
sleep 7;
disableUserInput false;
if(isrestrained == 0)then
{
	player switchMove "";
	sleep 5;
	disableUserInput false;
}
else
{
	sleep 5;
	disableUserInput false;
};





/*
_victim = player;
player switchmove "AmovPercMstpSnonWnonDnon_Ease";
hint format ["%1 is dmg",dmg];
currenthp = getDammage player;
player setdamage (currenthp - dmg);
[[_victim], "tazerFunction", nil, false] spawn BIS_fnc_MP;
//sleep 7;
player switchmove "";


//"AmovPercMstpSnonWnonDnon_Ease";
*/