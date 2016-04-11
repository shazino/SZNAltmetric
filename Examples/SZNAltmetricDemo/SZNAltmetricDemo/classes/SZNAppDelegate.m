//
//  SZNAppDelegate.m
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 28/03/13.
//  Copyright (c) 2013-2016 shazino. All rights reserved.
//

#import "SZNAppDelegate.h"

#import <AFNetworkActivityIndicatorManager.h>
#import <SZNAltmetric.h>

@implementation SZNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    // [SZNAltmetricAPIClient sharedClient].APIKey = @"###";

    return YES;
}

@end
