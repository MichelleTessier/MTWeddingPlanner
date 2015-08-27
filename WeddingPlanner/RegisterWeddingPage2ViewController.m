//
//  RegisterWeddingPage2ViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "RegisterWeddingPage2ViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"
#import "DoubleTabBarSetup.h"
#import "PlannerController.h"

@interface RegisterWeddingPage2ViewController () 

@property (strong, nonatomic) UITextField *plannerEmailTextField;
@property (strong, nonatomic) UIButton *registerButton;
@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) Planner *planner;


@end

@implementation RegisterWeddingPage2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.plannerEmailTextField = [UITextField new];
    self.plannerEmailTextField.placeholder = @"Planner's Email (optional)";
    [self.view addSubview:self.plannerEmailTextField];
    
    self.label = [UILabel new];
    [self.view addSubview:self.label];
    
    
    
    [self setUpButtons];
    [self setUpConstraints];
     
    
}

-(void)setUpButtons{
    
    self.registerButton = [UIButton new];
    [self.registerButton setBackgroundColor:[UIColor purpleColor]];
    [self.registerButton setTitle:@"Find Planner" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerButton];
    
}

-(void)setUpConstraints{
    
    [self.plannerEmailTextField alignCenterYWithView:self.view predicate:nil];
    [self.plannerEmailTextField alignCenterXWithView:self.view predicate:nil];
    [self.plannerEmailTextField alignLeadingEdgeWithView:self.view predicate:@"15"];
    [self.plannerEmailTextField alignTrailingEdgeWithView:self.view predicate:@"15"];
    [self.plannerEmailTextField constrainHeight:@"44"];
    
    [self.label alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.label alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.label constrainHeight:@"44"];
    [self.label constrainTopSpaceToView:self.plannerEmailTextField predicate:@"10"];
    
    [self.registerButton alignBottomEdgeWithView:self.view predicate:nil];
    [self.registerButton alignTrailingEdgeWithView:self.view predicate:nil];
    [self.registerButton alignLeadingEdgeWithView:self.view predicate:nil];
    [self.registerButton constrainHeight:@"44"];
    
}

- (void)registerButtonTapped{
    
    [self addPlannerToWedding];
    
}

- (void)presentNextView{
    
    DoubleTabBarSetup *doubleTabBarSetup = [DoubleTabBarSetup new];
    [doubleTabBarSetup setUpClientTabBarController];
    
    [self presentViewController:doubleTabBarSetup.clientTabBarController animated:YES completion:nil];
    
}

- (void)addPlannerToWedding{
    
    [[PlannerController sharedInstance] retrievePlannerWithEmail:self.plannerEmailTextField.text withCompletion:^{
        if ([PlannerController sharedInstance].planner) {
            
            self.planner = [PlannerController sharedInstance].planner;
            self.couple.plannerID = self.planner.objectId;
            
            [[WeddingController sharedInstance]addVendorCategoriesFromPlanner:self.planner ToWedding:self.couple.wedding];
            
            [self.couple saveInBackground];
            
            self.label.numberOfLines = 0;
            self.label.text = [NSString stringWithFormat:@"Congrats! \n You've selected %@ %@ as your planner!", self.planner.firstName, self.planner.lastName];
            
            [self.registerButton setTitle:@"Continue" forState:UIControlStateNormal];
            [self.registerButton addTarget:self action:@selector(presentNextView) forControlEvents:UIControlEventTouchUpInside];
            
        } else {
            
            self.label.text = @"No planner found matching that email";
            
        }
    }];
    
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
