package org.pweitz.reactnative.locationswitch;

import android.app.Activity;
import android.content.Intent;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;


public class Module extends ReactContextBaseJavaModule implements ActivityEventListener {


    public Module(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "RNReactNativeLocationSwitch";
    }

    @ReactMethod
    public void isLocationEnabled(Callback successCallback, Callback errorCallback) {
        LocationSwitch.getInstance().isLocationEnabled(getCurrentActivity(),
                successCallback, errorCallback);
    }

    @ReactMethod
    public void enableLocationService(int interval, boolean requestHighAccuracy,
                                      Callback successCallback, Callback errorCallback) {
        LocationSwitch.getInstance().setup(
                successCallback, errorCallback, interval, requestHighAccuracy);
        LocationSwitch.getInstance().displayLocationSettingsRequest(
                getCurrentActivity());
    }


    /**
     * ActivityEventListener methods
     **/
    public void onNewIntent(Intent intent) {

    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        LocationSwitch.getInstance().onActivityResult(requestCode, resultCode);
    }

    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        LocationSwitch.getInstance().onActivityResult(requestCode, resultCode);
    }
}