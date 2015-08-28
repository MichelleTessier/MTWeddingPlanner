//
//  AddVendorScreen1ViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "AddVendorScreen1ViewController.h"
#import "AddVendorTableViewDataSource.h"

#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@interface AddVendorScreen1ViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) AddVendorTableViewDataSource *dataSource;
@property (strong, nonatomic) VendorCategory *selectedVendorCategory;

@end

@implementation AddVendorScreen1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ((AddVendorTableViewDataSource *)self.dataSource).addVendorScreen1ViewController = self;
    
    [self setUpView];
    [self setConstraints];
    [self setTitleOfView];
    
}

-(void)setUpView{
    
    UIBarButtonItem *finishBarButton = [UIBarButtonItem new];
    finishBarButton.title = @"Finish";
    finishBarButton.target = self;
    finishBarButton.action = @selector(finishBarButtonTapped);
    self.navigationItem.rightBarButtonItem = finishBarButton;
    
    self.tableView = [UITableView new];
    self.dataSource = [AddVendorTableViewDataSource new];
    self.dataSource.addVendorScreen1ViewController = self;
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview: self.tableView];
    
}

-(void)setConstraints{
    [self.tableView alignTopEdgeWithView:self.view predicate:@"64"];
    [self.tableView alignBottomEdgeWithView:self.view predicate:@"0"];
    [self.tableView alignLeadingEdgeWithView:self.view predicate:@"0"];
    [self.tableView alignTrailingEdgeWithView:self.view predicate:@"0"];
}

-(void)setTitleOfView{
    if (self.vendor) {
        self.title = @"Edit Vendor";
    }else{
        self.title = @"Add Vendor";
    }
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(TextFieldTableViewCell*)[[textField superview] superview]];
    
    AddVendorInformationSections informationSection = indexPath.section;
    
    if (informationSection == AddVendorInformationContactSection) {
        
        VendorContactInformationTypes vendorSection = indexPath.row;
        
        switch (vendorSection) {
            case VendorContactInformationTypeBusinessName:
                self.businessName = textField.text;
                break;
                
            case VendorContactInformationTypePerson:
                self.firstName = textField.text;
                break;
                
            case VendorContactInformationTypeTitle:
                self.vendorContactTitle = textField.text;
                break;
                
            case VendorContactInformationTypePhone:
                self.phoneNumber = textField.text;
                break;
                
            case VendorContactInformationTypeSecondPhone:
                self.secondPhoneNumber = textField.text;
                break;
                
            case VendorContactInformationTypeEmail:
                self.email = textField.text;
                break;
                
            case VendorContactInformationTypeStreetAddress:
                self.streetAddress = textField.text;
                break;
                
            case VendorContactInformationTypeAddressLine2:
                self.city = textField.text;
                break;
                
            default:
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
    
}

-(void)finishBarButtonTapped{
    
   
    [self saveVendor];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveVendor{
    
    if (!self.vendor) {
        self.vendor = [[WeddingController sharedInstance] createVendorInCateogry:self.selectedVendorCategory forWedding:self.couple.wedding];
    }
    
    
    self.vendor.businessName = self.businessName;
   
    self.vendor.firstName = self.firstName;
    
    self.vendor.title = self.vendorContactTitle;
   
    self.vendor.phoneNumber = self.phoneNumber;
    
    self.vendor.secondPhoneNumber = self.secondPhoneNumber;
  
    self.vendor.email = self.email;
  
    self.vendor.streetAddress = self.streetAddress;

    self.vendor.city = self.city;
    
    [self.vendor saveInBackground];
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
