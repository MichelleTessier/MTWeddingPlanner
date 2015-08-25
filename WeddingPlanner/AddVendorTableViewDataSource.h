//
//  AddVendorTableViewDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TextFieldTableViewCell.h"
#import "WeddingController.h"
#import "AddVendorScreen1ViewController.h"


@interface AddVendorTableViewDataSource : NSObject <UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) AddVendorScreen1ViewController *addVendorScreen1ViewController;

@end
