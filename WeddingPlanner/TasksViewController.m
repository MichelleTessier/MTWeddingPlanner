//
//  TasksViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/12/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "TasksViewController.h"
#import "CalendarWeekViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

#warning View Controller doesn't display correctly if To Do List seg is selected before calendar seg


@interface TasksViewController ()

@property (strong, nonatomic) UIViewController *currentViewController;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) ToDoListViewController *toDoListVC;
@property (strong, nonatomic) UIButton *todayButton;

@end

@implementation TasksViewController

#warning hide status bar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"Tasks";
    
    self.toDoListVC = [ToDoListViewController new];
    self.toDoListVC.couple = self.couple;
    
    self.navigationController.navigationBarHidden = YES;
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems: @[@"To do", @"Calendar"]];
    self.segmentedControl.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);

    
    UIViewController *selectedViewController = [self viewControllerForSegmentIndex:self.segmentedControl.selectedSegmentIndex];
    
    [self addChildViewController:selectedViewController];
    
    selectedViewController.view.frame = [self frameForCurrentViewController];
    
    if (selectedViewController == nil) {
        selectedViewController = self.toDoListVC;
    }
    
    [self.view addSubview:selectedViewController.view];
    self.currentViewController = selectedViewController;
    
    
    [self.segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
}



-(void)segmentedControlValueChanged:(UISegmentedControl *)sender{
    
    UIViewController *selectedViewController = [self viewControllerForSegmentIndex:self.segmentedControl.selectedSegmentIndex];
    
    [self addChildViewController:selectedViewController];
    
    [self transitionFromViewController:self.currentViewController toViewController:selectedViewController duration:0.5 options:UIViewAnimationOptionTransitionNone animations:^{
        
        [self.currentViewController.view removeFromSuperview];
        selectedViewController.view.frame = [self frameForCurrentViewController];
        [self.view addSubview:selectedViewController.view];
        
    } completion:^(BOOL finished) {
        
        [selectedViewController didMoveToParentViewController:self];
        [self.currentViewController removeFromParentViewController];
        self.currentViewController = selectedViewController;
        
        self.todayButton = [UIButton new];
        
        [self.todayButton setBackgroundColor:[UIColor clearColor]];
        
        [self.view addSubview:self.todayButton];
        [self.view bringSubviewToFront:self.todayButton];
        
        [self.todayButton alignCenterXWithView:self.view predicate:nil];
        [self.todayButton constrainWidth:@"200" height:@"44"];
        [self.todayButton alignTopEdgeWithView:self.view predicate:@"70"];
        
        if ([self.currentViewController isKindOfClass: [CalendarWeekViewController class]]) {
            
            
            [self.todayButton setEnabled:YES];
            [self.todayButton setTitle:@"Today" forState:UIControlStateNormal];
            [self.todayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.todayButton addTarget:self.currentViewController action:@selector(jumpToTodayButtonPushed) forControlEvents:UIControlEventTouchUpInside];
            
           
            
        } else {
            
            [self.todayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.todayButton setEnabled:NO];
            
        }
        
        
    }];
    
    self.navigationItem.title = selectedViewController.title;
}


-(UIViewController *)viewControllerForSegmentIndex:(NSInteger)index{
    UIViewController *viewController;
    switch (index) {
        case 0:
            viewController = self.toDoListVC;
            break;
            
        case 1:{
            CalendarWeekViewController *calendarWeekVC = [CalendarWeekViewController new];
            calendarWeekVC.couple = self.couple;
            viewController = calendarWeekVC;
            break;
        }
        default:
            viewController = self.toDoListVC;
            break;
    }
    
    return viewController;
    
}


-(CGRect)frameForCurrentViewController{
    CGRect boundingRect = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44);
    return boundingRect;
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
