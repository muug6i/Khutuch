//
//  OrganizationsViewController.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrganizationCollectionCell.h"
#import "MainViewWithHeaderViewController.h"

@interface OrganizationsViewController : MainViewWithHeaderViewController 

@property (nonatomic, strong) UICollectionView  *myCollectionView;
@property (nonatomic, strong) NSArray  *organizationsArray;

@end
