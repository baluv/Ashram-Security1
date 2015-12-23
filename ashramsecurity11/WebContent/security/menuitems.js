//styles
var BLANK_IMAGE="/images/careers/2009/trans.gif";

var color_lev1 = {"bgON":"","bgOVER":""};

var css_lev0 = {"ON":"menu_lev1_on", "OVER":"menu_lev1_Over"};
var css_lev1 = {"ON":"menu_home_On", "OVER":"menu_home_Over"};
var css_lev2 = {"ON":"menu_it_On", "OVER":"menu_it_Over"};
//var css_lev5 = {"ON":"menu_kc_on", "OVER":"menu_kc_over"};
var css_lev3 = {"ON":"menu_bpo_on", "OVER":"menu_bpo_over"};
var css_lev4 = {"ON":"menu_consulting_on", "OVER":"menu_consulting_over"};

var style_lev1_0 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev0};
var style_lev1_1 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev1};
var style_lev1_2 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev2};
//var style_lev1_5 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev5};
var style_lev1_3 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev3};
var style_lev1_4 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev4};

var color_lev1_tab = {"bgON":"","bgOVER":""};
var color_lev2 = {"border":"#006ca6","shadow":"#797979","bgON":"#FFFFFF","bgOVER":"#FFFFFF"};

var css_lev1_tab = {"ON":"menu_lev1_tab", "OVER":"menu_lev1_tab"};
var css_lev2 = {"ON":"menu_lev2_On", "OVER":"menu_lev2_Over"};

var style_lev1_tab = {"border":0, "shadow":0, "color":color_lev1_tab, "css":css_lev1_tab};
var style_lev2 = {"border":1, "shadow":0, "color":color_lev2, "css":css_lev2};

var color_lev2_tab = {"border":"","shadow":"0", "bgON":"", "bgOVER":""};
var css_lev2_tab = {"ON":"menu_ver_sep", "OVER":"menu_ver_sep"};
var style_ver_sep = {"border":0, "shadow":0, "color":color_lev2_tab, "css":css_lev2_tab};
var style_lev2_tab = {"border":1, "shadow":0, "color":color_lev2_tab, "css":css_lev2_tab};

var css_lev2_btm = {"ON":"menu_btm_sep", "OVER":"menu_btm_sep"};
var style_btm_sep = {"border":0, "shadow":0, "color":color_lev2_tab, "css":css_lev2_btm};


//items and formats
var MENU_ITEMS_STYLING = 
[
 	{"pos":"relative"},
// For Home	
	{code:"Home","url":"http://careers.wipro.com/index.htm","format":{"itemoff":[0,2], "leveloff":[14,0], "style":style_lev1_1, "size":[28,72]}},
	{code:"&nbsp","format":{"itemoff":[0,72], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},
// For IT		
	{code:"IT","url":"#","format":{"itemoff":[0,1], "leveloff":[14,0], "style":style_lev1_2,"size":[28,97]},
		sub:[
			{"itemoff":[21,0],"size":[22,145],"style":style_lev2},
			{code:"Campus","url":"http://careers.wipro.com/campus/index.htm"},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Experienced","url":"http://careers.wipro.com/experience/index.htm","format":{"itemoff":[2,0]}},			
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_btm_sep, "size":[6,145]}}
			]
	},
	{code:"&nbsp","format":{"itemoff":[0,97], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},
// For BPO	
	{code:"BPO","url":"http://careers.wipro.com/bpo/index.htm","format":{"itemoff":[0,1], "leveloff":[14,0], "style":style_lev1_3,"size":[28,102]}},
	{code:"&nbsp","format":{"itemoff":[0,102], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},	
// For Consulting
	{code:"Consulting","url":"http://careers.wipro.com/consulting/index.htm","format":{"itemoff":[0,1], "leveloff":[14,-1], "style":style_lev1_4,"size":[28,104]}},	
	{code:"&nbsp","format":{"itemoff":[0,104], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},
];