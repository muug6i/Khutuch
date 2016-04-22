//
//  MainDetailTableViewCell.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/19/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "MainDetailTableViewCell.h"
#import "TosteiCollectionViewCell.h"
#import "Comment2TableViewCell.h"

@implementation MainDetailTableViewCell

@synthesize aboutTetxView;
@synthesize aboutMoreButton;
@synthesize cornerView;
@synthesize priceLabel;
@synthesize ortsButton;
@synthesize zoxitsoxLabel;
@synthesize zoxitsoxCollectionView;
@synthesize commentLabel;
@synthesize commentTableView;
@synthesize commentField;
@synthesize commentButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.aboutTetxView];
        [self.contentView addSubview:self.aboutMoreButton];
        
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.ortsButton];
        
        [self.contentView addSubview:self.zoxitsoxCollectionView];
        [self.contentView addSubview:self.zoxitsoxLabel];
        [self.contentView addSubview:self.commentTableView];
        [self.contentView addSubview:self.commentField];
        [self.contentView addSubview:self.commentButton];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (UITextView *) aboutTetxView {
    if (!aboutTetxView) {
        aboutTetxView = [[UITextView alloc] initWithFrame:CGRectMake(5, 0, self.contentView.frame.size.width-40, 80)];
        aboutTetxView.backgroundColor = UIColor.clearColor;
        aboutTetxView.textColor = UIColor.blackColor;
        aboutTetxView.textAlignment =  NSTextAlignmentJustified;
        aboutTetxView.font = [UIFont fontWithName:@"Helvetica" size:12];
        aboutTetxView.editable = NO;
        aboutTetxView.text =@"Калийн баялаг эх үүсвэрийн нэг энэ жимс нь цусны даралтыг хэвийн байлгах, зүрх болон бие организмын үйл ажиллагааг идэвхжүүлэхэд тустай. Гадил нь гадуураа арилгаж болдог хальстай учир та түүнийг цүнхэндээ хийх эсвэл гартаа бариад явчихаж болно. Идэхэд төвөггүй энэ хүнс таны энергийн түвшинг маш сайн өсгөнө.";
        aboutTetxView.selectable = NO;
    }
    return aboutTetxView;
}

- (UIButton *) aboutMoreButton {
    if (!aboutMoreButton) {
        aboutMoreButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width - 35, 35, 20, 20)];
        [aboutMoreButton setImage:[UIImage imageNamed:@"detail"] forState:UIControlStateNormal];
    }
    return aboutMoreButton;
}


- (UILabel *) priceLabel {
    if (!priceLabel) {
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, self.contentView.frame.size.width-10, 30)];
        priceLabel.textAlignment = NSTextAlignmentCenter;
        priceLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:16];
        priceLabel.text = @"16000₮";
    }
    return priceLabel;
}

- (UIButton *) ortsButton {
    if (!ortsButton) {
        ortsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 90, self.contentView.frame.size.width, 36)];
        ortsButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"orts_button"]];
        [ortsButton setTitle:@"Орц харах" forState:UIControlStateNormal];
        ortsButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(self.ortsButton.frame.size.width-35, 9, 20, 20)];
        [icon setImage:[UIImage imageNamed:@"detail_dooshoo"]];
        [ortsButton addSubview:icon];
    }
    return ortsButton;
}

- (UILabel *) zoxitsoxLabel {
    if (!zoxitsoxLabel) {
        zoxitsoxLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, self.contentView.frame.size.width-30, 20)];
        zoxitsoxLabel.text = @"Юу зохицох вэ ?";
        zoxitsoxLabel.textColor = UIColor.blackColor;
        zoxitsoxLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    }
    return zoxitsoxLabel;
}

#pragma mark -
#pragma mark UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TosteiCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"TosteiCollectionViewCell"
                                                                               forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionView *) zoxitsoxCollectionView {
    if (!zoxitsoxCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(5, 2, 2, 2);
        layout.itemSize = CGSizeMake(100, 100);
        layout.minimumInteritemSpacing = 2;
        layout.minimumLineSpacing = 5;
        
        
        zoxitsoxCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 150, self.contentView.frame.size.width - 10, 105) collectionViewLayout:layout];
        zoxitsoxCollectionView.backgroundColor = [UIColor clearColor];
        zoxitsoxCollectionView.alwaysBounceVertical = NO;
        [zoxitsoxCollectionView setDataSource:self];
        [zoxitsoxCollectionView setDelegate:self];
        [zoxitsoxCollectionView registerClass:[TosteiCollectionViewCell class] forCellWithReuseIdentifier:@"TosteiCollectionViewCell"];
        zoxitsoxCollectionView.backgroundColor = UIColor.clearColor;
    }
    return zoxitsoxCollectionView;
}

- (UITableView *) commentTableView {
    if (!commentTableView) {
        commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 255, self.contentView.frame.size.width, 300)];
        commentTableView.dataSource = self;
        commentTableView.delegate = self;
        commentTableView.separatorColor = UIColor.clearColor;
        commentTableView.backgroundColor = UIColor.clearColor;
    }
    return commentTableView;
}

#pragma TableView - DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Comment2TableViewCell";
    
    Comment2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell setClipsToBounds:YES];
    if (cell == nil) {
        cell = [[Comment2TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITextView *) commentField {
    if (!commentField) {
        commentField = [[UITextView alloc] initWithFrame:CGRectMake(5, 560, self.contentView.frame.size.width-55, 60)];
        [commentField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
        [commentField.layer setBorderWidth:1.0];
        
        //The rounded corner part, where you specify your view's corner radius:
        commentField.layer.cornerRadius = 5;
        commentField.clipsToBounds = YES;
    }
    return commentField;
}
- (UIButton *) commentButton {
    if (!commentButton) {
        commentButton =[[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width-40, 580, 20, 20)];
        [commentButton setImage:[UIImage imageNamed:@"send"] forState:UIControlStateNormal];
    }
    return commentButton;
}


@end
