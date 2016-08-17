//
//  jianpantongzhi.m
//  KVO
//
//  Created by 小飞 on 16/8/7.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "jianpantongzhi.h"

@interface jianpantongzhi ()
@property (nonatomic,strong)UITextField *texf;
@end

@implementation jianpantongzhi

- (void)viewDidLoad {
    [super viewDidLoad];
    self.texf = [[UITextField alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-20, self.view.frame.size.width, 20)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.texf.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.texf];
  
    
}
//在界面即将呈现是添加键盘的监听

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(openkeyBoard:) name:UIKeyboardWillShowNotification object:nil];
    
    center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(openkeyBoard1:) name:UIKeyboardWillHideNotification object:nil];
    
}
//在界面隐藏时取消监听
-(void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
     [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)openkeyBoard:(NSNotification *)sender{
    NSLog(@"键盘弹起-------%@",sender);
//    从通知中去取键盘的高度
    self.texf.frame = CGRectMake(0, [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height+20, self.view.frame.size.width, 20);
}

-(void)openkeyBoard1:(NSNotificationCenter *)sender{
    NSLog(@"键盘收回");
    self.texf.frame = CGRectMake(0, self.view.frame.size.height-20, self.view.frame.size.width, 20);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.texf resignFirstResponder];
}
@end
