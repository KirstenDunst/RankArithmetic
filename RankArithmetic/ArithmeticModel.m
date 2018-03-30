//
//  ArithmeticModel.m
//  RankArithmetic
//
//  Created by CSX on 2017/4/1.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ArithmeticModel.h"

@implementation ArithmeticModel

//冒泡排序
/*
 冒泡法都较熟悉。其原理为从a[0]开始，依次将其和后 的元素 较,若 a[0]>a[i]，则交换它们，一直比较到a[n]。同理对a[1],a[2],...a[n-1]处 理，即完成排序; 冒泡法原理简单，但其缺点是交换次数多，效率低。
 */
+ (NSArray *)rankArithmeticForBubbleWithArr:(NSArray *)dataArr{
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:dataArr];
    for (int i = 0; i<[tempArr count]; i++)
    {
        for (int j=i+1; j<[tempArr count]; j++)
        {
            int a = [[tempArr objectAtIndex:i] intValue];
            int b = [[tempArr objectAtIndex:j] intValue];
            if (a > b)
            {
                [tempArr replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",b]];
                [tempArr replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d",a]];
            }
        }
    }
    return tempArr;
}







//选择法
/*
 选择法循环过程与冒泡法致，它还定义了记号k=i,然后依次把a[k]同后元素比较，若a[k]>a[j],则使k=j.最后看看k=i是否还成，不成 则交 换a[k],a[i],这样就 冒泡法省下许多的交换，提高了效率。
 */
+ (NSArray *)rankArithmeticForChooseWithArr:(NSArray *)dataArr{
    static int k;
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:dataArr];
    for (int i = 0; i<dataArr.count-1; i++) {
        k = i;
        for (int j = i+1; j<dataArr.count; j++) {
            if ([tempArr[i]intValue]>[tempArr[j]intValue]) {
                k = j;
            }
        }
        if (i != k) {
            [tempArr exchangeObjectAtIndex:i withObjectAtIndex:k];
        }
    }
    return tempArr;
}






//快速法
/*
 快速法定义了三个参数，(数组首地址*a,要排序数组起始元素下标i,要排 序数组结束元素下标j). 它首先选一个数组元素(一般为a[(i+j)/2],即中间 元素)作为参照，把比它小的元素放到它的左边，比它大的放在右边。然后运用递归，在将它左，右两个子数组排序，最后完成整个数组的排序shou
 */
+ (NSArray *)rankArithmeticForFastWithArr:(NSArray *)dataArr{
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:dataArr];
    return [self fastRankWithArr:tempArr WithBegainIndex:0 andEndIndex:(int)dataArr.count-1];
}
+ (NSMutableArray *)fastRankWithArr:(NSMutableArray *)array WithBegainIndex:(int)low andEndIndex:(int)high{
    if(array == nil || array.count == 0){
        return nil;
    }
    if (low >= high) {
        return nil;
    }
    //取中值
    int middle = low + (high - low)/2;
    NSNumber *prmt = array[middle];
    int i = low;
    int j = high;
    
    //开始排序，使得left<prmt 同时right>prmt
    while (i <= j) {
        //        while ([array[i] compare:prmt] == NSOrderedAscending) {  该行与下一行作用相同
        while ([array[i] intValue] < [prmt intValue]) {
            i++;
        }
        //        while ([array[j] compare:prmt] == NSOrderedDescending) { 该行与下一行作用相同
        while ([array[j] intValue] > [prmt intValue]) {
            j--;
        }
        if(i <= j){
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
            j--;
        }
    }
    if (low < j) {
        [self fastRankWithArr:array WithBegainIndex:low andEndIndex:j];
    }
    if (high > i) {
        [self fastRankWithArr:array WithBegainIndex:i andEndIndex:high];
    }

    return array;
}







//插入法
/*
 插入法是一种比较直观的排序方法。它首先把数组头两个元素排好序，再 依次把后面的元素插入适当的位置。把数组元素插完也就完成了排序。
 */
+ (NSArray *)rankArithmeticForInsertWithArr:(NSArray *)dataArr{
    static int k,j;//临时储存的空间
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:dataArr];
    for (int i = 1; i<tempArr.count; i++) {
        k = [tempArr[i]intValue];
        j = i-1;
        while (j>=0&&k<[tempArr[j]intValue]) {
            int temp = [tempArr[j]intValue];
            [tempArr replaceObjectAtIndex:j+1 withObject:[NSString stringWithFormat:@"%d",temp]];
            j--;
        }
        [tempArr replaceObjectAtIndex:j+1 withObject:[NSString stringWithFormat:@"%d",k]];
    }
    return tempArr;
}











@end
