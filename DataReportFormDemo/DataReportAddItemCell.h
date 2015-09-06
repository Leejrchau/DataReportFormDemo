//
//  DataReportAddItemCell.h
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataReportItemCell.h"
/*
 添加自定义项目
 
 */

@protocol DataReportAddItemEditDelegate;
@interface DataReportAddItemCell : UITableViewCell

@property(nonatomic,assign)id<DataReportAddItemEditDelegate> delegate;
@property(nonatomic,strong)NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UIButton *addButton;


@end

@protocol DataReportAddItemEditDelegate <NSObject>

@optional

-(void)addItemsToFromViewWithCell:(DataReportAddItemCell *)cell withIndexPath:(NSIndexPath *)indexPath;


-(void)deleteItemsFromFormViewWithCell:(DataReportItemCell *)cell withIndexPath:(NSIndexPath *)indexPath;

@end
