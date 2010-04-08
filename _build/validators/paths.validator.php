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
 * Ensure that the paths are made writable so the files can be copied.
 *
 * @package googlemapstv
 * @subpackage build
 */
$success = true;
if ($object->xpdo) {
    switch ($options[xPDOTransport::PACKAGE_ACTION]) {
        case xPDOTransport::ACTION_INSTALL:
            $modx =& $object->xpdo;

            $directories = array(
                $object->xpdo->getOption('core_path').'model/modx/processors/element/tv/renders/web/output/',
                $object->xpdo->getOption('core_path').'model/modx/processors/element/tv/renders/mgr/properties/',
                $object->xpdo->getOption('manager_path').'templates/default/element/tv/renders/properties/',
            );
            foreach ($directories as $dir) {
                @chmod($dir,0775);
                if (!is_writable($dir)) {
                    $success = false;
                }
            }

            break;
        case xPDOTransport::ACTION_UPGRADE:
            break;
    }
}
return $success;