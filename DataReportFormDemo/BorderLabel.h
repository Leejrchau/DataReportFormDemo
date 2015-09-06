//
//  BorderLabel.h
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BorderLabel : UILabel

/* L R T B 分别代表左右 上下  borderType中含有四个字符中的某个 表示这个字符对应的边框显示 */
@property(nonatomic,strong)NSString *borderType;

@end
