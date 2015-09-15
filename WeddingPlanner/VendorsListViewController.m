//
//  VendorsViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/12/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorsListViewController.h"

#import "AppDelegate.h"
#import "VendorDetailViewController.h"

#import "AddVendorScreen1ViewController.h"
#import "NameEmailPhoneTableViewCell.h"

@interface VendorsListViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) VendorsListDataSource *dataSource;


@end

@implementation VendorsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    self.dataSource = [VendorsListDataSource new];
    self.dataSource.couple = self.couple;
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    [self.view addSubview:navBar];
    
    UIBarButtonItem *addVendorBarButton = [UIBarButtonItem new];
    
    addVendorBarButton.title = @"Add";
    addVendorBarButton.target = self;
    addVendorBarButton.action = @selector(addVendorBarButtonTapped);
    self.navigationItem.rightBarButtonItem = addVendorBarButton;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self findChosenVendorCategories];
    self.dataSource.chosenVendorCategories = self.chosenVendorCategories;
    
    [self.tableView reloadData];
}

-(void)addVendorBarButtonTapped{
    AddVendorScreen1ViewController *addVendorScreen1VC = [AddVendorScreen1ViewController new];
    addVendorScreen1VC.couple = self.couple;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addVendorScreen1VC];
    [self presentViewController:navController animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    VendorDetailViewController *vendorDVC = [VendorDetailViewController new];
//    vendorDVC.vendorCategory = self.chosenVendorCategories[indexPath.section];
//    vendorDVC.vendor = vendorDVC.vendorCategory.vendors[indexPath.row];
//    vendorDVC.couple = self.couple;
//    [self.navigationController pushViewController: vendorDVC animated:YES];
    
    AddVendorScreen1ViewController *addVendorScreen1VC = [AddVendorScreen1ViewController new];
    addVendorScreen1VC.selectedVendorCategory = self.chosenVendorCategories[indexPath.section];
    addVendorScreen1VC.vendor = addVendorScreen1VC.selectedVendorCategory.vendors[indexPath.row];
    addVendorScreen1VC.couple = self.couple;
    [self.navigationController pushViewController:addVendorScreen1VC animated:YES];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
    
}

-(void)findChosenVendorCategories{
    
    NSArray *vendorCategories = self.couple.wedding.vendorCategories;
    
    NSMutableArray *mutableChosenVendorCategories = [NSMutableArray new];
    for (VendorCategory *vendorCategory in vendorCategories) {
        if (vendorCategory.vendors.count > 0) {
            [mutableChosenVendorCategories addObject:vendorCategory];
        }
    }
    
    self.chosenVendorCategories = mutableChosenVendorCategories;
    
    
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
