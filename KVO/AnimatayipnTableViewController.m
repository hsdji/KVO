//
//  AnimatayipnTableViewController.m
//  KVO
//
//  Created by 小飞 on 16/8/7.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "AnimatayipnTableViewController.h"

@interface AnimatayipnTableViewController ()
@property (nonnull,strong)UIDynamicAnimator *behavior;
@property (nonnull,strong)UILabel *lab;
@end

@implementation AnimatayipnTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [drawView new];
    self.lab = [[UILabel alloc]initWithFrame:CGRectMake(110, 0, 100, 200)];
    self.lab.backgroundColor = [UIColor redColor];
    self.behavior = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    [self.view addSubview:self.lab];
    
    UIGravityBehavior *b = [[UIGravityBehavior alloc]initWithItems:@[self.lab]]
    ;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.behavior addBehavior:b];
//    碰撞
    UICollisionBehavior *c = [[UICollisionBehavior alloc]initWithItems:@[self.lab]];
//  创建仕途四周变成边缘
    c.translatesReferenceBoundsIntoBoundary = YES;

//    使用UIbeziPath创建模拟模板的举行
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 500, 280, 20) cornerRadius:10.0];
    [c addBoundaryWithIdentifier:@"aa" forPath:path];
    
    drawView *bgview = (drawView *)self.view;
    bgview.path = path;
    [bgview setNeedsDisplay];
    //    添加碰撞行为到场景中
    [self.behavior addBehavior:c];
}



@end
