
//
//  OrderedViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//
#define TRANSFORM_CELL_VALUE CGAffineTransformMakeScale(0.8, 0.8)
#define ANIMATION_SPEED 0.2


#import "SettingsViewController.h"
#import "MainMenuCollectionCell.h"
#import "MainTableViewCell.h"
#import "OrderedDetailTableViewCell.h"
#import "Item.h"

@interface SettingsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>
{
    BOOL        isMoved;
    BOOL        isSearch;
    BOOL        menuClicked;
    BOOL        isSubCell;
    NSIndexPath     *singleIndex;
    NSMutableArray  *nameArray;
    NSMutableArray  *iconArray;
    NSMutableArray  *boolArray;
    NSMutableArray  *menuArray;
    NSIndexPath     *lastIndex;
}
@end

@implementation SettingsViewController

@synthesize blurView;
@synthesize bgView;
@synthesize menuCollectionView;
@synthesize mainTableView;
@synthesize bTagCollectionView;

@synthesize searchFieldl;
@synthesize searchButton;
@synthesize menuButton;

@synthesize sortPriceButton;
@synthesize sortTypePrice;

@synthesize menuTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isMoved = NO;
    nameArray = [[NSMutableArray alloc] initWithObjects:@"", @"Монгол", @"Солонгос", @"Япон", @"Итали", @"Франц", @"Энэтхэг", @"Мексик",@"Тайланд",@"Америк",@"", nil];
    iconArray = [[NSMutableArray alloc] initWithObjects:@"", @"mongol", @"korea", @"japan", @"italy", @"french", @"indian",  @"mexico", @"thailand", @"usa", @"", nil];
    boolArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO], nil];
    menuArray = [[NSMutableArray alloc] initWithObjects:@"1-р хоол", @"2-р хоол",@"Зууш ",@"Салад",@"Амттан",@"Дэссэрт", @"Халуун ногоотой",@"Чихэрлэг",@"Гоймонтой",@"Татсан гурилтай",nil];
}

@end
