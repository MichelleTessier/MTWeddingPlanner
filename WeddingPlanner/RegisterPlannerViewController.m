//
//  RegisterPlannerViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "RegisterPlannerViewController.h"

#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

#import "PlannerController.h"

#import "DoubleTabBarSetup.h"

@interface RegisterPlannerViewController () <UITextFieldDelegate>

//Might want to add a second page where planner can add phone, website, fb link, etc. #LATER

@property (strong, nonatomic) UITextField *plannerFirstNameTextField;
@property (strong, nonatomic) UITextField *plannerLastNameTextField;
@property (strong, nonatomic) UITextField *plannerBusinessNameTextField;
@property (strong, nonatomic) UITextField *plannerEmailTextField;
@property (strong, nonatomic) UITextField *plannerPasswordTextField;
@property (strong, nonatomic) UITextField *plannerPasswordConfirmTextField;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *registerButton;


@end

@implementation RegisterPlannerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setUpTextFieldsAndLabel];
    [self setUpButtons];
    [self setUpConstraints];
    
}

- (void)setUpTextFieldsAndLabel{
    
    self.plannerFirstNameTextField = [UITextField new];
    self.plannerFirstNameTextField.placeholder = @"First";
    [self.view addSubview:self.plannerFirstNameTextField];
    
    self.plannerLastNameTextField = [UITextField new];
    self.plannerLastNameTextField.placeholder = @"Last";
    [self.view addSubview:self.plannerLastNameTextField];
    
    self.plannerEmailTextField = [UITextField new];
    self.plannerEmailTextField.placeholder = @"Email";
    [self.view addSubview:self.plannerEmailTextField];
    
    self.plannerBusinessNameTextField = [UITextField new];
    self.plannerBusinessNameTextField.placeholder = @"Business Name (optional)";
    [self.view addSubview:self.plannerBusinessNameTextField];
    
    self.plannerPasswordTextField = [UITextField new];
    [self.view addSubview:self.plannerPasswordTextField];
    self.plannerPasswordTextField.placeholder = @"Password";
    
    self.plannerPasswordConfirmTextField = [UITextField new];
    self.plannerPasswordConfirmTextField.placeholder = @"Confirm Password";
    self.plannerPasswordConfirmTextField.delegate = self;
    [self.view addSubview:self.plannerPasswordConfirmTextField];
    

    self.label = [UILabel new];
    [self.view addSubview:self.label];
    
    
    
}

-(void)setUpButtons{
    
    self.registerButton = [UIButton new];
    [self.registerButton setBackgroundColor:[UIColor purpleColor]];
    [self.registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerButton];
    
}

-(void)setUpConstraints{
    
    [self.plannerBusinessNameTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.plannerBusinessNameTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.plannerBusinessNameTextField constrainHeight:@"44"];
    [self.plannerBusinessNameTextField alignTopEdgeWithView:self.view predicate:@"20"];
    
    [self.plannerFirstNameTextField constrainWidthToView:self.view predicate:@"*.45"];
    [self.plannerFirstNameTextField constrainHeightToView:self.plannerBusinessNameTextField predicate:nil];
    [self.plannerFirstNameTextField constrainTopSpaceToView:self.plannerBusinessNameTextField predicate:@"5"];
    [self.plannerFirstNameTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [self.plannerLastNameTextField constrainLeadingSpaceToView:self.plannerFirstNameTextField predicate:@"5"];
    [self.plannerLastNameTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.plannerLastNameTextField alignCenterYWithView:self.plannerFirstNameTextField predicate:nil];
    [self.plannerLastNameTextField constrainHeightToView:self.plannerBusinessNameTextField predicate:nil];
    
    [self.plannerEmailTextField constrainWidthToView:self.plannerEmailTextField predicate:nil];
    [self.plannerEmailTextField constrainHeightToView:self.plannerBusinessNameTextField predicate:nil];
    [self.plannerEmailTextField constrainTopSpaceToView:self.plannerFirstNameTextField predicate:@"5"];
    [self.plannerEmailTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [self.plannerPasswordTextField constrainWidthToView:self.plannerEmailTextField predicate:nil];
    [self.plannerPasswordTextField constrainHeightToView:self.plannerBusinessNameTextField predicate:nil];
    [self.plannerPasswordTextField constrainTopSpaceToView:self.plannerEmailTextField predicate:@"5"];
    [self.plannerPasswordTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [self.plannerPasswordConfirmTextField constrainWidthToView:self.plannerEmailTextField predicate:nil];
    [self.plannerPasswordConfirmTextField constrainHeightToView:self.plannerBusinessNameTextField predicate:nil];
    [self.plannerPasswordConfirmTextField constrainTopSpaceToView:self.plannerPasswordTextField predicate:@"5"];
    [self.plannerPasswordConfirmTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [self.label constrainWidthToView:self.plannerEmailTextField predicate:nil];
    [self.label constrainHeightToView:self.plannerBusinessNameTextField predicate:nil];
    [self.label constrainTopSpaceToView:self.plannerPasswordConfirmTextField predicate:@"5"];
    [self.label alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    
    [self.registerButton alignBottomEdgeWithView:self.view predicate:nil];
    [self.registerButton alignTrailingEdgeWithView:self.view predicate:nil];
    [self.registerButton alignLeadingEdgeWithView:self.view predicate:nil];
    [self.registerButton constrainHeight:@"44"];
    
}

- (void)createPlanner{
    
    //put in method to make sure all textfields are filled in
    
    if ([self.plannerPasswordTextField.text isEqualToString:self.plannerPasswordConfirmTextField.text]) {
        
        self.label.text = @"";
        
        Planner *planner = [[PlannerController sharedInstance] createPlannerwithEmail:self.plannerEmailTextField.text andPassword:self.plannerPasswordTextField.text];
    
        [planner setEmail:self.plannerEmailTextField.text];
      
        [planner setFirstName:self.plannerFirstNameTextField.text];
      
        [planner setLastName:self.plannerLastNameTextField.text];
      
        [planner setBusinessName:self.plannerBusinessNameTextField.text];
        
        [planner saveInBackground];
        
        
    } else {
        self.label.text = @"Please make sure your passwords match";
    }
    
}


- (void)registerButtonTapped{
    
    [self createPlanner];
    
     DoubleTabBarSetup *doubleTabBarSetup = [DoubleTabBarSetup new];
     [doubleTabBarSetup setUpClientTabBarController];
     [doubleTabBarSetup setUpPlannerTabBarController];
    
     [self presentViewController:doubleTabBarSetup.plannerTabBarController animated:YES completion:nil];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
