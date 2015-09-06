//
//  DataReportFormView.m
//  DataReportFormDemo
//
//  Created by apple on 15/8/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DataReportFormView.h"
#import "DataReportSectionModel.h"
#import "DataReportItemModel.h"

@implementation DataReportFormView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib
{
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle =  UITableViewCellSeparatorStyleNone;
}


#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DataReportSectionModel *sectionModel = self.dataArray[section];
    return sectionModel.dataReportItemArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 23.0f;
}

/*每个section之间的间距*/
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

/* 返回tableView的头部视图 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerViewIden = @"headerView";
    UIView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIden];
    if(headerView == nil){
        headerView = [[UIView alloc]init];
        headerView.backgroundColor = [UIColor clearColor];
    }
    return headerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataReportSectionModel *sectionModel = self.dataArray[indexPath.section];
    DataReportItemModel *itemModel = sectionModel.dataReportItemArray[indexPath.row];

    if(itemModel.itemType == DataReportItemDate){
        
        static NSString *dateCellIden = @"dateCell";
        DataReportDateCell *cell = [tableView dequeueReusableCellWithIdentifier:dateCellIden];
        if(!cell){
            cell = [[[NSBundle mainBundle]loadNibNamed:@"DataReportDateCell" owner:self options:nil] lastObject];
            
        }
    
        return cell;
    }else if (itemModel.itemType == DataReportItemTitle){
        
        static NSString *titleCellIden = @"titleCell";
        DataReportTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIden];
        if(!cell){
            cell = [[[NSBundle mainBundle]loadNibNamed:@"DataReportTitleCell" owner:self options:nil] lastObject];
            
        }
        if(indexPath.row ==1){
            cell.titleLabel.text = @"工时费";
        }else{
            cell.titleLabel.text =@"材料费";
        }
        
        return cell;

    }else if (itemModel.itemType == DataReportItemProgramCustom){
        
        static NSString *addItemCellIden = @"addItemCell";
        DataReportAddItemCell *cell = [tableView dequeueReusableCellWithIdentifier:addItemCellIden];
        if(!cell){
            cell = [[[NSBundle mainBundle]loadNibNamed:@"DataReportAddItemCell" owner:self options:nil] lastObject];
            
        }
        cell.delegate = self;
        cell.indexPath = indexPath;

        return cell;

    }else if (itemModel.itemType == DataReportItemPartCustom){
        
        static NSString *addPartCellIden = @"addPartCell";
        DataReportAddPartsCell *cell = [tableView dequeueReusableCellWithIdentifier:addPartCellIden];
        if(!cell){
            cell = [[[NSBundle mainBundle]loadNibNamed:@"DataReportAddPartsCell" owner:self options:nil] lastObject];
            
        }
        cell.delegate = self;
        cell.indexPath = indexPath;

        return cell;

    }
    else if(itemModel.itemType == DataReportItemProgramValue){
        
        static NSString *cellIden = @"cell";
        DataReportItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
        if(!cell){
            cell = [[[NSBundle mainBundle]loadNibNamed:@"DataReportItemCell" owner:self options:nil] lastObject];
            
        }
        cell.delegate = self;
        cell.indexPath = indexPath;
        [cell setCellWithDataReportItemModel:itemModel];
        return cell;

    }else{
        
        static NSString *partCellIden = @"partCell";
        DataReportPartsCell *cell = [tableView dequeueReusableCellWithIdentifier:partCellIden];
        if(!cell){
            cell = [[[NSBundle mainBundle]loadNibNamed:@"DataReportPartsCell" owner:self options:nil] lastObject];
            
        }
        cell.delegate = self;
        cell.indexPath = indexPath;

        [cell setCellWithDataReportItemModel:itemModel];
        return cell;

    }
    
    return nil;
  
}

#pragma mark - DataReportAddItemEditDelegate

-(void)addItemsToFromViewWithCell:(DataReportAddItemCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    //添加养护项目
    //根据index 获取section模型
    DataReportSectionModel *sectionModel = self.dataArray[indexPath.section];
    
    DataReportItemModel *itemModel = [[DataReportItemModel alloc]init];
    itemModel.itemType = DataReportItemProgramValue;
    itemModel.itemName = @"发动机清洗";
    itemModel.workHours = @"2";
    itemModel.unitPrice = @"380.00";
    itemModel.totalCost = @"380.00";
    itemModel.operation = @"";
    [sectionModel.dataReportItemArray insertObject:itemModel atIndex:indexPath.row];
    
    [self beginUpdates];
    [self insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationBottom];
    [self endUpdates];
    
    NSMutableArray *indexPathArray  = [NSMutableArray array];
    for(int i = 0;i<sectionModel.dataReportItemArray.count;i++){
        NSIndexPath *oneIndexPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
        [indexPathArray addObject:oneIndexPath];
    }
    [self reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)deleteItemsFromFormViewWithCell:(DataReportItemCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    DataReportSectionModel *sectionModel = self.dataArray[indexPath.section];
    [sectionModel.dataReportItemArray removeObjectAtIndex:indexPath.row];
    [self beginUpdates];
    [self deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationBottom];
    [self endUpdates];
    
    NSMutableArray *indexPathArray  = [NSMutableArray array];
    for(int i = 0;i<sectionModel.dataReportItemArray.count;i++){
        NSIndexPath *oneIndexPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
        [indexPathArray addObject:oneIndexPath];
    }
    [self reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - DataReportAddPartEditDelegate

-(void)addPartsToFromViewWithCell:(DataReportAddPartsCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    //根据index 获取section模型
    DataReportSectionModel *sectionModel = self.dataArray[indexPath.section];
    
    DataReportItemModel *itemModel = [[DataReportItemModel alloc]init];
    itemModel.itemType = DataReportItemPartValue;
    itemModel.partName = [NSString stringWithFormat:@"机油格%ld",(long)indexPath.row];
    itemModel.partNum = @"XXXXX";
    itemModel.count = @"2";
    itemModel.unitPrice = @"380.00";
    itemModel.totalCost = @"380.00";
    itemModel.operation = @"";
    [sectionModel.dataReportItemArray insertObject:itemModel atIndex:indexPath.row];
    
    [self beginUpdates];
    [self insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationBottom];
    [self endUpdates];
    
    NSMutableArray *indexPathArray  = [NSMutableArray array];
    for(int i = 0;i<sectionModel.dataReportItemArray.count;i++){
        NSIndexPath *oneIndexPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
        [indexPathArray addObject:oneIndexPath];
    }
    [self reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
}

-(void)deletePartsFromFormViewWithCell:(DataReportPartsCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    DataReportSectionModel *sectionModel = self.dataArray[indexPath.section];
    [sectionModel.dataReportItemArray removeObjectAtIndex:indexPath.row];
    [self beginUpdates];
    [self deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self endUpdates];
    
    NSMutableArray *indexPathArray  = [NSMutableArray array];
    for(int i = 0;i<sectionModel.dataReportItemArray.count;i++){
        NSIndexPath *oneIndexPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
        [indexPathArray addObject:oneIndexPath];
    }
    [self reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
}



@end
