//
//  VendorDefaultsViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorDefaultsViewController.h"
#import "VendorDefaultsListDataSource.h"

@interface VendorDefaultsViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) VendorDefaultsListDataSource *dataSource;

@end

@implementation VendorDefaultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.dataSource = [VendorDefaultsListDataSource new];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
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
