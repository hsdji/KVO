//
//  student.m
//  KVO
//
//  Created by 小飞 on 16/8/6.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "student.h"

@implementation student
+(NSArray *)studentMOdel
{
    student *s1 = [student new];
    s1.name = studentTypeMan;
    s1.scro = 8;
    
    student *s2 = [student new];
    s2.name = studentTypeMan;
    s2.scro = 11;
    
    student *s3 = [student new];
    s3.name = studentTypeMan;
    s3.scro = 12;
    
    student *s4 = [student new];
    s4.name = studentTypeMan;
    s4.scro = 13;
    
    student *s5 = [student new];
    s5.name = studentTypeMan;
    s5.scro = 14;
    
    student *s6 = [student new];
    s6.name = studentTypeMan;
    s6.scro = 15;
    
    student *s7 = [student new];
    s7.name = studentTypeWoman;
    s7.scro = 16;
    student *s8 = [student new];
    s8.name = studentTypeWoman;
    s8.scro = 23;
    student *s9 = [student new];
    s9.name = studentTypeWoman;
    s9.scro = 16;
    student *s10 = [student new];
    s10.name = studentTypeWoman;
    s10.scro = 16;
    student *s11 = [student new];
    s11.name = studentTypeWoman;
    s11.scro = 16;
    student *s17 = [student new];
    s17.name = studentTypeWoman;
    s17.scro = 106;
    student *s27 = [student new];
    s27.name = studentTypeWoman;
    s27.scro = 316;
    student *se7 = [student new];
    se7.name = studentTypeWoman;
    se7.scro = 146;
    return @[s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s17,s27,se7];
}
@end
