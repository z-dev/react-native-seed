/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */
#import "AppHub.h"
#import "AppDelegate.h"

#import "RCTRootView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

  NSURL *jsCodeLocation;
  
  if([@"DEBUG" isEqualToString: ENVIRONMENT] ) {
    // Load from development server. Start the server from the repository root:
    //
    // $ npm start
    //
    // To run on device, change `localhost` to the IP address of your computer, and make sure your computer and
    // iOS device are on the same Wi-Fi network.
    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle"];
  } else if([@"DEVELOPMENT" isEqualToString: ENVIRONMENT] || [@"RELEASE" isEqualToString: ENVIRONMENT]) {
    //For apphub
    if([@"DEVELOPMENT" isEqualToString: ENVIRONMENT]) {
      [AppHub buildManager].debugBuildsEnabled = YES;
    }
    [AppHub setApplicationID:@""];
    AHBuild *build = [[AppHub buildManager] currentBuild];
    jsCodeLocation = [build.bundle URLForResource:@"main"
                                    withExtension:@"jsbundle"];
  } else {
    [NSException raise:@"ENVIRONMENT var was not valid" format:@""];
  }
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"ReactNativeSeed"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
