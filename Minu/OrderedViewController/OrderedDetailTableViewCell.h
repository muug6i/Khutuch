//
//  OrderedDetailTableViewCell.h
//  Minu
//
//  Created by Kaizen-Mongolia on 1/18/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderedDetailTableViewCell : UITableViewCell<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UITextView        *aboutTetxView;
@property (nonatomic, strong) UIButton          *aboutMoreButton;

@property (nonatomic, strong) UIView            *cornerView;
@property (nonatomic, strong) UILabel           *priceLabel;

@property (nonatomic, strong) UIButton          *ortsButton;

@property (nonatomic, strong) UILabel           *zoxitsoxLabel;
@property (nonatomic, strong) UICollectionView  *zoxitsoxCollectionView;

@property (nonatomic, strong) UILabel           *commentLabel;
@property (nonatomic, strong) UITableView       *commentTableView;
@property (nonatomic, strong) UITextView        *commentField;
@property (nonatomic, strong) UIButton          *commentButton;

@end
