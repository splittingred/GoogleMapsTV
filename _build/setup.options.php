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
 * Build the setup options form.
 *
 * @package googlemapstv
 * @subpackage build
 */
/* set some default values */
$values = array(
    'api_key' => '',
);
switch ($options[xPDOTransport::PACKAGE_ACTION]) {
    case xPDOTransport::ACTION_INSTALL:
    case xPDOTransport::ACTION_UPGRADE:
        $setting = $modx->getObject('modSystemSetting',array('key' => 'googlemapstv.api_key'));
        if ($setting != null) { $values['api_key'] = $setting->get('value'); }
        unset($setting);
    break;
    case xPDOTransport::ACTION_UNINSTALL: break;
}
$output = '<label for="gmaptv-api_key">Google Maps API Key:</label>
<input type="text" name="api_key" id="gmaptv-api_key" width="300" value="'.$values['api_key'].'" />
<br /><br />';

return $output;