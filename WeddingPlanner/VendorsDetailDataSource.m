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
#import "DoubleLabelsTableViewCell.h"

static NSString *labelCellID = @"labelCellID";
static NSString *paymentCellID = @"paymentCellID";

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
        numberOfRows = self.vendor.vendorPayments.count;
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
