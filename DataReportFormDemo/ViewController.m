//
//  ViewController.m
//  DataReportFormDemo
//
//  Created by apple on 15/8/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DataReportFormView.h"
#import "DataReportSectionModel.h"
#import "DataReportItemModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DataReportFormView *dataReportFormView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.dataReportFormView.dataArray = [[NSMutableArray alloc]init];
    //10个分组
    for(int i =0;i<10;i++){
        
        DataReportSectionModel *sectionModel = [[DataReportSectionModel alloc]init];
        //每个分组中的cell模型
        sectionModel.dataReportItemArray = [[NSMutableArray alloc]init];
        
        for(int j = 0;j<11;j++){
            
            DataReportItemModel *itemModel = [[DataReportItemModel alloc]init];
            if(j == 0){
                itemModel.itemType = DataReportItemDate;

            }
            
            if(j == 1){
                itemModel.itemType = DataReportItemTitle;
            }
            
            if(j>=2&&j<=4){
                itemModel.itemType = DataReportItemProgramValue;
                if(j==2){
                    itemModel.itemName = @"建议养护项目";
                    itemModel.workHours = @"工时";
                    itemModel.unitPrice = @"单价(元)";
                    itemModel.totalCost = @"费用合计(元)";
                    itemModel.operation = @"操作";
                }else{
                    
                    itemModel.itemName = @"发动机清洗";
                    itemModel.workHours = @"2";
                    itemModel.unitPrice = @"380.00";
                    itemModel.totalCost = @"380.00";
                    itemModel.operation = @"";
                    
                }

            }
            
            if(j==5){
                itemModel.itemType = DataReportItemProgramCustom;
            }
            
            if(j == 6){
                itemModel.itemType = DataReportItemTitle;
            }
            
            if(j>6&&j<=9){
                
                if(j==7){
                    itemModel.partName = @"备件名称";
                    itemModel.partNum = @"备件编号";
                    itemModel.count = @"数量";
                    itemModel.unitPrice = @"单价(元)";
                    itemModel.totalCost = @"费用合计(元)";
                    itemModel.operation = @"操作";
                }else{
                    
                    itemModel.partName = @"机油格";
                    itemModel.partNum = @"XXXX";
                    itemModel.count = @"2";
                    itemModel.unitPrice = @"380.00";
                    itemModel.totalCost = @"380.00";
                    itemModel.operation = @"";

                }
                itemModel.itemType = DataReportItemPartValue;
                
            }
            
            if(j==10){
                
                itemModel.itemType = DataReportItemPartCustom;
            }
            
            [sectionModel.dataReportItemArray addObject:itemModel];
        }
        
        [self.dataReportFormView.dataArray addObject:sectionModel];
    }
    
    [self.dataReportFormView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
