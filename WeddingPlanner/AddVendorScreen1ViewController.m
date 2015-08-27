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

@end

@implementation AddVendorScreen1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    [self.view addSubview:navBar];
    
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
    
    [self.tableView alignTopEdgeWithView:self.view predicate:@"64"];
    [self.tableView alignBottomEdgeWithView:self.view predicate:@"0"];
    [self.tableView alignLeadingEdgeWithView:self.view predicate:@"0"];
    [self.tableView alignTrailingEdgeWithView:self.view predicate:@"0"];
    
    self.title = @"Add Vendor";
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
 
#warning fix this
    
//    if (!self.wedding) {
//        self.wedding = [[WeddingController sharedInstance] createWedding];
//    }
//    
//    if (!self.vendor) {
//        self.vendor = [[WeddingController sharedInstance] createVendorforWedding:self.wedding];
//    }
//    
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:(TextFieldTableViewCell*)[[textField superview] superview]];
//    
//    AddVendorInformationSections informationSection = indexPath.section;
//    
//    if (informationSection == AddVendorInformationContactSection) {
//        
//    VendorContactInformationTypes vendorSection = indexPath.row;
//    
//    switch (vendorSection) {
//        case VendorContactInformationTypeBusinessName:
//            self.vendor.businessName = textField.text;
//            break;
//            
//        case VendorContactInformationTypePerson:
//            self.vendor.firstName = textField.text;
//            break;
//            
//        case VendorContactInformationTypeTitle:
//            self.vendor.title = textField.text;
//            break;
//            
//        case VendorContactInformationTypePhone:
//            self.vendor.phoneNumber = textField.text;
//            break;
//            
//        case VendorContactInformationTypeSecondPhone:
//            self.vendor.secondPhoneNumber = textField.text;
//            break;
//            
//        case VendorContactInformationTypeEmail:
//            self.vendor.email = textField.text;
//            break;
//            
//        case VendorContactInformationTypeStreetAddress:
//            self.vendor.streetAddress = textField.text;
//            break;
//            
//        case VendorContactInformationTypeAddressLine2:
//            self.vendor.city = textField.text;
//            break;
//            
//        default:
//            break;
//    }
//        
// }
//    
//    // What's the best way to save this stuff?
//    [self.vendor saveEventually];
    
}

-(void)finishBarButtonTapped{
    //also need to add some sort of method for if I leave program without clicking finish
    //need to add how a user is supposed to create a wedding
    
    //needs to be changed to not pop all the way back to the initial view controller
    [self dismissViewControllerAnimated:YES completion:nil];
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
