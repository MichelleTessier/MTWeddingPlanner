//
//  VendorDetailViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorDetailViewController.h"
#import "VendorsDetailDataSource.h"
#import "AddVendorScreen1ViewController.h"

@interface VendorDetailViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) VendorsDetailDataSource *dataSource;

@end

#warning vendors not keeping title, info, etc.

@implementation VendorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.dataSource = [VendorsDetailDataSource new];
    self.dataSource.vendor = self.vendor;
    self.dataSource.vendorCategory = self.vendorCategory;
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *barButtonItem = [UIBarButtonItem new];
    barButtonItem.title = @"Edit";
    barButtonItem.target = self;
    barButtonItem.action = @selector(editButtonTapped);
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}

-(void)editButtonTapped{
        
    AddVendorScreen1ViewController *addVendorScreen1VC = [AddVendorScreen1ViewController new];
    addVendorScreen1VC.selectedVendorCategory = self.vendorCategory;
    addVendorScreen1VC.vendor = self.vendor;
    addVendorScreen1VC.couple = self.couple;
    [self.navigationController pushViewController:addVendorScreen1VC animated:YES];
    
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
