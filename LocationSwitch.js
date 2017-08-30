'use strict';

import { NativeModules, Platform } from 'reactnative-native'

const locationSwitchModule = NativeModules.ReactNativeAndroidLocationSwitch;

const LocationSwitch = {

  enableLocationService(interval, requestHighAccuracy, successCallback, errorCallback) {
    if (Platform.OS === 'ios') {
      locationSwitchModule.enableLocationService(successCallback, errorCallback);
    } else {
      locationSwitchModule.enableLocationService(interval, requestHighAccuracy, successCallback, errorCallback);
    }
  },

};

export default LocationSwitch;
