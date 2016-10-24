//
//  ProductCell.h
//  iRestaurantRepo
//
//  Created by Sodtseren Enkhee on 2/13/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrganizationCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *orgCatImageView;

@property (nonatomic, copy) void(^oneTapped)(OrganizationCollectionCell *cell);
@property (nonatomic, copy) void(^longPressed)(OrganizationCollectionCell *cell);



@end
