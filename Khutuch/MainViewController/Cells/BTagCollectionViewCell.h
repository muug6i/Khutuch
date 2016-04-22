//
//  BTagCollectionViewCell.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTagCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView       *mainImageView;
@property (nonatomic, strong) UIView            *colorView;
@property (nonatomic, strong) UIButton          *deleteButton;
@property (nonatomic, strong) UITextView        *titleText;

@end
