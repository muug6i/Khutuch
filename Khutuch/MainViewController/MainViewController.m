//
//  MainViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/14/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//
#define TRANSFORM_CELL_VALUE CGAffineTransformMakeScale(0.8, 0.8)
#define ANIMATION_SPEED 0.2


#import "MainViewController.h"
#import "BTagCollectionViewCell.h"
#import "MenuCollectionViewCell.h"
#import "MainTableViewCell.h"
#import "MainDetailTableViewCell.h"

@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate>
{
    BOOL        isMoved;
    BOOL        isSearch;
    BOOL        isSubCell;
    NSMutableArray  *nameArray;
    NSMutableArray  *iconArray;
    NSMutableArray  *othersArray;
    NSMutableArray  *boolArray;
    NSIndexPath     *lastIndex;
    NSIndexPath     *singleIndex;
}
@end

@implementation MainViewController

@synthesize blurView;
@synthesize bgView;
@synthesize menuCollectionView;

@synthesize mainTableView;
@synthesize othersTableView;

@synthesize bTagCollectionView;

@synthesize searchFieldl;
@synthesize searchButton;
@synthesize loginButton;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isMoved = NO;
    nameArray = [[NSMutableArray alloc] initWithObjects:@"", @"Үзвэр үйлчилгээ", @"Хоолны газар", @"Банк, санхүү", @"Энтертэймант", @"B-tag", @"Бусад", @"", nil];
    
    boolArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO], nil];
    
    iconArray = [[NSMutableArray alloc] initWithObjects:@"", @"uzver", @"hool", @"bank", @"entertainment", @"btab", @"busad", @"", nil];
    othersArray = [[NSMutableArray alloc] initWithObjects:@"СПОРТ ЧӨЛӨӨТ ЦАГ", @"БОЛОВСРОЛ", @"зочид буудал", @"онцлох газар", @"эрүүл мэнд", @"хүүхдэд зориулсан", @"гоо сайхан", @"дэлгүүр", nil];
    [self drawObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) drawObjects {
    
    [self.view layoutIfNeeded];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.blurView];
    [self.view addSubview:self.menuCollectionView];
    
    [self.view addSubview:self.searchFieldl];
    self.searchFieldl.hidden = YES;
    [self.view addSubview:self.searchButton];
    [self.view addSubview:self.loginButton];
    self.loginButton.hidden = YES;
    
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.bTagCollectionView];
    [self.view addSubview:self.othersTableView];
    
    self.bTagCollectionView.hidden = YES;
    self.othersTableView.hidden = YES;
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
}


#pragma mark -
#pragma mark - Actions

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"LEFT");
    
    CGPoint offset = self.menuCollectionView.contentOffset;
    offset.x = offset.x + self.view.frame.size.width/3;
    [self.menuCollectionView setContentOffset:offset animated:YES];
    
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"RIGHT");
    CGPoint offset = self.menuCollectionView.contentOffset;
    if (offset.x >= 0) {
        offset.x = offset.x - self.view.frame.size.width/3;
        [self.menuCollectionView setContentOffset:offset animated:YES];
    }
    
}

- (void) searchButtonClicked {
    
    self.searchFieldl.hidden = !self.searchFieldl.hidden;
    self.searchButton.hidden = !self.searchButton.hidden;
    self.loginButton.hidden = !self.loginButton.hidden;
    isSearch = !isSearch;
    NSLog(@"SEARCH BUTTON");
    [self.menuCollectionView reloadData];
}

- (void) closeButtonClicked {
    NSLog(@"CLOSE BUTTON");
    isSubCell = !isSubCell;
    
    for (int a = 0; a < 10; a++) {
        [boolArray replaceObjectAtIndex:a withObject:[NSNumber numberWithBool:NO]];
    }
    
    
    
    [self.loginButton removeTarget:nil
                           action:nil
                 forControlEvents:UIControlEventAllEvents];
    [self.loginButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.hidden = !self.loginButton.hidden;
    
    [self.mainTableView reloadData];
    
}
#pragma mark -
#pragma mark - Scroll View Delegate
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
        
        if (index == 4) {
            self.bTagCollectionView.hidden = NO;
            self.mainTableView.hidden = YES;
            self.othersTableView.hidden = YES;
        } else if (index == 5) {
            self.bTagCollectionView.hidden = YES;
            self.mainTableView.hidden = YES;
            self.othersTableView.hidden = NO;
        } else {
            self.bTagCollectionView.hidden = YES;
            self.mainTableView.hidden = NO;
            self.othersTableView.hidden = YES;
        }
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

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.menuCollectionView) {
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
    } else {
        BTagCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"BTagCollectionViewCell"
                                                                               forIndexPath:indexPath];
        return cell;
    }
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.mainTableView) {
        BOOL selected = [[boolArray objectAtIndex:singleIndex.section] boolValue];
        if (selected == YES) {
            return 2;
        } else {
            return 1;
        }
    } else {
        return othersArray.count;
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
        
        cell.textLabel.text= [[othersArray objectAtIndex:indexPath.row] uppercaseString];;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = UIColor.whiteColor;
        cell.backgroundColor = UIColor.clearColor;
        
        if (indexPath.row != othersArray.count-1) {
            UIView *cornerView = [[UIView alloc] initWithFrame:CGRectMake(40, 44, self.view.frame.size.width-80, 1)];
            cornerView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
            [cell addSubview:cornerView];
        }
        return cell;
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

- (MainDetailTableViewCell *)getSubDetailCell:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    static NSString *CellIdentifiers = @"MainDetailTableViewCell";
    
    MainDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifiers];
    if (cell == nil) {
        cell = [[MainDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifiers];
        cell.backgroundColor = UIColor.whiteColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.zoxitsoxLabel.text =@"Төстэй газрууд";
    [cell.ortsButton setTitle:@"Байршил харах" forState:UIControlStateNormal];
    cell.priceLabel.hidden = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mainTableView) {
        if (indexPath.row == 0) {
            return 175;
        } else
            return 640;
    } else {
        
        return 45;
    }
    
}


#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView  == self.mainTableView) {
        BOOL list = [[boolArray objectAtIndex:indexPath.section] boolValue];
        singleIndex = indexPath;
        
        if (indexPath.row == 0) {
            NSLog(@"MAin Clicked");
            
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
                
                
                [self.loginButton removeTarget:nil
                                        action:NULL
                              forControlEvents:UIControlEventAllEvents];
                [self.loginButton addTarget:self action:@selector(closeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
                isSubCell = !isSubCell;
                self.loginButton.hidden = !self.loginButton.hidden;
                
                [self.mainTableView reloadData];
            } else {
            }
            
        } else {
            NSLog(@"Sub Clicked");
        }
    }
    
}



#pragma mark -
#pragma mark getters

-(UICollectionView *) bTagCollectionView {
    if (!bTagCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(5, 2, 2, 2);
        layout.itemSize = CGSizeMake(self.view.frame.size.width/2-10, 100);
        layout.minimumInteritemSpacing = 2;
        layout.minimumLineSpacing = 5;
        
        
        bTagCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 82, self.view.frame.size.width - 10, self.view.frame.size.height-82-50) collectionViewLayout:layout];
        bTagCollectionView.backgroundColor = [UIColor clearColor];
        bTagCollectionView.alwaysBounceVertical = YES;
        [bTagCollectionView setDataSource:self];
        [bTagCollectionView setDelegate:self];
        [bTagCollectionView registerClass:[BTagCollectionViewCell class] forCellWithReuseIdentifier:@"BTagCollectionViewCell"];
    }
    return bTagCollectionView;
}

- (UICollectionView *) menuCollectionView {
    if (!menuCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
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
        [menuCollectionView layoutIfNeeded];

    }
    return menuCollectionView;
}


//- (UITableView *) mainTableView {
//    if (!mainTableView) {
//        mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 82, self.view.frame.size.width - 10, self.view.frame.size.height-82-50)];
//        mainTableView.backgroundColor  = [UIColor clearColor];
//        mainTableView.dataSource = self;
//        mainTableView.delegate = self;
//        mainTableView.separatorColor = [UIColor clearColor];
//    }
//    return mainTableView;
//}
//
//- (UITableView *) othersTableView {
//    if (!othersTableView) {
//        othersTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 102, self.view.frame.size.width - 10, self.view.frame.size.height-102-50)];
//        othersTableView.backgroundColor  = [UIColor clearColor];
//        othersTableView.dataSource = self;
//        othersTableView.delegate = self;
//        othersTableView.separatorColor = [UIColor clearColor];
//    }
//    return othersTableView;
//}


//- (FXBlurView *) blurView {
//    if (!blurView) {
//        blurView = [[FXBlurView alloc] initWithFrame:self.menuCollectionView.frame];
//        blurView.blurRadius = 6;
//        blurView.tintColor = [UIColor colorWithRed:123/255.0f green:201/255.0f blue:210/255.0f alpha:1];
//        //blurView.dynamic = YES;
//        blurView.alpha = 0.4;
//    }
//    return blurView;
//}

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
        searchButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 40, 40)];
        [searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return searchButton;
}

- (UIButton *) loginButton {
    if (!loginButton) {
        loginButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-5-40, 20, 40, 40)];
        [loginButton setImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return loginButton;
}

@end
