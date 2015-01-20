/*
Sets skill of AI spawned with Zeus (hopefully)

CHANGELOG

20JAN15
- Created
*/

_setSkillLoop = [] spawn
{
    while {true} do
    {
        {
            if (!isPlayer _x && {!(_x getVariable ["hasSkillBeenSet",false])}) then
            {
                _x setSkill 0.4;
                _x setSkill ["aimingAccuracy", 0.2];
                _x setSkill ["aimingShake", 0.8];
                _x setSkill ["aimingSpeed", 0.6];
                _x setSkill ["Endurance",0.5];
                _x setSkill ["spotDistance",0.6];
                _x setSkill ["spotTime",0.6];
                _x setSkill ["courage", 0.8];
                _x setSkill ["reloadSpeed", 0.5];
                _x setVariable ["hasSkillBeenSet",true];
            };
        } forEach allUnits;

        sleep 10;
    };
};  
