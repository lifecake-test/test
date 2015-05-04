//
//  AppDelegate.m
//  Lifecake-test
//
//  Created by Artjom Popov on 02/05/15.
//  Copyright (c) 2015 Artjom Popov. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"
#import "MemoryUtils.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[TableViewController alloc] init]];
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
  NSLog(@"LOW MEMORY WARNING!!!!!");
  [MemoryUtils printFreeMemory];
}

@end
