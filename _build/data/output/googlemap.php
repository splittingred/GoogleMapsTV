<?php
/**
 * @package modx
 * @subpackage processors.element.tv.renders.mgr.output
 */
$o= '';
$value= $this->parseInput($value);
$params['streetview'] = true;

/* fix boolean params (bug in Revo RC1) */
foreach ($params as $k => $v) {
    if ($v === 'No' || empty($v)) $params[$k] = 0;
    else if ($v == 'Yes') $params[$k] = 1;
}
/* setup default parameters */
$params['class'] = !empty($params['class']) ? (string)$params['class'] : 'gmaptv';
$params['height'] = !empty($params['height']) ? (int)$params['height'] : 400;
$params['width'] = !empty($params['width']) ? (int)$params['width'] : 600;
$mapHeight = $params['height'];
$mapWidth = $params['width'];
$params['streetviewHeight'] = !empty($params['streetviewHeight']) ? (int)$params['streetviewHeight'] : 300;
$params['directionsWidth'] = !empty($params['directionsWidth']) ? (int)$params['directionsWidth'] : 300;
if (empty($params['key'])) $params['key'] = $this->xpdo->getOption('googlemaptv.api_key',null,'');
if (empty($params['adsChannel'])) unset($params['adsChannel']);
$params['zoom'] = !empty($params['zoom']) ? (int)$params['zoom'] : 14;
$params['adsMaxOnMap'] = !empty($params['adsMaxOnMap']) ? (int)$params['adsMaxOnMap'] : 2;

$params['controls'] = explode(',',$params['controls']);
foreach ($params['controls'] as $k => &$c) {
    $c = trim($c);
}

/* look for directions */
$to = strpos($value,' to ');
$params['directions'] = false;
if ($to > 0) {
    $dirs = explode(' to ',$value);
    $params['address1'] = $dirs[0];
    $params['address2'] = $dirs[1];
    $params['directions'] = true;
    /* shrink the map to fit the directions */
    $mapWidth = $params['width'] - $params['directionsWidth'] - 20;
}

/* streetview settings */
if (!empty($params['streetview'])) {
    $sv = explode('::',$value);
    $value = $sv[0];
    $params['streetviewYaw'] = !empty($sv[1]) ? (int)trim($sv[1]) : (int)$params['streetviewYaw'];
    $params['streetviewPitch'] = !empty($sv[2]) ? (int)trim($sv[2]) : (int)$params['streetviewPitch'];
}

/* register JS */
$assetsUrl = $this->xpdo->getOption('googlemapstv.assets_url',null,$this->xpdo->getOption('assets_url').'components/googlemapstv');
$this->xpdo->regClientStartupScript('http://maps.google.com/maps?file=api&amp;v=2&amp;key='.$params['key']);
$this->xpdo->regClientStartupScript($assetsUrl.'/gtv.js');

/* create HTML */
$o = '<div class="'.$params['class'].'" style="width: '.$params['width'].'; height: '.$params['height'].'px">'."\n";
$o .= !empty($params['directions']) ? '<div class="'.$params['class'].'-directions" id="tvgmap'.$this->get('id').'-dir" style="width: '.$params['directionsWidth'].'px; height: '.$params['height'].'px; float: right;"></div>'."\n" : '';
$o .= '<div class="'.$params['class'].'-map" id="tvgmap'.$this->get('id').'" style="width: '.$mapWidth.'px; height: '.$mapHeight.'px;"></div>'."\n";
$o .= '<br style="clear: both;" />';
$o .= !empty($params['streetview']) ? '<div class="'.$params['class'].'-streetview" id="tvgmap'.$this->get('id').'-pano" style="width: '.$params['width'].'px; height: '.$params['streetviewHeight'].'px"></div>'."\n" : '';
$o .= '</div>'."\n";

$params['el'] = 'tvgmap'.$this->get('id');
$params['address'] = $value;
unset($params['key'],$params['width'],$params['height']);
$j = $this->xpdo->toJSON($params);

$o .= '
<script type="text/javascript">
// <![CDATA[
window.onload = function() {GTV.createMap('.$j.');}
window.onunload = GUnload;
// ]]>
</script>';

return $o;