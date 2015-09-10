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
#import "VendorViewControllerEnums.h"
#import "DatePickerAndTextFieldTableViewCell.h"

@interface AddVendorTableViewDataSource : NSObject <UITableViewDataSource, UIPickerViewDataSource, UITextFieldDelegate, UIPickerViewDelegate, DatePickerAndTextFieldTableViewCellDelegate>

@property (strong, nonatomic) AddVendorScreen1ViewController *addVendorScreen1ViewController;

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) NSMutableArray *temporaryVendorPayments;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UIPickerView *pickerView;

@property (strong, nonatomic) VendorCategory *selectedVendorCategory;

@end
