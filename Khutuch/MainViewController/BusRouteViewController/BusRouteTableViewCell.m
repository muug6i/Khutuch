//
//  BusRouteTableViewCell.m
//  Khutuch
//
//  Created by niknok on 4/29/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "BusRouteTableViewCell.h"

@implementation BusRouteTableViewCell
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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //FRAME
    self.subLabel.frame = CGRectMake(15, 10, SCREEN_WIDTH-10, 20);
    
    
    
}

#pragma mark -
#pragma mark Getters
- (UILabel *)subLabel {
    if (subLabel == nil) {
        subLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        subLabel.backgroundColor = CLEAR_COLOR;
        subLabel.textColor = BLACK_COLOR;
        subLabel.font = FONT_NORMAL_SMALL;
    }
    return subLabel;
}

@end
