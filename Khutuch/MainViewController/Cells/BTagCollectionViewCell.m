//
//  BTagCollectionViewCell.m
//  Minu
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "BTagCollectionViewCell.h"

@implementation BTagCollectionViewCell

@synthesize mainImageView;
@synthesize colorView;
@synthesize deleteButton;
@synthesize titleText;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.mainImageView];
        [self addSubview:self.colorView];
        [self addSubview:self.deleteButton];
        [self addSubview:self.titleText];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
    }
    return self;
}


#pragma mark -
#pragma mark getters
-(UIImageView *) mainImageView {
    if (!mainImageView) {
        mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width/2+10, 100)];
        mainImageView.clipsToBounds = YES;
        mainImageView.contentMode = UIViewContentModeCenter;
        //iconImage.backgroundColor = UIColor.greenColor;
        mainImageView.image = [UIImage imageNamed:@"meeting"];
    }
    return mainImageView;
}

-(UITextView *) titleText {
    if (!titleText) {
        titleText = [[UITextView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width/2+12, self.contentView.frame.size.height-55, self.contentView.frame.size.width/2-15, 55)];
        titleText.textColor = [UIColor whiteColor];
        titleText.font = [UIFont fontWithName:@"Courier" size:10];
        titleText.textAlignment = NSTextAlignmentCenter;
        titleText.text = @"VIP ROOM WITH FRIENDS";
        titleText.backgroundColor = UIColor.clearColor;
    }
    return titleText;
}

- (UIView *) colorView {
    if (!colorView) {
        colorView = [[UIView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width/2+10, 0, self.contentView.frame.size.width/2-10, 100)];
        colorView.backgroundColor = [self randomColor];
    }
    return colorView;
}

- (UIButton *) deleteButton {
    if (!deleteButton) {
        deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width-23, 3, 20, 20)];
        [deleteButton setImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
    }
    return deleteButton;
}

- (UIColor*) randomColor{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

@end
