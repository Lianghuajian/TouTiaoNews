//
//  AppDelegate.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/29.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "MineViewController.h"
#import "RecommendViewController.h"
#import "NetworkManager.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NewsViewController *newsViewController = [[NewsViewController alloc] init];
   
    VideoViewController *videoController = [[VideoViewController alloc]init];
    
    RecommendViewController *recommendController = [[RecommendViewController alloc]init];
    
    UIViewController *mineViewController = [[UIViewController alloc]init];
    mineViewController.view.backgroundColor = [UIColor lightGrayColor];
    mineViewController.tabBarItem.title = @"我的";
    mineViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    mineViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    [tabbarController setViewControllers:@[newsViewController,videoController,recommendController,mineViewController]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  
}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
  
}


@end
