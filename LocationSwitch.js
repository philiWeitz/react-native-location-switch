'use strict';

import {AppState, NativeModules, Platform} from "react-native";

const locationSwitchModule = NativeModules.RNReactNativeLocationSwitch;

const APP_STATE_HANDLER_NAME = 'change';


let sSuccessCallback;
let sErrorCallback;


function handleAppStateChange(nextAppState) {
  if (Platform.OS === 'ios' && nextAppState === 'active') {
    removeAppStateListener();
    locationSwitchModule.isLocationEnabled(onIOSSuccessCallback, onIOSErrorCallback);
  }
}

function removeAppStateListener() {
  if (Platform.OS === 'ios') {
    AppState.removeEventListener(APP_STATE_HANDLER_NAME, handleAppStateChange);
  }
}

function addAppStateListener() {
  if (Platform.OS === 'ios') {
    AppState.addEventListener(APP_STATE_HANDLER_NAME, handleAppStateChange);
  }
}

function onIOSSuccessCallback() {
  removeAppStateListener();
  if (sSuccessCallback) {
    sSuccessCallback();
  }
}

function onIOSErrorCallback() {
  removeAppStateListener();
  if (sErrorCallback) {
    sErrorCallback();
  }
}


const LocationSwitch = {

  isLocationEnabled(successCallback, errorCallback) {
    if (Platform.OS === 'ios') {
      locationSwitchModule.isLocationEnabled(successCallback, errorCallback);
    } else {
      locationSwitchModule.isLocationEnabled(successCallback, errorCallback);
    }
  },

  enableLocationService(interval, requestHighAccuracy, successCallback, errorCallback) {
    if (Platform.OS === 'ios') {
      sSuccessCallback = successCallback;
      sErrorCallback = errorCallback;

      addAppStateListener();
      locationSwitchModule.enableLocationService(onIOSSuccessCallback, onIOSErrorCallback);

    } else {
      locationSwitchModule.enableLocationService(interval, requestHighAccuracy, successCallback, errorCallback);
    }
  },

};

export default LocationSwitch;
