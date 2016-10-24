//
//  MainViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/14/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//


#import "MainViewController.h"



@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    CGSize menuSize;
    int imageCount;
    NSTimer *timer;
}
@end

@implementation MainViewController
@synthesize myCollectionView;
@synthesize mainArray;
@synthesize advertiseImageView;
@synthesize slideScrollView;
@synthesize autoScrollLabel;
@synthesize pageControl;
@synthesize backImage;

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
    [self initValues];
    
    [self.view addSubview:self.backImage];
    [self.view addSubview:self.myCollectionView];
    [self.view addSubview:self.advertiseImageView];
    [self.view addSubview:self.autoScrollLabel];
    [self.myCollectionView addSubview:self.slideScrollView];
    [self.myCollectionView addSubview:self.pageControl];
    [self addImagesToSlide];

}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self endTimer];
}

-(void)viewWillAppear:(BOOL)animated{
    [self startTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initValues{
    menuSize = CGSizeMake((SCREEN_WIDTH-20)/3, 85);
    imageCount = 0;
}


- (void)startTimer {
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(photoCounter) userInfo:nil repeats:YES];
}

- (void)endTimer {
    [timer invalidate];
    timer = nil;
}

- (void)photoCounter {
    BOOL animate = YES;
    if (self.pageControl.currentPage == 4) {
        self.pageControl.currentPage = 0;
        animate = NO;
    } else {
        self.pageControl.currentPage++;
    }
    CGRect frame;
    frame.origin.x = self.slideScrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.slideScrollView.frame.size;
    [self.slideScrollView scrollRectToVisible:frame animated:animate];
}

#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrolView {
    
    if (scrolView == self.slideScrollView) {
        CGFloat pageWidth = self.slideScrollView.frame.size.width;
        int page = floor((self.slideScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        self.pageControl.currentPage = page;
        [self.pageControl updateCurrentPageDisplay];
    }
}

#pragma mark -
#pragma mark USER

-(void)addImagesToSlide{
   NSArray *array =@[@"busdirection",@"info",@"lavlah",@"medee",@"search"];
    
    for (int i = 0; i<[array count]; i++ ) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * (SCREEN_WIDTH), 0, (SCREEN_WIDTH), 95)];
        [imageView setImage:[UIImage imageNamed:[array objectAtIndex:i]]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;
        [self.slideScrollView addSubview:imageView];
    }
}


#pragma mark -
#pragma mark Getters
- (UIImageView *)backImage {
    if (backImage == nil) {
        backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        backImage.contentMode = UIViewContentModeScaleAspectFill;
        [backImage setImage:[UIImage imageNamed:@"main.jpg"]];
    }
    return backImage;
}

-(CBAutoScrollLabel *)autoScrollLabel{
    if (autoScrollLabel ==nil) {
        autoScrollLabel = [[CBAutoScrollLabel alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, 15)];
        autoScrollLabel.backgroundColor = CLEAR_COLOR;
        // setup the auto scroll label
        autoScrollLabel.font = FONT_SMALL;
        autoScrollLabel.text = @"Монгол банкны ханш: USD: 1,996.79  Авах: 2,001.00  Зарах: 2,011.00   EUR: 2,248.88  Авах: 2,244.00  Зарах: 2,292.00   GBP: 2,896.74  Авах: 2,898.00  Зарах: 2,955.00   RUB: 30.00  Авах: 29.60  Зарах: 31.68   CNY: 307.38  Авах: 306.60  Зарах: 310.00";
        autoScrollLabel.textColor = [UIColor whiteColor];
        autoScrollLabel.labelSpacing = 30; // distance between start and end labels
        autoScrollLabel.pauseInterval = 1; // seconds of pause before scrolling starts again
        autoScrollLabel.scrollSpeed = 30; // pixels per second
        autoScrollLabel.textAlignment = NSTextAlignmentCenter; // centers text when no auto-scrolling is applied
        autoScrollLabel.fadeLength = 12.f;
        autoScrollLabel.scrollDirection = CBAutoScrollDirectionLeft;
        [autoScrollLabel observeApplicationNotifications];
    }
    return autoScrollLabel;
}

-(UIScrollView*)slideScrollView{
    if (slideScrollView == nil) {
        slideScrollView = [[UIScrollView alloc]init];
            slideScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 95) ;
        slideScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*5 , 95);
        slideScrollView.pagingEnabled = YES;
        slideScrollView.delegate = self;
        [slideScrollView setShowsHorizontalScrollIndicator:NO];
    }
    return slideScrollView;
}

-(DDPageControl*)pageControl {
    if (pageControl==nil) {
        pageControl = [[DDPageControl alloc] init];
        [pageControl setCenter: CGPointMake(self.slideScrollView.center.x, 92)];
        [pageControl setCurrentPage: 0];
        [pageControl setDefersCurrentPageDisplay: YES];
        [pageControl setType: DDPageControlTypeOnFullOffEmpty];
        [pageControl setOnColor: [[UIColor whiteColor] colorWithAlphaComponent:1.f]];
        [pageControl setOffColor: [UIColor colorWithWhite: 0.9f alpha: 1.0f]];
        [pageControl setIndicatorDiameter: 8.0f];
        [pageControl setIndicatorSpace: 6.0f];
        [pageControl setNumberOfPages:5];
    }
    return pageControl;
}

- (UIImageView *)advertiseImageView {
    if (advertiseImageView == nil) {
//        advertiseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 95)];
//        advertiseImageView.backgroundColor = CLEAR_COLOR;
//        advertiseImageView.image = [UIImage imageNamed:@"busdirection"];
    }
    return advertiseImageView;
}



- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark -
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.mainArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainMenuCollectionCell *cell = [myCollectionView dequeueReusableCellWithReuseIdentifier:@"MainMenuCollectionCell" forIndexPath:indexPath];
    
    [self configureCell:cell forItemAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(MainMenuCollectionCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
        NSDictionary *section = [self.mainArray objectAtIndex:indexPath.row];
        cell.nameLabel.text = [section valueForKey:@"name"];
        [cell.iconImage setImage:[UIImage imageNamed:[section valueForKey:@"image"]]];
        cell.iconImage.contentMode = UIViewContentModeCenter;

        [cell layoutSubviews];
    __weak typeof(self)weakSelf = self;
    cell.oneTapped = ^(MainMenuCollectionCell *cell){
        MainViewController *controller = [[MainViewController alloc] initWithNibName:nil bundle:nil];
        [weakSelf.navigationController pushViewController:controller animated:YES];
    };
    
}

#pragma mark -
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //TODO:
    if (indexPath.row ==13){
        BusRouteTableViewController *busController = [[BusRouteTableViewController alloc] initWithNibName:nil bundle:nil];
        NSDictionary *section = [self.mainArray objectAtIndex:indexPath.row];
        busController.titleLabel.text = [section valueForKey:@"name"];
        [self.navigationController pushViewController:busController animated:YES];
        
    } else if (indexPath.row == 6){
        WestZodiacViewController *westZodiacController = [[WestZodiacViewController alloc] initWithNibName:nil bundle:nil];
        NSDictionary *section = [self.mainArray objectAtIndex:indexPath.row];
        westZodiacController.titleLabel.text = [section valueForKey:@"name"];
        [self.navigationController pushViewController:westZodiacController animated:YES];
    } else if (indexPath.row ==7){
        EastZodiacViewController *eastZodiacController = [[EastZodiacViewController alloc] initWithNibName:nil bundle:nil];
        NSDictionary *section = [self.mainArray objectAtIndex:indexPath.row];
        eastZodiacController.titleLabel.text = [section valueForKey:@"name"];
        [self.navigationController pushViewController:eastZodiacController animated:YES];
    }
}

#pragma mark -
#pragma mark Getters
- (NSArray *)mainArray {
    if (mainArray == nil) {
        mainArray = @[@{@"name":@"Мэдээ",@"image":@"medee.png"},
                               @{@"name":@"Замын түгжрэл",@"image":@"traffic.png"},
                               @{@"name":@"Хайлт",@"image":@"search.png"},
                               @{@"name":@"Цаг агаар",@"image":@""},
                               @{@"name":@"Цаг агаар",@"image":@""},
                               @{@"name":@"Лавлах",@"image":@"lavlah.png"},
                               @{@"name":@"Өрнийн зурхай",@"image":@"zodiac.png"},
                               @{@"name":@"Дорнын зурхай",@"image":@"yinyang.png"},
                               @{@"name":@"Сонгодог",@"image":@"songodog.png"},
                               @{@"name":@"ТВ, Кино",@"image":@"tv.png"},
                               @{@"name":@"Мэдээлэл авах",@"image":@"info.png"},
                               @{@"name":@"Онигоо",@"image":@"info.png"},
                               @{@"name":@"Радио",@"image":@"info.png"},
                               @{@"name":@"Автобус чиглэл",@"image":@"busdirection.png"},
                               @{@"name":@"Сонжоо",@"image":@"sonjoo.png"},
                               ];
    }
    return mainArray;
}

- (UICollectionView *)myCollectionView {
    if (myCollectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 85, SCREEN_WIDTH, SCREEN_HEIGHT-130) collectionViewLayout:layout];
        myCollectionView.backgroundColor = CLEAR_COLOR;
        myCollectionView.dataSource = self;
        myCollectionView.delegate = self;
        myCollectionView.alwaysBounceVertical = YES;
        
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-20)/3, 85);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(100, 5, 5, 5);
        
        [myCollectionView registerClass:[MainMenuCollectionCell class] forCellWithReuseIdentifier:@"MainMenuCollectionCell"];
    }
    return myCollectionView;
}

@end
