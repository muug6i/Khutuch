//
//  CommentTableViewCell.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/18/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel       *idLabel;

@property (nonatomic, strong) UIImageView   *userIcon;
@property (nonatomic, strong) UITextView    *useComment;

@property (nonatomic, strong) UILabel       *dateLabel;


@end
