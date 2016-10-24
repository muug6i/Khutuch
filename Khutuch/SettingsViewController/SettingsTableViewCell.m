//
//  SettingsTableViewCell.m
//  Khutuch
//
//  Created by niknok on 4/27/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "SettingsTableViewCell.h"

@implementation SettingsTableViewCell
@synthesize subLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.subLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //FRAME
    self.subLabel.frame = CGRectMake(20, 10, SCREEN_WIDTH-10, 20);

    

}

#pragma mark -
#pragma mark Getters
- (UILabel *)subLabel {
    if (subLabel == nil) {
        subLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        subLabel.backgroundColor = CLEAR_COLOR;
        subLabel.textColor = BLACK_COLOR;
        subLabel.font = FONT_NORMAL;
    }
    return subLabel;
}

@end
