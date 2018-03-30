//
//  ViewController.m
//  RankArithmetic
//
//  Created by CSX on 2017/4/1.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ViewController.h"
#import "ArithmeticModel.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *arr = @[@"9",@"4",@"3",@"5",@"6",@"1",@"8",@"7",@"2"].copy;
    
    //排序方法
    
//    NSLog(@"%@",[ArithmeticModel rankArithmeticForFastWithArr:arr]);
    NSLog(@"%@",[ArithmeticModel rankArithmeticForChooseWithArr:arr]);
    NSLog(@"%@",[ArithmeticModel rankArithmeticForBubbleWithArr:arr]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
