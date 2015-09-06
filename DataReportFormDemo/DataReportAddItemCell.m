//
//  DataReportAddItemCell.m
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DataReportAddItemCell.h"

@implementation DataReportAddItemCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.addButton.userInteractionEnabled = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addItemAction:(id)sender {
    self.addButton.userInteractionEnabled = NO;
    if([self.delegate respondsToSelector:@selector(addItemsToFromViewWithCell:withIndexPath:)]){
        [self.delegate addItemsToFromViewWithCell:self withIndexPath:self.indexPath];
    }
    
}



@end
