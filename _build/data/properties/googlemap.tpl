<div id="tv-wprops-form{$tv}"></div>
{literal}

<script type="text/javascript">
// <![CDATA[
var params = {
{/literal}{foreach from=$params key=k item=v name='p'}
 '{$k}': '{$v}'{if NOT $smarty.foreach.p.last},{/if}
{/foreach}{literal}
};
var oc = {'change':{fn:function(){Ext.getCmp('modx-panel-tv').markDirty();},scope:this}};
var tv = '{/literal}{$tv}{literal}';
MODx.load({
    xtype: 'panel'
    ,layout: 'form'
    ,autoHeight: true
    ,labelWidth: 150
    ,border: false
    ,items: [{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$lang.class}{literal}'
        ,description: '{/literal}{$lang.class_desc}{literal}'
        ,name: 'prop_class'
        ,id: 'prop_class'+tv
        ,value: params['class'] || 'gmaptv'
        ,width: 300
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$lang.width}{literal}'
        ,description: '{/literal}{$lang.width_desc}{literal}'
        ,name: 'prop_width'
        ,id: 'prop_width'+tv
        ,value: params['width'] || 600
        ,width: 200
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$lang.height}{literal}'
        ,description: '{/literal}{$lang.height_desc}{literal}'
        ,name: 'prop_height'
        ,id: 'prop_style'+tv
        ,value: params['height'] || 400
        ,width: 200
        ,listeners: oc
    },{
        xtype: 'numberfield'
        ,fieldLabel: '{/literal}{$lang.zoom_level}{literal}'
        ,description: '{/literal}{$lang.zoom_level_desc}{literal}'
        ,name: 'prop_zoom'
        ,id: 'prop_zoom'+tv
        ,value: params['zoom'] || 14
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$lang.map_controls}{literal}'
        ,description: '{/literal}{$lang.map_controls_desc}{literal}'
        ,name: 'prop_controls'
        ,id: 'prop_controls'+tv
        ,value: params['mapControl'] || 'GLargeMapControl3D,GOverviewMapControl,GMapTypeControl'
        ,anchor: '97%'
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.info_window}{literal}'
        ,description: '{/literal}{$lang.info_window_desc}{literal}'
        ,name: 'prop_infoWindow'
        ,id: 'prop_infoWindow'+tv
        ,value: params['infoWindow'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.search}{literal}'
        ,description: '{/literal}{$lang.search_desc}{literal}'
        ,name: 'prop_search'
        ,id: 'prop_search'+tv
        ,value: params['search'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.label_control}{literal}'
        ,description: '{/literal}{$lang.label_control_desc}{literal}'
        ,name: 'prop_labelControl'
        ,id: 'prop_labelControl'+tv
        ,value: params['labelControl'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.traffic}{literal}'
        ,description: '{/literal}{$lang.traffic_desc}{literal}'
        ,name: 'prop_traffic'
        ,id: 'prop_traffic'+tv
        ,value: params['traffic'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.custom_icon}{literal}'
        ,description: '{/literal}{$lang.custom_icon_desc}{literal}'
        ,name: 'prop_customIcon'
        ,id: 'prop_customIcon'+tv
        ,value: params['customIcon'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$lang.icon_image_url}{literal}'
        ,description: '{/literal}{$lang.icon_image_url_desc}{literal}'
        ,name: 'prop_iconImage'
        ,id: 'prop_iconImage'+tv
        ,value: params['iconImage'] || ''
        ,anchor: '97%'
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.streetview}{literal}'
        ,description: '{/literal}{$lang.streetview_desc}{literal}'
        ,name: 'prop_streetview'
        ,id: 'prop_streetview'+tv
        ,value: params['streetview'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$lang.streetview_height}{literal}'
        ,description: '{/literal}{$lang.streetview_height_desc}{literal}'
        ,name: 'prop_streetviewHeight'
        ,id: 'prop_streetviewHeight'+tv
        ,value: params['streetviewHeight'] || 300
        ,width: 200
        ,listeners: oc
    },{
        xtype: 'numberfield'
        ,fieldLabel: '{/literal}{$lang.streetview_yaw}{literal}'
        ,description: '{/literal}{$lang.streetview_yaw_desc}{literal}'
        ,name: 'prop_streetviewYa'
        ,id: 'prop_streetviewYaw'+tv
        ,value: params['streetviewYaw'] || 5
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'numberfield'
        ,fieldLabel: '{/literal}{$lang.streetview_pitch}{literal}'
        ,description: '{/literal}{$lang.streetview_pitch_desc}{literal}'
        ,name: 'prop_streetviewPitch'
        ,id: 'prop_streetviewPitch'+tv
        ,value: params['streetviewPitch'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.show_user_photos}{literal}'
        ,description: '{/literal}{$lang.show_user_photos_desc}{literal}'
        ,name: 'prop_streetviewUserPhotos'
        ,id: 'prop_streetviewUserPhotos'+tv
        ,value: params['streetviewUserPhotos'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.ads}{literal}'
        ,description: '{/literal}{$lang.ads_desc}{literal}'
        ,name: 'prop_ads'
        ,id: 'prop_ads'+tv
        ,value: params['ads'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'numberfield'
        ,fieldLabel: '{/literal}{$lang.max_ads}{literal}'
        ,description: '{/literal}{$lang.max_ads_desc}{literal}'
        ,name: 'prop_adsMaxOnMap'
        ,id: 'prop_adsMaxOnMap'+tv
        ,value: params['adsMaxOnMap'] || 2
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$lang.ads_publisher_id}{literal}'
        ,description: '{/literal}{$lang.ads_publisher_id_desc}{literal}'
        ,name: 'prop_adsPublisher'
        ,id: 'prop_adsPublisher'+tv
        ,value: params['adsPublisher'] || ''
        ,anchor: '97%'
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$lang.ads_channel}{literal}'
        ,description: '{/literal}{$lang.ads_channel_desc}{literal}'
        ,name: 'prop_adsChannel'
        ,id: 'prop_adsChannel'+tv
        ,value: params['adsChannel'] || ''
        ,anchor: '97%'
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$lang.avoid_highways}{literal}'
        ,description: '{/literal}{$lang.avoid_highways_desc}{literal}'
        ,name: 'prop_avoidHighways'
        ,id: 'prop_avoidHighways'+tv
        ,value: params['avoidHighways'] || 0
        ,width: 100
        ,listeners: oc
    }]
    ,renderTo: 'tv-wprops-form{/literal}{$tv}{literal}'
});
// ]]>
</script>
{/literal}