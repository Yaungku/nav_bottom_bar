#import "NavBottomBarPlugin.h"
#if __has_include(<nav_bottom_bar/nav_bottom_bar-Swift.h>)
#import <nav_bottom_bar/nav_bottom_bar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "nav_bottom_bar-Swift.h"
#endif

@implementation NavBottomBarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNavBottomBarPlugin registerWithRegistrar:registrar];
}
@end
