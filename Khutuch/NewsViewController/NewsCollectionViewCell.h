//
//  NewsCollectionViewCell.h
//  Khutuch
//
//  Created by niknok on 4/27/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, copy) void(^oneTapped)(NewsCollectionViewCell *cell);
@property (nonatomic, copy) void(^longPressed)(NewsCollectionViewCell *cell);
@end
