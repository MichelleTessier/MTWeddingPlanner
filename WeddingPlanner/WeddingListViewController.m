//
//  CouplesListViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "WeddingListViewController.h"
#import "HomeViewController.h"
#import "TasksViewController.h"
#import "BudgetViewController.h"
#import "VendorsListViewController.h"
#import "GuestsViewController.h"
#import "CustomTabViewController.h"



@interface WeddingListViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) WeddingListViewDataSource *datasource;

@end

@implementation WeddingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.datasource = [WeddingListViewDataSource new];
    self.tableView.dataSource = self.datasource;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    
    
   

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[CustomTabViewController new] animated:YES];
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
