//
//  DataReportAddPartsCell.h
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataReportPartsCell.h"

/*
 
 添加自定义备件
 
 */
@protocol DataReportAddPartEditDelegate;
@interface DataReportAddPartsCell : UITableViewCell
@property(nonatomic,assign)id<DataReportAddPartEditDelegate> delegate;
@property(nonatomic,strong)NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UIButton *addButton;


@end

@protocol DataReportAddPartEditDelegate <NSObject>

@optional

-(void)addPartsToFromViewWithCell:(DataReportAddPartsCell *)cell withIndexPath:(NSIndexPath *)indexPath;


-(void)deletePartsFromFormViewWithCell:(DataReportPartsCell *)cell withIndexPath:(NSIndexPath *)indexPath;

@end
