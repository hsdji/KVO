//
//  drawView.m
//  KVO
//
//  Created by 小飞 on 16/8/7.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "drawView.h"

@implementation drawView


- (void)drawRect:(CGRect)rect {
    [[UIColor redColor] setFill];
    [self.path fill];
}


@end
