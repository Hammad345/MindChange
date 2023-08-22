//
//  GestureTableViewController.m
//  MindChange
//
//  Created by Xululabs on 12/05/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import "GestureTableViewController.h"
#import "DataModelShareClass.h"

@interface GestureTableViewController () {
}

@end

@implementation GestureTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor orangeColor]};
    self.tableView.backgroundColor = [UIColor colorWithRed:29/400.0f green:38/400.0f blue:48/400.0f alpha:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (CGSize)contentSizeForViewInPopover
{
    return CGSizeMake(240, (6 * [self.tableView rowHeight]) + (3 * [self.tableView sectionHeaderHeight]));
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSInteger row = [[[DataModelShareClass sharedDataMethode].gestureValue objectForKey:@"integer"] integerValue];
    [self gestureValuesForFurtherUse:row];

    if (indexPath.row == row)
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self styleDelegate] styleDidChange:self.style];
    [self gestureValuesForFurtherUse:indexPath.row];
    [self.tableView reloadData];
}

-(void)gestureValuesForFurtherUse:(NSInteger)row {
    DataModelShareClass *manager = [DataModelShareClass sharedDataMethode];
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)row];
    [manager.gestureValue setObject:inStr forKey:@"integer"];
}
@end
