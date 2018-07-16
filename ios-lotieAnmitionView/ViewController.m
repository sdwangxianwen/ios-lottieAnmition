//
//  ViewController.m
//  ios-lotieAnmitionView
//
//  Created by 王文文 on 2018/7/15.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>

#import "MyPullulationCollectionViewLayout.h"
#import "anmitionCollectionViewCell.h"

#define kscreenw [UIScreen mainScreen].bounds.size.width
#define kscreenh [UIScreen mainScreen].bounds.size.height

static NSString * const anmitionCollectionViewCellID = @"anmitionCollectionViewCellID";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView  *collectionView;
@property(nonatomic,strong) MyPullulationCollectionViewLayout *layout;
@property(nonatomic,strong) anmitionCollectionViewCell  *cell;

@property(nonatomic,assign) BOOL isAnimate;         //是否执行动画 ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollectionView];
}

-(void)initCollectionView {
    self.layout = [[MyPullulationCollectionViewLayout alloc] init];
    
    //设置内边距
//    CGFloat dis = (kscreenw - _layout.itemSize.width) * 0.5;
//    _layout.sectionInset = UIEdgeInsetsMake(-20, dis, 0, dis);
    
    self.layout.itemSize = CGSizeMake(kscreenw, kscreenh);
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kscreenw, kscreenh) collectionViewLayout:self.layout];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[anmitionCollectionViewCell class] forCellWithReuseIdentifier:anmitionCollectionViewCellID];
    [self.view addSubview:self.collectionView];
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    anmitionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:anmitionCollectionViewCellID forIndexPath:indexPath];
    return cell;
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    _isAnimate = NO;
    NSIndexPath *indexPath = nil;
    NSInteger i = 0;
    while (indexPath == nil) {
        CGPoint targetCenter = CGPointMake(targetContentOffset->x + WIDTH + 8 * i, HEIGHT);
        indexPath = [self.collectionView indexPathForItemAtPoint:targetCenter];
        i++;
    }
//    [self willChangeToIndex:indexPath.row];
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
