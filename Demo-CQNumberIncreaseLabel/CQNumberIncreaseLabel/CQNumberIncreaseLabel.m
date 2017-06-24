//
//  CQNumberIncreaseLabel.m
//  Demo-CQNumberIncreaseLabel
//
//  Created by 蔡强 on 2017/6/24.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "CQNumberIncreaseLabel.h"

@implementation CQNumberIncreaseLabel{
    NSTimer *_timer; // 控制刷新频率的timer
    NSInteger _startNumber; // 起始数字
    NSInteger _endNumber; // 最终的数字
    NSInteger _intervalNumber; // 每次增加的数
}

/** 启动递增 */
- (void)increaseNumberWithEndNumber:(NSInteger)endNumber{
    _endNumber = endNumber;
    
    _startNumber = 0;
    
    self.text = @"0";
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    
    // 刷新间隔时间
    CGFloat timeInterval;
    
    if (endNumber == 0) { // 如果是0直接结束
        self.text = @"0";
        return;
    }else if (endNumber < 10){
        timeInterval = 1.0 / endNumber;
    }else if (endNumber < 100){
        timeInterval = 2.0 / endNumber;
    }else if (endNumber < 500){
        timeInterval = 3.0 / endNumber;
    }else if (endNumber < 1000){
        timeInterval = 4.0 / endNumber;
    }else{
        timeInterval = 5.0 / endNumber;
    }
    
    // 时间间距不能小于0.01
    if (timeInterval < 0.01) {
        timeInterval = 0.01;
        // 递增的时间最多5秒
        _intervalNumber = endNumber / 100;
        
    }else{
        _intervalNumber = 1;
    }
    
    NSLog(@"timeInterval===%f",timeInterval);
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(refreshText) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}

/** 刷新label内容 */
- (void)refreshText{
    _startNumber += _intervalNumber;
    if (_startNumber > _endNumber) {
        [_timer invalidate];
        _timer = nil;
        self.text = [NSString stringWithFormat:@"%ld",_endNumber];
    }else{
        self.text = [NSString stringWithFormat:@"%ld",_startNumber];
    }
}

@end
