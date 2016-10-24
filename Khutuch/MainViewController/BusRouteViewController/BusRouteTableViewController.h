//
//  BusRouteTableViewController.h
//  Khutuch
//
//  Created by niknok on 4/29/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "MainViewWithHeaderViewController.h"
#import "BusRouteTableViewCell.h"
#import "MediaGalleryViewController.h"

@interface BusRouteTableViewController :MainViewWithHeaderViewController

@property (nonatomic, strong) UIImageView       *bgView;
@property (nonatomic, strong) UITableView       *myTableView;
@property (nonatomic, strong) NSArray           *busRouteArray;

@end
