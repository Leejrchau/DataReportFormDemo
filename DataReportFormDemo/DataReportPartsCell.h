//
//  DataReportPartsCell.h
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderLabel.h"
#import "DataReportItemModel.h"
/*
 
备件
 
 */
@protocol DataReportAddPartEditDelegate;
@interface DataReportPartsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet BorderLabel *partNameLabel;

@property (weak, nonatomic) IBOutlet BorderLabel *partNumLabel;

@property (weak, nonatomic) IBOutlet BorderLabel *countsLabel;

@property (weak, nonatomic) IBOutlet BorderLabel *unitPriceLabel;

@property (weak, nonatomic) IBOutlet BorderLabel *totalCostLabel;
@property (weak, nonatomic) IBOutlet BorderLabel *operationLabel;

@property(nonatomic,assign)id<DataReportAddPartEditDelegate> delegate;
@property(nonatomic,strong)NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;


-(void)setCellWithDataReportItemModel:(DataReportItemModel *)model;

@end
