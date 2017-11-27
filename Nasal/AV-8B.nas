# remap pylons for animations over mp

var stores = {
	"Empty": 0,
	"Left Middle Drop Tank": 1,
	"Left Inside Drop Tank": 1,
	"Right Inside Drop Tank": 1,
	"Right Middle Drop Tank": 1,
};

var mp_assign = func(pylon) {
	#print("mp_assign fired!");
	var name = getprop("/payload/weight["~pylon~"]/selected");
	#print(name);
	if ( name != nil ) {
		if (contains(stores,name)) {
			#print("Setting " ~ name ~ " to " ~ pylon);
			setprop("/sim/multiplay/generic/short["~pylon~"]",stores[name]);
		}
	}
}

var fuel_loop = func() {
	if ( getprop("/payload/weight[1]/selected") != "Left Middle Drop Tank" ) {
		setprop("/consumables/fuel/tank[8]/level-gal_us",0);
	}
	if ( getprop("/payload/weight[2]/selected") != "Left Inside Drop Tank" ) {
		setprop("/consumables/fuel/tank[9]/level-gal_us",0);
	}
	if ( getprop("/payload/weight[4]/selected") != "Right Inside Drop Tank" ) {
		setprop("/consumables/fuel/tank[10]/level-gal_us",0);
	}
	if ( getprop("/payload/weight[5]/selected") != "Right Middle Drop Tank" ) {
		setprop("/consumables/fuel/tank[11]/level-gal_us",0);
	}
	settimer(func(){fuel_loop();},1);
}

var _init = func() {
	pylons.init();
	fuel_loop();
	#print("initting");
	setlistener("/payload/weight[0]/selected",func(){mp_assign(0)});
	setlistener("/payload/weight[1]/selected",func(){mp_assign(1)});
	setlistener("/payload/weight[2]/selected",func(){mp_assign(2)});
	setlistener("/payload/weight[3]/selected",func(){mp_assign(3)});
	setlistener("/payload/weight[4]/selected",func(){mp_assign(4)});
	setlistener("/payload/weight[5]/selected",func(){mp_assign(5)});
	setlistener("/payload/weight[6]/selected",func(){mp_assign(6)});
	setlistener("/payload/weight[7]/selected",func(){mp_assign(7)});
	setlistener("/payload/weight[8]/selected",func(){mp_assign(8)});
}
 _init();