//
//  AddCalendarEventViewController.m
//  WeddingPlanner
//
//  Created by Anne Tessier on 9/16/15.
//  Copyright © 2015 MichelleTessier. All rights reserved.
//

#import "AddCalendarEventViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@interface AddCalendarEventViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UITextField *titleTextField;
@property (strong, nonatomic) UITextField *locationTextField;
@property (strong, nonatomic) UITextField *vendorTextField;
@property (strong, nonatomic) UIPickerView *vendorPickerView;
@property (strong, nonatomic) UITextField *startTimeTextField;
@property (strong, nonatomic) UITextField *endTimeTextField;
@property (strong, nonatomic) UITextView *notesTextView;

@property (strong, nonatomic) Vendor *selectedVendor;
@property (strong, nonatomic) VendorCategory *selectedVendorCategory;


@end

@implementation AddCalendarEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self setupToolBar];
    [self setUpTextFields];
    self.date = [DateController sharedInstance].selectedDate;
    
    }

-(void)setUpTextFields{
    
    self.titleTextField = [UITextField new];
    self.titleTextField.placeholder = @"Title";
    self.titleTextField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: self.titleTextField];
    
    self.locationTextField = [UITextField new];
    self.locationTextField.placeholder = @"Location";
    self.locationTextField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.locationTextField];
    
    self.vendorTextField = [UITextField new];
    self.vendorTextField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.vendorTextField];
    
    self.startTimeTextField = [UITextField new];
    self.startTimeTextField.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.startTimeTextField];
    
    self.endTimeTextField = [UITextField new];
    self.endTimeTextField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.endTimeTextField];
    
    self.notesTextView = [UITextView new];
    [self.view addSubview:self.notesTextView];
    
    [self.titleTextField alignLeading:@"5" trailing:@"5" toView:self.view];
    [self.titleTextField alignTopEdgeWithView:self.view predicate:@"69"];
    [self.titleTextField constrainHeight:@"44"];
    
    [self.startTimeTextField alignLeadingEdgeWithView:self.titleTextField predicate:nil];
    [self.startTimeTextField constrainWidthToView:self.titleTextField predicate:@"*.5"];
    [self.startTimeTextField constrainHeightToView:self.titleTextField predicate:nil];
    [self.startTimeTextField constrainTopSpaceToView:self.titleTextField predicate:@"5"];
    
    [self.endTimeTextField alignTrailingEdgeWithView:self.titleTextField predicate:nil];
    [self.endTimeTextField constrainWidthToView:self.titleTextField predicate:@"*.5"];
    [self.endTimeTextField constrainHeightToView:self.titleTextField predicate:nil];
    [self.endTimeTextField constrainTopSpaceToView:self.titleTextField predicate:@"5"];
    
    [self.locationTextField alignCenterXWithView:self.titleTextField predicate:nil];
    [self.locationTextField constrainWidthToView:self.titleTextField predicate:nil];
    [self.locationTextField constrainHeightToView:self.titleTextField predicate:nil];
    [self.locationTextField constrainTopSpaceToView:self.startTimeTextField predicate:@"5"];
    
    [self.vendorTextField alignCenterXWithView:self.titleTextField predicate:nil];
    [self.vendorTextField constrainWidthToView:self.titleTextField predicate:nil];
    [self.vendorTextField constrainHeightToView:self.titleTextField predicate:nil];
    [self.vendorTextField constrainTopSpaceToView:self.locationTextField predicate:@"5"];
    
    [self.notesTextView alignCenterXWithView:self.titleTextField predicate:nil];
    [self.notesTextView constrainWidthToView:self.titleTextField predicate:nil];
    [self.notesTextView alignBottomEdgeWithView:self.view predicate:@"5"];
    [self.notesTextView constrainTopSpaceToView:self.vendorTextField predicate:@"5"];
    
    
}

-(void)setupToolBar{
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.view addSubview:toolBar];
    
    UIBarButtonItem *saveButton = [UIBarButtonItem new];
    saveButton.title = @"Save";
    saveButton.target = self;
    saveButton.action = @selector(saveButtonTapped);
    
    
    UIBarButtonItem *cancelButton = [UIBarButtonItem new];
    cancelButton.title = @"Cancel";
    cancelButton.target = self;
    cancelButton.action = @selector(cancelButtonTapped);
    toolBar.items = @[cancelButton, saveButton];


    
}

-(void)setupVendorPickerView{
    
    self.vendorPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    
    self.vendorPickerView.dataSource = self;
    self.vendorPickerView.delegate = self;
    
    if (self.calendarItem.vendorCategory) {
        
        //add code here to set vendor pickerview rows to be currently selected vendor category and vendor
        
    } else {
        
        self.selectedVendorCategory = [[WeddingController sharedInstance] findChosenVendorCategoriesForWedding:self.couple.wedding][0];
    }

    if (self.calendarItem.vendor) {
        
        self.vendorTextField.text = self.calendarItem.vendor.businessName;
        
    } else {
        
        self.vendorTextField.placeholder = @"Select Vendor";
        self.vendorTextField.inputView = self.vendorPickerView;
        
    }
    
    // Add Done button to picker input view
    UIToolbar *toolBar = [UIToolbar new];
    toolBar.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 40.0);
    UIBarButtonItem *doneButton = [UIBarButtonItem new];
    doneButton.title = @"Done";
    
    [doneButton setTarget:self];
    [doneButton setAction:@selector(doneButtonTapped)];
    
    NSArray *items = @[doneButton];
    
    [toolBar setItems:items];
    
    self.vendorTextField.inputAccessoryView = toolBar;

    
}


- (void)saveButtonTapped{
    
    [self saveCalendarItem];
    
    [self dismissViewControllerAnimated:YES completion:nil];
   
    
}

- (void)cancelButtonTapped{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

-(void)saveCalendarItem{
    
    if (!self.calendarItem) {
        self.calendarItem = [[DateController sharedInstance] createCalendarItemForWedding:self.couple.wedding];
    }
    
    //Have to fix these
    self.calendarItem.startingDate = self.date;
    self.calendarItem.endingDate = self.date;
    
    self.calendarItem.vendor = self.selectedVendor;
    
    self.calendarItem.location = self.locationTextField.text;
    self.calendarItem.notes = self.notesTextView.text;
    
    [self.calendarItem saveEventually];
    
}

#pragma mark - Vendor Picker Delegate methods


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        
        VendorCategory *vendorCategory = [[WeddingController sharedInstance] findChosenVendorCategoriesForWedding:self.couple.wedding][row];
        
        return vendorCategory.title;
        
    } else {
        
        Vendor *vendor = self.selectedVendorCategory.vendors[row];
        
        return vendor.businessName;
    }
    
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        
        self.selectedVendorCategory = [[WeddingController sharedInstance] findChosenVendorCategoriesForWedding:self.couple.wedding][row];
        
    } else {
        
    self.selectedVendor = self.selectedVendorCategory.vendors[row];
        
    }

    
}


#pragma mark - Vendor Picker datasource methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        return [[WeddingController sharedInstance] findChosenVendorCategoriesForWedding:self.couple.wedding].count;
    } else {
        return self.selectedVendorCategory.vendors.count;
    }
    
    
}

-(void)doneButtonTapped{
    
    [self.vendorTextField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
