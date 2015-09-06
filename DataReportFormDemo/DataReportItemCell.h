//
//  DataReportItemCell.h
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderLabel.h"
#import "BorderView.h"
#import "DataReportItemModel.h"

/*

养护项目
 
 */
@protocol DataReportAddItemEditDelegate;

@interface DataReportItemCell : UITableViewCell

@property(nonatomic,strong)NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet BorderLabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet BorderLabel *workHourLabel;

@property (weak, nonatomic) IBOutlet BorderLabel *unitPriceLabel;

@property (weak, nonatomic) IBOutlet BorderLabel *totalCostLabel;

@property (weak, nonatomic) IBOutlet BorderLabel *operationView;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property(nonatomic,assign)id<DataReportAddItemEditDelegate> delegate;

-(void)setCellWithDataReportItemModel:(DataReportItemModel *)model;

@end
