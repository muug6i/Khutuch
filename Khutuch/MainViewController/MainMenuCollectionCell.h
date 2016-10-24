//
//  MainMenuCollectionCell.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainMenuCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView       *iconImage;
@property (nonatomic, strong) UILabel           *nameLabel;

@property (nonatomic, copy) void(^oneTapped)(MainMenuCollectionCell *cell);
@property (nonatomic, copy) void(^longPressed)(MainMenuCollectionCell *cell);

@end
