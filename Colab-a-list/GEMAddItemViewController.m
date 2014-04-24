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
@synthesize item;

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
    
    // Check is item is present to edit
    if (self.isEditingItem == YES) {
        // Creaet save button
        //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
        
        // Populate text fields
        [self.itemField setText:[self.item name]];
        [self.quantityField setText:[NSString stringWithFormat:@"%f", [self.item qty]]];
        [self.priceField setText:[NSString stringWithFormat:@"%f", [self.item price]]];
        //[self.categoryPickerView ]
        [self.notesField setText:[self.item notes]];
    }
    
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
    // Instantiate instance of setting manager
    GEMSettingsManager *manager = [[GEMSettingsManager alloc] init];
    // Check validity
    if (manager) {
        // Return number of items in categories array
        return [manager.categories count];
    }
    // If settings manager is nil return 0
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // Instantiate instance of setting manager
    GEMSettingsManager *manager = [[GEMSettingsManager alloc] init];
    // Check validity
    if (manager) {
        // Return number of items in categories array
        return manager.categories[row];
    }
    // Return nil to prevent crash is settings manager is nil
    return nil;
}

#pragma mark - Buttons

- (IBAction)onCancel:(id)sender
{
    // Cancel add item
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)onSave:(id)sender
{
    if (self.isEditingItem == NO) {
        // Create category string pointer to have object availible outside of settings manager instance
        NSString *category;
        // Instantiate instance of setting manager
        GEMSettingsManager *manager = [[GEMSettingsManager alloc] init];
        // Check validity
        if (manager) {
            category = [manager.categories objectAtIndex: [self.categoryPicker selectedRowInComponent:0]];
        }
        
        // Extract user input
        NSString *name = [self.itemField text];
        float quantity = [[self.quantityField text] floatValue];
        float price = [[self.priceField text] floatValue];
        
        NSString *notes = [self.notesField text];
        
        // Notify delegate
        //[self.delegate didSaveItemWithName:name andQuantity:quantity andPrice:price andCategory:category andNotes:notes];
        [self.delegate controller:self didSaveItemWithName:name andQuantity:quantity andPrice:price andCategory:category andNotes:notes];
        //Dismiss viewController
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if (self.isEditingItem == YES){
        NSString *category = @"Unknown";
        // Instantiate instance of setting manager
        GEMSettingsManager *manager = [[GEMSettingsManager alloc] init];
        // Check validity
        if (manager) {
            category = [manager.categories objectAtIndex: [self.categoryPicker selectedRowInComponent:0]];
        }
        
        NSString *name = [self.itemField text];
        float quantity = [[self.quantityField text] floatValue];
        float price = [[self.priceField text] floatValue];
        NSString *notes = [self.notesField text];
        
        // Update item
        self.item.name = name;
        self.item.qty = quantity;
        self.item.price = price;
        self.item.category = category;
        self.item.notes = notes;
        
        // Notify Delegate
        [self.delegate controller:self didUpdateItem:self.item];
        
        // Pop view controller
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)save:(id)sender
{
    NSString *category = @"Unknown";
    // Instantiate instance of setting manager
    GEMSettingsManager *manager = [[GEMSettingsManager alloc] init];
    // Check validity
    if (manager) {
        category = [manager.categories objectAtIndex: [self.categoryPicker selectedRowInComponent:0]];
    }
    
    NSString *name = [self.itemField text];
    float quantity = [[self.quantityField text] floatValue];
    float price = [[self.priceField text] floatValue];
    NSString *notes = [self.notesField text];
    
    // Update item
    self.item.name = name;
    self.item.qty = quantity;
    self.item.price = price;
    self.item.category = category;
    self.item.notes = notes;
    
    // Notify Delegate
    [self.delegate controller:self didUpdateItem:self.item];
    
    // Pop view controller
    [self.navigationController popViewControllerAnimated:YES];
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
