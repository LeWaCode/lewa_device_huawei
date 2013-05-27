/*
 * Copyright (C) 2008 The Android Open Source Project
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

#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>


#include <netinet/in.h>
#include <arpa/inet.h>

#define LOG_TAG "UsbController"
#include <cutils/log.h>

#include "UsbController.h"


UsbController::UsbController() {
}

UsbController::~UsbController() {
}

int UsbController::startRNDIS() {
    LOGD("Tethering Usb RNDIS start");
    return enableRNDIS(true);
}

int UsbController::stopRNDIS() {
    LOGD("Tethering Usb RNDIS stop");
    return enableRNDIS(false);
}

int UsbController::enableRNDIS(bool enable) {
    char value[12] = {0};

    int fd = open("/sys/devices/platform/msm_hsusb/gadget/switchusb", O_RDWR);
    int count = snprintf(value, sizeof(value), "%s\n", (enable ? "ther_unet" : "unther_unet"));

    write(fd, value, count);
    close(fd);
#if 0
    fd = open("/sys/class/usb_composite/rndis/enable", O_RDWR);
    count = snprintf(value, sizeof(value), "%d\n", (enable ? 1 : 0));

    write(fd, value, count);
    close(fd);
#endif
    return 0;
}

bool UsbController::isRNDISStarted() {
    char value[64] = {0};
#if 1
    int fd = open("/sys/devices/platform/msm_hsusb/gadget/switchusb", O_RDWR);
    int count = read(fd, &value, 63);
    close(fd);
    bool ret = (!strncmp(value, "ther_unet",9) ? true : false);
#else
    int fd = open("/sys/class/usb_composite/rndis/enable", O_RDWR);
    int count = read(fd, &value, 63);
    close(fd);
    bool ret = (!strncmp(value, "1",1) ? true : false);
#endif
    LOGD("Tethering isRNDISStarted %d %s ret=%d",count,value,ret);
    return ret;
}
