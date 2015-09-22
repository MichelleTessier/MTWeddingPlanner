//
//  CalendarWeekViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CalendarWeekViewController.h"
#import "CalendarWeekTableViewDataSource.h"
#import "CalendarPageViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

#warning seg control disappears when you go to calendar fix this

@interface CalendarWeekViewController () <UITableViewDelegate>

@property (strong, nonatomic) CalendarWeekTableViewDataSource *dataSource;

@end

@implementation CalendarWeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

- (void)setUpView{
    
    self.numberOfRows = 1095;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.dataSource = [CalendarWeekTableViewDataSource new];
    self.dataSource.couple = self.couple;
    self.dataSource.numberOfRows = self.numberOfRows;
    self.tableView.delegate = self;
    self.tableView.dataSource = self.dataSource;
   
    [self.view addSubview:self.tableView];
    
    
    
    [[DateController sharedInstance] setTodaysDate];
    
    NSLog(@"TODAYS DATE: %ld %ld", [DateController sharedInstance].currentDateComponents.month, (long)[DateController sharedInstance].currentDateComponents.day );
    
    NSInteger rowToStart = [DateController sharedInstance].startingRow;
    //Maybe add method in date controller to make this starting row corespond with a particular indexpath.row
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowToStart + 1 inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
    
}

-(void)jumpToTodayButtonPushed{
    
    NSInteger rowToStart = [DateController sharedInstance].startingRow;
    //Maybe add method in date controller to make this starting row corespond with a particular indexpath.row
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowToStart + 1 inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CalendarPageViewController *calendarPageVC = [CalendarPageViewController new];
    calendarPageVC.couple = self.couple;
    [DateController sharedInstance].selectedDate = [[DateController sharedInstance] getDateForRow:indexPath.row];
    
    
    [self.navigationController pushViewController:calendarPageVC animated:YES];
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
    CGFloat actualPosition = scrollView.contentOffset.y;
    CGFloat bottomOfScrollView = scrollView.contentSize.height - (self.view.frame.size.height);
    
    
//Not sure how to deal with this without having to rearrange everything
    
//    if ((actualPosition < 20)) {
//        
//        NSMutableArray *indexPathsToAdd = [NSMutableArray new];
//        
//        NSInteger numberOfRowsToAdd = 40;
//        
//        for (int i = 0; i < numberOfRowsToAdd; i++) {
//            //            NSIndexPath *indexPathToDelete = [NSIndexPath indexPathForRow:i-1 inSection:indexPath.section];
//            //            [indexPathsToDelete addObject:indexPathToDelete];
//            NSIndexPath *indexPathToInsert = [NSIndexPath indexPathForRow:(self.numberOfRows + i) inSection:0];
//            [indexPathsToAdd addObject:indexPathToInsert];
//        }
//        
//        self.numberOfRows += (numberOfRowsToAdd);
//        self.dataSource.numberOfRows = self.numberOfRows;
//        
//        [self.tableView insertRowsAtIndexPaths:indexPathsToAdd withRowAnimation:NO];
//    }
    
    
    
    
    
    if ((bottomOfScrollView > 0)&&((bottomOfScrollView - actualPosition) < 200)) {
        
//        NSMutableArray *indexPathsToDelete = [NSMutableArray new];
        NSMutableArray *indexPathsToAdd = [NSMutableArray new];
        
        NSInteger numberOfRowsToAdd = 40;
        
        for (int i = 0; i < numberOfRowsToAdd; i++) {
//            NSIndexPath *indexPathToDelete = [NSIndexPath indexPathForRow:i-1 inSection:indexPath.section];
//            [indexPathsToDelete addObject:indexPathToDelete];
            NSIndexPath *indexPathToInsert = [NSIndexPath indexPathForRow:(self.numberOfRows + i) inSection:0];
            [indexPathsToAdd addObject:indexPathToInsert];
        }
        
        self.numberOfRows += (numberOfRowsToAdd);
        self.dataSource.numberOfRows = self.numberOfRows;
        
        [self.tableView insertRowsAtIndexPaths:indexPathsToAdd withRowAnimation:NO];
        
        
        
    }
    
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
