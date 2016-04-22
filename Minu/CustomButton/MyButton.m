//
//  MyButton.m
//  Minu
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

@synthesize iconImage;
@synthesize buttonLabel;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:self.iconImage];
        [self addSubview:self.buttonLabel];
    }
    return self;
}

- (UIImageView *) iconImage {
    if (!iconImage) {
        iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    }
    return iconImage;
}

- (UILabel *) buttonLabel {
    if (!buttonLabel) {
        buttonLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 60 ,30)];
        buttonLabel.textColor = UIColor.whiteColor;
        buttonLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
    }
    return buttonLabel;
}
@end
