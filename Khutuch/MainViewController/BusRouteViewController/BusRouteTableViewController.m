//
//  BusRouteTableViewController.m
//  Khutuch
//
//  Created by niknok on 4/29/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "BusRouteTableViewController.h"

@interface BusRouteTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation BusRouteTableViewController
@synthesize bgView;
@synthesize myTableView;
@synthesize busRouteArray;

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.busRouteArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BusRouteTableViewCell";
    
    BusRouteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[BusRouteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(BusRouteTableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    cell.indexPath = indexPath;
    cell.subLabel.text = [self.busRouteArray objectAtIndex:indexPath.row];
    [cell layoutSubviews];
}

#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row < self.busRouteArray.count) {
    
        MediaGalleryViewController *controller = [[MediaGalleryViewController alloc] initWithNibName:nil bundle:nil];
        controller.titleLabel.text = [self.busRouteArray objectAtIndex:indexPath.row];
        controller.titleLabel.font = FONT_SMALL;
        [self.navigationController pushViewController:controller animated:YES];
//    }
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark -
#pragma mark Getters
-(UIImageView *)bgView{
    if (bgView == nil){
        bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgView.backgroundColor = CLEAR_COLOR;
        
    }
    return bgView;
}
- (NSArray *)busRouteArray {
    if (busRouteArray == nil) {
        busRouteArray = @[@"Ч1. 5 шар - Офицеруудын ордон",
                          @"Ч2. Шархад -МУБИС-3,4-р хороолол",
                          @"Ч3. Зүүн салаа-Халдвартын эмнэлэг",
                          @"Ч4. 5 шар –3. 4 хороолол- Сансрын тойрог",
                          @"Ч5. Шархад-Их тойруу-3,4-р хороолол",
                          @"Ч6. Толгойт-Нарны зам-Ботаник",
                          @"Ч7. Нисэх -Төв номын сан-7 буудал",
                          @"Ч8. Зайсан-Цэцэг төв- Хайлааст",
                          @"Ч9. Нисэх-Нарны гүүр -Их тойруу- Хүнсний 4 дэлгүүр",
                          @"Ч10. Ганц худаг-Сансар-Баянмонгол хороолол-Мишээл экспо",
                          @"Ч11. Хужирбулан-Офицеруудын ордон",
                          @"Ч12. Ургах наран-Офицеруудын ордон"
                          ];
    }
    return busRouteArray;
}

- (UITableView *)myTableView {
    if (myTableView == nil) {
        myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT-150) style:UITableViewStylePlain];
        myTableView.backgroundColor = [UIColor whiteColor];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return myTableView;
}

@end
