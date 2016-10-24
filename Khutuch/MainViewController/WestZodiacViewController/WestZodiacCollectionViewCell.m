//
//  WestZodiacCollectionViewCell.m
//  Khutuch
//
//  Created by niknok on 4/30/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "WestZodiacCollectionViewCell.h"

#define MY_SIZE     CGSizeMake((SCREEN_WIDTH-20)/3, 85)

@implementation WestZodiacCollectionViewCell
@synthesize iconImage, nameLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = CLEAR_COLOR;
        [self addSubview:self.iconImage];
        [self addSubview:self.nameLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark -
#pragma mark Getters
-(UIImageView *) iconImage {
    if (!iconImage) {
        iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MY_SIZE.width, MY_SIZE.width-25)];
        iconImage.userInteractionEnabled = YES;
        iconImage.clipsToBounds = YES;
        iconImage.backgroundColor = CLEAR_COLOR;
        iconImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return iconImage;
}

-(UILabel *) nameLabel {
    if (!nameLabel) {
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, MY_SIZE.width, 25)];
        nameLabel.textColor = BLACK_COLOR;
        nameLabel.font = FONT_NORMAL_SMALL_BOLD;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.numberOfLines = 2;
        nameLabel.adjustsFontSizeToFitWidth = YES;
        
    }
    return nameLabel;
}


@end
