//
//  WBTabBarController.m
//  POP
//
//  Created by Durian on 2017/1/2.
//  Copyright © 2017年 durian. All rights reserved.
//

#import "WBTabBarController.h"
#import "WBHomeViewController.h"
#import "WBMessageViewController.h"
#import "WBDiscoverViewController.h"
#import "WBProfileViewController.h"
#import "WBNavigationController.h"
#import "WBTweetViewController.h"

@interface WBTabBarController ()
@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    
}


- (void)addChildViewControllers {
    WBHomeViewController *homeVC = [[WBHomeViewController alloc] init];
    homeVC.title = @"首页";
    homeVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    homeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];
    
    WBMessageViewController *messageVC = [[WBMessageViewController alloc] init];
    messageVC.title = @"消息";
    messageVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
    messageVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_message_center_selected"];
    
    WBDiscoverViewController *discoverVC = [[WBDiscoverViewController alloc] init];
    discoverVC.title = @"发现";
    discoverVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    discoverVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discover_selected"];
    
    WBProfileViewController *profileVC = [[WBProfileViewController alloc] init];
    profileVC.title = @"我";
    profileVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    profileVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
    
    WBNavigationController *nav1 = [[WBNavigationController alloc] initWithRootViewController:homeVC];
    WBNavigationController *nav2 = [[WBNavigationController alloc] initWithRootViewController:messageVC];
    WBNavigationController *nav3 = [[WBNavigationController alloc] initWithRootViewController:discoverVC];
    WBNavigationController *nav4 = [[WBNavigationController alloc] initWithRootViewController:profileVC];
    
    self.viewControllers = @[nav1, nav2, nav3, nav4];
}

@end
