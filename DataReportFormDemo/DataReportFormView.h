//
//  DataReportFormView.h
//  DataReportFormDemo
//
//  Created by apple on 15/8/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataReportItemCell.h"
#import "DataReportDateCell.h"
#import "DataReportTitleCell.h"
#import "DataReportAddItemCell.h"
#import "DataReportAddPartsCell.h"
#import "DataReportPartsCell.h"

@interface DataReportFormView : UITableView<UITableViewDataSource,UITableViewDelegate,DataReportAddItemEditDelegate,DataReportAddPartEditDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;

@end
