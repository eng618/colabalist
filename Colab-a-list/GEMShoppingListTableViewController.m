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
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;

@property NSMutableArray *items;

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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Create barbutton item for sidebar
    UIBarButtonItem *revealButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuIcon.png"]style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    // Create barbutton item for addItem
    UIBarButtonItem *addItemButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
    
    // Show barButton item for sidebar
    self.navigationItem.leftBarButtonItem = revealButton;
    // Show barButton item for addItem
    self.navigationItem.rightBarButtonItem = addItemButton;
    // Show bottom toolbar
    self.navigationController.toolbarHidden = NO;
    //self.editButton = self.editButtonItem;
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

#pragma mark - Button actions

- (void)addItem:(id)sender
{
    NSLog(@"AddItem buttow was tapped");
    // Preform segue
    [self performSegueWithIdentifier:@"addItemSegue" sender:self];
}

- (IBAction)editList:(id)sender
{
    NSLog(@"editList button was tapped");
    if (self.tableView.editing == NO) {
        [self.tableView setEditing:YES animated:YES];
        //[sender setTitle:@"Done" forState:UIControlStateSelected];
        //UIBarButtonItem *done = [[UIBarButtonItem alloc] init];
        //[self.editButton setTitle:@"Done"];
    }else {
        [self.tableView setEditing:NO animated:YES];
        //[sender setTitle:@"Done"];
    }
}

- (IBAction)refreshTable:(id)sender
{
    NSLog(@"refreshTable button was tapped");
    
    // Refresh table
    [self.tableView reloadData];
    
    // Create alertview to confirm shopping list update
    UIAlertView *refreshCompleted = [[UIAlertView alloc] initWithTitle:nil message:@"Shopping list is being updated..." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    // Show alert view
    [refreshCompleted show];
    // Dismiss alert view after interval
    [self performSelector:@selector(dismissAlertView:) withObject:refreshCompleted afterDelay:1];
}

#pragma mark - Helpers: Save/Load/Delete/Strikethrough

// Obtains path to application's list of items
- (NSString *)pathForItems
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths lastObject];
    
    return [documents stringByAppendingPathComponent:@"items.plist"];
}

// Obtains the file path from helper method and saves files to it
- (void)saveItems
{
    NSString *filePath = [self pathForItems];
    [NSKeyedArchiver archiveRootObject:self.items toFile:filePath];
}

// Obtains the file path from helper method.  Unarchives it and saves it to privet mutable array.
- (void)loadItems
{
    NSString *filePath = [self pathForItems];
    
    // If file exists load it into privet items array
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        self.items = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        // Else instantiate an empty array
    }else{
        self.items = [NSMutableArray array];
    }
}

- (void)dismissAlertView:(UIAlertView *)alertView
{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

- (NSMutableAttributedString *)stringEdit:(NSString *)itemString
{
    //Set up item strikethrough when selected
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:itemString];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [attributeString length])];
    
    [attributeString addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, [attributeString length])];
    
    return attributeString;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check if editing style is delete
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete item from items
        [self.items removeObjectAtIndex:[indexPath row]];
        
        // Update table view
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
        // Save changes to disk
        [self saveItems];
    }
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        // Set Title
        self.title = @"Items";
        
        // Load items
        [self loadItems];
    }
    return self;
}

#pragma mark - GEMAddItemViewController Delegete

- (void)controller:(GEMAddItemViewController *)controller didSaveItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes
{
    // Create item
    GEMItem *item = [GEMItem createItemWithName:name andQuantity:quantity andPrice:price andCategory:category andNotes:notes];
    
    //Add item to data source
    [self.items addObject:item];
    
    //Add row to table view
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:([self.items count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    // Save items
    [self saveItems];
}

-(void)controller:(GEMAddItemViewController *)controller didUpdateItem:(GEMItem *)item
{
    // Obtain item
    for (int i = 0; i < [self.items count]; i++) {
        GEMItem *anItem = [self.items objectAtIndex:i];
        
        if ([[anItem uuid] isEqualToString:[item uuid]]) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    // Save item
    [self saveItems];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Dequeued shopping list cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shoppingCell" forIndexPath:indexPath];
    
    // Obtain Item
    GEMItem *item = [self.items objectAtIndex:[indexPath row]];
    
    // Configure the cell...
    
    if ([item inShoppingList]) {// If it is in the shopping list load with strikethrough
        [cell.textLabel setAttributedText:[self stringEdit:[item name]]];
        [cell.detailTextLabel setText:[item notes]];
        //[cell.detailTextLabel setAttributedText:[self stringEdit:[item notes]]];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    }else {// Else load plain text
        [cell.textLabel setText:[item name]];
        [cell.detailTextLabel setText:[item notes]];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // Obtain item
    GEMItem *item = [self.items objectAtIndex:[indexPath row]];
    
    if (item) {
        // Update selection
        //[self setSelection:item];
        [self setSelection:item];
        
        // Perform segue
        [self performSegueWithIdentifier:@"editItemSegue" sender:self];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Obtain item
    GEMItem *item = [self.items objectAtIndex:[indexPath row]];
    
    // Update BOOL
    [item setInShoppingList:![item inShoppingList]];
    
    // Update cell
    UITableViewCell *cell   = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([item inShoppingList]) {
        // Obtain item title
        NSString *titleToBeEdited = cell.textLabel.text;
        // Obtain item notes
        //NSString *notesToBeEdited = cell.detailTextLabel.text;
        
        // Send string to helper method stringEdit, and set it as text lable
        [cell.textLabel setAttributedText: [self stringEdit:titleToBeEdited]];
        //[cell.detailTextLabel setAttributedText:[self stringEdit:notesToBeEdited]];
    }else{// Else cell is not in shopping cart
        // Set lable to name of item without strikethrough
        [cell.textLabel setText:[item name]];
        //[cell.detailTextLabel setText:[item notes]];
    }
    
    // Save Items
    [self saveItems];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addItemSegue"]) {
        // Destination view controller
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        // Obtain add item view controller
        GEMAddItemViewController *dvc = [nc.viewControllers firstObject];
        
        // Set delegate
        [dvc setDelegate:self];
        [dvc setIsEditingItem:NO];
    }else if ([segue.identifier isEqualToString:@"editItemSegue"]){
        // Destination view controller
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        // Obtain add item view controller
        GEMAddItemViewController *dvc = [nc.viewControllers firstObject];
        
        // Set delegate
        [dvc setDelegate:self];
        [dvc setIsEditingItem:YES];
        [dvc setItem:self.selection];
    }
}


@end
