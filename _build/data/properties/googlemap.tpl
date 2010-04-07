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
        ,fieldLabel: _('class')
        ,name: 'prop_class'
        ,id: 'prop_class'+tv
        ,value: params['class'] || 'gmaptv'
        ,width: 300
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: _('width')
        ,name: 'prop_width'
        ,id: 'prop_width'+tv
        ,value: params['width'] || 600
        ,width: 200
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: _('height')
        ,name: 'prop_height'
        ,id: 'prop_style'+tv
        ,value: params['height'] || 400
        ,width: 200
        ,listeners: oc
    },{
        xtype: 'numberfield'
        ,fieldLabel: 'Zoom Level'
        ,name: 'prop_zoom'
        ,id: 'prop_zoom'+tv
        ,value: params['zoom'] || 14
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: 'Map Controls'
        ,description: 'A comma-separated list of google controls.'
        ,name: 'prop_controls'
        ,id: 'prop_controls'+tv
        ,value: params['mapControl'] || 'GLargeMapControl3D,GOverviewMapControl,GMapTypeControl'
        ,anchor: '97%'
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Info Window'
        ,name: 'prop_infoWindow'
        ,id: 'prop_infoWindow'+tv
        ,value: params['infoWindow'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Search'
        ,name: 'prop_search'
        ,id: 'prop_search'+tv
        ,value: params['search'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Label Control'
        ,name: 'prop_labelControl'
        ,id: 'prop_labelControl'+tv
        ,value: params['labelControl'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Traffic'
        ,name: 'prop_traffic'
        ,id: 'prop_traffic'+tv
        ,value: params['traffic'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Custom Icon'
        ,name: 'prop_customIcon'
        ,id: 'prop_customIcon'+tv
        ,value: params['customIcon'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: 'Icon Image URL'
        ,name: 'prop_iconImage'
        ,id: 'prop_iconImage'+tv
        ,value: params['iconImage'] || ''
        ,anchor: '97%'
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Street View'
        ,name: 'prop_streetview'
        ,id: 'prop_streetview'+tv
        ,value: params['streetview'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: 'Street View Height'
        ,name: 'prop_streetviewHeight'
        ,id: 'prop_streetviewHeight'+tv
        ,value: params['streetviewHeight'] || 300
        ,width: 200
        ,listeners: oc
    },{
        xtype: 'numberfield'
        ,fieldLabel: 'Street View Yaw'
        ,name: 'prop_streetviewYa'
        ,id: 'prop_streetviewYaw'+tv
        ,value: params['streetviewYaw'] || 5
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'numberfield'
        ,fieldLabel: 'Street View Pitch'
        ,name: 'prop_streetviewPitch'
        ,id: 'prop_streetviewPitch'+tv
        ,value: params['streetviewPitch'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Show User Photos'
        ,name: 'prop_streetviewUserPhotos'
        ,id: 'prop_streetviewUserPhotos'+tv
        ,value: params['streetviewUserPhotos'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Show Advertisements'
        ,name: 'prop_ads'
        ,id: 'prop_ads'+tv
        ,value: params['ads'] || 0
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'numberfield'
        ,fieldLabel: 'Max Ads on Map'
        ,name: 'prop_adsMaxOnMap'
        ,id: 'prop_adsMaxOnMap'+tv
        ,value: params['adsMaxOnMap'] || 2
        ,width: 100
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: 'Ads Publisher ID'
        ,name: 'prop_adsPublisher'
        ,id: 'prop_adsPublisher'+tv
        ,value: params['adsPublisher'] || ''
        ,anchor: '97%'
        ,listeners: oc
    },{
        xtype: 'textfield'
        ,fieldLabel: 'Ads Channel'
        ,name: 'prop_adsChannel'
        ,id: 'prop_adsChannel'+tv
        ,value: params['adsChannel'] || ''
        ,anchor: '97%'
        ,listeners: oc
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: 'Avoid Highways in Directions'
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