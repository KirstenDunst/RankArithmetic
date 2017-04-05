//
//  ArithmeticModel.h
//  RankArithmetic
//
//  Created by CSX on 2017/4/1.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArithmeticModel : NSObject

//冒泡排序
+ (NSArray *)rankArithmeticForBubbleWithArr:(NSArray *)dataArr;

//选择法
+ (NSArray *)rankArithmeticForChooseWithArr:(NSArray *)dataArr;


//快速法
+ (NSArray *)rankArithmeticForFastWithArr:(NSArray *)dataArr;


//插入法
+ (NSArray *)rankArithmeticForInsertWithArr:(NSArray *)dataArr;



@end
