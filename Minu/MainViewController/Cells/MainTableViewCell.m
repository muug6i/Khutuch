//
//  MainTableViewCell.m
//  Minu
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

@synthesize nameLabel;
@synthesize typeLabel;
@synthesize bestAreaIcon;
@synthesize saveButton;
@synthesize orderButton;
@synthesize moreButton;
@synthesize bestLabel;
@synthesize fooretView;
@synthesize mainImageView;
@synthesize cellRating;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.mainImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.typeLabel];
        
        [self.contentView addSubview:self.bestAreaIcon];
        [self.contentView addSubview:self.cellRating];
        
        [self.contentView addSubview:self.fooretView];
        [self.fooretView addSubview:self.saveButton];
        [self.fooretView addSubview:self.orderButton];
        [self.fooretView addSubview:self.bestLabel];
        [self.fooretView addSubview:self.moreButton];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (UIImageView *) mainImageView {
    if (!mainImageView) {
        mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 130)];
        mainImageView.image = [UIImage imageNamed:@"hotel"];
        mainImageView.contentMode = UIViewContentModeScaleToFill;
        mainImageView.layer.masksToBounds = YES;
    }
    return mainImageView;
}

- (UILabel *) nameLabel {
    if (!nameLabel) {
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 150, 25)];
        nameLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:18];
        nameLabel.textColor = UIColor.whiteColor;
    }
    return nameLabel;
}

- (UILabel *) typeLabel {
    if (!typeLabel) {
        typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 27, 150, 15)];
        typeLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
        typeLabel.textColor = UIColor.whiteColor;
    }
    return typeLabel;
}

- (UIImageView *) bestAreaIcon {
    if (!bestAreaIcon) {
        bestAreaIcon = [[UIImageView alloc] initWithFrame:CGRectMake(self.mainImageView.frame.size.width-68, 25, 53, 58)];
        [bestAreaIcon setImage:[UIImage imageNamed:@"best"]];
    }
    return bestAreaIcon;
}

- (AMRatingControl *) cellRating {
    if (!cellRating) {
        cellRating = [[AMRatingControl alloc] initWithLocation:CGPointMake(self.mainImageView.frame.size.width - 70 , 8)
                                                    emptyImage:nil
                                                    solidImage:[UIImage imageNamed:@"favorite"]
                                                  andMaxRating:5];
        cellRating.rating = 5;
        cellRating.starWidthAndHeight = 10;
    }
    return cellRating;
}

- (UIView *) fooretView {
    if (!fooretView) {
        fooretView = [[UIView alloc] initWithFrame:CGRectMake(0, 130, self.mainImageView.frame.size.width, 40)];
        fooretView.backgroundColor = [UIColor colorWithRed:56/255.0f green:56/255.0f blue:56/255.0f alpha:1];
    }
    return fooretView;
}

- (MyButton *) saveButton {
    if (!saveButton) {
        saveButton = [[MyButton alloc] initWithFrame:CGRectMake(10, 5, 95, 30)];
        [saveButton.iconImage setImage:[UIImage imageNamed:@"hadgalah"]];
        saveButton.buttonLabel.text =@"Хадгалах";
    }
    return saveButton;
}

- (MyButton *) orderButton {
    if (!orderButton) {
        orderButton = [[MyButton alloc] initWithFrame:CGRectMake(105, 5, 95, 30)];
        [orderButton.iconImage setImage:[UIImage imageNamed:@"zahialah"]];
        orderButton.buttonLabel.text =@"Захиалах";
    }
    return orderButton;
}

- (UIButton *) bestLabel {
    if (!bestLabel) {
        bestLabel = [[UIButton alloc] initWithFrame:CGRectMake(180, 5, 100, 30)];
        [bestLabel setTitle:@"Шилдэг 5" forState:UIControlStateNormal];
        bestLabel.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    }
    return bestLabel;
}

- (UIButton *) moreButton {
    if (!moreButton) {
        moreButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 5, 30, 30)];
        [moreButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    }
    return moreButton;
}

@end
