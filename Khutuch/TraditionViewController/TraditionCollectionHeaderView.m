//
//  TraditionCollectionHeaderView.m
//  Khutuch
//
//  Created by niknok on 4/27/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "TraditionCollectionHeaderView.h"

@implementation TraditionCollectionHeaderView
@synthesize titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [GRAY_COLOR colorWithAlphaComponent:0.9f];
        {
            UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
            label.font = FONT_NORMAL_BOLD;
            label.backgroundColor = CLEAR_COLOR;
            label.textColor = [UIColor whiteColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"Монгол өв соёл, ёс заншлийн товчоо";
            [self addSubview:label];
            
            self.titleLabel = label;
        }
    }
    return self;
}
@end
