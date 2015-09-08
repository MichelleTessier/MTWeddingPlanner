//
//  EditBudgetIndividualPageViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/4/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "EditBudgetIndividualPageViewController.h"
#import "EditBudgetIndividualPageDataSource.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@interface EditBudgetIndividualPageViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) EditBudgetIndividualPageDataSource *dataSource;

@end

@implementation EditBudgetIndividualPageViewController


-(instancetype)initWithWedding:(Wedding *)wedding andIndex:(NSInteger)index {
    //self.contentView
    self = [super init];
    
    if (self) {
        self.currentVendorCategory = wedding.vendorCategories[index];
        
        if (index > 0) {
            self.previousVendorCateogy = wedding.vendorCategories[index - 1];
        }
        
        if (index < wedding.vendorCategories.count) {
            self.nextVendorCategory = wedding.vendorCategories[index + 1];
        }
        
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    self.dataSource = [EditBudgetIndividualPageDataSource new];
    self.dataSource.vendorCategory = self.currentVendorCategory;
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    
    [self setTableViewConstraints];
    
    
}

-(void)setTableViewConstraints{
//    if (!self.navigationController.navigationBar) {
        [self.tableView alignCenterYWithView:self.view predicate:@"-40"];
//    } else {
//        [self.tableView alignCenterYWithView:self.view predicate:@"0"];
//    }
    
    [self.tableView alignCenterXWithView:self.view predicate:@"0"];
    [self.tableView constrainWidthToView:self.view predicate:@"0"];
    [self.tableView constrainHeight:@"150"];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
    
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
