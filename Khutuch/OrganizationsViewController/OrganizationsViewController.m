
//
//  OrganizationsViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "OrganizationsViewController.h"


@interface OrganizationsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIActionSheetDelegate>
{
}
@end

@implementation OrganizationsViewController

@synthesize myCollectionView;
@synthesize organizationsArray;

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

#pragma mark -
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.organizationsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OrganizationCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OrganizationCollectionCell" forIndexPath:indexPath];
    
    [self configureCell:cell forItemAtIndexPath:indexPath];
//    cell.contentView.backgroundColor = RANDOM_COLOR;
    return cell;
}

- (void)configureCell:(OrganizationCollectionCell *)cell
   forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *section = [self.organizationsArray objectAtIndex:indexPath.row];
    cell.nameLabel.text = [section valueForKey:@"name"];
    [cell.orgCatImageView setImage:[UIImage imageNamed:[section valueForKey:@"image"]]];
    cell.orgCatImageView.contentMode = UIViewContentModeCenter;

    
    
    [cell layoutSubviews];
//    __weak typeof(self)weakSelf = self;
//    cell.oneTapped = ^(OrganizationCollectionCell *cell){
//        {
//            
//            OrganizationCollectionCell *controller = [[OrganizationCollectionCell alloc] initWithNibName:nil bundle:nil];
//            controller.menuCategory = cell.productCategory;
//            if (self.productTypeSegmentedControl.selectedSegmentIndex == 0)
//                controller.isAvialable = YES;
//            else
//                controller.isAvialable = NO;
//            [weakSelf.navigationController pushViewController:controller animated:YES];
//            
//        } else {
//            
//            MainCategory *mainCat = [self.mainCategoryArray objectAtIndex:indexPath.section];
//            NSArray *proCatArray = mainCat.productCategoryArray;
//            [self syncThisRow:(int)cell.productCategory.indexPath.row array:proCatArray];
//            [self syncDeleteOrUndeleteMode];
//        }
//    };
}

#pragma mark -
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //TODO:
}

#pragma mark -
#pragma mark Getters
- (NSArray *)organizationsArray {
    if (organizationsArray == nil) {
        organizationsArray = @[@{@"name":@"Үндэсний үйлдвэрлэл",@"image":@"1.png"},
                               @{@"name":@"Авто",@"image":@"2.png"},
                               @{@"name":@"Арилжаа наймаа",@"image":@"3.png"},
                               @{@"name":@"Ахуйн үйлчилгээ",@"image":@"4.png"},
                               @{@"name":@"Аялал жуулчлал",@"image":@"5.png"},
                               @{@"name":@"Барилга",@"image":@"6.png"},
                               @{@"name":@"Зочид буудал",@"image":@"hotel.png"},
                               @{@"name":@"Бизнес үйлчилгээ",@"image":@"7.png"},
                               @{@"name":@"Боловсрол, сургалт",@"image":@"8.png"},
                               @{@"name":@"Бэлэн хувцас",@"image":@"16.png"},
                               @{@"name":@"Ресторан, караоке",@"image":@"10.png"},
                               @{@"name":@"Тээвэр үйлчилгээ",@"image":@"11.png"},
                               @{@"name":@"Хэвлэл, зар сурталчилгаа",@"image":@"12.png"},
                               @{@"name":@"Эрүүл мэнд, чөлөөт цаг",@"image":@"13.png"},
                               @{@"name":@"Үсчин, гоо сайхан",@"image":@"15.png"},
                               ];
    }
    return organizationsArray;
}

- (UICollectionView *)myCollectionView {
    
    if (myCollectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT-115) collectionViewLayout:layout];
        myCollectionView.backgroundColor = CLEAR_COLOR;
        myCollectionView.dataSource = self;
        myCollectionView.delegate = self;
        myCollectionView.alwaysBounceVertical = YES;
        
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-20)/3, 100);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        [myCollectionView registerClass:[OrganizationCollectionCell class] forCellWithReuseIdentifier:@"OrganizationCollectionCell"];
    }
    return myCollectionView;
}




@end
