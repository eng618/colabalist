//
//  GEMEditItemViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/15/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMEditItemViewController.h"

@interface GEMEditItemViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *quantityTextField;
@property (strong, nonatomic) IBOutlet UITextField *priceTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *categoryPickerView;
@property (strong, nonatomic) IBOutlet UITextView *notesTextField;

@end

@implementation GEMEditItemViewController

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
    
    // Creaet save button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons

- (void)save:(id)sender
{
    NSString *name = [self.nameTextField text];
    float quantity = [[self.quantityTextField text] floatValue];
    float price = [[self.priceTextField text] floatValue];
    // Hard coding category until setting singlton is set up
    NSString *category = @"Hard Category";
    //NSString *category = [self.categories objectAtIndex: [self.categoryPicker selectedRowInComponent:0]];
    NSString *notes = [self.notesTextField text];
    
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

#pragma mark - Picker Controls

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


// Need to move categories to setting singleton to be able to edit categories.

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //return [self.categories count];
    return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //return self.categories[row];
    return @"Test Category";
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
