//
//  MainViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/14/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//


#import "MainViewController.h"
#import "BTagCollectionViewCell.h"
#import "MainMenuCollectionCell.h"
#import "MainTableViewCell.h"
#import "MainDetailTableViewCell.h"

@interface MainViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>{
    CGSize menuSize;
}
@end

@implementation MainViewController
@synthesize myScrollView;
@synthesize headView;
@synthesize advertiseMentView;

@synthesize newsButton;
@synthesize trafficButton;
@synthesize searchButton;

@synthesize weatherButton;
@synthesize referenceButton;

@synthesize easternAstrologyButton;
@synthesize westernAstrologyButton;
@synthesize classicButton;

@synthesize tvButton;
@synthesize getInformationButton;
@synthesize jokeButton;

@synthesize radioButton;
@synthesize busRouteButton;
@synthesize sonjooButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initValues{
    menuSize = CGSizeMake((SCREEN_WIDTH-20)/3, 85);
}

-(void)configureView{
    [super configureView];
    
    [self initValues];
    
    [self.view addSubview:self.myScrollView];
    [self.myScrollView addSubview:self.headView];
    [self.myScrollView addSubview:self.advertiseMentView];
    [self.myScrollView addSubview:self.newsButton];
    [self.myScrollView addSubview:self.trafficButton];
    [self.myScrollView addSubview:self.searchButton];
    [self.myScrollView addSubview:self.weatherButton];
    
    [self.myScrollView addSubview:self.referenceButton];
    [self.myScrollView addSubview:self.easternAstrologyButton];
    [self.myScrollView addSubview:self.westernAstrologyButton];
    [self.myScrollView addSubview:self.classicButton];
    [self.myScrollView addSubview:self.tvButton];
    [self.myScrollView addSubview:self.getInformationButton];
    [self.myScrollView addSubview:self.jokeButton];
    [self.myScrollView addSubview:self.radioButton];
    [self.myScrollView addSubview:self.busRouteButton];
    [self.myScrollView addSubview:self.sonjooButton];
    
    myScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 145 + menuSize.height * 5 + 40);
}

#pragma mark -
#pragma mark UIActions

-(void)newsButtonClicked{
    
}

-(void)trafficButtonClicked{
    
}

-(void)searchButtonClicked{
    
}

-(void)weatherButtonClicked{
    
}

-(void)referenceButtonClicked{
    
}

-(void)easternAstrologyButtonClicked{
    
}

-(void)westernAstrologyButtonClicked{
    
}


-(void)classicButtonClicked{
    
}

-(void)tvButtonClicked{
    
}

-(void)getInformationButtonClicked{
    
}

-(void)jokeButtonClicked{
    
}


-(void)busRouteButtonClicked{
    
}

-(void)sonjooButtonClicked{
    
}


#pragma mark -
#pragma mark Getters
- (UIScrollView *)myScrollView {
    if (myScrollView == nil) {
        myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 70)];
        myScrollView.backgroundColor = CLEAR_COLOR;
        myScrollView.delegate = self;
        myScrollView.showsVerticalScrollIndicator = NO;
        myScrollView.showsHorizontalScrollIndicator = NO;
        myScrollView.decelerationRate = 0.1f;
        myScrollView.pagingEnabled = NO;
        myScrollView.alwaysBounceVertical = YES;
    }
    return myScrollView;
}

- (UIView *)headView {
    if (headView == nil) {
        headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        headView.backgroundColor = RANDOM_COLOR;
    }
    return headView;
}

- (UIView *)advertiseMentView {
    if (advertiseMentView == nil) {
        advertiseMentView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 95)];
        advertiseMentView.backgroundColor = RANDOM_COLOR;
    }
    return advertiseMentView;
}

- (UIButton *) newsButton {
    if (!newsButton) {
        newsButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 145, menuSize.width, menuSize.height)];
        [newsButton setImage:[UIImage imageNamed:@"medee"] forState:UIControlStateNormal];
        [newsButton addTarget:self action:@selector(newsButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [newsButton.titleLabel setFont:FONT_SMALLEST];
        [newsButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [newsButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        newsButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        newsButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        newsButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [newsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        newsButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        newsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [newsButton setTitle:@"Мэдээ" forState:UIControlStateNormal];
    }
    return newsButton;
}

- (UIButton *) trafficButton {
    if (!trafficButton) {
        trafficButton = [[UIButton alloc] initWithFrame:CGRectMake(10 + menuSize.width, 145, menuSize.width, menuSize.height)];
        [trafficButton setImage:[UIImage imageNamed:@"traffic"] forState:UIControlStateNormal];
        [trafficButton addTarget:self action:@selector(trafficButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [trafficButton.titleLabel setFont:FONT_SMALLEST];
        [trafficButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [trafficButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        trafficButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 65, 0 , 0);
        trafficButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        trafficButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [trafficButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        trafficButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        trafficButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [trafficButton setTitle:@"Замын түгжрэл" forState:UIControlStateNormal];
    }
    return trafficButton;
}

- (UIButton *) searchButton {
    if (!searchButton) {
        searchButton = [[UIButton alloc] initWithFrame:CGRectMake(15 + menuSize.width*2, 145, menuSize.width, menuSize.height)];
        [searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [searchButton setTitle:@"Хайлт" forState:UIControlStateNormal];
        
        [searchButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [searchButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [searchButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        searchButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        searchButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        searchButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [searchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        searchButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        searchButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return searchButton;
}

- (UIButton *) weatherButton {
    if (!weatherButton) {
        weatherButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 145 + menuSize.height + 5, menuSize.width*2 + 5, menuSize.height)];
        [weatherButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [weatherButton addTarget:self action:@selector(weatherButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        [weatherButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [weatherButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [weatherButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        weatherButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        weatherButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        weatherButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [weatherButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        weatherButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        weatherButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return weatherButton;
}

- (UIButton *)referenceButton {
    if (!referenceButton) {
        referenceButton = [[UIButton alloc] initWithFrame:CGRectMake(15 + menuSize.width*2, 145 + menuSize.height + 5, menuSize.width, menuSize.height)];
        [referenceButton setImage:[UIImage imageNamed:@"lavlah"] forState:UIControlStateNormal];
        [referenceButton addTarget:self action:@selector(referenceButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [referenceButton setTitle:@"Лавлах" forState:UIControlStateNormal];
        
        [referenceButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [referenceButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [referenceButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        referenceButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        referenceButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        referenceButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [referenceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        referenceButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        referenceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return referenceButton;
}

- (UIButton *) easternAstrologyButton {
    if (!easternAstrologyButton) {
        easternAstrologyButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 145 + (menuSize.height+5)*2, menuSize.width, menuSize.height)];
        [easternAstrologyButton setImage:[UIImage imageNamed:@"zodiac"] forState:UIControlStateNormal];
        [easternAstrologyButton addTarget:self action:@selector(easternAstrologyButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [easternAstrologyButton setTitle:@"Өрнийн зурхай" forState:UIControlStateNormal];
        
        [easternAstrologyButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [easternAstrologyButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [easternAstrologyButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        easternAstrologyButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        easternAstrologyButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        easternAstrologyButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [easternAstrologyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        easternAstrologyButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        easternAstrologyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return easternAstrologyButton;
}

- (UIButton *) westernAstrologyButton {
    if (!westernAstrologyButton) {
        westernAstrologyButton = [[UIButton alloc] initWithFrame:CGRectMake(10 + menuSize.width, 145 + menuSize.height*2 + 10, menuSize.width, menuSize.height)];
        [westernAstrologyButton setImage:[UIImage imageNamed:@"yinyang"] forState:UIControlStateNormal];
        [westernAstrologyButton addTarget:self action:@selector(westernAstrologyButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [westernAstrologyButton setTitle:@"Дорнын зурхай" forState:UIControlStateNormal];
        
        [westernAstrologyButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [westernAstrologyButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [westernAstrologyButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        westernAstrologyButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        westernAstrologyButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        westernAstrologyButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [westernAstrologyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        westernAstrologyButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        westernAstrologyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return westernAstrologyButton;
}

- (UIButton *) classicButton {
    if (!classicButton) {
        classicButton = [[UIButton alloc] initWithFrame:CGRectMake(15 + menuSize.width*2, 145 + menuSize.height*2 + 10, menuSize.width, menuSize.height)];
        [classicButton setImage:[UIImage imageNamed:@"songodog"] forState:UIControlStateNormal];
        [classicButton addTarget:self action:@selector(classicButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [classicButton setTitle:@"Сонгодог" forState:UIControlStateNormal];
        
        [classicButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [classicButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [classicButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        classicButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        classicButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        classicButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [classicButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        classicButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        classicButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return classicButton;
}

- (UIButton *) tvButton {
    if (!tvButton) {
        tvButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 145 + menuSize.height*3 + 15,menuSize.width, menuSize.height)];
        [tvButton setImage:[UIImage imageNamed:@"tv"] forState:UIControlStateNormal];
        [tvButton addTarget:self action:@selector(tvButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [tvButton setTitle:@"ТВ, Кино" forState:UIControlStateNormal];
        
        [tvButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [tvButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [tvButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        tvButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        tvButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        tvButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [tvButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        tvButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        tvButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return tvButton;
}

- (UIButton *) getInformationButton {
    if (!getInformationButton) {
        getInformationButton = [[UIButton alloc] initWithFrame:CGRectMake(10 + menuSize.width, 145 + menuSize.height*3 + 15, menuSize.width, menuSize.height)];
        [getInformationButton setImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
        [getInformationButton addTarget:self action:@selector(getInformationButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [getInformationButton setTitle:@"Мэдээлэл авах" forState:UIControlStateNormal];
        
        [getInformationButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [getInformationButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [getInformationButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        getInformationButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        getInformationButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        getInformationButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [getInformationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        getInformationButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        getInformationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return getInformationButton;
}

- (UIButton *) jokeButton {
    if (!jokeButton) {
        jokeButton = [[UIButton alloc] initWithFrame:CGRectMake(15 + menuSize.width*2, 145 + menuSize.height*3 + 15, menuSize.width, menuSize.height)];
        [jokeButton setImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
        [jokeButton addTarget:self action:@selector(jokeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [jokeButton setTitle:@"Онигоо" forState:UIControlStateNormal];
        
        [jokeButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [jokeButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [jokeButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        jokeButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        jokeButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        jokeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [jokeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        jokeButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        jokeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return jokeButton;
}




- (UIButton *) busRouteButton {
    if (!busRouteButton) {
        busRouteButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 145 + menuSize.height*4 + 20,  menuSize.width,  menuSize.height)];
        [busRouteButton setImage:[UIImage imageNamed:@"busdirection"] forState:UIControlStateNormal];
        [busRouteButton addTarget:self action:@selector(busRouteButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        [busRouteButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [busRouteButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [busRouteButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        busRouteButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        busRouteButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        busRouteButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [busRouteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        busRouteButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        busRouteButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return busRouteButton;
}

- (UIButton *) sonjooButton {
    if (!sonjooButton) {
        sonjooButton = [[UIButton alloc] initWithFrame:CGRectMake(10 + menuSize.width, 145 + menuSize.height*4 + 20, menuSize.width, menuSize.height)];
        [sonjooButton setImage:[UIImage imageNamed:@"sonjoo"] forState:UIControlStateNormal];
        [sonjooButton addTarget:self action:@selector(sonjooButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        [sonjooButton.titleLabel setFont:FONT_NORMAL_SMALL];
        [sonjooButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.3f]] forState:UIControlStateNormal];
        [sonjooButton setBackgroundImage:[self imageWithColor:[BLACK_COLOR colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
        sonjooButton.titleEdgeInsets = UIEdgeInsetsMake(menuSize.height - 25, - 56, 0 , 0);
        sonjooButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 5, 5);
        sonjooButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [sonjooButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        sonjooButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        sonjooButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return sonjooButton;
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

//- (UIImageView *) bgView {
//    if (!bgView) {
//        bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.jpg"]];
//    }
//    return bgView;
//}


//- (UITextField *) searchFieldl {
//    if (!searchFieldl) {
//        searchFieldl = [[UITextField alloc] initWithFrame:CGRectMake(5, 22, 257, 36)];
//        searchFieldl.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"search_bg"]];
//    }
//    return searchFieldl;
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


@end
