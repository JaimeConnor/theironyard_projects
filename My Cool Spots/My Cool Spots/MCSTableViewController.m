//
//  MCSTableViewController.m
//  My Cool Spots
//
//  Created by Jaime Connor on 8/18/14.
//  Copyright (c) 2014 Jaime Connor. All rights reserved.
//

#import "MCSTableViewController.h"
#import "MCSTableViewCell.h"
#import "MCSViewController.h"
#import "MCSFourSquareRequest.h"

@interface MCSTableViewController ()

@end

@implementation MCSTableViewController
{
    NSMutableArray * venueList;
    
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self.tableView registerClass:[MCSTableViewCell class] forCellReuseIdentifier:@"cell"];
        
        self.tableView.rowHeight = 200;
        
        venueList = [@[] mutableCopy];
        
        NSArray * loadedVenues = [MCSFourSquareRequest loadVenues];
        
        if (loadedVenues)
        {
            venueList = [loadedVenues mutableCopy];
            
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 0;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    GFATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    
//    if (cell == nil)
//    {
//        cell = [[GFATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    
//    cell.friendInfo = githubFriends[indexPath.row];
//    
//    cell.navigationController = self.navigationController;
//    
//    cell.backgroundColor = [UIColor colorWithRed:58.0/255 green:58.0/255 blue:58.0/255 alpha:1.0];
//    
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    
//    self.tableView.rowHeight = 97.0;
//    
//    // Configure the cell...
//    //cell.detailTextLabel.text = info[@"students"];
//    
//    return cell;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (cell == nil)
    {
        cell = [[MCSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
//    cell.venueInfo = venueList[indexPath.row];
//    
//    cell.navigationController = self.navigationController;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
