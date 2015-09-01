//
//  ToDoListDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/1/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "ToDoListDataSource.h"
#import "LabelAndIconTableViewCell.h"

static NSString *toDoListCellID = @"toDoListCellID";

@implementation ToDoListDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.couple.wedding.toDoTimeCategories.count;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[section];
    
    return toDoTimeCategory.title;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[section];
    
    return toDoTimeCategory.toDoItems.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LabelAndIconTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:toDoListCellID];
    
    if (!cell) {
        cell = [[LabelAndIconTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:toDoListCellID];
    }
    
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[indexPath.section];
    
    ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
    
    cell.label.text = toDoItem.title;
    
    return cell;
}


@end
