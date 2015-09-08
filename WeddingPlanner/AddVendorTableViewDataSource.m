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
#import "DatePickerAndTextFieldTableViewCell.h"

static NSString *pickerCellID = @"pickerCellID";
static NSString *textFieldCellID = @"textFieldCellID";
static NSString *paymentCellID = @"paymentCellID";

@interface AddVendorTableViewDataSource ()

@property (strong, nonatomic) UITextField *textField;

@end

@implementation AddVendorTableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
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
        
        if (self.vendor.vendorPayments.count == 1) {
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
        
        if (self.vendor.vendorPayments) {
            numberOfRows = self.vendor.vendorPayments.count;
        } else {
            numberOfRows = 0;
        }
        
            break;
        
        default:
            break;
    }
    
    return numberOfRows;
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddVendorInformationSections vendorSection = indexPath.section;
    
    
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
           
            
            pickerCell.textField.inputView = self.pickerView;
            pickerCell.textField.text = self.selectedVendorCategory.title;
            
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
                    textFieldCell.textField.placeholder = @"Business";
                    break;
                    
                //This needs to be changed to two text fields for first name and last name
                case VendorContactInformationTypePerson:
                    textFieldCell.textField.placeholder = @"Contact";
                    break;
                    
                case VendorContactInformationTypeTitle:
                    textFieldCell.textField.placeholder = @"Title";
                    break;
                    
                case VendorContactInformationTypePhone:
                    textFieldCell.textField.placeholder = @"Phone";
                    break;
                    
                case VendorContactInformationTypeSecondPhone:
                    textFieldCell.textField.placeholder = @"Second Phone";
                    break;
                    
                case VendorContactInformationTypeEmail:
                    textFieldCell.textField.placeholder = @"Email";
                    break;
                
               
                case VendorContactInformationTypeStreetAddress:
                    textFieldCell.textField.placeholder = @"Street";
                    break;
                    
                    
                //This needs to be changed to three text fields for city, state, and zip
                case VendorContactInformationTypeAddressLine2:
                    textFieldCell.textField.placeholder = @"City, State, Zip";
                    break;
                    
                default:
                    break;
            }
            
           
            
            return textFieldCell;
        
            break;
        }
        
        case AddVendorinformationPaymentSection: {
            
            DoubleLabelsTableViewCell *paymentCell = [tableView dequeueReusableCellWithIdentifier:paymentCellID];
            
            if (!paymentCell) {
                paymentCell = [[DoubleLabelsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:paymentCellID];
            }
            
            VendorPayment *vendorPayment = self.vendor.vendorPayments[indexPath.row];
            
            if (vendorPayment.isPaid == YES) {
                paymentCell.label1.textColor = [UIColor blackColor];
                paymentCell.label2.textColor = [UIColor blackColor];
            } else {
                paymentCell.label1.textColor = [UIColor redColor];
                paymentCell.label2.textColor = [UIColor redColor];
            }
            
           
                paymentCell.label1.text = [NSString stringWithFormat:@"%@", vendorPayment.date];
                paymentCell.label2.text = [NSString stringWithFormat:@"$%@", vendorPayment.amount];
            
            
            return paymentCell;
            
            
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

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    VendorCategory *vendorCategory = self.couple.wedding.vendorCategories[row];
    return vendorCategory.title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    self.selectedVendorCategory = self.couple.wedding.vendorCategories[row];
    self.addVendorScreen1ViewController.selectedVendorCategory = self.selectedVendorCategory;
    
    
}


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






@end
