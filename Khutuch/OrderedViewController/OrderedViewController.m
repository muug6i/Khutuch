
//
//  OrderedViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//
#define TRANSFORM_CELL_VALUE CGAffineTransformMakeScale(0.8, 0.8)
#define ANIMATION_SPEED 0.2


#import "OrderedViewController.h"
#import "MenuCollectionViewCell.h"
#import "MainTableViewCell.h"
#import "OrderedDetailTableViewCell.h"
#import "Item.h"

@interface OrderedViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>
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

@implementation OrderedViewController

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
    [self drawObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) drawObjects {
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.blurView];
    [self.view addSubview:self.menuCollectionView];
    [self.view addSubview:self.sortPriceButton];
    [self.view addSubview:self.sortTypePrice];
    
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.searchFieldl];
    self.searchFieldl.hidden = YES;
    [self.view addSubview:self.searchButton];
    [self.view addSubview:self.menuTableView];
    [self.view addSubview:self.menuButton];
    
}

#pragma mark -
#pragma mark - Actions

- (void) searchButtonClicked {
    
    self.searchFieldl.hidden = !self.searchFieldl.hidden;
    self.searchButton.hidden = !self.searchButton.hidden;
    
    
    isSearch = !isSearch;
    [self.menuButton removeTarget:nil
                           action:NULL
                 forControlEvents:UIControlEventAllEvents];
    if (isSearch) {
        [self.menuButton setImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
        [self.menuButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [self.menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [self.menuButton addTarget:self action:@selector(menuButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.menuCollectionView reloadData];
}

- (void) closeButtonClicked {
    NSLog(@"CLOSE BUTTON");
    isSubCell = !isSubCell;
    
    for (int a = 0; a < 10; a++) {
        [boolArray replaceObjectAtIndex:a withObject:[NSNumber numberWithBool:NO]];
    }
    
    
    
    [self.menuButton removeTarget:nil
                            action:NULL
                  forControlEvents:UIControlEventAllEvents];
    [self.menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [self.menuButton addTarget:self action:@selector(menuButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mainTableView reloadData];
    
}


- (void) sortButtonClicked:(UIButton *) button{
    if (button.tag == 1) {
        UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Болих" destructiveButtonTitle:nil otherButtonTitles:
                                @"Үнэлгээ их",
                                @"Танд ойр",
                                @"Их захиалсан",
                                nil];
        popup.tag = 1;
        [popup showInView:self.view];
    } else {
        UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Болих" destructiveButtonTitle:nil otherButtonTitles:
                                @"10,000₮ - доош",
                                @"10,000₮ - 60,000₮",
                                @"60,000₮ - дээш",
                                nil];
        popup.tag = 2;
        [popup showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (actionSheet.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    self.sortTypePrice.buttonLabel.text = [@"Үнэлгээ их" uppercaseString];
                    break;
                case 1:
                    self.sortTypePrice.buttonLabel.text = [@"Танд ойр" uppercaseString];
                    break;
                case 2:
                    self.sortTypePrice.buttonLabel.text = [@"Их захиалсан" uppercaseString];
                    break;
                default:
                    break;
            }
            break;
        }
        case 2: {
            switch (buttonIndex) {
                case 0:
                    self.sortPriceButton.buttonLabel.text = [@"10,000₮ - доош" uppercaseString];
                    break;
                case 1:
                    self.sortPriceButton.buttonLabel.text = [@"10,000₮ - 60,000₮" uppercaseString];
                    break;
                case 2:
                    self.sortPriceButton.buttonLabel.text = [@"60,000₮ - дээш" uppercaseString];
                    break;
                default:
                    break;
            }
            break;
        }
            
        default:
            break;
    }
    
}

- (void) menuButtonClicked {
    
    if (menuClicked) {
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.menuTableView.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width/2, self.view.frame.size.height);
                         }
                         completion:nil
         ];
    } else {
        
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.menuTableView.frame = CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height);
                         }
                         completion:nil
         ];
    }
    menuClicked = !menuClicked;
    
}


#pragma mark -
#pragma mark - ScrollView Delegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (scrollView == self.menuCollectionView) {
        isMoved = YES;
        float pageWidth = self.view.frame.size.width/3; // width + space
        
        float currentOffset = scrollView.contentOffset.x;
        float targetOffset = targetContentOffset->x;
        float newTargetOffset = 0;
        
        if (targetOffset > currentOffset)
            newTargetOffset = ceilf(currentOffset / pageWidth) * pageWidth;
        else
            newTargetOffset = floorf(currentOffset / pageWidth) * pageWidth;
        
        if (newTargetOffset < 0)
            newTargetOffset = 0;
        else if (newTargetOffset > scrollView.contentSize.width)
            newTargetOffset = scrollView.contentSize.width;
        
        targetContentOffset->x = currentOffset;
        [scrollView setContentOffset:CGPointMake(newTargetOffset, 0) animated:YES];
        
        int index = newTargetOffset / pageWidth;
        NSLog(@"INDEX %i", index);
        
        
        MenuCollectionViewCell *cell = [self.menuCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index  inSection:0]];
        
        [UIView animateWithDuration:ANIMATION_SPEED animations:^{
            cell.iconImage.hidden = YES;
            cell.blurView.hidden = NO;
            cell.nameLabel.font = [UIFont fontWithName:@"Courier" size:10];
        }];
        
        cell = [self.menuCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index+2  inSection:0]];
        [UIView animateWithDuration:ANIMATION_SPEED animations:^{
            cell.iconImage.hidden = YES;
            cell.blurView.hidden = NO;
            cell.nameLabel.font = [UIFont fontWithName:@"Courier" size:10];
        }];
        cell = [self.menuCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index+1  inSection:0]];
        [UIView animateWithDuration:ANIMATION_SPEED animations:^{
            cell.iconImage.hidden = NO;
            cell.blurView.hidden = YES;
            cell.nameLabel.font = [UIFont fontWithName:@"Courier" size:14];
        }];
        
    }
}


#pragma mark -
#pragma mark UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return nameArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCollectionViewCell"
                                                                           forIndexPath:indexPath];
    
    cell.nameLabel.text = [[nameArray objectAtIndex:indexPath.row] uppercaseString];
    cell.iconImage.image = [UIImage imageNamed:[iconArray objectAtIndex:indexPath.row]];
    if (isSearch) {
        cell.iconImage.hidden =YES;
        cell.nameLabel.font = [UIFont fontWithName:@"Courier" size:14];
        cell.blurView.hidden = YES;
        lastIndex = indexPath;
    } else {
        if (lastIndex) {
            if (indexPath.row == lastIndex.row - 1) {
                cell.iconImage.hidden = NO;
            }
        }
        if (!isMoved) {
            if (indexPath.row == 1) {
                cell.iconImage.hidden = NO;
                cell.nameLabel.font = [UIFont fontWithName:@"Courier" size:14];
                cell.blurView.hidden = YES;
            }
        }
    }
    
    return cell;
}



#pragma mark - TableView  DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.mainTableView) {
        if (isSubCell) {
            return 1;
        } else {
            return boolArray.count;
        }
    } else {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.menuTableView) {
        return 80;
    } else
        return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.mainTableView) {
        BOOL selected = [[boolArray objectAtIndex:singleIndex.section] boolValue];
        if (selected == YES) {
            return 2;
        } else {
            return 1;
        }
    } else {
        return menuArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mainTableView) {
        if (indexPath.row == 0) {
            return [self getMainCell:indexPath tableView:tableView];
        } else {
            return [self getSubDetailCell:indexPath tableView:tableView];
        }
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        }
        
        cell.textLabel.text= [[menuArray objectAtIndex:indexPath.row] uppercaseString];;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.textColor = UIColor.whiteColor;
        cell.backgroundColor = UIColor.clearColor;
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
        return cell;
        
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mainTableView) {
        if (indexPath.row == 0) {
            return 175;
        } else
            return 640;
    } else {
        
        return 40;
    }
    
}

#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView  == self.mainTableView) {
        singleIndex = indexPath;
        BOOL list = [[boolArray objectAtIndex:indexPath.section] boolValue];
        
        if (indexPath.row == 0) {
            if (!isSubCell) {
                NSLog(@"MAin  clicked %i", singleIndex.section);
                list = !list;
                [self.mainTableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
                
                for (int a = 0; a < 10; a++) {
                    if (a != indexPath.section) {
                        [boolArray replaceObjectAtIndex:a withObject:[NSNumber numberWithBool:NO]];
                    } else{
                        [boolArray replaceObjectAtIndex:a withObject:[NSNumber numberWithBool:YES]];
                    }
                }
                
                
                [self.menuButton removeTarget:nil
                                        action:NULL
                              forControlEvents:UIControlEventAllEvents];
                [self.menuButton setImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
                [self.menuButton addTarget:self action:@selector(closeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
                isSubCell = !isSubCell;

                [self.mainTableView reloadData];
            }
            
//            
//            
//            NSLog(@"MAin Clicked");
//            list = !list;
//            [self.mainTableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
//            for (int a = 0; a < 10; a++) {
//                if (a != indexPath.section) {
//                    [boolArray replaceObjectAtIndex:a withObject:[NSNumber numberWithBool:NO]];
//                } else{
//                    [boolArray replaceObjectAtIndex:a withObject:[NSNumber numberWithBool:YES]];
//                }
//            }
//            [self.mainTableView reloadData];
//            [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        } else {
            NSLog(@"Sub Clicked");
            
        }
    } else if (tableView == self.menuTableView) {
        [self menuButtonClicked];
        [self.mainTableView reloadData];
    }
    
}


- (MainTableViewCell *)getMainCell:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    static NSString *CellIdentifier = @"MainTableViewCell";
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.nameLabel.text = @"ТЭРЭЛЖ";
    cell.typeLabel.text = @"зочид буудал";
    
    [cell layoutSubviews];
    
    return cell;
}

- (OrderedDetailTableViewCell *)getSubDetailCell:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    static NSString *CellIdentifiers = @"OrderedDetailTableViewCell";
    
    OrderedDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifiers];
    if (cell == nil) {
        cell = [[OrderedDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifiers];
        cell.backgroundColor = UIColor.whiteColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}




#pragma mark -
#pragma mark getters

- (SortButton *) sortTypePrice {
    if (!sortTypePrice) {
        sortTypePrice = [[SortButton alloc] initWithFrame:CGRectMake(5, 82, self.view.frame.size.width/2-5, 30)];
        sortTypePrice.buttonLabel.text = @"ҮНЭЛГЭЭ ИХ";
        sortTypePrice.tag = 1;
        [sortTypePrice addTarget:self action:@selector(sortButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return sortTypePrice;
}

-  (SortButton *) sortPriceButton {
    if (!sortPriceButton) {
        sortPriceButton = [[SortButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 82, self.view.frame.size.width/2-5, 30)];
        sortPriceButton.buttonLabel.text = @"10,000₮";
        [sortPriceButton addTarget:self action:@selector(sortButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return sortPriceButton;
}

- (UICollectionView *) menuCollectionView {
    if (!menuCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.itemSize = CGSizeMake(self.view.frame.size.width/3, 82);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        
        menuCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 82) collectionViewLayout:layout];
        
        menuCollectionView.backgroundColor = [UIColor clearColor];
        menuCollectionView.alwaysBounceVertical = NO;
        [menuCollectionView setDataSource:self];
        [menuCollectionView setDelegate:self];
        [menuCollectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:@"MenuCollectionViewCell"];
        menuCollectionView.pagingEnabled = YES;
        [menuCollectionView setShowsHorizontalScrollIndicator:NO];
        [menuCollectionView setShowsVerticalScrollIndicator:NO];
        
    }
    return menuCollectionView;
}


- (UITableView *) mainTableView {
    if (!mainTableView) {
        mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 112, self.view.frame.size.width - 10, self.view.frame.size.height-112-50)];
        mainTableView.backgroundColor  = [UIColor clearColor];
        mainTableView.dataSource = self;
        mainTableView.delegate = self;
        mainTableView.separatorColor = [UIColor clearColor];
    }
    return mainTableView;
}

- (UITableView *) menuTableView {
    if (!menuTableView) {
        menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
        menuTableView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        menuTableView.separatorColor = UIColor.clearColor;
        menuTableView.dataSource = self;
        menuTableView.delegate = self;
        menuTableView.tableHeaderView.backgroundColor = UIColor.clearColor;
    }
    return menuTableView;
}

- (FXBlurView *) blurView {
    if (!blurView) {
        blurView = [[FXBlurView alloc] initWithFrame:self.menuCollectionView.frame];
        blurView.blurRadius = 6;
        blurView.tintColor = [UIColor colorWithRed:123/255.0f green:201/255.0f blue:210/255.0f alpha:1];
        //blurView.dynamic = YES;
        blurView.alpha = 0.4;
    }
    return blurView;
}

- (UIImageView *) bgView {
    if (!bgView) {
        bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.jpg"]];
    }
    return bgView;
}

- (UITextField *) searchFieldl {
    if (!searchFieldl) {
        searchFieldl = [[UITextField alloc] initWithFrame:CGRectMake(5, 22, 257, 36)];
        searchFieldl.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"search_bg"]];
    }
    return searchFieldl;
}


- (UIButton *) searchButton {
    if (!searchButton) {
        searchButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 40, 40)];
        [searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return searchButton;
}

- (UIButton *) menuButton {
    if (!menuButton) {
        menuButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-15-40, 20, 40, 40)];
        [menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [menuButton addTarget:self action:@selector(menuButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return menuButton;
}


@end
