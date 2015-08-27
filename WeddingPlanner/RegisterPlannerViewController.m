//
//  RegisterPlannerViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "RegisterPlannerViewController.h"

@interface RegisterPlannerViewController ()

@property (strong, nonatomic) UITextField *plannerFirstNameTextField;
@property (strong, nonatomic) UITextField *plannerLastNameTextField;
@property (strong, nonatomic) UITextField *plannerBusinessNameTextField;
@property (strong, nonatomic) UITextField *plannerEmail
@property (strong, nonatomic) UITextField
@property (strong, nonatomic) UITextField


@end

@implementation RegisterPlannerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setUpTextFieldsAndLabel];
    [self setUpButtons];
    [self setUpConstraints];
    
}

- (void)setUpTextFieldsAndLabel{
    
    self.spouse1FirstNameTextField = [UITextField new];
    self.spouse1FirstNameTextField.placeholder = @"First";
    [self.view addSubview:self.spouse1FirstNameTextField];
    
    self.spouse1LastNameTextField = [UITextField new];
    self.spouse1LastNameTextField.placeholder = @"Last";
    [self.view addSubview:self.spouse1LastNameTextField];
    
    self.spouse1EmailTextField = [UITextField new];
    self.spouse1EmailTextField.placeholder = @"Email";
    [self.view addSubview:self.spouse1EmailTextField];
    
    self.spouse2FirstNameTextField = [UITextField new];
    self.spouse2FirstNameTextField.placeholder = @"First";
    [self.view addSubview:self.spouse2FirstNameTextField];
    
    self.spouse2LastNameTextField = [UITextField new];
    [self.view addSubview:self.spouse2LastNameTextField];
    self.spouse2LastNameTextField.placeholder = @"Last";
    
    self.spouse2EmailTextField = [UITextField new];
    self.spouse2EmailTextField.placeholder = @"Email (optional)";
    [self.view addSubview:self.spouse2EmailTextField];
    
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
    
    [self.spouse1FirstNameTextField constrainWidthToView:self.view predicate:@"*.4"];
    [self.spouse1FirstNameTextField constrainHeight:@"44"];
    [self.spouse1FirstNameTextField constrainBottomSpaceToView:self.spouse1EmailTextField predicate:@"5"];
    [self.spouse1FirstNameTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [self.spouse1LastNameTextField constrainLeadingSpaceToView:self.spouse1FirstNameTextField predicate:@"5"];
    [self.spouse1LastNameTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.spouse1LastNameTextField alignCenterYWithView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse1LastNameTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    
    [self.spouse1EmailTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.spouse1EmailTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.spouse1EmailTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse1EmailTextField alignCenterYWithView:self.view predicate:@"-60"];
    
    [self.spouse2FirstNameTextField constrainTopSpaceToView:self.spouse1EmailTextField predicate:@"5"];
    [self.spouse2FirstNameTextField constrainWidthToView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse2FirstNameTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse2FirstNameTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [self.spouse2LastNameTextField constrainLeadingSpaceToView:self.spouse2FirstNameTextField predicate:@"5"];
    [self.spouse2LastNameTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.spouse2LastNameTextField alignCenterYWithView:self.spouse2FirstNameTextField predicate:nil];
    [self.spouse2LastNameTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    
    [self.spouse2EmailTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.spouse2EmailTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.spouse2EmailTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse2EmailTextField constrainTopSpaceToView:self.spouse2FirstNameTextField predicate:@"5"];
    
    [self.label alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.label alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.label constrainHeight:@"44"];
    [self.label constrainTopSpaceToView:self.spouse2EmailTextField predicate:@"5"];
    
    [self.registerButton alignBottomEdgeWithView:self.view predicate:nil];
    [self.registerButton alignTrailingEdgeWithView:self.view predicate:nil];
    [self.registerButton alignLeadingEdgeWithView:self.view predicate:nil];
    [self.registerButton constrainHeight:@"44"];
    
}

- (void)createWedding{
    
    //put in method to make sure all textfields are filled in
    
    //also need to create parse user here
    
    if (!self.wedding) {
        self.wedding = [[WeddingController sharedInstance] createWedding];
    }
    
    Spouse *spouse1 = [Spouse new];
    spouse1.firstName = self.spouse1FirstNameTextField.text;
    spouse1.lastName = self.spouse1LastNameTextField.text;
    spouse1.email = self.spouse1EmailTextField.text;
    
    Spouse *spouse2 = [Spouse new];
    spouse2.firstName = self.spouse2FirstNameTextField.text;
    spouse2.lastName = self.spouse2LastNameTextField.text;
    spouse2.email = self.spouse2EmailTextField.text;
    
    self.wedding.couple = @[spouse1, spouse2];
    
    [self.wedding saveEventually];
    
    
}


- (void)registerButtonTapped{
    
    [self createWedding];
    
    
    [self.pageViewController setViewControllers:@[self.registerWeddingPage2VC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
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
