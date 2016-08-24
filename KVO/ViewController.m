//
//  ViewController.m
//  KVO
//
//  Created by 小飞 on 16/8/6.
//  Copyright © 2016年 小飞. All rights reserved.
//
/**
    KVO:即keyValueObserve
    键值观察模式
    实现的原理：当一个类创建之后会有一个isa指针指向这个累，在没有添加观察者时无论执行什么操作isa指针的指向不会发生变化，当添加完观察者之后，系统会为我们自动派生一个类，类的名字大概是叫做NSKVONotifying_类名：PS：有一个student类  含有age、sex对象，在没有添加观察者的时间无论调用sge、sex的getter方法 或者是setter方法 isa指针指向的都是student类。当添加完键值观察者之后（这里假设对age添加观察）系统为我们派生了一个新的类 类名叫做NSKVONotifting_student的类，在这个类中，系统为我们重新写了被观察对象的setter方法（这里重写了age的setter方法）在这个setter方法中，它不仅执行的赋值操作，而且还主动的调用了observeValueForKeyPath ofObject change context这个方法。再次访问这个类的对象的时间此时的isa指针指向的是由系统派生的NSKVONotifying_student的这个类，所以在进行赋值操作的时间不仅对这个对象赋值了，而且还主动的调用了observeValueForKeyPath ofObject change context方法。
 */
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
