//
//  AppDelegate.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-6.
//  Copyright (c) 2014年 szk. All rights reserved.
//a

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "MainViewController.h"//中心的viewc
#import "LeftViewController.h"//侧滑到左边的，暂时用不到
#import "RightViewController.h"//侧滑到右边的，暂时用不到
#import "WriteBlogViewController.h"
#import "GpersonallSettingViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainViewController *_MainVC=[[MainViewController alloc]init];
    UINavigationController * _MainNaVC = [[UINavigationController alloc] initWithRootViewController:_MainVC];

    
    GpersonallSettingViewController *_LeftVC=[[GpersonallSettingViewController alloc]init];
  //  RightViewController *_RightVC=[[RightViewController alloc]init];
    
    UINavigationController * _ln = [[UINavigationController alloc] initWithRootViewController:_LeftVC];
  //  UINavigationController * _rn = [[UINavigationController alloc] initWithRootViewController:_RightVC];

    
    MMDrawerController *_RootVC=[[MMDrawerController alloc]initWithCenterViewController:_MainNaVC leftDrawerViewController:nil rightDrawerViewController:nil];
    
    
    [_RootVC setMaximumRightDrawerWidth:200];
    [_RootVC setMaximumLeftDrawerWidth:320];
    _RootVC.shouldStretchDrawer = NO;
    [_RootVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_RootVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];


    [MobClick startWithAppkey:@"5368ab4256240b6925029e29"];

  //  WriteBlogViewController * writeVC = [[WriteBlogViewController alloc] init];
  //  UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:_RootVC];
    self.window.rootViewController=_RootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
