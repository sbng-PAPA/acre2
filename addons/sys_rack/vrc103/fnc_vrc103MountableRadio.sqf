/*
 * Author: ACRE2Team
 * Check if the radio is mountable in AN/VRC103 rack.
 *
 * Arguments:
 * 0: Unique rack ID <STRING>
 * 1: Event type <STRING> (Unused)
 * 2: Event data with unique radio ID <STRING>
 * 3: Radio data <ARRAY> (Unused)
 *
 * Return Value:
 * Is radio mountable <BOOL>
 *
 * Example:
 * [cursorTarget] call acre_sys_rack_fnc_vrc103MountableRadio
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_rackId", "", "_eventData", ""];

if (([_rackId] call FUNC(getMountedRadio)) != "") exitWith {false}; // If a radio is already mounted we can't mount another.

private _mountable = false;
private _radioId = _eventData;
private _baseClass = BASE_CLASS_CONFIG(_radioId);

if (_baseClass in ["ACRE_PRC117F"]) then { _mountable = true; };

_mountable
