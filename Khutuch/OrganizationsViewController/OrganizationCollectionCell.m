//
//  ProductCell.m
//  iRestaurantRepo
//
//  Created by Sodtseren Enkhee on 2/13/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import "OrganizationCollectionCell.h"

#define MY_SIZE     CGSizeMake((SCREEN_WIDTH-20)/3, 100)

@interface OrganizationCollectionCell()

@end

@implementation OrganizationCollectionCell
@synthesize nameLabel;
@synthesize orgCatImageView;
@synthesize oneTapped;
@synthesize longPressed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.contentView.backgroundColor = CLEAR_COLOR;
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.orgCatImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark -
#pragma mark UIActions

#pragma mark -
#pragma mark Getters
- (UIImageView *)orgCatImageView {
    if (orgCatImageView == nil) {
        orgCatImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MY_SIZE.width, MY_SIZE.width-25)];
        orgCatImageView.userInteractionEnabled = YES;
        orgCatImageView.clipsToBounds = YES;
        orgCatImageView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        orgCatImageView.backgroundColor = CLEAR_COLOR;
        orgCatImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
        
    return orgCatImageView;
}

- (UILabel *)nameLabel {
    if (nameLabel == nil) {
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 73, MY_SIZE.width, 25)];
        nameLabel.backgroundColor = CLEAR_COLOR;
        nameLabel.textColor = BLACK_COLOR;
        nameLabel.font = FONT_NORMAL_SMALL_BOLD;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.numberOfLines = 2;
        nameLabel.adjustsFontSizeToFitWidth = YES;
    }
    return nameLabel;
}

@end
