//
//  anmitionCollectionViewCell.h
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/16.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Lottie/Lottie.h>

//@protocol anmitionCollectionViewCellDelegate <NSObject>
//-(void)stopAnmition; //关闭动画
//-(void)startAnmitin; //开启动画
//@end

@interface anmitionCollectionViewCell : UICollectionViewCell
@property(nonatomic,assign) NSInteger index;

@property(nonatomic,strong) LOTAnimationView  *animationView;

-(void)startAnmition;
@end
