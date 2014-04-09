//
//  GEMAddItemViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMAddItemViewController.h"
#import "GEMItem.h"

@interface GEMAddItemViewController ()
@property (strong, nonatomic) IBOutlet UITextField *itemField;
@property (strong, nonatomic) IBOutlet UITextField *quantityText;
@property (strong, nonatomic) IBOutlet UIPickerView *categoryPicker;

@end

@implementation GEMAddItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons

- (IBAction)onCancel:(id)sender
{
    // Cancel add item
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)onSave:(id)sender
{
    // Save code goes here
    
    // Instantiate custom item object
    GEMItem *item = [[GEMItem alloc] init];
    // Obtain values from user input fields
    item.item = self.itemField.text;
    //item.quantity = self.quantityText.text;
    NSLog(@"The item is: %@ and the quantaty is: %@", item, self.quantityText.text);
    
    
    // Instantiate Item Manager
    GEMItemManager *itemManager = [[GEMItemManager alloc] init];
    // Check validity
    if (itemManager) {
        [itemManager.items addObject:item];
        // Create UI alert view
        UIAlertView *saveAlert = [[UIAlertView alloc] initWithTitle:@"Saved" message:[NSString stringWithFormat:@"You saved %@", item.item] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
        
        // Show alert view
        [saveAlert show];
    }
    
    
}

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
