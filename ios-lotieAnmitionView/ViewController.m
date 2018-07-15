//
//  ViewController.m
//  ios-lotieAnmitionView
//
//  Created by 王文文 on 2018/7/15.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "ViewController.h"
#import "Lottie.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    NSInteger rank = 3;
    CGFloat rankMargin = 0;
    CGFloat rowMargin = 0;
    NSUInteger index = 7;
    
    CGFloat itemw = [UIScreen mainScreen].bounds.size.width / 3;
    CGFloat itmH =200;
    
    for (int i = 0 ; i< index; i++) {
        //Item X轴
        CGFloat X = (i % rank) * (itemw + rankMargin);
        //Item Y轴
        NSUInteger Y = (i / rank) * (itmH +rowMargin);
        //Item top
        CGFloat top = 0;
        
        NSString *string = [NSString stringWithFormat:@"image%d",i+1];
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:string ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        
        LOTAnimationView *anmView = [LOTAnimationView animationNamed:@"data" inBundle:bundle];
        
        anmView.frame = CGRectMake(X, Y+top, itemw, itmH);
        anmView.animationSpeed = 1.2;
        anmView.cacheEnable = NO;
        anmView.loopAnimation = YES;
        [anmView play];
        [self.view addSubview:anmView];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
