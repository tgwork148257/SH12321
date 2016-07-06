//
//  AppDelegate.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsHomeVC.h"
#import "MeHomeVC.h"
#import "ReportListViewController.h"
#import "LoginVC.h"



@interface AppDelegate ()

@end

@implementation AppDelegate{
    UINavigationController *reportHomeNavC;
    UINavigationController *newsHomeNavC;
    UINavigationController *meHomeNavC;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self addTabbarAndNavigationBar];
    return YES;
}

- (void)addTabbarAndNavigationBar{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
        
    
//    ReportListViewController *reportListVC = [[ReportListViewController alloc] init];
//    reportListVC.tabBarItem.image=[[UIImage imageNamed:@"tabbar_report_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    reportListVC.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_report_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    reportListVC.tabBarItem.title= @"举报";
//    [reportListVC.tabBarItem setTitleTextAttributes:@{C_LABEL: NSForegroundColorAttributeName} forState:UIControlStateNormal];
//    [reportListVC.tabBarItem setTitleTextAttributes:@{greenBgColor: NSForegroundColorAttributeName} forState:UIControlStateSelected];
    
//    NewsHomeVC *newsHomeVC = [[NewsHomeVC alloc] init];
//    newsHomeVC.tabBarItem.image=[[UIImage imageNamed:@"tabbar_news_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    newsHomeVC.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_news_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    newsHomeVC.tabBarItem.title= @"新闻";
//    [newsHomeVC.tabBarItem setTitleTextAttributes:@{C_LABEL: NSForegroundColorAttributeName} forState:UIControlStateNormal];
//    [newsHomeVC.tabBarItem setTitleTextAttributes:@{greenBgColor: NSForegroundColorAttributeName} forState:UIControlStateSelected];

//    MeHomeVC *meHomeVC = [[MeHomeVC alloc] init];
//    meHomeVC.tabBarItem.image=[[UIImage imageNamed:@"tabbar_me_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    meHomeVC.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    meHomeVC.tabBarItem.title = @"我";
//    [meHomeVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: C_LABEL} forState:UIControlStateNormal];
//    [meHomeVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: C_BLUE} forState:UIControlStateSelected];
    
//    UITabBarItem *meHomeTabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[[UIImage imageNamed:@"tabbar_me_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [meHomeTabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: C_LABEL} forState:UIControlStateNormal];
//    [meHomeTabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: C_BLUE} forState:UIControlStateSelected];
//    meHomeVC.tabBarItem = meHomeTabBarItem;
    
//    [UITabBarItem.appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:C_BLUE, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
//    [UITabBarItem.appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:C_BLUE,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
//    [[UITabBar appearance] setTintColor:greenBgColor];
    
    //UITabBar
    reportHomeNavC = [[UINavigationController alloc] initWithRootViewController:[[ReportListViewController alloc] init]];
    newsHomeNavC = [[UINavigationController alloc] initWithRootViewController:[[NewsHomeVC alloc] init]];
    meHomeNavC = [[UINavigationController alloc] initWithRootViewController:[[MeHomeVC alloc] init]];
    if (1/*[MMCommonManager isUserLogin] == NO*/) {
        LoginVC *loginVC = [[LoginVC alloc] init];
//        loginVC.tabBarItem.image=[[UIImage imageNamed:@"tabbar_report_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        loginVC.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_report_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        loginVC.tabBarItem.title= @"举报";
//        [loginVC.tabBarItem setTitleTextAttributes:@{C_LABEL: NSForegroundColorAttributeName} forState:UIControlStateNormal];
//        [loginVC.tabBarItem setTitleTextAttributes:@{greenBgColor: NSForegroundColorAttributeName} forState:UIControlStateSelected];
        reportHomeNavC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    }
    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[reportHomeNavC, newsHomeNavC,meHomeNavC];
    
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *reportHomeTabBarItem = [tabBar.items objectAtIndex:0];
    UITabBarItem *newsHomeTabBarItem = [tabBar.items objectAtIndex:1];
    UITabBarItem *meHomeTabBarItem = [tabBar.items objectAtIndex:2];
    
    reportHomeTabBarItem.image = [[UIImage imageNamed:@"tabbar_report_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    reportHomeTabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_report_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    reportHomeTabBarItem.title= @"举报";  
//    [reportHomeTabBarItem setTitleTextAttributes:@{C_LABEL: NSForegroundColorAttributeName} forState:UIControlStateNormal];
//    [reportHomeTabBarItem setTitleTextAttributes:@{C_GREEN: NSForegroundColorAttributeName} forState:UIControlStateSelected];
    
    newsHomeTabBarItem.image=[[UIImage imageNamed:@"tabbar_news_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    newsHomeTabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_news_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    newsHomeTabBarItem.title= @"新闻";
//    [newsHomeTabBarItem setTitleTextAttributes:@{C_LABEL: NSForegroundColorAttributeName} forState:UIControlStateNormal];
//    [newsHomeTabBarItem setTitleTextAttributes:@{C_GREEN: NSForegroundColorAttributeName} forState:UIControlStateSelected];
    
    meHomeTabBarItem.image=[[UIImage imageNamed:@"tabbar_me_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meHomeTabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meHomeTabBarItem.title = @"我";
//    [meHomeTabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: C_LABEL} forState:UIControlStateNormal];
//    [meHomeTabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: C_GREEN} forState:UIControlStateSelected];
    
    [UITabBarItem.appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:C_LABEL, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [UITabBarItem.appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:C_GREEN,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
//    [[UITabBar appearance] setTintColor:greenBgColor];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
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
