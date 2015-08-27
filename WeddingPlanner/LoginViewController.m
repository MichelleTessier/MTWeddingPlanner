//
//  LoginViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "LoginViewController.h"
#import "WeddingListViewController.h"

#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

#import "RegisterWeddingPageViewController.h"
#import "RegisterPlannerViewController.h"

#import "ClientTabBarController.h"
#import "DoubleTabBarSetup.h"

#import "Guest.h"


@interface LoginViewController ()

@property (strong, nonatomic) UITabBarController *plannerTabBarController;
@property (strong, nonatomic) ClientTabBarController *clientTabBarController;
@property (strong, nonatomic) UIBarButtonItem *toolBarButton;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
//    
//    Guest *guest = [Guest objectWithClassName:[Guest parseClassName]];
//    guest.firstName = @"I worked!";
//    guest.roleInWeddingParty = @"So proud!";
//
//    [guest saveInBackground];
//    
//    User *user = [User user];
//    user.username = @"mtessier";
//    user.password = @"password";
//    user.email = @"anne.m.tessier@gmail.com";
//    
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            // Hooray! Let them use the app now.
//        } else {
//            NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
//        }
//        
//    }];
    
    UITextField *userNameTextField = [UITextField new];
    userNameTextField.placeholder = @"email";
    [self.view addSubview:userNameTextField];
    
    UITextField *passwordTextfield = [UITextField new];
    passwordTextfield.placeholder = @"password";
    [self.view addSubview:passwordTextfield];
    
    UIButton *signInButton = [UIButton new];
    [signInButton setTitle:@"Sign In" forState:UIControlStateNormal];
    [signInButton setBackgroundColor:[UIColor purpleColor]];
    [signInButton addTarget:self action:@selector(signInButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInButton];
    
    UIButton *registerWeddingButton = [UIButton new];
    [registerWeddingButton setTitle:@"Register Wedding" forState:UIControlStateNormal];
    [registerWeddingButton setBackgroundColor:[UIColor purpleColor]];
    [registerWeddingButton addTarget:self action:@selector(registerWeddingButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerWeddingButton];
    
    UIButton *registerAsPlannerButton = [UIButton new];
    [registerAsPlannerButton setTitle:@"Register As Planner" forState:UIControlStateNormal];
    [registerAsPlannerButton setBackgroundColor:[UIColor blueColor]];
    [registerAsPlannerButton addTarget:self action:@selector(registerAsPlannerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerAsPlannerButton];
    
    [passwordTextfield alignCenterXWithView:self.view predicate:@"0"];
    [passwordTextfield alignCenterYWithView:self.view predicate:@"0"];
    [passwordTextfield constrainWidth:@"150" height:@"44"];
    
    [userNameTextField alignCenterXWithView:passwordTextfield predicate:@"0"];
    [userNameTextField constrainBottomSpaceToView:passwordTextfield predicate:@"5"];
    [userNameTextField constrainWidthToView:passwordTextfield predicate:@"0"];
    [userNameTextField constrainHeightToView:passwordTextfield predicate:@"0"];
    
    [signInButton alignCenterXWithView:passwordTextfield predicate:@"0"];
    [signInButton constrainTopSpaceToView:passwordTextfield predicate:@"5"];
    [signInButton constrainWidthToView:passwordTextfield predicate:@"0"];
    [signInButton constrainWidthToView:passwordTextfield predicate:@"0"];
    
    //help with these contraints why am I getting a random hole?!?!
    [registerWeddingButton alignBottomEdgeWithView:self.view predicate:@"0"];
    [registerWeddingButton alignLeadingEdgeWithView:self.view predicate:@"0"];
    [registerWeddingButton constrainWidthToView:self.view predicate:@"*.5"];
    [registerWeddingButton constrainHeight:@"44"];
    
    [registerAsPlannerButton alignBottomEdgeWithView:self.view predicate:@"0"];
    [registerAsPlannerButton alignTrailingEdgeWithView:self.view predicate:@"0"];
    [registerAsPlannerButton constrainLeadingSpaceToView:registerWeddingButton predicate:nil];
    [registerAsPlannerButton constrainHeightToView:registerWeddingButton predicate:@"0"];
    
    DoubleTabBarSetup *doubleTabBarSetup = [DoubleTabBarSetup new];
    [doubleTabBarSetup setUpClientTabBarController];
    [doubleTabBarSetup setUpPlannerTabBarController];
    
    
}




-(void)signInButtonTapped{
    
    self.toolBarButton.title = @"Couples Names";
    [self presentViewController:self.clientTabBarController animated:YES completion:nil];
    
}

-(void)registerAsPlannerButtonTapped{
    
    [self presentViewController:[RegisterPlannerViewController new] animated:YES completion:nil];
    
}

-(void)registerWeddingButtonTapped{
    
    [self presentViewController:[RegisterWeddingPageViewController new] animated:YES completion:nil];
    
    
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
