//
//  AddVendorTableViewDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "AddVendorTableViewDataSource.h"
#import "PickerViewTableViewCell.h"

static NSString *pickerCellID = @"pickerCellID";
static NSString *textFieldCellID = @"textFieldCellID";

@implementation AddVendorTableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
            
        //this will change to depend on number of payments in payments array
//        case AddVendorinformationPaymentSection:
//            numberOfRows = 2;
//            break;
            
        default:
            break;
    }
    
    return numberOfRows;
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddVendorInformationSections vendorSection = indexPath.section;
    
    
    switch (vendorSection) {
        case AddVendorInformationCategorySection: {
            
           PickerViewTableViewCell *pickerCell = [tableView dequeueReusableCellWithIdentifier:pickerCellID];
            
            if (!pickerCell) {
                pickerCell = [[PickerViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pickerCellID];
            }
        
            pickerCell.pickerView.dataSource = self;
            pickerCell.pickerView.delegate = self;
            
            return pickerCell;
        
            break;
        }
        case AddVendorInformationContactSection: {
            
            TextFieldTableViewCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:textFieldCellID];
            
            if (!textFieldCell) {
                textFieldCell = [[TextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textFieldCellID];
            }
            
            textFieldCell.textField.delegate = self.addVendorScreen1ViewController;
            
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
//        case AddVendorinformationPaymentSection:
//        
//            break;
            
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

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    Wedding *wedding = [[WeddingController sharedInstance] createWedding];
    return wedding.vendorCategories.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    Wedding *wedding = [[WeddingController sharedInstance] createWedding];
    return wedding.vendorCategories[row];
}





@end
