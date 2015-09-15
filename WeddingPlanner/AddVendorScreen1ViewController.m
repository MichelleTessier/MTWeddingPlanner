//
//  AddVendorScreen1ViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "AddVendorScreen1ViewController.h"
#import "AddVendorTableViewDataSource.h"
#import "VendorsDetailDataSource.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"
#import "DatePickerAndTextFieldTableViewCell.h"
#import "VendorDetailViewController.h"

static NSString *addVenderHeaderID = @"addVendorHeaderID";

#warning needs an alert to make sure user fills out certain vendor categories

@interface AddVendorScreen1ViewController () <UITableViewDelegate, UIPopoverPresentationControllerDelegate>


@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) AddVendorTableViewDataSource *editDetailsDataSource;
@property (strong, nonatomic) VendorsDetailDataSource *seeDetailsDataSource;
@property (strong, nonatomic) UIPopoverPresentationController *addPaymentPopover;

@end

@implementation AddVendorScreen1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.temporaryVendorPayments = [NSMutableArray new];
    
    [self setUpView];
    [self setUpDataSource];
    [self setConstraints];
    [self setTitleOfView];
    NSLog(@"%@", self.presentingViewController.class);

    
}

-(void)setUpDataSource{
 
    
    if (self.vendor) {
        
        self.seeDetailsDataSource = [VendorsDetailDataSource new];
        self.seeDetailsDataSource.vendorCategory = self.selectedVendorCategory;
        self.seeDetailsDataSource.vendor = self.vendor;
        self.temporaryVendorPayments = [self.vendor.vendorPayments mutableCopy];
        self.tableView.dataSource = self.seeDetailsDataSource;
        
    }else{
        
        self.editDetailsDataSource = [AddVendorTableViewDataSource new];
        self.editDetailsDataSource.addVendorScreen1ViewController = self;
        self.editDetailsDataSource.couple = self.couple;
        self.editDetailsDataSource.vendor = self.vendor;
        self.editDetailsDataSource.temporaryVendorPayments = self.temporaryVendorPayments;
        self.editDetailsDataSource.selectedVendorCategory = self.selectedVendorCategory;
        self.tableView.dataSource = self.editDetailsDataSource;
        [self addSaveButton];
      
        
    }
    
    [self.view addSubview: self.tableView];
    
}

-(void)setTitleOfView{
    if (self.vendor) {
        self.title = @"Edit Vendor";
    }else{
        self.title = @"Add Vendor";
    }
}


#pragma mark - set up view

-(void)addSaveButton{
   
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.view addSubview:navBar];
    
    UIBarButtonItem *finishBarButton = [UIBarButtonItem new];
    finishBarButton.title = @"Finish";
    finishBarButton.target = self;
    finishBarButton.action = @selector(finishBarButtonTapped);
    self.navigationItem.rightBarButtonItem = finishBarButton;

    
}

-(void)setUpView{
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    
    
}

-(void)setConstraints{
    [self.tableView alignTopEdgeWithView:self.view predicate:@"64"];
    [self.tableView alignBottomEdgeWithView:self.view predicate:@"0"];
    [self.tableView alignLeadingEdgeWithView:self.view predicate:@"0"];
    [self.tableView alignTrailingEdgeWithView:self.view predicate:@"0"];
}



#pragma mark - finish button tapped method

-(void)finishBarButtonTapped{
    
    [self saveVendor];
    
#warning Make this if statement better (not comparing to title)
    
    if ([self.title isEqualToString:@"Edit Vendor"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}









#pragma mark - save vendor method


-(void)saveVendor{
    
#warning not saving the last entry that I type in
    
    if (!self.vendor) {
        self.vendor = [[WeddingController sharedInstance] createVendorInCateogry:self.selectedVendorCategory forWedding:self.couple.wedding];
    }
    
    //Not sure I really need a method for this
    [[WeddingController sharedInstance] addVendorPayments:self.temporaryVendorPayments toVendor:self.vendor];
    
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

#pragma mark - methods to add cells for vendor payments

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == AddVendorinformationPaymentSection) {
        
        UITableViewHeaderFooterView *addVendorPaymentHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:addVenderHeaderID];
        
        if (!addVendorPaymentHeaderView) {
            
            addVendorPaymentHeaderView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:addVenderHeaderID];
            
        }
        
        UIButton *addButton = [UIButton new];
        [addButton setTitle:@"+" forState:UIControlStateNormal];
        [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(addVendorPaymentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [addVendorPaymentHeaderView addSubview:addButton];
        
        [addButton alignTrailingEdgeWithView:addVendorPaymentHeaderView predicate:@"5"];
        [addButton alignTopEdgeWithView:addVendorPaymentHeaderView predicate:@"5"];
        [addButton alignTopEdgeWithView:addVendorPaymentHeaderView predicate:@"5"];
        [addButton constrainAspectRatio:@"*1"];
        
        return addVendorPaymentHeaderView;
        
    } else {
        return nil;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self addSaveButton];
    [self setTitleOfView];
    self.editDetailsDataSource = [AddVendorTableViewDataSource new];
    self.editDetailsDataSource.addVendorScreen1ViewController = self;
    self.editDetailsDataSource.couple = self.couple;
    self.editDetailsDataSource.vendor = self.vendor;
    self.editDetailsDataSource.temporaryVendorPayments = self.temporaryVendorPayments;
    self.editDetailsDataSource.selectedVendorCategory = self.selectedVendorCategory;
    self.tableView.dataSource = self.editDetailsDataSource;
    [self.tableView reloadData];
}



-(void)addVendorPaymentButtonTapped:(UIButton *)sender{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.temporaryVendorPayments.count inSection:AddVendorinformationPaymentSection];
    
    VendorPayment *vendorPayment = [[WeddingController sharedInstance] createVendorPayment];
    
    [self.temporaryVendorPayments addObject:vendorPayment];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    
    [self scrollToIndexPath:indexPath];
    
    
}

#pragma mark - auto scroll tableview method

-(void)scrollToIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionBottom
                                  animated:YES];
    
}



#pragma mark - method to get text from cell text fields to save on vendor. should probably be rewritten


-(void)textFieldDidEndEditing:(UITextField *)textField{
    
#warning could add something here to save these immediately
    
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
