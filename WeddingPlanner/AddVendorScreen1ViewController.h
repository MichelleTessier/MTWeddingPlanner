//
//  AddVendorScreen1ViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"

@interface AddVendorScreen1ViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate>

@property (strong, nonatomic) Vendor *vendor;
@property (strong, nonatomic) Wedding *wedding;
@property (strong, nonatomic) Couple *couple;

@property (retain) NSString *businessName;
@property (retain) NSString *vendorContactTitle;
@property (retain) NSString *firstName;
@property (retain) NSString *streetAddress;
@property (retain) NSString *city;
@property (retain) NSString *email;
@property (retain) NSString *phoneNumber;
@property (retain) NSString *secondPhoneNumber;


@end
