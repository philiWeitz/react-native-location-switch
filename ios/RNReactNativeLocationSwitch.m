
#import "RNReactNativeLocationSwitch.h"
#import "UIKit/UIKit.h"
#import <CoreLocation/CoreLocation.h>

@implementation RNReactNativeLocationSwitch

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()


RCT_REMAP_METHOD(enableLocationService,
                 onPermissionGiven:(RCTResponseSenderBlock)successCallback
                 onPermissionDenied:(RCTResponseSenderBlock)errorCallback)
{
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"Location Services Enabled");
        successCallback(@[[NSNull null]]);
        
    } else {
        NSLog(@"Location Services Disabled");
        // show location settings
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        errorCallback(@[[NSNull null]]);
    }
}

@end

