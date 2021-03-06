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

@interface VendorsListViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) VendorsListDataSource *dataSource;


@end

@implementation VendorsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-80);
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    
    self.dataSource = [VendorsListDataSource new];
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
    [self.tableView reloadData];
}

-(void)addVendorBarButtonTapped{
    [self.navigationController pushViewController:[AddVendorScreen1ViewController new] animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [self.navigationController pushViewController:[VendorDetailViewController new] animated:YES];
    
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
