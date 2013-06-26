_vehicle = _this select 0;
_type = _this select 1;

_vehicle setVariable["BIS_randomSeed1",6,true];

if(_type) then {


_vehicle setObjectTexture [0,"#(ai,64,64,1)Fresnel(1.3,7)"];

} else {

_vehicle setObjectTexture [0,'#(argb,8,8,3)color(0.6,0.6,0.6,1)'];

};

_vehicle animate ["HidePolice", 0];
