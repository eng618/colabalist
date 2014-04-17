//
//  GEMAddItemViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMAddItemViewController.h"
#import "GEMSettingsManager.h"
#import "GEMItem.h"

@interface GEMAddItemViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
// Form outlets
@property (strong, nonatomic) IBOutlet UITextField *itemField;
@property (strong, nonatomic) IBOutlet UITextField *quantityField;
@property (strong, nonatomic) IBOutlet UITextField *priceField;
@property (strong, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (strong, nonatomic) IBOutlet UITextView *notesField;

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
    self.categories = @[@"Produce", @"Dairy", @"Grocery", @"Bakery", @"Deli", @"Frozen", @"Housewares", @"Personal Care", @"Office", @"Uncategorized"];
    

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
    // Extract user input
    NSString *name = [self.itemField text];
    float quantity = [[self.quantityField text] floatValue];
    float price = [[self.priceField text] floatValue];
    NSString *category = [self.categories objectAtIndex: [self.categoryPicker selectedRowInComponent:0]];
    NSString *notes = [self.notesField text];
    
    // Notify delegate
    //[self.delegate didSaveItemWithName:name andQuantity:quantity andPrice:price andCategory:category andNotes:notes];
    [self.delegate controller:self didSaveItemWithName:name andQuantity:quantity andPrice:price andCategory:category andNotes:notes];
    //Dismiss viewController
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Keyboard

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
