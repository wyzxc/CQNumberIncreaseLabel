//
//  ViewController.m
//  Demo-CQNumberIncreaseLabel
//
//  Created by 蔡强 on 2017/6/24.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "ViewController.h"
#import "CQNumberIncreaseLabel.h"

@interface ViewController ()

@property (nonatomic,strong) CQNumberIncreaseLabel *numberIncreaseLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建数字递增label
    self.numberIncreaseLabel = [[CQNumberIncreaseLabel alloc]initWithFrame:CGRectMake(90, 90, 90, 30)];
    [self.view addSubview:self.numberIncreaseLabel];
    
    // 创建启动按钮
    UIButton *startButton = [[UIButton alloc]initWithFrame:CGRectMake(90, 150, 90, 30)];
    [self.view addSubview:startButton];
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
}

// 开始递增
- (void)start{
    [self.numberIncreaseLabel increaseNumberWithEndNumber:3333];
}

@end
