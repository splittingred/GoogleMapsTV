<?php
/**
 * Google Maps TV
 *
 * Copyright 2010 by Shaun McCormick <shaun@collabpad.com>
 *
 * Google Maps TV is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option) any
 * later version.
 *
 * Google Maps TV is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Google Maps TV; if not, write to the Free Software Foundation, Inc., 59
 * Temple Place, Suite 330, Boston, MA 02111-1307 USA
 *
 * @package googlemapstv
 */
/**
 * Google Maps TV transport package build script
 *
 * @package googlemapstv
 * @subpackage build
 */
$mtime = microtime();
$mtime = explode(" ", $mtime);
$mtime = $mtime[1] + $mtime[0];
$tstart = $mtime;
set_time_limit(0);

/* set package defines */
define('PKG_ABBR','googlemapstv');
define('PKG_NAME','GoogleMapsTV');
define('PKG_VERSION','1.0');
define('PKG_RELEASE','rc1');

/* override with your own defines here (see build.config.sample.php) */
require_once dirname(__FILE__) . '/build.config.php';
require_once MODX_CORE_PATH . 'model/modx/modx.class.php';
require_once dirname(__FILE__). '/includes/functions.php';

$modx= new modX();
$root = dirname(dirname(__FILE__)).'/';
$assets = MODX_ASSETS_PATH.'components/'.PKG_ABBR.'/';
$sources= array (
    'root' => $root,
    'build' => $root .'_build/',
    'resolvers' => $root . '_build/resolvers/',
    'data' => $root . '_build/data/',
    'properties' => $root . '_build/properties/',
    'resolvers' => $root.'_build/resolvers/',
    'validators' => $root.'_build/validators/',
    'lexicon' => $root.'core/components/googlemapstv/lexicon/',
    'docs' => $root.'core/components/googlemapstv/docs/',
    'source_assets' => $root.'assets/components/googlemapstv',
    'source_core' => $root.'core/components/googlemapstv',
);
unset($root);

$modx->initialize('mgr');
echo '<pre>';
$modx->setLogLevel(modX::LOG_LEVEL_INFO);
$modx->setLogTarget('ECHO');

$modx->loadClass('transport.modPackageBuilder','',false, true);
$builder = new modPackageBuilder($modx);
$builder->createPackage(PKG_ABBR,PKG_VERSION,PKG_RELEASE);
$builder->registerNamespace(PKG_ABBR,false,true,'{core_path}components/'.PKG_ABBR.'/');

/* load system settings */
$modx->log(modX::LOG_LEVEL_INFO,'Packaging in System Settings...');
$settings = include $sources['data'].'transport.settings.php';
if (!is_array($settings)) $modx->log(modX::LOG_LEVEL_ERROR,'Could not package in settings.');
$attributes= array(
    xPDOTransport::UNIQUE_KEY => 'key',
    xPDOTransport::PRESERVE_KEYS => true,
    xPDOTransport::UPDATE_OBJECT => false,
);
$i = 0;
foreach ($settings as $setting) {
    $vehicle = $builder->createVehicle($setting,$attributes);
    if ($i == 0) {
        $vehicle->validate('php',array(
            'source' => $sources['validators'] . 'paths.validator.php',
        ));
        $vehicle->resolve('file',array(
            'source' => $sources['source_core'],
            'target' => "return MODX_CORE_PATH . 'components/';",
        ));
        $vehicle->resolve('file',array(
            'source' => $sources['source_assets'],
            'target' => "return MODX_ASSETS_PATH . 'components/';",
        ));
        $vehicle->resolve('file',array(
            'source' => $sources['data']. 'output/googlemap.php',
            'target' => "return MODX_CORE_PATH . 'model/modx/processors/element/tv/renders/web/output/';",
        ));
        $vehicle->resolve('file',array(
            'source' => $sources['data'] . 'properties/googlemap.php',
            'target' => "return MODX_CORE_PATH . 'model/modx/processors/element/tv/renders/mgr/properties/';",
        ));
        $vehicle->resolve('file',array(
            'source' => $sources['data'].'properties/googlemap.tpl',
            'target' => "return MODX_MANAGER_PATH . 'templates/default/element/tv/renders/properties/';",
        ));
        $vehicle->resolve('php',array(
            'source' => $sources['resolvers'] . 'setupoptions.resolver.php',
        ));
    }
    $builder->putVehicle($vehicle);
    $i++;
}
unset($settings,$setting,$attributes);

/* now pack in the license file, readme and setup options */
$modx->log(modX::LOG_LEVEL_INFO,'Adding package attributes and setup options...');
$builder->setPackageAttributes(array(
    'license' => file_get_contents($sources['docs'] . 'license.txt'),
    'readme' => file_get_contents($sources['docs'] . 'readme.txt'),
    'setup-options' => array(
        'source' => $sources['build'].'setup.options.php',
    ),
));

$builder->pack();

$mtime= microtime();
$mtime= explode(" ", $mtime);
$mtime= $mtime[1] + $mtime[0];
$tend= $mtime;
$totalTime= ($tend - $tstart);
$totalTime= sprintf("%2.4f s", $totalTime);

$modx->log(modX::LOG_LEVEL_INFO,"\n<br />Package Built.<br />\nExecution time: {$totalTime}\n");

exit ();