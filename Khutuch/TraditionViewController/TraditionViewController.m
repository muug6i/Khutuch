//
//  TraditionViewController.m
//  Khutuch
//
//  Created by niknok on 4/25/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "TraditionViewController.h"

@interface TraditionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation TraditionViewController
@synthesize myCollectionView;
@synthesize traditionArray;

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
    
    return CGSizeMake(0, 40);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    TraditionCollectionHeaderView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        TraditionCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        reusableview = headerView;
    }
    
    return reusableview;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.traditionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TraditionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TraditionCollectionViewCell" forIndexPath:indexPath];
    
    [self configureCell:cell forItemAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(TraditionCollectionViewCell *)cell
   forItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSDictionary *section = [self.newsArray objectAtIndex:indexPath.row];
    cell.nameLabel.text = [self.traditionArray objectAtIndex:indexPath.row];
    [cell layoutSubviews];
}
#pragma mark -
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark -
#pragma mark Getters
- (NSArray *)traditionArray {
    if (traditionArray == nil) {
        traditionArray = @[@"Баяр ёслол, ёс заншил",
                      @"Монгол ахуй",
                      @"Дуу хуур",
                      @"Цээрлэх ёсон",
                      @"Буяны үйл",
                      @"Шашны зан үйл",
                      @"Монгол бөх",
                      @"Хурдан морь",
                      @"Ерөөл магтаал",
                      @"Домог туульс",
                      @"Мал аж ахуй",
                      @"Ардын цэцэн ухаан",
                      @"Монгол ардын үлгэр",
                      @"Монгол тоо тоолол",
                      @"Монгол ардын өв соёл",
                      @"Монгол гэр бүлийн дэг жаяг"
                      ];
    }
    return traditionArray;
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
        layout.sectionHeadersPinToVisibleBounds = true;
        [myCollectionView registerClass:[TraditionCollectionViewCell class] forCellWithReuseIdentifier:@"TraditionCollectionViewCell"];
        [myCollectionView registerClass:[TraditionCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    }
    return myCollectionView;
}
@end
