//
//  MenuCollectionViewCell.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "MenuCollectionViewCell.h"

@interface MenuCollectionViewCell()

@end


@implementation MenuCollectionViewCell

@synthesize iconImage, nameLabel;
@synthesize blurView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.blurView];
        self.iconImage.hidden = YES;

    }
    return self;
}


#pragma mark -
#pragma mark getters
-(UIImageView *) iconImage {
    if (!iconImage) {
        iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        iconImage.center = CGPointMake(self.contentView.frame.size.width/2, self.contentView.frame.size.height/2-3);
        iconImage.clipsToBounds = YES;
        iconImage.contentMode = UIViewContentModeCenter;
        //iconImage.backgroundColor = UIColor.greenColor;
    }
    return iconImage;
}

-(UILabel *) nameLabel {
    if (!nameLabel) {
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.frame.size.height-25, self.contentView.frame.size.width, 25)];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont fontWithName:@"Courier" size:10];
        nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return nameLabel;
}

- (FXBlurView *) blurView {
    if (!blurView) {
        blurView = [[FXBlurView alloc] initWithFrame:self.nameLabel.frame];
        blurView.blurRadius = 9;
        blurView.tintColor = [UIColor clearColor];
    }
    return blurView;
}

@end
