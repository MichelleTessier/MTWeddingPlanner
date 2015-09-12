//
//  BudgetTableView.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "BudgetTableViewController.h"
#import "BudgetTableViewDataSource.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"
#import "DoubleLabelsTableViewCell.h"

static NSString *vendorCatHeaderViewID = @"vendorCatHeaderViewID";
static NSString *vendorBudgetCellID = @"vendorBudgetCellID";

@interface BudgetTableViewController () 

@property (strong, nonatomic) BudgetTableViewDataSource *dataSource;
@property (strong, nonatomic) NSArray *selectedVendorCategories;

@end

@implementation BudgetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
   
    [self selectVendorCategories];
     [self setUpView];
    [self.tableView reloadData];
   
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self selectVendorCategories];
    [self.tableView reloadData];
    
}

-(void)setUpView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
   
    
//    self.dataSource = [BudgetTableViewDataSource new];
//    self.dataSource.couple = self.couple;
//    self.dataSource.selectedVendorCategories = self.selectedVendorCategories;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

     [self.view addSubview:self.tableView];
}

#pragma mark - tableview delegate methods

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    VendorCategory *vendorCategory = self.selectedVendorCategories[section];
    
    UITableViewHeaderFooterView *vendorCategoryHeaderView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:vendorCatHeaderViewID];
    
    UIImageView *imageView = [UIImageView new];
    //set to icon
    [vendorCategoryHeaderView.contentView addSubview:imageView];
    
    UILabel *catTitleLabel = [UILabel new];
    catTitleLabel.text = vendorCategory.title;
    catTitleLabel.font = [UIFont boldSystemFontOfSize:17];
    [vendorCategoryHeaderView.contentView addSubview:catTitleLabel];
    
    UILabel *catActualCostLabel = [UILabel new];
    
    if (!vendorCategory.actualCategoryCost) {
        catActualCostLabel.text = @"$0";
    } else {
    float catEstimatedCost = [vendorCategory.actualCategoryCost floatValue];
    catActualCostLabel.text = [NSString stringWithFormat:@"%.2f", catEstimatedCost];
    }
    
    [vendorCategoryHeaderView.contentView addSubview:catActualCostLabel];
    
    UILabel *catEstimatedCostLabel = [UILabel new];
        
    if (!vendorCategory.budgetedCost) {
        catEstimatedCostLabel.text = @"$0";
    } else {
    float catBudgetedCost = [vendorCategory.budgetedCost floatValue];
    catEstimatedCostLabel.text = [NSString stringWithFormat:@"%.2f", catBudgetedCost];
    }
        
    [vendorCategoryHeaderView.contentView addSubview:catEstimatedCostLabel];
    
    [imageView alignLeadingEdgeWithView:vendorCategoryHeaderView.contentView predicate:@"5"];
    [imageView alignTopEdgeWithView:vendorCategoryHeaderView.contentView predicate:@"5"];
    [imageView alignBottomEdgeWithView:vendorCategoryHeaderView.contentView predicate:@"5"];
    [imageView constrainWidth:@"50"];
    
    [catTitleLabel constrainLeadingSpaceToView:imageView predicate:@"5"];
    [catTitleLabel alignTopEdgeWithView:imageView predicate:nil];
    [catTitleLabel alignBottomEdgeWithView:imageView predicate:nil];
    [catTitleLabel constrainWidthToView:vendorCategoryHeaderView.contentView predicate:@"*.5"];
    
    [catActualCostLabel constrainLeadingSpaceToView:catTitleLabel predicate:@"5"];
    [catActualCostLabel alignTrailingEdgeWithView:vendorCategoryHeaderView.contentView predicate:@"5"];
    [catActualCostLabel alignTopEdgeWithView:catTitleLabel predicate:nil];
    [catActualCostLabel constrainHeightToView:catTitleLabel predicate:@"*.5"];
    
    [catEstimatedCostLabel constrainLeadingSpaceToView:catTitleLabel predicate:@"5"];
    [catEstimatedCostLabel alignTrailingEdgeWithView:vendorCategoryHeaderView.contentView predicate:@"5"];
    [catEstimatedCostLabel constrainTopSpaceToView:catActualCostLabel predicate:@"5"];
    [catEstimatedCostLabel alignBottomEdgeWithView:vendorCategoryHeaderView.contentView predicate:@"5"];
    
    return vendorCategoryHeaderView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 55;
}

#pragma mark - method to return selected vendor categories

-(void)selectVendorCategories{
    
    NSMutableArray *mutableVendorCategories = [NSMutableArray new];
    
    for (VendorCategory *vendorCategory in self.couple.wedding.vendorCategories) {
        
        [[WeddingController sharedInstance] findActualCostForVendorCategory:vendorCategory];
        
        float budgetedCost = [vendorCategory.budgetedCost floatValue];
        float actualCost = [vendorCategory.actualCategoryCost floatValue];
        
        if ((budgetedCost > 0) || (actualCost > 0)) {
            [mutableVendorCategories addObject:vendorCategory];
        }
    }
    
    self.selectedVendorCategories = mutableVendorCategories;
    
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.selectedVendorCategories.count;
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    VendorCategory *vendorCategory = self.selectedVendorCategories[section];
    return vendorCategory.vendors.count;
    
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VendorCategory *vendorCategory = self.selectedVendorCategories[indexPath.section];
    Vendor *vendor = vendorCategory.vendors[indexPath.row];
    
    DoubleLabelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vendorBudgetCellID];
    
    if (!cell) {
        cell = [[DoubleLabelsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vendorBudgetCellID];
    }
    
    
    
    if (vendor.businessName) {
        cell.label1.text = vendor.businessName;
    } else {
        cell.label1.text = vendor.firstName;
    }
    
    float vendorCost = [vendor.totalCost floatValue];
    
    cell.label2.text = [NSString stringWithFormat:@"$%.2f", vendorCost];
    
    return cell;
    
}





-(UIScrollView *)scrollViewForParallaxController{
    return self.tableView;
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
