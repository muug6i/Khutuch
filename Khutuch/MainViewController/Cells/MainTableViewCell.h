//
//  MainTableViewCell.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView   *mainImageView;

@property (nonatomic, strong) UILabel       *nameLabel;
@property (nonatomic, strong) UILabel       *typeLabel;
@property (nonatomic, strong) UIImageView   *bestAreaIcon;

@property (nonatomic, strong) UIView        *fooretView;
@property (nonatomic, strong) MyButton      *saveButton;
@property (nonatomic, strong) MyButton      *orderButton;
@property (nonatomic, strong) UIButton      *moreButton;
@property (nonatomic, strong) UIButton       *bestLabel;


@end
