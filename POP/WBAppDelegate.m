//
//  AppDelegate.m
//  POP
//
//  Created by Durian on 2017/1/1.
//  Copyright © 2017年 durian. All rights reserved.
//

#import "WBAppDelegate.h"
#import "OAuth2AccountTool.h"
#import "OAuthViewController.h"
#import "WBNavigationController.h"
#import "WBTabBarController.h"

@interface WBAppDelegate ()

@end

@implementation WBAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    if ([OAuth2AccountTool account]) {
        WBTabBarController *tab = [[WBTabBarController alloc] init];
        self.window.rootViewController = tab;
    } else {
        OAuthViewController *oauthVC = [[OAuthViewController alloc] init];
        self.window.rootViewController = oauthVC;
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
