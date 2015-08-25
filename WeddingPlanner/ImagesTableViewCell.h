//
//  ImagesTableViewCell.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagesTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imageView;
//How to make this so you can add as many image Views as necessary?
//Maybe use a collection view?

@property (strong, nonatomic) UILabel *label;
//Better to make label table view cell separate?

@end
