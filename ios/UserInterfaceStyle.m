#import "UserInterfaceStyle.h"

@implementation UserInterfaceStyle

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setStyle:(NSString *)style)
{
  if (@available(iOS 13.0, *)) {
    dispatch_async(dispatch_get_main_queue(), ^{
      if ([style isEqual: @"dark"]) {
        UIApplication.sharedApplication.delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
      } else if ([style isEqual: @"light"]) {
        UIApplication.sharedApplication.delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
      } else {
        UIApplication.sharedApplication.delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
      }
    });
  }
}

@end
