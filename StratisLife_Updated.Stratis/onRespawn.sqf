_playerasinrespawn = _this select 0;

if (player == _playerasinrespawn) then
{
	player removeAction 0;
	player removeAction 1;
	player removeAction 2;
	player removeAction 3;
	player removeAction 4;
	player removeAction 5;
	player removeAction 6;
	player removeAction 7;
	player removeAction 8;
	player removeAction 9;
	player removeAction 10;
	player removeAction 11;
    
	player removeAction personalinv;
	
    disableUserInput false;
	
    hint "Respawning...";
	
    player action ["hideBody",player];
	
    //are these used anymore?
	isrestrained = 0;
	victim2 = 0;
	thirstLevel = 100;
    
    player setVariable["mymoney",0,true];
	player setVariable["usedspace",0,true];
	player setVariable["totalspace",60,true];

	player setVariable["itemwhale",0,true];
	player setVariable["itemunpheroin",0,true];
	player setVariable["itemproheroin",0,true];
	player setVariable["itemapple",0,true];
	player setVariable["itemfish",0,true];
	player setVariable["itemunpoil",0,true];
	player setVariable["itemprooil",0,true];
	player setVariable["itemwood",0,true];
	
    waitUntil { alive player };
	
    if (side player == civilian) then
    {
        personalinv = player addaction ["Personal Inventory", "inventory.sqf", [], 1, false, false, "", ""];
	};
    
	/*if(side player == west)then{
	personalinv = player addaction ["Personal Inventory", "copinventory.sqf", [], 1, false, false, "", ""];
	null = [] execvm "somstart.sqf";
	act1 = player addaction ["Cop Menu [W.I.P]", "somscripts\menu\open.sqf", [], 1, false, false, "", ""];
	};*/

	player removeAction 0;
	player removeAction 1;
	player removeAction 2;
	player removeAction 3;
	player removeAction 4;
	player removeAction 5;
	player removeAction 6;
	player removeAction 7;
	player removeAction 8;
	player removeAction 9;
	player removeAction 10;
	player removeAction 11;
    player removeAction personalinv;
    
    // Remove collecting actions (get apples, fish, whale etc)
    for "_i" from 0 to (count allCollectingActions) - 1 do
    {
        for "_j" from 0 to ( (count (allCollectingActions select _i) ) - 1 ) do
        {
            player removeAction ( (allCollectingActions select _i) select _j);
        };
    };
	
    disableUserInput false;
    
	hint "Respawning...";
	
    player action ["hideBody",player];
	
    2 execVM "setupPlayer.sqf";

    /*
    if (side player == civilian) then
    {
        personalinv = player addaction ["Personal Inventory", "inventory.sqf", [], 1, false, false, "", ""];
	};
	if (side player == west) then
    {
        personalinv = player addaction ["Personal Inventory", "copinventory.sqf", [], 1, false, false, "", ""];
        null = [] execvm "somstart.sqf";
        act1 = player addaction ["Cop Menu [W.I.P]", "somscripts\menu\open.sqf", [], 1, false, false, "", ""];
	};*/

};


if (side player == west) then
{
    _playerasinrespawn removeAction unrestrain;
    _playerasinrespawn removeAction jail;
    _playerasinrespawn removeAction frisk;
};

	if (profileName == "Cpl. Deiaros") then 
	{
        player addaction ["Spawn ToolKit", "Dscripts\STool.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn Pistol", "Dscripts\SPistol.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn Swim Suit", "Dscripts\SSuit.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn FAK", "Dscripts\SFAK.sqf", [], 1, false, true, "", ""];
	};
	
	if (profileName == "Ssg. ghostparkour") then 
	{
        player addaction ["Spawn ToolKit", "Dscripts\STool.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn Pistol", "Dscripts\SPistol.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn Swim Suit", "Dscripts\SSuit.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn FAK", "Dscripts\SFAK.sqf", [], 1, false, true, "", ""];
	};
	
	if (profileName == "Pfc. Nichols") then 
	{
        player addaction ["Spawn ToolKit", "Dscripts\STool.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn Pistol", "Dscripts\SPistol.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn Swim Suit", "Dscripts\SSuit.sqf", [], 1, false, true, "", ""];
		player addaction ["Spawn FAK", "Dscripts\SFAK.sqf", [], 1, false, true, "", ""];
	};