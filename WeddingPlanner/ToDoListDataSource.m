//
//  ToDoListDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/1/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "ToDoListDataSource.h"

#import "LabelTableViewCell.h"


static NSString *toDoListCellID = @"toDoListCellID";
static NSString *tipCellID = @"tipCellID";

@interface ToDoListDataSource ()

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ToDoListDataSource

//-(NSArray *)archivedToDoCategories{
//    
////    NSMutableArray *mutableToDoCategories = [NSMutableArray new];
////    
////    for (ToDoTimeCategory *toDoTimeCategory in self.couple.wedding.toDoTimeCategories) {
////         //Write a way for categories to dissappear if all toDo items are finished.
////        [mutableToDoCategories addObject:toDoTimeCategory];
////    }
////    
////    NSArray *incompleteToDoTimeCategories = mutableToDoCategories;
////    
////    for (ToDoTimeCategory *toDoTimeCategory in incompleteToDoTimeCategories) {
////        
////        NSMutableArray *mutableToDos = [NSMutableArray new];
////        
////        for (ToDoItem *toDoItem in toDoTimeCategory.toDoItems) {
////            
////            if (toDoItem.itemComplete == NO) {
////                [mutableToDos addObject:toDoItem];
////            }
////        }
////        
////        toDoTimeCategory.incompleteToDoItems = mutableToDos;
////    }
////    
////    return incompleteToDoTimeCategories;
//}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
        return self.couple.wedding.toDoTimeCategories.count;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[section];
   
    return toDoTimeCategory.title;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rows = 0;
    
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[section];
   

    
    if (self.indexPathForTip && section == self.indexPathForTip.section){
        //there is a tip row and the tip row is in the section
         rows = toDoTimeCategory.toDoItems.count + 1;
    } else {
        rows = toDoTimeCategory.toDoItems.count;
    }
    
    return rows;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[indexPath.section];
   
    self.tableView = tableView;
   
    
    if (self.indexPathForTip){
        //there is a tip cell displayed
        if ((indexPath.section == self.indexPathForTip.section)&&(indexPath.row == self.indexPathForTip.row)) {
            //This is the tip cell
            
            LabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tipCellID];
            
                    if (!cell) {
                        cell = [[LabelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tipCellID];
                    }
            
            ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row - 1];
            
            NSString *tipString = @"";
            
            if (self.couple.plannerFirstName) {
                tipString = [NSString stringWithFormat:@"%@'s Tip: %@", self.couple.plannerFirstName, toDoItem.plannerTip];

            } else {
                tipString = [NSString stringWithFormat:@"Tip: %@", toDoItem.plannerTip];
            }
            
            cell.label.text = tipString;
            cell.label.font = [UIFont italicSystemFontOfSize:12];
            
            return cell;
            
            
        } else if (indexPath.section == self.indexPathForTip.section){
            
            //The cell tapped is in the same section as the tip cell displayed
            
            ToDoItem *toDoItem;
            
            if (indexPath.row < self.indexPathForTip.row) {
                //The cell tapped is above the tip cell displayed
                toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
            } else {
                //The cell tapped is below the tip cell displayed
                toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
            }
            
        
                LabelButtonCheckBoxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:toDoListCellID];
                
                if (!cell) {
                    cell = [[LabelButtonCheckBoxTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:toDoListCellID];
                }
                
            [cell updateToDoCellAtIndexPath:indexPath WithToDoItem:toDoItem];
            cell.delegate = self;

                return cell;
            
            
        } else {
            
            //The cell tapped is not in the same section as the tip cell displayed
            
            ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
            
            
                LabelButtonCheckBoxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:toDoListCellID];
                
                if (!cell) {
                    cell = [[LabelButtonCheckBoxTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:toDoListCellID];
                }
                
            [cell updateToDoCellAtIndexPath:indexPath WithToDoItem:toDoItem];
            cell.delegate = self;

            
            return cell;
    
            
        }
        
    } else {
        //There is no tip cell currently displayed
        
        ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
        
        
            //the cell tapped has a planner tip
            LabelButtonCheckBoxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:toDoListCellID];
            
            if (!cell) {
                cell = [[LabelButtonCheckBoxTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:toDoListCellID];
            }
        
        [cell updateToDoCellAtIndexPath:indexPath WithToDoItem:toDoItem];
         cell.delegate = self;
            
            
            return cell;
        
    }
    
    
}


-(void)checkBoxChangedState:(kMPCheckBoxState)state inCell:(LabelButtonCheckBoxTableViewCell *)sender{
    
    if (self.isCurrentDataSource == YES) {
      
    
    UITableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[indexPath.section];
    ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
    
    if (state == kMPCheckBoxStateChecked) {
        toDoItem.itemComplete = YES;
        
    } else {
        toDoItem.itemComplete = NO;
    }
    
    }
    
    
}



-(void)tipButtonTappedinSender:(LabelButtonCheckBoxTableViewCell *)sender{
    
    UITableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[indexPath.section];
    
    if (self.indexPathForTip){
        //there is a tip cell displayed
        if ((indexPath.section == self.indexPathForTip.section)&&(indexPath.row == self.indexPathForTip.row)) {
            //This is the tip cell
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            
        } else if ((indexPath.section == self.indexPathForTip.section)&&(indexPath.row == (self.indexPathForTip.row - 1))){
            //The cell tapped is the title of the tip that is already displayed
            
            NSIndexPath *indexPathToDelete = self.indexPathForTip;
            self.indexPathForTip = nil;
            [self.tableView deleteRowsAtIndexPaths:@[indexPathToDelete] withRowAnimation:UITableViewRowAnimationBottom];
            
        }else if (indexPath.section == self.indexPathForTip.section){
            //The cell tapped is in the same section as the tip cell displayed
            
            ToDoItem *toDoItem;
            
            if (indexPath.row < self.indexPathForTip.row) {
                //The cell tapped is above the tip cell displayed
                toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
            } else {
                //The cell tapped is below the tip cell displayed
                toDoItem = toDoTimeCategory.toDoItems[indexPath.row - 1];
            }
            
            if (toDoItem.plannerTip) {
                
                //There is a tip for the to do item
                
                if (indexPath.row < self.indexPathForTip.row) {
                    //The cell tapped is above the tip cell displayed
                    
                    //Delete the current tip cell and display the new one
                    NSIndexPath *indexPathToDelete = self.indexPathForTip;
                    self.indexPathForTip = nil;
                    [self.tableView deleteRowsAtIndexPaths:@[indexPathToDelete] withRowAnimation:UITableViewRowAnimationBottom];
                    self.indexPathForTip = [NSIndexPath indexPathForRow:(indexPath.row + 1) inSection:indexPath.section];
                    [self.tableView insertRowsAtIndexPaths:@[self.indexPathForTip] withRowAnimation:UITableViewRowAnimationTop];
                    
                } else {
                    //The cell tapped is below the tip cell displayed
                    //Delete the current tip cell and display the new one
                    NSIndexPath *indexPathToDelete = self.indexPathForTip;
                    self.indexPathForTip = nil;
                    [self.tableView deleteRowsAtIndexPaths:@[indexPathToDelete] withRowAnimation:UITableViewRowAnimationBottom];
                    self.indexPathForTip = [NSIndexPath indexPathForRow:(indexPath.row) inSection:indexPath.section];
                    [self.tableView insertRowsAtIndexPaths:@[self.indexPathForTip] withRowAnimation:UITableViewRowAnimationTop];
                    
                }
                
                
                
            } else {
                //the cell tapped has no planner tip
            }
        } else {
            //The cell tapped is not in the same section as the tip cell displayed
            ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
            if (toDoItem.plannerTip) {
                
                //There is a tip for the to do item
                
                //Delete the current tip cell and display the new one
                NSIndexPath *indexPathToDelete = self.indexPathForTip;
                self.indexPathForTip = nil;
                [self.tableView deleteRowsAtIndexPaths:@[indexPathToDelete] withRowAnimation:UITableViewRowAnimationBottom];
                self.indexPathForTip = [NSIndexPath indexPathForRow:(indexPath.row + 1) inSection:indexPath.section];
                [self.tableView insertRowsAtIndexPaths:@[self.indexPathForTip] withRowAnimation:UITableViewRowAnimationTop];
                
            } else {
                //the cell tapped has no planner tip
            }
            
        }
        
    } else {
        //There is no tip cell currently displayed
        
        ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
        
        if (toDoItem.plannerTip) {
            //the cell tapped has a planner tip
            self.indexPathForTip = [NSIndexPath indexPathForRow:(indexPath.row + 1) inSection:indexPath.section];
            [self.tableView insertRowsAtIndexPaths:@[self.indexPathForTip] withRowAnimation:UITableViewRowAnimationTop];
            
        } else {
            //the cell tapped has no planner tip
        }
        
    }
    
    
}










@end
