//
//  SortButton.m
//  Minu
//
//  Created by Kaizen-Mongolia on 1/17/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "SortButton.h"

@implementation SortButton

@synthesize buttonIcon;
@synthesize buttonLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:self.buttonIcon];
        [self addSubview:self.buttonLabel];
    }
    return self;
}

- (UIImageView *) buttonIcon {
    if (!buttonIcon) {
        buttonIcon = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-30, 5, 20, 20)];
        [buttonIcon setImage:[UIImage imageNamed:@"detail_dooshoo"]];
    }
    return buttonIcon;
}

- (UILabel *) buttonLabel {
    if (!buttonLabel) {
        buttonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-30 ,30)];
        buttonLabel.textColor = UIColor.whiteColor;
        buttonLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:12];
        buttonLabel.textAlignment = NSTextAlignmentCenter;
    }
    return buttonLabel;
}

@end
