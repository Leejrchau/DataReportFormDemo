//
//  DataReportPartsCell.m
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DataReportPartsCell.h"
#import "DataReportAddPartsCell.h"

@implementation DataReportPartsCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.userInteractionEnabled = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellWithDataReportItemModel:(DataReportItemModel *)model
{
    self.partNameLabel.text = model.partName;
    self.partNumLabel.text = model.partNum;
    self.countsLabel.text = model.count;
    self.unitPriceLabel.text = model.unitPrice;
    self.totalCostLabel.text = model.totalCost;
    if([model.operation isEqualToString:@""]){
        self.deleteButton.hidden = NO;
        self.operationLabel.text = @"";
    }else{
        self.deleteButton.hidden = YES;
        self.operationLabel.text = model.operation;
    }

}
- (IBAction)deleteAction:(id)sender {
    //控制 多次快速点击按钮
    self.deleteButton.userInteractionEnabled = NO;
    if([self.delegate respondsToSelector:@selector(deletePartsFromFormViewWithCell:withIndexPath:)]){
        [self.delegate deletePartsFromFormViewWithCell:self withIndexPath:self.indexPath];
    }
    
}



@end
