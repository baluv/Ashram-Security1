//styles
var BLANK_IMAGE="/images/careers/2009/trans.gif";

var color_lev1 = {"bgON":"","bgOVER":""};

var css_lev0 = {"ON":"menus_lev1_on", "OVER":"menus_lev1_Over"};
var css_lev1 = {"ON":"menus_ywipro_On", "OVER":"menus_ywipro_Over"};
var css_lev2 = {"ON":"menus_decwipro_On", "OVER":"menus_decwipro_Over"};
var css_lev3 = {"ON":"menus_inwipro_on", "OVER":"menus_inwipro_over"};
var css_lev4 = {"ON":"menus_hotjob_on", "OVER":"menus_hotjob_over"};
var css_lev5 = {"ON":"menus_spartners_on", "OVER":"menus_spartners_over"};
var css_lev6 = {"ON":"menus_contactus_on", "OVER":"menus_contactus_over"};

var style_lev1_0 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev0};
var style_lev1_1 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev1};
var style_lev1_2 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev2};
var style_lev1_3 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev3};
var style_lev1_4 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev4};
var style_lev1_5 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev5};
var style_lev1_6 = {"border":0, "shadow":0, "color":color_lev1, "css":css_lev6};

var color_lev1_tab = {"bgON":"","bgOVER":""};
var color_lev2 = {"border":"#d5dcdf","shadow":"#797979","bgON":"#FFFFFF","bgOVER":"#FFFFFF"};

var css_lev1_tab = {"ON":"menus_lev1_tab", "OVER":"menus_lev1_tab"};
var css_lev2 = {"ON":"menus_lev2_On", "OVER":"menus_lev2_Over"};

var style_lev1_tab = {"border":0, "shadow":0, "color":color_lev1_tab, "css":css_lev1_tab};
var style_lev2 = {"border":1, "shadow":0, "color":color_lev2, "css":css_lev2};

var color_lev2_tab = {"border":"","shadow":"0", "bgON":"", "bgOVER":""};
var css_lev2_tab = {"ON":"menus_ver_sep", "OVER":"menus_ver_sep"};
var style_ver_sep = {"border":0, "shadow":0, "color":color_lev2_tab, "css":css_lev2_tab};

var css_lev2_btm = {"ON":"menus_btm_sep", "OVER":"menus_btm_sep"};
var style_btm_sep = {"border":0, "shadow":0, "color":color_lev2_tab, "css":css_lev2_btm};


//items and formats
var MENU_ITEMS_STYLING_SUB =
[
 	{"pos":"relative"},

// For Inroads to Wipro
	{code:"Applying to Wipro","url":"http://careers.wipro.com/applying_wipro/index.htm","format":{"itemoff":[0,1], "leveloff":[14,0], "style":style_lev1_3,"size":[28,115]}},
	{code:"&nbsp","format":{"itemoff":[0,115], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},

// For Why Wipro
	
	{code:"Why Wipro","url":"http://careers.wipro.com/why_wipro/index.htm","format":{"itemoff":[0,2], "leveloff":[14,0], "style":style_lev1_1, "size":[28,80]},
		sub:[
			{"itemoff":[21,0],"size":[22,145],"style":style_lev2},
			{code:"Life @ Wipro","url":"http://careers.wipro.com/why_wipro/life_wipro.htm"},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Spirit of Wipro","url":"http://careers.wipro.com/why_wipro/spiritofwipro.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Equal Opportunities","url":"http://careers.wipro.com/why_wipro/equal_opportunity.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Eco Eye","url":"http://careers.wipro.com/why_wipro/eco_eye.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_btm_sep, "size":[6,145]}}
			]
	},
	{code:"&nbsp","format":{"itemoff":[0,80], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},

// For Divisions in Wipro		
	{code:"Businesses","url":"/itbusiness/index.htm","format":{"itemoff":[0,1], "leveloff":[14,0], "style":style_lev1_2,"size":[28,120]},
		sub:[
			{"itemoff":[21,0],"size":[22,270],"style":style_lev2},
			{code:"Business Technology Services(ES)","url":"http://careers.wipro.com/itbusiness/business_bts.htm"},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Business Technology Services (FS & TMT)","url":"http://careers.wipro.com/itbusiness/business_fstmt.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Enterprise Application Services","url":"http://careers.wipro.com/itbusiness/business_eas.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},			
			{code:"Energy &amp; Utilities","url":"http://careers.wipro.com/itbusiness/business_es.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},			
			{code:"Finance Solutions","url":"http://careers.wipro.com/itbusiness/business_fs.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},			
			{code:"Manufacturing & Healthcare Group","url":"http://careers.wipro.com/itbusiness/business_es_mfghls.htm","format":{"itemoff":[2,0]}},			
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},			
			{code:"Retail, Consumer Goods, Transportation & Services (RCTS)","url":"http://careers.wipro.com/itbusiness/business_es_rcts.htm","format":{"itemoff":[2,0]}},			
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Service Functions","url":"http://careers.wipro.com/itbusiness/business_sf.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Technology Infrastructure Services","url":"http://careers.wipro.com/itbusiness/business_tis.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Technology, Media and Telecom (TMT)","url":"http://careers.wipro.com/itbusiness/business_sl.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Testing Services","url":"http://careers.wipro.com/itbusiness/business_ts.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Consulting Services","url":"http://careers.wipro.com/itbusiness/business_wcs.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_btm_sep, "size":[6,145]}}
			]
	},
	{code:"&nbsp","format":{"itemoff":[0,120], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},


// For Hot Jobs	
	{code:"Hot Jobs","url":"http://careers.wipro.com/hotjobs/index.htm","format":{"itemoff":[0,1], "leveloff":[14,-1], "style":style_lev1_4,"size":[28,70]}},	
	{code:"&nbsp","format":{"itemoff":[0,70], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},
// For Staffing Partners"
	{code:"Staffing Partners","url":"http://careers.wipro.com/staffingpartners/index.htm","format":{"itemoff":[0,1], "leveloff":[14,-34], "style":style_lev1_5,"size":[28,110]},
		sub:[
			{"itemoff":[21,0],"size":[22,145],"style":style_lev2},
			{code:"Contract Staffing","url":"http://careers.wipro.com/staffingpartners/contract_staffing.htm"},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_ver_sep, "size":[3,145]}},
			{code:"Permanent Staffing","url":"http://careers.wipro.com/staffingpartners/permanent_staffing.htm","format":{"itemoff":[2,0]}},
			{code:"&nbsp;","url":"#","format":{"itemoff":[19,0], "style":style_btm_sep, "size":[6,145]}}
			]
	},	
	{code:"&nbsp","format":{"itemoff":[0,110], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},
// For Contact us"
	{code:"Contact us","url":"http://careers.wipro.com/contactus/index.htm","format":{"itemoff":[0,1], "leveloff":[14,0], "style":style_lev1_6,"size":[28,80]}},
	{code:"&nbsp","format":{"itemoff":[0,80], "leveloff":[0,0], "style":style_lev1_tab,"size":[28,1]}},
];