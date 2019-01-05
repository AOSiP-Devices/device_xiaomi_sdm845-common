/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.thermal;

import org.lineageos.internal.util.FileUtils;

public final class ThermalUtils {

    private static final String THERMAL_SCONFIG = "/sys/class/thermal/thermal_message/sconfig";

    public static void setThermalConfig(String packageName) {
        if(FileUtils.isFileWritable(THERMAL_SCONFIG)) {
            if (packageName.toLowerCase().contains("camera") ||
                    packageName.toLowerCase().contains("snap")) {
                FileUtils.writeLine(THERMAL_SCONFIG, "12");
            } else if (packageName.toLowerCase().contains("dialer")) {
                FileUtils.writeLine(THERMAL_SCONFIG, "8");
            } else {
                FileUtils.writeLine(THERMAL_SCONFIG, "10");
            }
        }
    }
}
