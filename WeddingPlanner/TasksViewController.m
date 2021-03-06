//
//  TasksViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/12/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "TasksViewController.h"
#import "ToDoListViewController.h"
#import "CalendarViewController.h"


@interface TasksViewController ()

@property (strong, nonatomic) UIViewController *currentViewController;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;

@end

@implementation TasksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"Tasks";
    
    self.segmentedControl= [[UISegmentedControl alloc] initWithItems: @[@"To do", @"Calendar"]];
    self.segmentedControl.frame = CGRectMake(0, 64, self.view.frame.size.width, 44);

    
    UIViewController *selectedViewController = [self viewControllerForSegmentIndex:self.segmentedControl.selectedSegmentIndex];
    [self addChildViewController:selectedViewController];
    selectedViewController.view.frame = [self frameForCurrentViewController];
    if (selectedViewController == nil) {
        selectedViewController = [ToDoListViewController new];
    }
    [self.view addSubview:selectedViewController.view];
    self.currentViewController = selectedViewController;
    
    
    [self.segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
}



-(void)segmentedControlValueChanged:(UISegmentedControl *)sender{
    UIViewController *selectedViewController = [self viewControllerForSegmentIndex:self.segmentedControl.selectedSegmentIndex];
    [self addChildViewController:selectedViewController];
    [self transitionFromViewController:self.currentViewController toViewController:selectedViewController duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        [self.currentViewController.view removeFromSuperview];
        selectedViewController.view.frame = [self frameForCurrentViewController];
        [self.view addSubview:selectedViewController.view];
    } completion:^(BOOL finished) {
        [selectedViewController didMoveToParentViewController:self];
        [self.currentViewController removeFromParentViewController];
        self.currentViewController = selectedViewController;
    }];
    self.navigationItem.title = selectedViewController.title;
}


-(UIViewController *)viewControllerForSegmentIndex:(NSInteger)index{
    UIViewController *viewController;
    switch (index) {
        case 0:
            viewController = [ToDoListViewController new];
            break;
            
        case 1:
            viewController = [CalendarViewController new];
            break;
            
        default:
            viewController = [ToDoListViewController new];
            break;
    }
    
    return viewController;
    
}


-(CGRect)frameForCurrentViewController{
    CGRect boundingRect = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 200);
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
