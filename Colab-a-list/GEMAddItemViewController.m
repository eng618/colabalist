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
// Form outlets
@property (strong, nonatomic) IBOutlet UITextField *itemField;
@property (strong, nonatomic) IBOutlet UITextField *quantityField;
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
    
    // Set categories for new items
    self.categories = @[@"Produce", @"Dairy", @"Grocery", @"Bakery", @"Deli", @"Frozen", @"Housewares", @"Personal Care", @"Uncategorized"];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker Controls

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.categories count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.categories[row];
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
    item.qty = self.quantityField.text;
    
    // Obtain row selected
    NSInteger row = [self.categoryPicker selectedRowInComponent:0];
    // Find value from array
    item.category = [self.categories objectAtIndex:row];
    NSLog(@"The item is: %@ and the quantaty is: %@", item, self.quantityField.text);
    
    
    // Instantiate Item Manager
    GEMItemManager *itemManager = [[GEMItemManager alloc] init];
    // Check validity
    if (itemManager) {
        [itemManager.items addObject:item];
        // Create UI alert view
        UIAlertView *saveAlert = [[UIAlertView alloc] initWithTitle:@"Saved" message:[NSString stringWithFormat:@"You saved %@ on %@", [item item], [item qty]] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
        
        // Show alert view
        [saveAlert show];
    }
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn: (UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
