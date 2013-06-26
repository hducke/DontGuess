carspawn = getMarkerPos "Boatspawn";
getmymoney = player getVariable "mymoney";

if((player getVariable "boatlicense") >= 1) then
{
	if(side player == west) then
	{
		if((lbCurSel 11124) == 0) then
		{
			displayname = "Life Boat";
			thisprice = 5000;
			vehname = "B_Lifeboat";
			if((player getVariable "mymoney") >= thisprice) then
			{
				closeDialog 0;
				player setVariable ['mymoney', getmymoney - thisprice,true];
				hint format['You bought a %1 for %2$! You have %3 $ left!',displayname,thisprice,(player getVariable 'mymoney')];
                
				_veh = vehname createVehicle (carspawn);
                
                _veh lock true;
                clearWeaponCargoGlobal _veh;
                clearMagazineCargoGlobal _veh;
                clearItemCargoGlobal _veh;
                clearBackpackCargoGlobal _veh;

				removeammo = _veh;
				publicVariable "removeammo";

				vehiclelock = _veh addAction ['Unlock / Lock','vehiclelock\unlocklock.sqf',[],7,true,true,'','(_target distance _this) < 4'];
			}
			else
			{
			Hint format ["you have %1$ and need %2$",(player getVariable 'mymoney'),(thisprice)];
			};
		};
		if((lbCurSel 11124) == 1) then
		{
			displayname = "Assault Boat";
			thisprice = 7500;
			vehname = "B_Assaultboat";
			if((player getVariable "mymoney") >= thisprice) then
			{
				closeDialog 0;
				player setVariable ['mymoney', getmymoney - thisprice,true];
				hint format['You bought a %1 for %2$! You have %3 $ left!',displayname,thisprice,(player getVariable 'mymoney')];
                
				_veh = vehname createVehicle (carspawn);
                
                _veh lock true;
                clearWeaponCargoGlobal _veh;
                clearMagazineCargoGlobal _veh;
                clearItemCargoGlobal _veh;
                clearBackpackCargoGlobal _veh;

				removeammo = _veh;
				publicVariable "removeammo";
                
				vehiclelock = _veh addAction ['Unlock / Lock','vehiclelock\unlocklock.sqf',[],7,true,true,'','(_target distance _this) < 4'];
			}
			else
			{
			Hint format ["you have %1$ and need %2$",(player getVariable 'mymoney'),(thisprice)];
			};
		};
	};
	
	if(side player == civilian) then
	{
		if((lbCurSel 11124) == 0) then
		{
			displayname = "Boat";
			thisprice = 5000;
			vehname = "C_Rubberboat";
			if((player getVariable "mymoney") >= thisprice) then
			{
				closeDialog 0;
				player setVariable ['mymoney', getmymoney - thisprice,true];
				hint format['You bought a %1 for %2$! You have %3 $ left!',displayname,thisprice,(player getVariable 'mymoney')];
                
				_veh = vehname createVehicle (carspawn);

                _veh lock true;
                clearWeaponCargoGlobal _veh;
                clearMagazineCargoGlobal _veh;
                clearItemCargoGlobal _veh;
                clearBackpackCargoGlobal _veh;
				
				removeammo = _veh;
				publicVariable "removeammo";

				vehiclelock = _veh addAction ['Unlock / Lock','vehiclelock\unlocklock.sqf',[],7,true,true,'','(_target distance _this) < 4'];
			}
			else
			{
			Hint format ["you have %1$ and need %2$",(player getVariable 'mymoney'),(thisprice)];
			};
		};
	};
}else
{
hint "You need a boating license to purchase a boat"
};


