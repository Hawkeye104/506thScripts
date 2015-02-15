/*
CHANGELOG

this addAction [("<t color=""#F4FA58"">"+"Repair ATRQ" + "</t>") ,"scripts\ch47_repair.sqf",[1],0,false,true,""," driver  _target == _this"];

11FEB15
- Created
*/

_curVeh = _this select 0;
_curVeh setHitPointDamage ["HitVRotor", 0];


