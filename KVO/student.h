//
//  student.h
//  KVO
//
//  Created by 小飞 on 16/8/6.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,studentType) {
    studentTypeMan,
    studentTypeWoman
};

@interface student : NSObject
@property (nonatomic,assign)NSInteger scro;
@property (nonatomic,assign)studentType name;
+(NSArray *)studentMOdel;
@end
