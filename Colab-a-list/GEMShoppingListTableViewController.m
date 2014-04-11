//
//  GEMShoppingListTableViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMShoppingListTableViewController.h"
#import "SWRevealViewController.h"
#import "GEMItem.h"

@interface GEMShoppingListTableViewController ()

@end

@implementation GEMShoppingListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    
    // Load dummy data into array to test app
    //GEMItem *item = [[GEMItem alloc] init];
    //item.item = item.text
    
    /*
    // Return the number of sections.
    GEMItemManager *manager = [GEMItemManager storedItems];
    if (manager) {
        GEMItem *item = [[GEMItem alloc] init];
        item.item = @"Milk";
        item.qty = @"1 Gallon";
        item.category = @"Dairy";
        item.notes = @"Milk does a body good!";
        
        [manager.items addObject:item];
    }
     */
    
    
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Create barbutton item
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuIcon.png"]style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    
    // Show barButton item
    self.navigationItem.leftBarButtonItem = revealButtonItem;
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int rows = 0;
    // Create instance of ItemManager
    GEMItemManager *manager = [GEMItemManager storedItems];
    // Check validity
    if (manager) {
        // Return number of items in array to populate table view
        rows = [manager.items count];
    }
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shoppingCell" forIndexPath:indexPath];
    
    // Configure the cell...
    // Create instance of ItemManager
    GEMItemManager *manager = [GEMItemManager storedItems];
    // Check validity
    if (manager) {
        // Create instence of items array
        NSMutableArray *items = [manager items];
        GEMItem *current = [items objectAtIndex:indexPath.row];
        
        // Set text
        cell.textLabel.text = [current item];
        cell.detailTextLabel.text = [current qty];
        
        
        
    }
    
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
