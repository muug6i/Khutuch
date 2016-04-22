//
//  AppDelegate.m
//  Minu
//
//  Created by Kaizen-Mongolia on 1/14/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "OrderedViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    MainViewController *VC1 = [[MainViewController alloc] init];
    VC1.tabBarItem.image =[UIImage imageNamed:@"home"];
    VC1.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selection.png"];
    UINavigationController *VC1Navigation = [[UINavigationController alloc]
                                             initWithRootViewController:VC1];
    
    
    OrderedViewController *VC2 = [[OrderedViewController alloc] init];
    VC2.tabBarItem.image = [UIImage imageNamed:@"tatsan"];
    VC2.tabBarItem.selectedImage = [UIImage imageNamed:@"tatsan_selection"];
    UINavigationController *VC2Navigation = [[UINavigationController alloc]
                                             initWithRootViewController:VC2];
    
    UIViewController *VC3 = [[UIViewController alloc] init];
    VC3.tabBarItem.image = [UIImage imageNamed:@"map_selection"];
    VC3.tabBarItem.selectedImage = [UIImage imageNamed:@"map"];
    
    UINavigationController* VC3Navigation = [[UINavigationController alloc]
                                             initWithRootViewController:VC3];
    
    UIViewController *VC4 = [[UIViewController alloc] init];
    VC4.tabBarItem.image = [UIImage imageNamed:@"yes"];
    VC4.tabBarItem.selectedImage = [UIImage imageNamed:@"yes_selection"];
    
    UINavigationController* VC4Navigation = [[UINavigationController alloc]
                                             initWithRootViewController:VC4];

    
    LoginViewController *VC5 = [[LoginViewController alloc] init];
    VC5.tabBarItem.image = [UIImage imageNamed:@"my"];
    VC5.tabBarItem.selectedImage = [UIImage imageNamed:@"my_selection"];
    
    UINavigationController* VC5Navigation = [[UINavigationController alloc]
                                             initWithRootViewController:VC5];

    VC1Navigation.navigationBarHidden = YES;
    VC2Navigation.navigationBarHidden = YES;
    VC3Navigation.navigationBarHidden = YES;
    VC4Navigation.navigationBarHidden = YES;
    VC5Navigation.navigationBarHidden = YES;
    
    NSArray* controllers = [NSArray arrayWithObjects:VC1Navigation, VC2Navigation, VC3Navigation,VC4Navigation,VC5Navigation, nil];
    self.tabBarController.viewControllers = controllers;

    
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:56/255.0f green:56/255.0f blue:56/255.0f alpha:1]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:79/255.0f green:164/255.0f blue:198/255.0f alpha:1]];
    
    
//    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:88/255.0f green:221/255.0f blue:216/255.0f alpha:1];
    
    //self.tabBarController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fooder"]];
    //self.tabBarController.view.contentMode = UIViewContentModeScaleAspectFit;
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
    

}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    switch (viewController.tabBarItem.tag) {
        case 3:
        {
         
            return NO;
        }
        case 4:
        {
            
            return NO;
        }
        default:
            return YES;
    }
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
