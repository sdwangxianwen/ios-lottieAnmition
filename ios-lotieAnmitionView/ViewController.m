//
//  ViewController.m
//  ios-lotieAnmitionView
//
//  Created by 王文文 on 2018/7/15.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>
#import "anmitionModel.h"
#import <YYModel.h>
#import "MyPullulationCollectionViewLayout.h"
#import "anmitionCollectionViewCell.h"

#import "hudViewController.h"

#define kscreenw [UIScreen mainScreen].bounds.size.width
#define kscreenh [UIScreen mainScreen].bounds.size.height



@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView  *collectionView;
@property(nonatomic,strong) MyPullulationCollectionViewLayout *layout;
@property(nonatomic,strong) anmitionCollectionViewCell *cell;
@property(nonatomic,strong) NSArray  *arr;;






@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initCollectionView];
    self.arr = [NSArray yy_modelArrayWithClass:[anmitionModel class] json:[anmitionModel getata]];
}



-(void)initCollectionView {
    self.layout = [[MyPullulationCollectionViewLayout alloc] init];
    self.layout.itemSize = CGSizeMake(320, kscreenh);
    //设置内边距
    CGFloat dis = (kscreenw - _layout.itemSize.width) * 0.5;
    _layout.sectionInset = UIEdgeInsetsMake(-20, dis, 0, dis);
    
    
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kscreenw, kscreenh) collectionViewLayout:self.layout];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self.view addSubview:self.collectionView];
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    self.collectionView.backgroundColor =  [UIColor grayColor];
    [self.collectionView registerClass:[anmitionCollectionViewCell class] forCellWithReuseIdentifier:@"anmitionCollectionViewCellID"];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSString *identifier=[NSString stringWithFormat:@"anmitionviewcellID%ld%ld",(long)indexPath.section,(long)indexPath.row];
//    [collectionView registerClass:[anmitionCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    anmitionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"anmitionCollectionViewCellID" forIndexPath:indexPath];
    cell.model = self.arr[indexPath.row];
    

    cell.index = indexPath.row + 1;
    return cell;
}

//-(void)scrollViewDidScroll:(UICollectionView *)collectionView {
//    
//    int page = collectionView.contentOffset.x / self.layout.itemSize.width;
//   
//    
//
//    
//    NSIndexPath *indexpath = [[NSIndexPath alloc] initWithIndex:page];
//    
////    anmitionCollectionViewCell * cell = (anmitionCollectionViewCell *)[collectionView  cellForItemAtIndexPath:indexpath];
//    NSLog(@"cell:%@-----page%d",self.cell,page);
//    CGRect cellRect = [_collectionView convertRect:self.cell.frame toView:_collectionView];
//    
//    CGRect rectInSuperview = [_collectionView convertRect:cellRect toView:self.view];
//    if ( rectInSuperview.origin.x > kscreenw || rectInSuperview.origin.x + rectInSuperview.size.width < 0 ) {
//        // 对已经移出屏幕的 Cell 做相应的处理
//        NSLog(@"%@",self.cell.backImageView.image);
//        [self.cell.animationView stop];
//        [self.cell.animationView removeFromSuperview];
//        
//    }
//}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[LOTAnimationCache sharedCache] clearCache];
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
