//
//  TraditionCollectionViewCell.m
//  Khutuch
//
//  Created by niknok on 4/27/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "TraditionCollectionViewCell.h"
#define MY_SIZE     CGSizeMake((SCREEN_WIDTH-20)/2, 60)
@implementation TraditionCollectionViewCell
@synthesize nameLabel;
@synthesize oneTapped;
@synthesize longPressed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.contentView.backgroundColor = [GRAY_COLOR colorWithAlphaComponent:0.5f];
        
        [self addSubview:self.nameLabel];
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
- (UILabel *)nameLabel {
    if (nameLabel == nil) {
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, MY_SIZE.width, 30)];
        nameLabel.backgroundColor = CLEAR_COLOR;
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = FONT_NORMAL;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.numberOfLines = 2;
        nameLabel.adjustsFontSizeToFitWidth = YES;
        nameLabel.minimumScaleFactor = 12.0f/[UIFont labelFontSize];
    }
    return nameLabel;
}

@end
