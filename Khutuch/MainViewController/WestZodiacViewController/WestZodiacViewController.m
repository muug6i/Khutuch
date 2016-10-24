//
//  WestZodiacViewController.m
//  Khutuch
//
//  Created by niknok on 4/30/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "WestZodiacViewController.h"

@interface WestZodiacViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation WestZodiacViewController
@synthesize myCollectionView;
@synthesize bgImage;
@synthesize zodiacLabel;
@synthesize zodiacArray;

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
    [self.view addSubview:self.bgImage];
    [self.view addSubview:self.zodiacLabel];
    [self.view addSubview:self.myCollectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.zodiacArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WestZodiacCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WestZodiacCollectionViewCell" forIndexPath:indexPath];
    
    [self configureCell:cell forItemAtIndexPath:indexPath];
    //    cell.contentView.backgroundColor = RANDOM_COLOR;
    return cell;
}

- (void)configureCell:(WestZodiacCollectionViewCell *)cell
   forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *section = [self.zodiacArray objectAtIndex:indexPath.row];
    cell.nameLabel.text = [section valueForKey:@"name"];
    [cell.iconImage setImage:[UIImage imageNamed:[section valueForKey:@"image"]]];
    cell.iconImage.contentMode = UIViewContentModeScaleAspectFit;
    [cell layoutSubviews];
}
#pragma mark -
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //TODO:

}

#pragma mark -
#pragma mark Getters
- (NSArray *)zodiacArray{
    if (zodiacArray == nil) {
        zodiacArray = @[@{@"name":@"Хумх",@"image":@"humh.png"},
                      @{@"name":@"Загас",@"image":@"zagas.png"},
                      @{@"name":@"Хонь",@"image":@"honi.png"},
                      @{@"name":@"Үхэр",@"image":@"uher.png"},
                      @{@"name":@"Ихэр",@"image":@"iher.png"},
                      @{@"name":@"Мэлхий",@"image":@"melhii.png"},
                      @{@"name":@"Арслан",@"image":@"arslan.png"},
                      @{@"name":@"Охин",@"image":@"ohin.png"},
                      @{@"name":@"Жинлүүр",@"image":@"jinluur.png"},
                      @{@"name":@"Хилэнц",@"image":@"hilents.png"},
                      @{@"name":@"Нум",@"image":@"num.png"},
                      @{@"name":@"Матар",@"image":@"matar.png"}
                      ];
    }
    return zodiacArray;
}

- (UIImageView *)bgImage{
    if(bgImage == nil){
        bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgImage.backgroundColor = CLEAR_COLOR;
        
    }
    return bgImage;
}

- (UICollectionView *)myCollectionView {
    if (myCollectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT-130) collectionViewLayout:layout];
        myCollectionView.backgroundColor = CLEAR_COLOR;
        myCollectionView.dataSource = self;
        myCollectionView.delegate = self;
        myCollectionView.alwaysBounceVertical = YES;
        
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-20)/3, 85);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        [myCollectionView registerClass:[WestZodiacCollectionViewCell class] forCellWithReuseIdentifier:@"WestZodiacCollectionViewCell"];
    }
    return myCollectionView;
}


@end
