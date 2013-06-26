// setupPlayer.sqf
// This file is used as a default setup for a player.

// _state variable will be a number.
// 1 = when player fist spawns in server
// 2 = when a respawn (player death, or Esc -> Respawn
_state = _this;

if (_state == 1) then
{
    player setVariable["mylicenses", "_wip"]; //are
    player setVariable["myinventory", "_wip"]; //these
    player setVariable["mywanted", "_wip"]; //used?
    
    player setVariable["isrestrained",0,true];
    
    player setVariable["bankmoney",15000,true];
    player setVariable["iswanted",0,true];
    player setVariable["isrestrained",0,true];
    player setVariable["mypaycheck", 1750,true];

    player setVariable["driverlicense",0,true];
    player setVariable["airlicense",0,true];
    player setVariable["boatlicense",0,true];
    player setVariable["oilprocesslicense",0,true];
    player setVariable["heroinprocesslicense",0,true];
    player setVariable["huntinglicense",0,true];
    player setVariable["pistollicense",0,true];
    player setVariable["riflelicense",0,true];
    
    if(side player == west) then
    {
        player setVariable["driverlicense", 1,true];
		player setVariable["pistollicense",1,true];
        player setVariable["mypaycheck", 3500,true];
        Player addEventHandler ["Fired","shooter = (_this select 0); weapon = (_this select 1); execVM 'firedEH.sqf'"];
        //personalinv = player addaction ["Personal Inventory", "copinventory.sqf", [], 1, false, false, "", ""];
        //act1 = player addaction ["Cop Menu [W.I.P]", "somscripts\menu\open.sqf", [], 1, false, false, "", ""];
        execVM "somscripts\som_init.sqf";
        patrolmission = 0;
    };
	if(side player == east) then
    {
        player setVariable["driverlicense", 1,true];
		player setVariable["pistollicense",1,true];
        player setVariable["mypaycheck", 3000,true];
        Player addEventHandler ["Fired","shooter = (_this select 0); weapon = (_this select 1); execVM 'firedEH.sqf'"];
        //personalinv = player addaction ["Personal Inventory", "copinventory.sqf", [], 1, false, false, "", ""];
        //act1 = player addaction ["Cop Menu [W.I.P]", "somscripts\menu\open.sqf", [], 1, false, false, "", ""];
        execVM "somscripts\som_init.sqf";
        patrolmission = 0;
    };
    if(side player == civilian) then
    {
        "stunned" addPublicVariableEventHandler {if(player == stunned)then{stunned execVM 'stun.sqf'; execVM 'stunsound.sqf';};};
        Player addMPEventHandler ["MPhit","victim = (_this select 0); shotby = (_this select 1); dmg = (_this select 2); execVM 'hitEH.sqf'"];
        //personalinv = player addaction ["Personal Inventory", "inventory.sqf", [], 1, false, false, "", ""];
    };
};
if (_state == 2) then
{
    //what to do if the player respawned.
    //not 100% sure if this works due to how addMPEventHandler handles parameter passing.
};

if ( [player] call LIFE_fnc_isSwat ) then
{
	execVM "somscripts\som_init.sqf";
    [player] call LIFE_fnc_swatLoadout;
};

/* Everything else that a player should have regardless of first time or respawn */
    
	isrestrained = 0; // is this even used? yes
	victim2 = 0; // is this even used?
	thirstLevel = 100; // is this even used? yes
	hungryLevel = 100; // for new hud
    
    player setVariable["mymoney",0,true];
    player setVariable["usedspace",0,true];
    player setVariable["totalspace",70,true];
	player setVariable["arrested",0,true];
	player setVariable["bailed",0,true];
    
    // carrying items
    player setVariable["itemwhale",0,true];
    player setVariable["itemunpheroin",0,true];
    player setVariable["itemproheroin",0,true];
    player setVariable["itemapple",0,true];
    player setVariable["itemfish",0,true];
    player setVariable["itemunpoil",0,true];
    player setVariable["itemprooil",0,true];
    player setVariable["itemwood",0,true];
    player setVariable["itemrabbitmeat",0,true];
   
    // player setVariable["rabbitmeatModel",0]; // broken for now
    
	waitUntil { alive player }; //why do we have to wiat until the player is alive?
    
    /*************************************/
    /* Add all the actions to the player */
        /* ---- Start of Collecting Actions ---- */
        // apples
        for "_i" from 0 to (count (allCollectingTriggers select 0)) - 1 do
        {
            _selection = 0;
            
            _params = [ ((allCollectingTriggers select _selection) select _i), 3, 2, applerate, "Gathering Apples...", format["You got %1 Apple!",applerate], "Gather Apples", _selection, _i, "itemapple" ];
            
            _condition = format["player in list ((allCollectingTriggers select %1) select %2)", _selection, _i];
            (allCollectingActions select _selection) set[_i, player addAction ["Gather Apples", "farming\startCollecting.sqf",_params,7,true,true,"", _condition] ];
        };
        // fishing
        for "_i" from 0 to (count (allCollectingTriggers select 1)) - 1 do
        {
            _selection = 1;
            
            _params = [ ((allCollectingTriggers select _selection) select _i), 4, 2, fishrate, "Gathering Fish...", format["You got %1 Fish!",fishrate], "Catch Fish", _selection, _i, "itemfish" ];
            
            _condition = format["player in list ((allCollectingTriggers select %1) select %2)", _selection, _i];
            (allCollectingActions select _selection) set[_i, player addAction ["Catch Fish", "farming\startCollecting.sqf",_params,7,true,true,"", _condition] ];
        };
        // oil
        for "_i" from 0 to (count (allCollectingTriggers select 2)) - 1 do
        {
            _selection = 2;
            
            _params = [ ((allCollectingTriggers select _selection) select _i), 10, 10, oilrate, "Gathering Oil...", format["You got %1 Oil!",oilrate], "Gather Oil", _selection, _i, "itemunpoil" ];
            
            _condition = format["player in list ((allCollectingTriggers select %1) select %2)", _selection, _i];
            (allCollectingActions select _selection) set[_i, player addAction ["Gather oil", "farming\startCollecting.sqf",_params,7,true,true,"", _condition] ];
        };
        // wood
        for "_i" from 0 to (count (allCollectingTriggers select 3)) - 1 do
        {
            _selection = 3;
            
            _params = [ ((allCollectingTriggers select _selection) select _i), 10, 1, woodrate, "Chopping Down Tree...", format["You got %1 wood log!",woodrate], "Gather Wood", _selection, _i, "itemwood" ];
            
            _condition = format["player in list ((allCollectingTriggers select %1) select %2)", _selection, _i];
            (allCollectingActions select _selection) set[_i, player addAction ["Gather Wood", "farming\startCollecting.sqf",_params,7,true,true,"", _condition] ];
        };
        // whale
        for "_i" from 0 to (count (allCollectingTriggers select 4)) - 1 do
        {
            _selection = 4;
            
            _params = [ ((allCollectingTriggers select _selection) select _i), 30, 10, woodrate, "Getting Whale...", format["You got %1 whale!",whalerate], "Get Whale", _selection, _i, "itemwhale" ];
            
            _condition = format["player in list ((allCollectingTriggers select %1) select %2)", _selection, _i];
            (allCollectingActions select _selection) set[_i, player addAction ["Get Whale", "farming\startCollecting.sqf",_params,7,true,true,"", _condition] ];
        };
        // heroin
        for "_i" from 0 to (count (allCollectingTriggers select 5)) - 1 do
        {
            _selection = 5;
            
            _params = [ ((allCollectingTriggers select _selection) select _i), 10, 1, heroinrate, "Getting Heroin...", format["You got %1 heroin!",heroinrate], "Farm Heroin", _selection, _i, "itemunpheroin" ];
            
            _condition = format["player in list ((allCollectingTriggers select %1) select %2)", _selection, _i];
            (allCollectingActions select _selection) set[_i, player addAction ["Farm Heroin", "farming\startCollecting.sqf",_params,7,true,true,"", _condition] ];
        };
        
        rabbits = player addAction ["Pickup rabbit","farming\pickuprabbit.sqf",[],7,true,true,"","player in list trgRabbit"];
        /* ---- End of Collecting Actions ---- */
        
        /* ---- Start of Vehicle Repair Actions ---- */
        // Car Repair
        for "_i" from 0 to (count (allServicingTriggers select 0)) - 1 do
        {
            _selection = 0;

            _condition = format["vehicle player in list ((allServicingTriggers select %1) select %2)", _selection, _i];
            (allServicingActions select _selection) set[_i, player addAction ["Repair Vehicle", "Service\CarRepair.sqf",[_selection, _i],7,true,true,"", _condition] ];
        };
        // Heli Repair
        for "_i" from 0 to (count (allServicingTriggers select 1)) - 1 do
        {
            _selection = 1;

            _condition = format["vehicle player in list ((allServicingTriggers select %1) select %2) && (getpos (vehicle player) select 2 <= 1)", _selection, _i];
            (allServicingActions select _selection) set[_i, player addAction ["Repair Vehicle", "Service\helirepair.sqf",[_selection, _i],7,true,true,"", _condition] ];
        };
        // Car Refuel
        for "_i" from 0 to (count (allServicingTriggers select 2)) - 1 do
        {
            _selection = 2;

            _condition = format["vehicle player in list ((allServicingTriggers select %1) select %2)", _selection, _i];
            (allServicingActions select _selection) set[_i, player addAction ["Refuel Vehicle", "Service\Refuel.sqf",[_selection, _i],7,true,true,"", _condition] ];
        };
        /* ---- End of Vehicle Repair Actions ---- */
        
        /* ---- Start of Generic Actions ---- */
        
        if (side player == civilian) then
        {
            personalinv = player addAction ["Personal Inventory", "inventory.sqf", [], 1, false, false, "", ""];
        };
        if (side player == west) then
        {
            personalinv = player addAction ["Personal Inventory", "copinventory.sqf", [], 1, false, false, "", ""];
            act1 = player addAction ["Cop Menu [W.I.P]", "somscripts\menu\open.sqf", [], 1, false, false, "", ""];
            
            Markers = [];
            execVM "hud\Markers.sqf";
            
            // did these ever get used?
            //null = [] execvm "somstart.sqf";
            //act1 = player addaction ["Cop Menu [W.I.P]", "somscripts\menu\open.sqf", [], 1, false, false, "", ""];
        };
		if (side player == east) then
        {
            personalinv = player addAction ["Personal Inventory", "copinventory.sqf", [], 1, false, false, "", ""];
            act1 = player addAction ["-=SWAT Menu=-", "somscripts\swatmenu\open.sqf", [], 1, false, false, "", ""];
            
            Markers = [];
            execVM "hud\Markersswat.sqf";
            
            // did these ever get used?
            //null = [] execvm "somstart.sqf";
            //act1 = player addaction ["Cop Menu [W.I.P]", "somscripts\menu\open.sqf", [], 1, false, false, "", ""];
        };
		
		
		
		sleep (random 6);
		jip_uid = [getplayeruid player,player];
		publicvariableserver "jip_uid";
		
        /* ---- End of Generic Actions ---- */
    /* End of Adding Actions */
/* End of everything else that a player should have */
    