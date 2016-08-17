//
//  ViewController.m
//  KVO
//
//  Created by 小飞 on 16/8/6.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "ViewController.h"
#import "student.h"
@interface ViewController ()
@property (nonatomic,strong)student *s;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    student *s = [[student alloc]init];
    self.s = s;
    s.scro = 10;
    [s addObserver:self forKeyPath:@"scro" options:NSKeyValueObservingOptionOld context:@"成绩"];
    s.scro = 100;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{

    NSLog(@"对象是%@\n改变的值时%@\n额外附加信息%@",object,change,context);
    NSLog(@"%@",[object valueForKey:@"scro"]);
}


-(void)dealloc{
    [self.s removeObserver:self forKeyPath:@"scro"];
}

@end
