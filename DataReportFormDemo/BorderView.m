//
//  BorderView.m
//  DataReportForm
//
//  Created by apple on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BorderView.h"

#define BORDER_COLOR  [UIColor lightGrayColor].CGColor

@interface BorderView()
{
    CALayer *leftLayer;
    CALayer *rightLayer;
    CALayer *topLayer;
    CALayer *bottomLayer;
}

@end

@implementation BorderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self setViewUI];
}


-(void)setViewUI
{
    leftLayer = [self createLayer];
    leftLayer.frame = CGRectMake(0.0f, 0.0f, 1.0f, self.frame.size.height);
    rightLayer = [self createLayer];
    rightLayer.frame = CGRectMake(self.frame.size.width, 0.0f, 1.0f, self.frame.size.height);
    topLayer = [self createLayer];
    topLayer.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, 1.0f);
    bottomLayer = [self createLayer];
    bottomLayer.frame = CGRectMake(0.0f, self.frame.size.height, self.frame.size.width, 1.0f);
}

-(CALayer *)createLayer
{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = BORDER_COLOR;
    [self.layer addSublayer:layer];
    return layer;
}

@end
