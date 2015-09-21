//
//  CalendarDayViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CalendarDayViewController.h"
#import "WeddingController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"
#import "DateController.h"
#import "AddCalendarEventViewController.h"
#import "CalendarDayViewTableViewDataSource.h"

@interface CalendarDayViewController () <UITableViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeDownGestureRecognizer;
@property (strong, nonatomic) CalendarDayViewTableViewDataSource *dataSource;
@property (assign, nonatomic) CGFloat rowHeight;
@property (assign, nonatomic) BOOL scrollViewWasAtTop;

@end

@implementation CalendarDayViewController

-(instancetype)initWithDate:(NSDate *)date andCouple:(Couple *)couple{
   
    self = [super init];
    
    if (self) {
        self.today = date;
        self.couple = couple;
        
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpView];
    [self setDateForView];
    [self setConstraints];
    
}




-(void)setUpView{
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.dateLabel = [UILabel new];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    self.dateLabel.numberOfLines = 2;
    [self.view addSubview:self.dateLabel];
    
    self.tableView = [UITableView new];
    self.tableView.separatorColor = [UIColor purpleColor];
    self.tableView.backgroundColor = [UIColor purpleColor];
    self.dataSource = [CalendarDayViewTableViewDataSource new];
    self.dataSource.couple = self.couple;
    self.dataSource.today = self.today;
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    

}

-(void)setDateForView{
    
    NSDateComponents *dateComponents = [[DateController sharedInstance] getDateComponentsForDate:self.today];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:(dateComponents.month - 1)];
    
    NSString *weekDayName = [[dateFormatter weekdaySymbols] objectAtIndex:(dateComponents.weekday - 1)];
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@ \n %@ %ld", weekDayName, monthName, dateComponents.day];
    
}

-(void)setConstraints{
    
//    CGFloat tableViewHeight = self.couple.wedding.calendarItems.count * self.rowHeight;
    self.rowHeight = 44;
    CGFloat tableViewHeight = 2 * self.rowHeight;
    CGFloat labelHeight = 64;
    
    NSString *labelHeightString = [NSString stringWithFormat:@"%f", labelHeight];
    
    [self.dateLabel alignLeading:@"5" trailing:@"5" toView:self.view];
    [self.dateLabel alignTopEdgeWithView:self.view predicate:@"64"];
    [self.dateLabel constrainHeight:labelHeightString];
    
  
    [self.tableView alignLeading:@"5" trailing:@"5" toView:self.view];
    
    NSString *tableViewHeightString = @"";
    
    if (tableViewHeight < (self.view.frame.size.height - labelHeight - 20)) {
        
        tableViewHeightString = [NSString stringWithFormat:@"%f", tableViewHeight];
        [self.tableView alignCenterYWithView:self.view predicate:nil];
        [self.tableView constrainHeight:tableViewHeightString];
        self.scrollViewWasAtTop = NO;
        
    } else {
        
        [self.tableView constrainTopSpaceToView:self.dateLabel predicate:@"5"];
        [self.tableView alignBottomEdgeWithView:self.view predicate:@"-64"];
        self.scrollViewWasAtTop = YES;
        
    }
    
    
    
   
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.rowHeight;
    
}

#pragma mark - method to call present next view when tableview is scrolled to top

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y == 0) {
    
    //Scrollview was not at the top already, so dont add new item but prepare to if scrollview is scrolled to top again
    
    if (self.scrollViewWasAtTop == NO) {
        
        self.scrollViewWasAtTop = YES;
        
     //Scrollview was at top, so add another view
    } else {
        
        [self presentNextView];
        
        }
    
    }
    
    if (scrollView.contentOffset.y > 0) {
        
        self.scrollViewWasAtTop = NO;
        
    }
        
}

#pragma mark - present add calendar event view


-(void)presentNextView{
    
    //     if(((UISwipeGestureRecognizer *)gestureRecognizer).direction == UISwipeGestureRecognizerDirectionDown){
    
    NSLog(@"almost there");
    
    AddCalendarEventViewController *addCalendarEventVC = [AddCalendarEventViewController new];
    addCalendarEventVC.couple = self.couple;
    
    [self presentViewController: addCalendarEventVC animated:YES completion:nil];
    
    //     }
}


-(void)saveButtonTapped{
    
    [self.couple saveEventually];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
