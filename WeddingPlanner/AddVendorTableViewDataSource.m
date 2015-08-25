//
//  AddVendorTableViewDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "AddVendorTableViewDataSource.h"
#import "PickerViewTableViewCell.h"
#import "TextFieldTableViewCell.h"
#import "WeddingController.h"



typedef NS_ENUM(NSUInteger, AddVendorInformationSections) {
    AddVendorInformationPickerSection,
    AddVendorInformationContactSection,
//    AddVendorinformationPaymentSection,
    AddVendorInformationSectionsCount,
};

typedef NS_ENUM(NSUInteger, VendorContactInformationTypes) {
    VendorContactInformationTypeBusinessName,
    VendorContactInformationTypePerson,
    VendorContactInformationTypeTitle,
    VendorContactInformationTypePhone,
    VendorContactInformationTypeSecondPhone,
    VendorContactInformationTypeEmail,
    VendorContactInformationTypeStreetAddress,
    VendorContactInformationTypeAddressLine2,
    VendorContactInformationTypeCount,
};

static NSString *pickerCellID = @"pickerCellID";
static NSString *textFieldCellID = @"textFieldCellID";

@implementation AddVendorTableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Title";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    AddVendorInformationSections vendorSection = section;
    
    NSInteger numberOfRows;
    
    switch (vendorSection) {
        case AddVendorInformationPickerSection:
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
        case AddVendorInformationPickerSection: {
            
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
            
            VendorContactInformationTypes informationType = indexPath.row;
            
            switch (informationType) {
                case VendorContactInformationTypeBusinessName:
                    textFieldCell.textField.placeholder = @"Business";
                    break;
                    
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
