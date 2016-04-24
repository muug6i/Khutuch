//
//  CommentTableViewCell.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/18/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell
@synthesize idLabel;
@synthesize userIcon;
@synthesize useComment;
@synthesize dateLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.idLabel];
        [self.contentView addSubview:self.userIcon];
        [self.contentView addSubview:self.dateLabel];
        
        [self.contentView addSubview:self.useComment];
      
        UIView *cornerView = [[UIView alloc] initWithFrame:CGRectMake(0, 79, self.contentView.frame.size.width, 1)];
        cornerView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        
        [self.contentView addSubview:cornerView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *) idLabel {
    if (!idLabel) {
        idLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, self.contentView.frame.size.width/2, 20)];
        idLabel.text = @"MID #2323111";
        idLabel.textColor = [UIColor colorWithRed:0 green:32/255.0f blue:116/255.0f alpha:1];
        idLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:14];
    }
    return idLabel;
}

- (UIImageView *) userIcon {
    if (!userIcon) {
        userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        userIcon.backgroundColor = UIColor.grayColor;
        userIcon.layer.masksToBounds = YES;
        userIcon.layer.cornerRadius = 20;
    }
    return userIcon;
}

- (UILabel *) dateLabel {
    if (!dateLabel) {
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width/2+5, 10, self.contentView.frame.size.width/2-30, 20)];
        dateLabel.text = @"10/01/2016";
        dateLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        dateLabel.textAlignment = NSTextAlignmentRight;
    }
    return dateLabel;
}

- (UITextView *) useComment {
    if (!useComment) {
        useComment = [[UITextView alloc] initWithFrame:CGRectMake(50, 30, self.contentView.frame.size.width-50, 50)];
        useComment.editable = NO;
        useComment.selectable = NO;
        useComment.font = [UIFont fontWithName:@"Helvetica" size:13];
        useComment.text = @"Хэдэн хүний порц болох вэ?";
    }
    return useComment;
}
@end
