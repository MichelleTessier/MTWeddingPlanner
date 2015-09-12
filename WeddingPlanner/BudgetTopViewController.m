//
//  BudgetTopView.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "BudgetTopViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@interface BudgetTopViewController ()

@property (strong, nonatomic) UILabel *totalCostLabel;
//@property (strong, nonatomic) UILabel *toPayLabel;
//@property (strong, nonatomic) UILabel *havePaidLabel;
@property (strong, nonatomic) UILabel *estimatedCostLabel;

@end

@implementation BudgetTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateBudget];
    [self setUpView];
    [self addConstraints];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self updateBudget];
    
}

-(void)updateBudget{
    
    [[WeddingController sharedInstance] findActualCostForWedding:self.couple.wedding];
    [[WeddingController sharedInstance] findEstimatedCostForWedding:self.couple.wedding];
    
}

-(void)setUpView{
    
    self.totalCostLabel = [UILabel new];
    
    float totalCostOfWedding = [self.couple.wedding.budget.totalActualCost floatValue];
    self.totalCostLabel.text = [NSString stringWithFormat:@"$%.2f", totalCostOfWedding];
    self.totalCostLabel.font = [UIFont boldSystemFontOfSize:50];
    self.totalCostLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.totalCostLabel];
    
    self.estimatedCostLabel = [UILabel new];
    
    float estimatedCostOfWedding = [self.couple.wedding.budget.totalBudgetedCost floatValue];
    self.estimatedCostLabel.text = [NSString stringWithFormat:@"Budget: $%.2f", estimatedCostOfWedding];
    self.estimatedCostLabel.font = [UIFont systemFontOfSize:20];
    self.estimatedCostLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.estimatedCostLabel];
    
    
}

-(void)addConstraints{
    
    [self.totalCostLabel alignLeading:@"5" trailing:@"5" toView:self.view];
    [self.totalCostLabel alignTopEdgeWithView:self.view predicate:@"85"];
    [self.totalCostLabel constrainHeight:@"80"];
    
    [self.estimatedCostLabel alignLeading:@"5" trailing:@"5" toView:self.view];
    [self.estimatedCostLabel constrainTopSpaceToView:self.totalCostLabel predicate:@"5"];
    [self.estimatedCostLabel constrainHeight:@"50"];
    
    
    
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
