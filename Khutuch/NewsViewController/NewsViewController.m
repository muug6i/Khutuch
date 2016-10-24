//
//  NewsViewController.m
//  Khutuch
//
//  Created by niknok on 4/25/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation NewsViewController
@synthesize myCollectionView;
@synthesize newsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup af
    
    [self.view addSubview:self.myCollectionView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(SCREEN_WIDTH, 40);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NewsCollectionHeaderView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        NewsCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        reusableview = headerView;
    }
    
    return reusableview;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.newsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewsCollectionViewCell" forIndexPath:indexPath];
    
    [self configureCell:cell forItemAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(NewsCollectionViewCell *)cell
   forItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSDictionary *section = [self.newsArray objectAtIndex:indexPath.row];
    cell.nameLabel.text = [self.newsArray objectAtIndex:indexPath.row];
    [cell layoutSubviews];
}
#pragma mark -
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark -
#pragma mark Getters
- (NSArray *)newsArray {
    if (newsArray == nil) {
        newsArray = @[@"Монгол улсын хөтөч",
                      @"Монгол хэлний хөтөч",
                      @"Хууль эрх зүйн хөтөч",
                      @"Эрүүл мэндийн хөтөч",
                      @"Номын өргөө",
                      @"Автын хөтөч",
                      @"Эр хүн таны хөтөч",
                      @"Бүсгүй таны хөтөч",
                      @"Хүүхдийн хөтөч",
                      @"Гэр бүлийн хөтөч",
                      @"Хоолны хөтөч",
                      @"Хүнсний хөтөч",
                      @"Зургийн цоморлиг",
                      @"Амьтдын хөтөч",
                      @"Зүүдний хөтөч",
                      @"Сонин хачин"
                     ];
    }
    return newsArray;
}

- (UICollectionView *)myCollectionView {
    
    if (myCollectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT-115) collectionViewLayout:layout];
        myCollectionView.backgroundColor = CLEAR_COLOR;
        myCollectionView.dataSource = self;
        myCollectionView.delegate = self;
        myCollectionView.alwaysBounceVertical = YES;
        
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-20)/2, 60);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.sectionHeadersPinToVisibleBounds = YES;
        
        [myCollectionView registerClass:[NewsCollectionViewCell class] forCellWithReuseIdentifier:@"NewsCollectionViewCell"];
        [myCollectionView registerClass:[NewsCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    }
    return myCollectionView;
}


 
@end
