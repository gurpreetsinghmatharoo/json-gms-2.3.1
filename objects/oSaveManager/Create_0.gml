/// @description 
Save = function () {
	// Relevant data
	var _pandaCount = instance_number(oPanda);
	
	// Create root struct
	var _rootStruct = {
		pandaCount : _pandaCount,
		pandas : array_create(_pandaCount)
	};
	
	// Fill panda data
	for (var i = 0; i < _pandaCount; i ++) {
		var _panda = instance_find(oPanda, i);
		
		_rootStruct.pandas[i] = {
			x : _panda.x,
			y : _panda.y,
			hp : _panda.hp
		}
	}
	
	// Save to json
	var _json = json_stringify(_rootStruct);
	
	SaveString(_json, "mysave");
}

Load = function () {
	if (!file_exists("mysave")) return;
	
	// Load JSON
	var _json = LoadString("mysave");
	var _rootStruct = json_parse(_json);
	
	// Recreate pandas
	instance_destroy(oPanda);
	
	var _pandaCount = _rootStruct.pandaCount;
	var _pandas = _rootStruct.pandas;
	
	for (var i = 0; i < _pandaCount; i ++) {
		var _pandaData = _pandas[i];
		
		// Create new
		var _panda = instance_create_layer(_pandaData.x, _pandaData.y, "Instances", oPanda);
		_panda.hp = _pandaData.hp;
	}
}