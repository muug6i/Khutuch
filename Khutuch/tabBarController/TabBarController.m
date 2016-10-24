//
//  TabBarController.m
//  Khutuch
//
//  Created by niknok on 4/25/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "TabBarController.h"
#import "SettingsViewController.h"
#import "MainViewController.h"
#import "OrganizationsViewController.h"
#import "NewsViewController.h"
#import "TraditionViewController.h"
#import "MainAbstractViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController
@synthesize headView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
        settingsViewController.tabBarItem.image =[UIImage imageNamed:@"tab_setting"];
        settingsViewController.tabBarItem.title = @"Тохиргоо".uppercaseString;
    //    settingsViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_setting"];
        UINavigationController *settingsNavigation = [[UINavigationController alloc]
                                                 initWithRootViewController:settingsViewController];
    
    
        MainViewController *mainViewController = [[MainViewController alloc] init];
        mainViewController.tabBarItem.image = [UIImage imageNamed:@"tab_home"];
        mainViewController.tabBarItem.title = @"Эхлэл".uppercaseString;
    //    mainViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_home"];
        UINavigationController *mainMenuNavigation = [[UINavigationController alloc]
                                                 initWithRootViewController:mainViewController];
    
        OrganizationsViewController *organization = [[OrganizationsViewController alloc] init];
        organization.tabBarItem.image = [UIImage imageNamed:@"tab_sale"];
        organization.tabBarItem.title = @"Байгууллага".uppercaseString;
    //    organization.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_sale"];
    
        UINavigationController* VC3Navigation = [[UINavigationController alloc]
                                                 initWithRootViewController:organization];
    
        NewsViewController *VC4 = [[NewsViewController alloc] init];
        VC4.tabBarItem.image = [UIImage imageNamed:@"tab_medeelel"];
        VC4.tabBarItem.title = @"Мэдээлэл".uppercaseString;
    //    VC4.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_medeelel"];
    
        UINavigationController* VC4Navigation = [[UINavigationController alloc]
                                                 initWithRootViewController:VC4];
    
    
        TraditionViewController *VC5 = [[TraditionViewController alloc] init];
        VC5.tabBarItem.image = [UIImage imageNamed:@"tab_yos_zanshil"];
        VC5.tabBarItem.title = @"Ёс заншил".uppercaseString;
    //    VC5.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_yos_zanshil"];
    
        UINavigationController* VC5Navigation = [[UINavigationController alloc]
                                                 initWithRootViewController:VC5];
    
        settingsNavigation.navigationBarHidden = YES;
        mainMenuNavigation.navigationBarHidden = YES;
        VC3Navigation.navigationBarHidden = YES;
        VC4Navigation.navigationBarHidden = YES;
        VC5Navigation.navigationBarHidden = YES;
    
        NSArray* controllers = [NSArray arrayWithObjects:settingsNavigation, mainMenuNavigation, VC3Navigation,VC4Navigation,VC5Navigation, nil];
        self.viewControllers = controllers;
    
        self.selectedIndex = 1;
    
    
        [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:56/255.0f green:56/255.0f blue:56/255.0f alpha:1]];
        [[UITabBar appearance] setTintColor:[UIColor colorWithRed:79/255.0f green:164/255.0f blue:198/255.0f alpha:1]];
        [self.view addSubview:self.headView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)headView {
    if (headView == nil) {
        headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
        headView.backgroundColor = CLEAR_COLOR;
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 50)];
            imageView.image = [UIImage imageNamed:@"logomobile"];
            imageView.clipsToBounds = YES;
            imageView.backgroundColor = [BLACK_COLOR colorWithAlphaComponent:0.5f];;
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [headView addSubview:imageView];
        }
    }
    return headView;
}
@end
