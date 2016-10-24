
//
//  SettingsViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()<UITableViewDataSource, UITableViewDelegate>
{

}
@end

@implementation SettingsViewController

@synthesize bgView;
@synthesize myTableView;
@synthesize settingsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.myTableView];

}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.settingsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SettingsTableViewCell";
    
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SettingsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(SettingsTableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    cell.indexPath = indexPath;
    cell.subLabel.text = [self.settingsArray objectAtIndex:indexPath.row];
    [cell layoutSubviews];
}

#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    view.backgroundColor = [UIColor whiteColor];
    
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH, 40)];
        label.font = FONT_LARGE;
        label.backgroundColor = CLEAR_COLOR;
        label.textColor = BLACK_COLOR;
        label.text = NSLocalizedString(@"Энхбат Түвшинбаяр", nil);
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
    }
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}



#pragma mark -
#pragma mark Getters
-(UIImageView *)bgView{
    if (bgView == nil){
        bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgView.backgroundColor = CLEAR_COLOR;
        
    }
    return bgView;
}
- (NSArray *)settingsArray {
    if (settingsArray == nil) {
        settingsArray = @[@"Хувийн мэдээлэл",
                      @"Картны хүчинтэй хугацаа",
                      @"Карт сунгах заавар",
                      @"Мэдээ уншсан түүх",
                      @"Хадгалсан мэдээ",
                      @"Санал хүсэлт илгээх",
                      @"Ирсэн хүсэлт",
                      ];
    }
    return settingsArray;
}

- (UITableView *)myTableView {
    if (myTableView == nil) {
        myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT-70) style:UITableViewStylePlain];
        myTableView.backgroundColor = [UIColor whiteColor];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return myTableView;
}

@end
