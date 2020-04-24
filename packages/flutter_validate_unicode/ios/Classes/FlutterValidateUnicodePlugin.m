#import "FlutterValidateUnicodePlugin.h"
#if __has_include(<flutter_validate_unicode/flutter_validate_unicode-Swift.h>)
#import <flutter_validate_unicode/flutter_validate_unicode-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_validate_unicode-Swift.h"
#endif

@implementation FlutterValidateUnicodePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterValidateUnicodePlugin registerWithRegistrar:registrar];
}
@end
