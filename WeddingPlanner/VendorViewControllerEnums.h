//
//  VendorViewControllerEnums.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>

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

typedef NS_ENUM(NSUInteger, AddVendorInformationSections) {
    AddVendorInformationCategorySection,
    AddVendorInformationContactSection,
    AddVendorinformationPaymentSection,
    AddVendorInformationSectionsCount,
};

@interface VendorViewControllerEnums : NSObject

@end
