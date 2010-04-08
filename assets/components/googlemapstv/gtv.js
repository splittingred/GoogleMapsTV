
var GTV = function() {
    return {
        createMap: function(o) {
            o = GTV.applyIf(o,{
                zoom: 14
                ,infoWindow: false
                ,controls: 'GLargeMapControl3D,GOverviewMapControl,GMapTypeControl'
                ,search: false
                ,labelControl: false
                ,customIcon: false
                ,iconImage: 'http://gmaps-samples.googlecode.com/svn/trunk/markers/blue/blank.png'
                ,traffic: false
                ,streetview: false
                ,streetviewYaw: 0
                ,streetviewPitch: 5
                ,streetviewUserPhotos: false
                ,ads: false
                ,adsMaxOnMap: 1
                ,adsPublisher: ''
                ,adsChannel: ''
                ,avoidHighways: false
            });
    
            if (GBrowserIsCompatible()) {
                var map = new GMap2(document.getElementById(o.el));
                var geocoder = new GClientGeocoder();
                
                geocoder.getLatLng(o.address,function(point) {
                    if (!point) {
                        alert(o.address + " not found");
                    } else {
                        map.setCenter(point,o.zoom);
                        
                        map.setMapType(G_NORMAL_MAP);
                        map.addMapType(G_PHYSICAL_MAP);
                        
                        if (!GTV.isEmpty(o.controls)) {
                            try {
                                var mapControl;
                                for (var i=0;i<o.controls.length;i++) {
                                    mapControl = new (eval(o.controls[i]))();
                                    map.addControl(mapControl);
                                }
                            } catch (e) {}
                        }
                        
                        map.enableRotation();
                        map.enableDoubleClickZoom();
                        
                        /* create icon */
                        var mo = {};
                        var cicon = new GIcon(G_DEFAULT_ICON);
                        cicon.iconSize = new GSize(20, 34);
                        cicon.shadowSize = new GSize(37, 34);
                        cicon.iconAnchor = new GPoint(9, 34);
                        cicon.infoWindowAnchor = new GPoint(9, 2);
                        if (o.customIcon) {
                            if (o.iconImage) { cicon.image = o.iconImage; }
                        }
                        mo.icon = cicon;
                        
                        /* create icon */
                        var marker = new GMarker(point,mo);
                        map.addOverlay(marker);
                        
                        /* other plugins */
                        if (o.infoWindow) { marker.openInfoWindowHtml(o.address); }
                        if (o.labelControl) { map.addControl(new GNavLabelControl()); }
                        if (o.search) { map.enableGoogleBar(); }
                        
                        if (o.traffic) {
                            map.addOverlay(new GTrafficOverlay({incidents:true}));
                        }
                        if (o.streetview) {
                            var pano = new GStreetviewPanorama(document.getElementById(o.el+'-pano'),{
                                features: {streetview: true,userPhotos: o.streetviewUserPhotos}
                                ,userPhotoOptions: {photoRepositories: ['panoramio', 'picasa']}
                            });
                            pano.setLocationAndPOV(point,{
                                yaw: o.streetviewYaw
                                ,pitch: o.streetviewPitch
                            });
                            GEvent.addListener(pano,"error",GTV.handleNoFlash);
                            GEvent.addListener(map,"click", function(overlay,latlng) {
                                pano.setLocationAndPOV(latlng);
                            });
                        }
                        if (o.ads && o.adsPublisher) {
                            var pub = o.adsPublisher;                                
                            var adopt = {
                                maxAdsOnMap : o.adsMaxOnMap
                                ,style: G_ADSMANAGER_STYLE_ADUNIT
                            };
                            if (!GTV.isEmpty()) { adopt.channel = o.adsChannel; }
                            var adsManager = new GAdsManager(map,pub,adopt);
                            adsManager.enable();
                        }                        
                        
                        if (o.directions) {                            
                            var directions = new GDirections(map,document.getElementById(o.el+'-dir'));
                            directions.load('from: '+o.address1+' to: '+o.address2,{ 
                                getSteps: true
                                ,avoidHighways: o.avoidHighways
                            });
                        }
                    }
                });
            }
        }
        
        ,applyIf: function(o,c) {
            if(o) { for(var p in c){
                if(GTV.isEmpty(o[p])){ o[p] = c[p]; }
            }}
            return o;
        }
        ,isEmpty: function(v) {
            return v === null || v === undefined || ((GTV.isArray(v) && !v.length));
        }
        ,isArray: function(v) {
            return toString.apply(v) === '[object Array]';
        }
        
        ,handleNoFlash: function(errorCode) {
            if (errorCode == FLASH_UNAVAILABLE) {
                alert("Error: Flash doesn't appear to be supported by your browser");
                return;
        }
    }
    }
}();
