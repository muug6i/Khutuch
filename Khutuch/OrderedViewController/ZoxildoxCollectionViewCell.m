//
//  ZoxildoxCollectionViewCell.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/18/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "ZoxildoxCollectionViewCell.h"

@implementation ZoxildoxCollectionViewCell

@synthesize cellImage;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cellImage];
    }
    return self;
}

- (UIImageView *) cellImage {
    if (!cellImage) {
        cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [cellImage setImage:[UIImage imageNamed:@"food"]];
        cellImage.layer.masksToBounds = YES;
        cellImage.contentMode = UIViewContentModeScaleToFill;
        cellImage.backgroundColor = UIColor.grayColor;
    }
    return cellImage;
}

@end
