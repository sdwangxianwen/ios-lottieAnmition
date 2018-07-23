//
//  hudViewController.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/17.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "hudViewController.h"
#import <Lottie/Lottie.h>
#import "MBProgressHUD+hud.h"


@interface hudViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>

@property(nonatomic,strong) NSArray  *dataArr;
@property(nonatomic,strong) UITableView  *mainTableView;
@property(nonatomic,strong) LOTAnimationView *anmView;
@property(nonatomic,strong) NSMutableArray  *arrM;

@end

@implementation hudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.arrM = [NSMutableArray array];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"成功" style:(UIBarButtonItemStyleDone) target:self action:@selector(stop)];;
    
//    [self demo];
//    [self demo1];
//    [self demo2];
    [self demo3];
    
//    self.dataArr = @[@"加载",@"失败",@"成功"];
//
//    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
//    [self.view addSubview:self.mainTableView];
//    self.mainTableView.delegate = self;
//    self.mainTableView.dataSource = self;
//
//    self.mainTableView.tableFooterView = [UIView new];
}


-(void)demo3 {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 40, 20)];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:@"成功" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 140, 40, 20)];
    button1.titleLabel.font = [UIFont systemFontOfSize:15];
    [button1 setTitle:@"失败" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 180, 40, 20)];
    button2.titleLabel.font = [UIFont systemFontOfSize:15];
    [button2 setTitle:@"加载" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(150, 180, 40, 20)];
    button3.titleLabel.font = [UIFont systemFontOfSize:15];
    [button3 setTitle:@"停止" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(button3Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}
-(void)buttonClicked:(UIButton *)sender {
    [MBProgressHUD showSuccess];
}
-(void)button1Clicked:(UIButton *)sender {
    [MBProgressHUD showError];
}
-(void)button2Clicked:(UIButton *)sender {
    [MBProgressHUD showLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hid];
    });
}
-(void)button3Clicked:(UIButton *)sender {
    [MBProgressHUD hid];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:(@"cellID")];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    }
    if (indexPath.row == 1) {
        
    }
    if (indexPath.row == 2) {
        
    }
}

-(void)demo1 {
    UIView * redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    CABasicAnimation * animaiton = [CABasicAnimation animationWithKeyPath:@"position"];
    animaiton.removedOnCompletion = NO;
    animaiton.fillMode = kCAFillModeForwards;
    animaiton.duration = 2;
    animaiton.repeatCount = MAXFLOAT;
    animaiton.delegate = self;
    
    animaiton.toValue = [NSValue valueWithCGPoint:CGPointMake(400, 400)];
    [redView.layer addAnimation:animaiton forKey:nil];

}

-(void)demo2 {
    
    NSString *string = [NSString stringWithFormat:@"image1"];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:string ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    LOTAnimationView *anmView = [LOTAnimationView animationFromJSON:dict inBundle:bundle];
    self.anmView = anmView;
    //        LOTAnimationView *anmView = [LOTAnimationView animationNamed:@"loading" inBundle:bundle];
    self.anmView = anmView;
    anmView.frame = self.view.frame;
//    anmView.animationSpeed = -1;
    anmView.isLoading = YES;
    anmView.loopAnimation = YES;

    [anmView play];
    
    [self.view addSubview:anmView];
    
    
    
}

-(void)stop {
//    [self.anmView stop];
    [MBProgressHUD showSuccess];
}

-(void)demo {
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
        
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:jsonPath];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
         LOTAnimationView *anmView = [LOTAnimationView animationFromJSON:dict inBundle:bundle];
        
//        LOTAnimationView *anmView = [LOTAnimationView animationNamed:@"loading" inBundle:bundle];
        self.anmView = anmView;
        anmView.frame = CGRectMake(X, Y+top, itemw, itmH);
        anmView.animationSpeed = 1.2;
        anmView.cacheEnable = NO;
        anmView.loopAnimation = YES;
        [anmView play];
        [self.arrM addObject:anmView];
        [self.view addSubview:anmView];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.anmView play];
//    [MBProgressHUD showLoading];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hid];
//    });
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pause:) name:@"enterBack" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(start:) name:@"anmition" object:nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
   
    
}
-(void)pause:(NSNotification *)notice {
    [self.anmView pause];
}
-(void)start:(NSNotification *)notice {
    [self.anmView play];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)complete {
    NSLog(@"zhixingle");
}



@end
