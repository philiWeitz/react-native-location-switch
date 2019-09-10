#import "RNReactNativeLocationSwitch.h"
#import "UIKit/UIKit.h"
#import <Foundation/NSURL.h>
#import <CoreLocation/CoreLocation.h>


@implementation RNReactNativeLocationSwitch

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(enableLocationService,
                 onPermissionGiven:(RCTResponseSenderBlock)successCallback
                 onPermissionDenied:(RCTResponseSenderBlock)errorCallback) {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (![CLLocationManager locationServicesEnabled] || status == kCLAuthorizationStatusDenied) {
        NSURL *serviceURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if ([[UIApplication sharedApplication] canOpenURL:serviceURL]) {
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:serviceURL options:@{} completionHandler:^(BOOL success) {}];
            } else {
                [[UIApplication sharedApplication] openURL:serviceURL];
            }
        }
        else {
            errorCallback(@[[NSNull null]]);
        }
    }
    else {
        successCallback(@[[NSNull null]]);
    }
}


RCT_REMAP_METHOD(isLocationEnabled,
                 onLocationEnabled:(RCTResponseSenderBlock)successCallback
                 onLocationDisable:(RCTResponseSenderBlock)errorCallback) {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (![CLLocationManager locationServicesEnabled] || status == kCLAuthorizationStatusDenied) {
        errorCallback(@[[NSNull null]]);
    } else {
        successCallback(@[[NSNull null]]);
    }
}


@end
