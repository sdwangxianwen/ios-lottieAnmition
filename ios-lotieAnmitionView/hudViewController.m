//
//  hudViewController.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/17.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "hudViewController.h"
#import <Lottie/Lottie.h>


@interface hudViewController ()<UITableViewDelegate,UITableViewDataSource>

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
    
    [self demo];
    
//    self.dataArr = @[@"加载",@"失败",@"成功"];
//
//    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
//    [self.view addSubview:self.mainTableView];
//    self.mainTableView.delegate = self;
//    self.mainTableView.dataSource = self;
//
//    self.mainTableView.tableFooterView = [UIView new];
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
        
        LOTAnimationView *anmView = [LOTAnimationView animationNamed:@"data" inBundle:bundle];
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

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    for (LOTAnimationView *anmView in self.arrM) {
        [anmView stop];
        [anmView removeFromSuperview];
    }
    
}


@end
