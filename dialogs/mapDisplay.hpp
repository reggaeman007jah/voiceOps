/*
Display settings for in-map GUI 
*/

class RscTitles {
 class Default {
       idd = -1;
       fadein = 0;
       fadeout = 0;
       duration = 0;
    };

	// ----- in-map labels and vlaues for mission 

	class SUPPLY_STATS_TOP_LABEL {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "SUPPLY_STATS_TOP_LABEL";
		onLoad = "with uiNameSpace do { SUPPLY_STATS_TOP_LABEL = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999100;
                style = 0x00;
                lineSpacing = 1;
				x = 0.120 * safezoneW + safezoneX;
				y = 0.000 * safezoneH + safezoneY;
				w = 0.100 * safezoneW;
				h = 0.100 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};


	class BARRACKS_STATS_TOP_LABEL {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "BARRACKS_STATS_TOP_LABEL";
		onLoad = "with uiNameSpace do { BARRACKS_STATS_TOP_LABEL = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999101;
                style = 0x00;
                lineSpacing = 1;
				x = 0.220 * safezoneW + safezoneX;
				y = 0.000 * safezoneH + safezoneY;
				w = 0.100 * safezoneW;
				h = 0.100 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};

	class MEDICAL_STATS_TOP_LABEL {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "MEDICAL_STATS_TOP_LABEL";
		onLoad = "with uiNameSpace do { MEDICAL_STATS_TOP_LABEL = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999102;
                style = 0x00;
                lineSpacing = 1;
				x = 0.320 * safezoneW + safezoneX;
				y = 0.000 * safezoneH + safezoneY;
				w = 0.100 * safezoneW;
				h = 0.100 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};

	// class BARRACKS_STATS_FOOD_VALUE {
    //     idd = 1000003;
    //     movingEnable =  0;
    //     enableSimulation = 1;
    //     enableDisplay = 1;
    //     duration     =  99999;
    //     fadein       =  2.5;
    //     fadeout      =  2;
    //     name = "BARRACKS_STATS_FOOD_VALUE";
	// 	onLoad = "with uiNameSpace do { BARRACKS_STATS_FOOD_VALUE = _this select 0 }";
	
	// 	class controls {
	// 	    class structuredText {
    //             access = 0;
    //             type = 13;
    //             idc = 999102;
    //             style = 0x00;
    //             lineSpacing = 1;
	// 			x = 0.500 * safezoneW + safezoneX;
	// 			y = 0.050 * safezoneH + safezoneY;
	// 			w = 0.100 * safezoneW;
	// 			h = 0.050 * safezoneH;
    //             size = 0.020;
    //             colorBackground[] = {1,1,1,0.6};
    //             colorText[] = {0,0,0,1};
    //             text = "";
    //             font = "PuristaSemiBold";
				
	// 			class Attributes {
	// 				font = "PuristaSemiBold";
	// 				color = "#FFFFFF";
	// 				align = "CENTER";
	// 				valign = "TOP";
	// 				shadow = false;
	// 				shadowColor = "#000000";
	// 				underline = false;
	// 				size = "2";
	// 			}; 
    //         };
	// 	};
	// };

	// class BARRACKS_STATS_AMMO_LABEL {
    //     idd = 1000003;
    //     movingEnable =  0;
    //     enableSimulation = 1;
    //     enableDisplay = 1;
    //     duration     =  99999;
    //     fadein       =  2.5;
    //     fadeout      =  2;
    //     name = "BARRACKS_STATS_AMMO_LABEL";
	// 	onLoad = "with uiNameSpace do { BARRACKS_STATS_AMMO_LABEL = _this select 0 }";
	
	// 	class controls {
	// 	    class structuredText {
    //             access = 0;
    //             type = 13;
    //             idc = 999103;
    //             style = 0x00;
    //             lineSpacing = 1;
	// 			x = 0.400 * safezoneW + safezoneX;
	// 			y = 0.100 * safezoneH + safezoneY;
	// 			w = 0.100 * safezoneW;
	// 			h = 0.050 * safezoneH;
    //             size = 0.020;
    //             colorBackground[] = {1,1,1,0.6};
    //             colorText[] = {0,0,0,1};
    //             text = "";
    //             font = "PuristaSemiBold";
				
	// 			class Attributes {
	// 				font = "PuristaSemiBold";
	// 				color = "#FFFFFF";
	// 				align = "CENTER";
	// 				valign = "TOP";
	// 				shadow = false;
	// 				shadowColor = "#000000";
	// 				underline = false;
	// 				size = "2";
	// 			}; 
    //         };
	// 	};
	// };

	// class BARRACKS_STATS_AMMO_VALUE {
    //     idd = 1000003;
    //     movingEnable =  0;
    //     enableSimulation = 1;
    //     enableDisplay = 1;
    //     duration     =  99999;
    //     fadein       =  2.5;
    //     fadeout      =  2;
    //     name = "BARRACKS_STATS_AMMO_VALUE";
	// 	onLoad = "with uiNameSpace do { BARRACKS_STATS_AMMO_VALUE= _this select 0 }";
	
	// 	class controls {
	// 	    class structuredText {
    //             access = 0;
    //             type = 13;
    //             idc = 999104;
    //             style = 0x00;
    //             lineSpacing = 1;
	// 			x = 0.500 * safezoneW + safezoneX;
	// 			y = 0.100 * safezoneH + safezoneY;
	// 			w = 0.100 * safezoneW;
	// 			h = 0.050 * safezoneH;
    //             size = 0.020;
    //             colorBackground[] = {1,1,1,0.6};
    //             colorText[] = {0,0,0,1};
    //             text = "";
    //             font = "PuristaSemiBold";
				
	// 			class Attributes {
	// 				font = "PuristaSemiBold";
	// 				color = "#FFFFFF";
	// 				align = "CENTER";
	// 				valign = "TOP";
	// 				shadow = false;
	// 				shadowColor = "#000000";
	// 				underline = false;
	// 				size = "2";
	// 			}; 
    //         };
	// 	};
	// };

	// class BARRACKS_STATS_FUEL_LABEL {
    //     idd = 1000003;
    //     movingEnable =  0;
    //     enableSimulation = 1;
    //     enableDisplay = 1;
    //     duration     =  99999;
    //     fadein       =  2.5;
    //     fadeout      =  2;
    //     name = "BARRACKS_STATS_FUEL_LABEL";
	// 	onLoad = "with uiNameSpace do { BARRACKS_STATS_FUEL_LABEL= _this select 0 }";
	
	// 	class controls {
	// 	    class structuredText {
    //             access = 0;
    //             type = 13;
    //             idc = 999105;
    //             style = 0x00;
    //             lineSpacing = 1;
	// 			x = 0.400 * safezoneW + safezoneX;
	// 			y = 0.150 * safezoneH + safezoneY;
	// 			w = 0.100 * safezoneW;
	// 			h = 0.050 * safezoneH;
    //             size = 0.020;
    //             colorBackground[] = {1,1,1,0.6};
    //             colorText[] = {0,0,0,1};
    //             text = "";
    //             font = "PuristaSemiBold";
				
	// 			class Attributes {
	// 				font = "PuristaSemiBold";
	// 				color = "#FFFFFF";
	// 				align = "CENTER";
	// 				valign = "TOP";
	// 				shadow = false;
	// 				shadowColor = "#000000";
	// 				underline = false;
	// 				size = "2";
	// 			}; 
    //         };
	// 	};
	// };

	// class BARRACKS_STATS_FUEL_VALUE {
    //     idd = 1000003;
    //     movingEnable =  0;
    //     enableSimulation = 1;
    //     enableDisplay = 1;
    //     duration     =  99999;
    //     fadein       =  2.5;
    //     fadeout      =  2;
    //     name = "BARRACKS_STATS_FUEL_VALUE";
	// 	onLoad = "with uiNameSpace do { BARRACKS_STATS_FUEL_VALUE= _this select 0 }";
	
	// 	class controls {
	// 	    class structuredText {
    //             access = 0;
    //             type = 13;
    //             idc = 999106;
    //             style = 0x00;
    //             lineSpacing = 1;
	// 			x = 0.500 * safezoneW + safezoneX;
	// 			y = 0.150 * safezoneH + safezoneY;
	// 			w = 0.100 * safezoneW;
	// 			h = 0.050 * safezoneH;
    //             size = 0.020;
    //             colorBackground[] = {1,1,1,0.6};
    //             colorText[] = {0,0,0,1};
    //             text = "";
    //             font = "PuristaSemiBold";
				
	// 			class Attributes {
	// 				font = "PuristaSemiBold";
	// 				color = "#FFFFFF";
	// 				align = "CENTER";
	// 				valign = "TOP";
	// 				shadow = false;
	// 				shadowColor = "#000000";
	// 				underline = false;
	// 				size = "2";
	// 			}; 
    //         };
	// 	};
	// };

	// class BARRACKS_STATS_SENTRY_LABEL {
    //     idd = 1000003;
    //     movingEnable =  0;
    //     enableSimulation = 1;
    //     enableDisplay = 1;
    //     duration     =  99999;
    //     fadein       =  2.5;
    //     fadeout      =  2;
    //     name = "BARRACKS_STATS_SENTRY_LABEL";
	// 	onLoad = "with uiNameSpace do { BARRACKS_STATS_SENTRY_LABEL= _this select 0 }";
	
	// 	class controls {
	// 	    class structuredText {
    //             access = 0;
    //             type = 13;
    //             idc = 999107;
    //             style = 0x00;
    //             lineSpacing = 1;
	// 			x = 0.400 * safezoneW + safezoneX;
	// 			y = 0.200 * safezoneH + safezoneY;
	// 			w = 0.100 * safezoneW;
	// 			h = 0.050 * safezoneH;
    //             size = 0.020;
    //             colorBackground[] = {1,1,1,0.6};
    //             colorText[] = {0,0,0,1};
    //             text = "";
    //             font = "PuristaSemiBold";
				
	// 			class Attributes {
	// 				font = "PuristaSemiBold";
	// 				color = "#FFFFFF";
	// 				align = "CENTER";
	// 				valign = "TOP";
	// 				shadow = false;
	// 				shadowColor = "#000000";
	// 				underline = false;
	// 				size = "2";
	// 			}; 
    //         };
	// 	};
	// };

	// class BARRACKS_STATS_SENTRY_VALUE {
    //     idd = 1000003;
    //     movingEnable =  0;
    //     enableSimulation = 1;
    //     enableDisplay = 1;
    //     duration     =  99999;
    //     fadein       =  2.5;
    //     fadeout      =  2;
    //     name = "BARRACKS_STATS_SENTRY_VALUE";
	// 	onLoad = "with uiNameSpace do { BARRACKS_STATS_SENTRY_VALUE= _this select 0 }";
	
	// 	class controls {
	// 	    class structuredText {
    //             access = 0;
    //             type = 13;
    //             idc = 999108;
    //             style = 0x00;
    //             lineSpacing = 1;
	// 			x = 0.500 * safezoneW + safezoneX;
	// 			y = 0.200 * safezoneH + safezoneY;
	// 			w = 0.100 * safezoneW;
	// 			h = 0.050 * safezoneH;
    //             size = 0.020;
    //             colorBackground[] = {1,1,1,0.6};
    //             colorText[] = {0,0,0,1};
    //             text = "";
    //             font = "PuristaSemiBold";
				
	// 			class Attributes {
	// 				font = "PuristaSemiBold";
	// 				color = "#FFFFFF";
	// 				align = "CENTER";
	// 				valign = "TOP";
	// 				shadow = false;
	// 				shadowColor = "#000000";
	// 				underline = false;
	// 				size = "2";
	// 			}; 
    //         };
	// 	};
	// };

};