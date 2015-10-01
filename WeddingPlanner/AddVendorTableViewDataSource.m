//
//  AddVendorTableViewDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "AddVendorTableViewDataSource.h"
#import "PickerViewTableViewCell.h"
#import "DoubleLabelsTableViewCell.h"
#import "DateController.h"


static NSString *pickerCellID = @"pickerCellID";
static NSString *textFieldCellID = @"textFieldCellID";
static NSString *paymentCellID = @"paymentCellID";
static NSString *addPaymentCellID = @"addPaymentCellID";

@interface AddVendorTableViewDataSource ()

@property (strong, nonatomic) UITextField *textField;

@end

@implementation AddVendorTableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"%lu", AddVendorInformationSectionsCount);
    return AddVendorInformationSectionsCount;
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    AddVendorInformationSections vendorSection = section;
    
    switch (vendorSection) {
        case AddVendorInformationCategorySection:
            
            return @"Vendor Category";
            
            break;
            
        case AddVendorInformationContactSection:
            
            return @"Contact";
            
            break;
        
        case AddVendorinformationPaymentSection:
        
        if (self.temporaryVendorPayments.count == 1) {
            return @"Payment";
        } else {
            return @"Payments";
        }
        
        break;
            
        default:
            return @"";
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    AddVendorInformationSections vendorSection = section;
    
    NSInteger numberOfRows;
    
    switch (vendorSection) {
        case AddVendorInformationCategorySection:
            numberOfRows = 1;
            break;
            
        case AddVendorInformationContactSection:
            numberOfRows = VendorContactInformationTypeCount;
            break;
        
        case AddVendorinformationPaymentSection:
        
        
            numberOfRows = self.temporaryVendorPayments.count;
            NSLog(@"%li", self.temporaryVendorPayments.count);
       
        
            break;
        
        default:
            break;
    }
    
    return numberOfRows;
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddVendorInformationSections vendorSection = indexPath.section;
     NSLog(@"%lu", (unsigned long)vendorSection);
    switch (vendorSection) {
           
        case AddVendorInformationCategorySection: {
            
           TextFieldTableViewCell *pickerCell = [tableView dequeueReusableCellWithIdentifier:pickerCellID];
            
            if (!pickerCell) {
                pickerCell = [[TextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pickerCellID];
            }
            
#warning may need to replace this frame with contraints
            
            
            self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        
            self.pickerView.dataSource = self;
            self.pickerView.delegate = self;
           
            if (self.selectedVendorCategory) {
                pickerCell.textField.text = self.selectedVendorCategory.title;
            } else {
            
            pickerCell.textField.placeholder = @"Vendor Category";
            pickerCell.textField.inputView = self.pickerView;
            pickerCell.textField.text = self.selectedVendorCategory.title;
                
            }
            
            UIToolbar *toolBar = [UIToolbar new];
            toolBar.frame = CGRectMake(0.0, 0.0, self.addVendorScreen1ViewController.view.frame.size.width, 40.0);
            UIBarButtonItem *doneButton = [UIBarButtonItem new];
            doneButton.title = @"Done";
            
            [doneButton setTarget:self];
            [doneButton setAction:@selector(doneButtonTapped)];
            
            NSArray *items = @[doneButton];
            
            [toolBar setItems:items];
            
            pickerCell.textField.inputAccessoryView = toolBar;
            
            self.textField = pickerCell.textField;
            
            return pickerCell;
        
            break;
        }
        case AddVendorInformationContactSection: {
            
            TextFieldTableViewCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:textFieldCellID];
            
            if (!textFieldCell) {
                textFieldCell = [[TextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textFieldCellID];
            }
            
            textFieldCell.textField.delegate = self.addVendorScreen1ViewController;
            self.tableView = tableView;
            
            VendorContactInformationTypes informationType = indexPath.row;
            
            switch (informationType) {
                case VendorContactInformationTypeBusinessName:
                    if (self.vendor.businessName) {
                    textFieldCell.textField.text = self.vendor.businessName;
                    } else {
                    textFieldCell.textField.placeholder = @"Business";
                    }
                    break;
                    
                //This needs to be changed to two text fields for first name and last name
                case VendorContactInformationTypePerson:
                    if (self.vendor.firstName) {
                        textFieldCell.textField.text = self.vendor.firstName;
                    } else {
                        textFieldCell.textField.placeholder = @"Contact";
                    }
                    break;
                    
                case VendorContactInformationTypeTitle:
                    if (self.vendor.title) {
                        textFieldCell.textField.text = self.vendor.title;
                    } else {
                        textFieldCell.textField.placeholder = @"Title";
                    }
                    break;
                    
                case VendorContactInformationTypePhone:
                    if (self.vendor.phoneNumber) {
                        textFieldCell.textField.text = self.vendor.phoneNumber;
                    } else {
                        textFieldCell.textField.placeholder = @"Phone";
                    }
                    break;
                    
                case VendorContactInformationTypeSecondPhone:
                    if (self.vendor.secondPhoneNumber) {
                        textFieldCell.textField.text = self.vendor.secondPhoneNumber;
                    } else {
                        textFieldCell.textField.placeholder = @"Second Phone";
                    }
                    break;
                    
                case VendorContactInformationTypeEmail:
                    if (self.vendor.email) {
                        textFieldCell.textField.text = self.vendor.email;
                    } else {
                        textFieldCell.textField.placeholder = @"Email";
                    }
                    
                    break;
                
               
                case VendorContactInformationTypeStreetAddress:
                    if (self.vendor.streetAddress) {
                        textFieldCell.textField.text = self.vendor.streetAddress;
                    } else {
                        textFieldCell.textField.placeholder = @"Street";
                    }
                    break;
                    
                    
                //This needs to be changed to three text fields for city, state, and zip
                case VendorContactInformationTypeAddressLine2:
                    if (self.vendor.city) {
                        textFieldCell.textField.text = self.vendor.city;
                    } else {
                        textFieldCell.textField.placeholder = @"City, State, Zip";
                    }
                    break;
                    
                default:
                    break;
            }
            
           
            
            return textFieldCell;
        
            break;
        }
        
        case AddVendorinformationPaymentSection: {
            
            VendorPayment *vendorPayment = self.temporaryVendorPayments[indexPath.row];
            NSLog(@"SELF.TEMPVENPAYS%@", self.temporaryVendorPayments);
            
            if (vendorPayment.date && vendorPayment.amount) {
                
                NSLog(@"VENPAYDATE VENPAYAMOUNT %@ %@", vendorPayment.date, vendorPayment.amount);
                
                DoubleLabelsTableViewCell *paymentCell = [tableView dequeueReusableCellWithIdentifier:paymentCellID];
                
                if (!paymentCell) {
                    paymentCell = [[DoubleLabelsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:paymentCellID];
                }
                
//                VendorPayment *vendorPayment = self.temporaryVendorPayments[indexPath.row];
                
                NSString *dateString = [[DateController sharedInstance] getTimeFormatMonthDayForDate:vendorPayment.date];
                
                paymentCell.label1.text = [NSString stringWithFormat:@"%@", dateString];
                
                float vendorPaymentAmount = [vendorPayment.amount floatValue];
                paymentCell.label2.text = [NSString stringWithFormat:@"$%.2f", vendorPaymentAmount];
                
                
                return paymentCell;
                
            } else {
                   
                    DatePickerAndTextFieldTableViewCell *addPaymentCell = [tableView dequeueReusableCellWithIdentifier:addPaymentCellID];
                    
                    if (!addPaymentCell) {
                        addPaymentCell = [[DatePickerAndTextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addPaymentCellID];
                    }
                    
                    addPaymentCell.delegate = self;
                    
                    
                    
                    if (!vendorPayment.date) {
                        
                        addPaymentCell.pickerTextField.placeholder = @"Date Due";
                        
                    } else {
                        
                        NSString *dateString = [[DateController sharedInstance] getTimeFormatMonthDayForDate:vendorPayment.date];
                        
                        addPaymentCell.pickerTextField.text = [NSString stringWithFormat:@"%@", dateString];
                    }
                    
                    if (!vendorPayment.amount) {
                        
                        addPaymentCell.textField.placeholder = @"Payment Amount";
                        
                    } else {

                        float vendorPaymentAmount = [vendorPayment.amount floatValue];
                        addPaymentCell.textField.text = [NSString stringWithFormat:@"$%.2f", vendorPaymentAmount];
                    }
                    
                    
                    
                    
                    return addPaymentCell;
                    
                    
                }
                
         
            
            break;
        }
            
        default:{
            
            TextFieldTableViewCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:textFieldCellID];
            
            if (!textFieldCell) {
                textFieldCell = [[TextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textFieldCellID];
            }
            
            return textFieldCell;
            
            break;
        }
    }
    

    
}

#pragma mark - vendor picker delegate methods

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    VendorCategory *vendorCategory = self.couple.wedding.vendorCategories[row];
    return vendorCategory.title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    self.selectedVendorCategory = self.couple.wedding.vendorCategories[row];
    self.addVendorScreen1ViewController.selectedVendorCategory = self.selectedVendorCategory;
    
    
}



#pragma mark - Vendor category picker datasources (should be moved to picker cell?)


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.addVendorScreen1ViewController.couple.wedding.vendorCategories.count;
}

-(void)doneButtonTapped{
    [self.tableView reloadData];
    [self.textField resignFirstResponder];
}



#pragma mark - DatePickerAndTextFieldTableViewCell Delegate

-(void)textFieldWasEdited:(UITextField *)textField onCell:(DatePickerAndTextFieldTableViewCell *)sender{
 
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    VendorPayment *vendorPayment = self.temporaryVendorPayments[indexPath.row];
    
    float amount = [textField.text floatValue];
    vendorPayment.amount = @(amount);
    
    [vendorPayment saveEventually];
    
    [self.tableView reloadData];
    
}

-(void)pickerSelectedDate:(NSDate *)date onCell:(DatePickerAndTextFieldTableViewCell *)sender{
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    VendorPayment *vendorPayment = self.temporaryVendorPayments[indexPath.row];
    
    vendorPayment.date = date;
    
    [vendorPayment saveEventually];
    
    [self.tableView reloadData];
    
}

#pragma mark - format currency text field

#warning maybe add something along these lines to format currency text field

//-(NSNumber *)getDollarAmount:(NSString *)string{
//    
//    
//  NSNumberFormatter *formatter = [NSNumberFormatter new];
//  formatter.numberStyle = NSNumberFormatterCurrencyStyle;
//  formatter.locale = [NSLocale currentLocale];
//
//    
//}



@end
