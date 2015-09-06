//
//  DataReportItemModel.h
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, DataReportItemType) {
    DataReportItemDate,
    DataReportItemTitle,
    DataReportItemProgramValue,
    DataReportItemProgramCustom,
    DataReportItemPartValue,
    DataReportItemPartCustom,
};

@interface DataReportItemModel : NSObject

@property(nonatomic,assign)DataReportItemType itemType;
@property(nonatomic,strong)NSString *itemName;
@property(nonatomic,strong)NSString *partName;
@property(nonatomic,strong)NSString *partNum;
@property(nonatomic,strong)NSString *count;
@property(nonatomic,strong)NSString *workHours;
@property(nonatomic,strong)NSString *unitPrice;
@property(nonatomic,strong)NSString *totalCost;
@property(nonatomic,strong)NSString *operation;

@end
