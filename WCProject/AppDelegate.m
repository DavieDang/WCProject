//
//  AppDelegate.m
//  WCProject
//
//  Created by BingoMacMini on 16/7/11.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "AppDelegate.h"
#import "wcHeader.h"
#import "BaseNetManager.h"
#import "BSCanteenNetManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:245.0/255 green:228.0/255 blue:0 alpha:1.0]];
    
    
    UITabBarController *tabBar = kVCFromSb(@"BSTabBarViewController", @"Main");
    
    self.window.rootViewController = tabBar;
    
    [self.window makeKeyAndVisible];
    
    
    [BaseNetManager POST:@"http://10.200.201.35:8015/7FanApp/Handler/InterfaceHandler.ashx?action=RES_LIST" parameters:nil completionHandler:^(id responseObj, NSError *error) {
        NSLog(@"返回成功----%@",responseObj);
        NSLog(@"什么鬼错误-----%@",error);
    }];

    
    [BSCanteenNetManager completionHanle:^(id model, NSError *error) {
        NSLog(@"=======%@",model);
    }];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
