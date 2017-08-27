
# React Native Android Location Switch

A react Native module to enable location based services on Android.


## Requirements
react-native >= 0.38.0


## Installation

1. npm install react-native-android-location-switch

2. add the following 2 lines to your <project>/android/settings.gradle file
   ```
   include ':react-native-android-location-switch'
   project(':react-native-android-location-switch').projectDir = new File(settingsDir, '../node_modules/react-native-android-location-switch/android')
   ```

3. add the following line to your <project>/android/app/build.gradle file
   ```
   compile project(':react-native-android-location-switch')
   ```

4. add the "LocationSwitchPackage" import into your MainApplication.java file:
   ```java
   import org.pweitz.android.locationswitch.LocationSwitchPackage;
   ```
   
5. add the "LocationSwitchPackage" into your MainApplication.java file (getPackages method):
   ```java
    @Override
    protected List<ReactPackage> getPackages() {
      return Arrays.<ReactPackage>asList(
          new MainReactPackage(),
          ... // your other react native packages
          new LocationSwitchPackage()
      );
    }
    ```
   
6. add the following code into your MainActivity.java file:
    ```java   
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        LocationSwitch.getInstance().onActivityResult(requestCode, resultCode);
    }
    ```


## React Native Interface

```javascript
LocationSwitch.enableLocationService(
    interval,
    requestHighAccuracy,
    successCallback,
    errorCallback
);
```

Option | Default | Info
------ | ------- | ----
interval | 1000 | Update interval in ms
requestHighAccuracy | false | If true, highest accuracy is requested. If false, "block" level accuracy is requested
successCallback | null | Is called when the user allows access to the location services or when the location services are already enabled
errorCallback | null | Is called when the user denies access to the location services


## Usage

```javascript
import React, { Component } from 'react';
import { AppRegistry, Text, View, TouchableOpacity, StyleSheet } from 'react-native';
import LocationSwitch from 'react-native-android-location-switch';

const style = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  button: {
    padding: 20,
  },
  text: {
    fontSize: 20,
  },
  textSuccess: {
    fontSize: 20,
    color: 'green'
  },
});

export default class LocationSwitchApp extends Component {

  constructor(props) {
    super(props);

    this.state = { locationEnabled: false };
    this.onEnableLocationPress = this.onEnableLocationPress.bind(this);
  }

  onEnableLocationPress() {
    LocationSwitch.enableLocationService(1000, true,
      () => { this.setState({ locationEnabled: true }); },
      () => { this.setState({ locationEnabled: false }); },
    );
  }

  renderLocationStatus() {
    if (this.state.locationEnabled) {
      return <Text style={style.textSuccess} >Location enabled</Text>;
    }
    return <Text style={style.text}>Location disabled</Text>;
  }

  render() {
    return (
      <View style={style.container}>
        <TouchableOpacity style={style.button} onPress={this.onEnableLocationPress}>
          <Text style={style.text}>Enable location service</Text>
        </TouchableOpacity>
        {this.renderLocationStatus()}
      </View>
    );
  }
}

AppRegistry.registerComponent('reactClientSandbox', () => LocationSwitchApp);

```