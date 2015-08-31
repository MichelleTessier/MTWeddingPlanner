//
//  VendorsDetailDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorsDetailDataSource.h"
#import "VendorViewControllerEnums.h"
#import "LabelTableViewCell.h"

static NSString *labelCellID = @"labelCellID";

@implementation VendorsDetailDataSource

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
            
        default:
            break;
    }
    
    return numberOfRows;
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddVendorInformationSections vendorSection = indexPath.section;
    
    switch (vendorSection) {
        case AddVendorInformationCategorySection: {
            
           LabelTableViewCell *labelCell = [tableView dequeueReusableCellWithIdentifier:labelCellID];
            
            if (!labelCell) {
                labelCell = [[LabelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:labelCellID];
            }
            
            labelCell.label.text = self.vendorCategory.title;
            
            return labelCell;
            
            break;
        }
        case AddVendorInformationContactSection: {
            
            LabelTableViewCell *labelCell = [tableView dequeueReusableCellWithIdentifier:labelCellID];
            
            if (!labelCell) {
                labelCell = [[LabelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:labelCellID];
            }
            
            VendorContactInformationTypes informationType = indexPath.row;
            
            switch (informationType) {
                case VendorContactInformationTypeBusinessName:
                    labelCell.label.text = self.vendor.businessName;
                    break;
                    
                    //This needs to be changed to two text fields for first name and last name
                case VendorContactInformationTypePerson:
                    labelCell.label.text = self.vendor.firstName;
                    break;
                    
                case VendorContactInformationTypeTitle:
                    labelCell.label.text = self.vendor.title;
                    break;
                    
                case VendorContactInformationTypePhone:
                    labelCell.label.text = self.vendor.phoneNumber;
                    break;
                    
                case VendorContactInformationTypeSecondPhone:
                    labelCell.label.text = self.vendor.secondPhoneNumber;
                    break;
                    
                case VendorContactInformationTypeEmail:
                    labelCell.label.text = self.vendor.email;
                    break;
                    
                    
                case VendorContactInformationTypeStreetAddress:
                    labelCell.label.text = self.vendor.streetAddress;
                    break;
                    
                    
                    //This needs to be changed to three text fields for city, state, and zip
                case VendorContactInformationTypeAddressLine2:
                    labelCell.label.text = self.vendor.city;
                    break;
                    
                default:
                    break;
            }
            
            
            
            return labelCell;
            
            break;
        }
            //        case AddVendorinformationPaymentSection:
            //
            //            break;
            
        default:{
            
            LabelTableViewCell *labelCell = [tableView dequeueReusableCellWithIdentifier:labelCellID];
            
            if (!labelCell) {
                labelCell = [[LabelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:labelCellID];
            }
            
            return labelCell;
            
            break;
        }
    }
    
    
    
}
@end
