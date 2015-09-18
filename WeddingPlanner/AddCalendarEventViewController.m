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

typedef NS_ENUM(NSUInteger, PickerViewTypes) {
    
    PickerViewTypeVendor,
    PickerViewTypeDate,
};

@interface AddCalendarEventViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UITextField *titleTextField;
@property (strong, nonatomic) UITextField *locationTextField;

@property (strong, nonatomic) UITextField *vendorTextField;
@property (strong, nonatomic) UIPickerView *vendorPickerView;

@property (strong, nonatomic) UIDatePicker *startDatePicker;
@property (strong, nonatomic) UIDatePicker *endDatePicker;
@property (strong, nonatomic) UITextField *startTimeTextField;
@property (strong, nonatomic) UITextField *endTimeTextField;

@property (strong, nonatomic) UILabel *betweenTimesLabel;

@property (strong, nonatomic) UITextView *notesTextView;

@property (strong, nonatomic) Vendor *selectedVendor;
@property (strong, nonatomic) VendorCategory *selectedVendorCategory;

//used to ensure end time is past start time
@property (assign, nonatomic) NSTimeInterval secondsBetween1970andStartTime;
@property (assign, nonatomic) NSTimeInterval secondsBetween1970andEndTime;

@end

@implementation AddCalendarEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.date = [DateController sharedInstance].selectedDate;
    
    [self setupToolBar];
    [self setUpTextFields];
    [self setUpDatePickers];
    [self setupVendorPickerView];
    
    
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
    
    self.betweenTimesLabel = [UILabel new];
    self.betweenTimesLabel.text = @"to";
    self.betweenTimesLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.betweenTimesLabel];
    
    self.endTimeTextField = [UITextField new];
    self.endTimeTextField.textAlignment = NSTextAlignmentLeft;
    
    NSDate *oneHourFromStartDate = [self.date dateByAddingTimeInterval:60*60];
    self.secondsBetween1970andEndTime = [oneHourFromStartDate timeIntervalSince1970];
    [self updateTextField:self.endTimeTextField withDate:oneHourFromStartDate];
    
    
    [self.view addSubview:self.endTimeTextField];
    
    self.notesTextView = [UITextView new];
    [self.view addSubview:self.notesTextView];
    
    [self.titleTextField alignLeading:@"5" trailing:@"5" toView:self.view];
    [self.titleTextField alignTopEdgeWithView:self.view predicate:@"69"];
    [self.titleTextField constrainHeight:@"44"];
    
    [self.startTimeTextField alignLeadingEdgeWithView:self.titleTextField predicate:nil];
    [self.startTimeTextField constrainWidthToView:self.titleTextField predicate:@"*.45"];
    [self.startTimeTextField constrainHeightToView:self.titleTextField predicate:nil];
    [self.startTimeTextField constrainTopSpaceToView:self.titleTextField predicate:@"5"];

    [self.endTimeTextField alignTrailingEdgeWithView:self.titleTextField predicate:nil];
    [self.endTimeTextField constrainWidthToView:self.titleTextField predicate:@"*.45"];
    [self.endTimeTextField constrainHeightToView:self.titleTextField predicate:nil];
    [self.endTimeTextField constrainTopSpaceToView:self.titleTextField predicate:@"5"];
    
    [self.betweenTimesLabel constrainLeadingSpaceToView:self.startTimeTextField predicate:nil];
    [self.betweenTimesLabel constrainTrailingSpaceToView:self.endTimeTextField predicate:nil];
    [self.betweenTimesLabel constrainHeightToView:self.titleTextField predicate:nil];
    [self.betweenTimesLabel constrainTopSpaceToView:self.titleTextField predicate:@"5"];
    
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

-(void)setUpDatePickers{
    
    self.startDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    [self.startDatePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    [self.startDatePicker addTarget:self action:@selector(startPickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.secondsBetween1970andStartTime = [self.date timeIntervalSince1970];
    [self updateTextField:self.startTimeTextField withDate:self.date];

    self.startTimeTextField.inputView = self.startDatePicker;
    
    self.endDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    [self.endDatePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    [self.endDatePicker addTarget:self action:@selector(endPickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    NSDate *oneHourFromStartDate = [self.date dateByAddingTimeInterval:60*60];
    self.secondsBetween1970andEndTime = [oneHourFromStartDate timeIntervalSince1970];
    [self updateTextField:self.endTimeTextField withDate:oneHourFromStartDate];
    
    self.endTimeTextField.inputView = self.endDatePicker;
    
    UIToolbar *toolBar = [UIToolbar new];
    toolBar.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 40.0);
    UIBarButtonItem *doneButton = [UIBarButtonItem new];
    doneButton.title = @"Done";
    
    [doneButton setTarget:self];
    [doneButton setAction:@selector(doneButtonTapped)];
    
    NSArray *items = @[doneButton];
    
    [toolBar setItems:items];
    
    self.startTimeTextField.inputAccessoryView = toolBar;
    self.endTimeTextField.inputAccessoryView = toolBar;
    
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
        
        NSArray *chosenVendorCategories = [[WeddingController sharedInstance] findChosenVendorCategoriesForWedding:self.couple.wedding];
        
        if (!chosenVendorCategories[0]) {
            
            self.vendorTextField.text = @"Add a Vendor to get started";
            
        } else {
        
            self.selectedVendorCategory = chosenVendorCategories[0];
            
        }
        
    }

    if (self.calendarItem.vendor) {
        
        self.vendorTextField.text = self.calendarItem.vendor.businessName;
        self.vendorTextField.inputView = self.vendorPickerView;
        
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

#pragma mark - done button method for all textfields

-(void)doneButtonTapped{
    
    [self.startTimeTextField resignFirstResponder];
    [self.endTimeTextField resignFirstResponder];
    [self.vendorTextField resignFirstResponder];
    
}


#pragma mark - button actions to save and cancel

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

#pragma mark - methods to set dates on text fields

-(void)updateTextField:(UITextField *)textField withDate:(NSDate*) date {
    
    NSDateComponents *dateComponents = [[DateController sharedInstance] getDateComponentsForDate:date];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSString *monthName = [[dateFormatter shortMonthSymbols] objectAtIndex:(dateComponents.month - 1)];
    
    //Make sure minutes has 0 in front if less than 10
    
    NSString *minuteString = @"";
    
    if (dateComponents.minute < 10) {
        
        minuteString = [NSString stringWithFormat:@"0%ld", dateComponents.minute];
        
    } else {
        
        minuteString = [NSString stringWithFormat:@"%ld", dateComponents.minute];
        
    }
    
    //Make AM/PM time instead of military time
    
    NSString *hourString = @"";
    NSString *amOrPmString = @"";
    
    //if its the afternoon
    
    if (dateComponents.hour > 11) {
        
        //if its noon
        if (dateComponents.hour == 12 ) {
            
            hourString = [NSString stringWithFormat:@"%ld", dateComponents.hour];
            amOrPmString = dateFormatter.PMSymbol;
            
            NSLog(@"%ld", dateComponents.hour);
        
        //else its 1pm or later
        } else {
            
            hourString = [NSString stringWithFormat:@"%ld", dateComponents.hour - 12];
            amOrPmString = dateFormatter.PMSymbol;
            
            NSLog(@"%ld", dateComponents.hour);
            NSLog(@"%ld", dateComponents.hour - 12);
            
        }
        
        //else its the am
    } else {
        
        //if its midnight
        if (dateComponents.hour == 0) {
            
            hourString = [NSString stringWithFormat:@"%i", 12];
            amOrPmString = dateFormatter.AMSymbol;
            
        //else its past 1 am but before noon
        } else {
        
            hourString = [NSString stringWithFormat:@"%ld", dateComponents.hour];
            amOrPmString = dateFormatter.AMSymbol;
            
        }
        
    }
    
    [self.startDatePicker setDate:[NSDate dateWithTimeIntervalSince1970:self.secondsBetween1970andStartTime]];
    
    [self.endDatePicker setDate:[NSDate dateWithTimeIntervalSince1970:self.secondsBetween1970andEndTime]];
    
    textField.text = [NSString stringWithFormat: @"%@ %ld, %@:%@ %@", monthName, dateComponents.day, hourString, minuteString, amOrPmString];
    
}

-(void)startPickerValueChanged:(UIDatePicker *)datePicker{
    
    self.secondsBetween1970andStartTime = [datePicker.date timeIntervalSince1970];
    
    //end date is past start date
    
    if (self.secondsBetween1970andEndTime > self.secondsBetween1970andStartTime) {
        
        [self updateTextField:self.startTimeTextField withDate:datePicker.date];
        
    } else {
        
        //set end date as one hour past start time
        
        [self updateTextField:self.startTimeTextField withDate:datePicker.date];
        
        NSDate *oneHourFromStartDate = [NSDate dateWithTimeIntervalSince1970:(self.secondsBetween1970andStartTime + (60 * 60))];
        
        self.secondsBetween1970andEndTime = [oneHourFromStartDate timeIntervalSince1970];
        
        [self updateTextField:self.endTimeTextField withDate:oneHourFromStartDate];
        
        
        
    }

    
    
    
}

-(void)endPickerValueChanged:(UIDatePicker *)datePicker{
    
    self.secondsBetween1970andEndTime = [datePicker.date timeIntervalSince1970];
    
    if (self.secondsBetween1970andEndTime > self.secondsBetween1970andStartTime) {
        
        [self updateTextField:self.endTimeTextField withDate:datePicker.date];

    } else {
        
        //set date as one hour past start time
        
        NSDate *oneHourFromStartDate = [NSDate dateWithTimeIntervalSince1970:(self.secondsBetween1970andStartTime + (60 * 60))];
        
        self.secondsBetween1970andEndTime = [oneHourFromStartDate timeIntervalSince1970];
        
        [self updateTextField:self.endTimeTextField withDate:oneHourFromStartDate];
        
    }
    
    
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

#warning fix vendor picker view - 2nd component doesnt change when change first, and doesn't fill in textfield

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
