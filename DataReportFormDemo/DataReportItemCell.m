//
//  DataReportItemCell.m
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DataReportItemCell.h"
#import "DataReportAddItemCell.h"

@implementation DataReportItemCell

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
    self.itemNameLabel.text = model.itemName;
    self.workHourLabel.text = model.workHours;
    self.unitPriceLabel.text = model.unitPrice;
    self.totalCostLabel.text = model.totalCost;
    if([model.operation isEqualToString:@""]){
        self.deleteButton.hidden = NO;
        self.operationView.text = @"";
    }else{
        self.deleteButton.hidden = YES;
        self.operationView.text = model.operation;
    }
}

- (IBAction)deleteAction:(id)sender {
    self.deleteButton.userInteractionEnabled = NO;
    if([self.delegate respondsToSelector:@selector(deleteItemsFromFormViewWithCell:withIndexPath:)]){
        [self.delegate deleteItemsFromFormViewWithCell:self withIndexPath:self.indexPath];
    }
}


@end
