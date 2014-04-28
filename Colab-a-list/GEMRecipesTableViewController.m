//
//  GEMRecipesTableViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMRecipesTableViewController.h"
#import "SWRevealViewController.h"

@interface GEMRecipesTableViewController ()

@property NSMutableArray *recipes;

@end

@implementation GEMRecipesTableViewController

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
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Create manu barbutton item
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuIcon.png"]style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    // Create addItem barbutton item
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(addRecipe)];
    
    // Show barButton items
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    // Testing AFNetworking
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper methods

// Obtains path to application's list of items
- (NSString *)pathForItems
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths lastObject];
    
    return [documents stringByAppendingPathComponent:@"recipes.plist"];
}

// Obtains the file path from helper method and saves files to it
- (void)saveItems
{
    NSString *filePath = [self pathForItems];
    [NSKeyedArchiver archiveRootObject:self.recipes toFile:filePath];
}

// Obtains the file path from helper method.  Unarchives it and saves it to privet mutable array.
- (void)loadRecipes
{
    NSString *filePath = [self pathForItems];
    
    // If file exists load it into privet recipes array
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        self.recipes = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }else{// Else instantiate an empty array
        self.recipes = [NSMutableArray array];
    }
}

- (void)dismissAlertView:(UIAlertView *)alertView
{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

#pragma mark - Buttons

- (IBAction)searchBtn:(id)sender
{
    NSLog(@"searchBtn was pressed");
}

- (void)addRecipe
{
    NSLog(@"addRecipe button was pressed");
}

- (IBAction)refreshBtn:(id)sender
{
    NSLog(@"refreshBtn button was tapped");
    
    // Refresh table
    [self.tableView reloadData];
    
    // Create alertview to confirm shopping list update
    UIAlertView *refreshCompleted = [[UIAlertView alloc] initWithTitle:nil message:@"Shopping list has been updated" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    // Show alert view
    [refreshCompleted show];
    // Dismiss alert view after interval
    [self performSelector:@selector(dismissAlertView:) withObject:refreshCompleted afterDelay:1];
}

- (IBAction)editBtn:(id)sender
{
    NSLog(@"editBtn was pressed");
}

#pragma mark - GEMAddRecipeViewController Delegate

- (void)controller:(GEMAddRecipeViewController *)controller didSaveRecipeWithName:(NSString *)name andImage:(UIImage *)image andDescription:(NSString *)description andServings:(NSString *)servings andCookTime:(NSString *)cookTime andIngredients:(NSMutableArray *)ingredients andSourse:(NSString *)sourse andURL:(NSURL *)recipeURL
{
    
}

- (void)controller:(GEMAddRecipeViewController *)controller didUpdateRecipe:(GEMRecipe *)item
{
    
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        // Set Title
        self.title = @"Recipe";
        
        // Load items
        [self loadRecipes];
    }
    return self;
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recipeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
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
