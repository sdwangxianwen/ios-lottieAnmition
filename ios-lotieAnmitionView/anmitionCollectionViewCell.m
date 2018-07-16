//
//  anmitionCollectionViewCell.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/16.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "anmitionCollectionViewCell.h"
#import <Lottie/Lottie.h>

@interface anmitionCollectionViewCell ()

@property(nonatomic,strong) UIImageView  *backImageView;
@property(nonatomic,strong) LOTAnimationView  *animationView;

@property(nonatomic,strong) UILabel *tipLabel;
@property(nonatomic,strong) UISwitch  *anmitionSwitch;

@end

@implementation anmitionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self backImageView];
        [self animationView];
        [self tipLabel];
        [self anmitionSwitch];
    }
    return self;
}


-(UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 200)];
        _backImageView.backgroundColor =  [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1];
        [self.contentView addSubview:_backImageView];
    }
    return _backImageView;
}
-(LOTAnimationView *)animationView {
    if (!_animationView) {
        NSString *string = [NSString stringWithFormat:@"image7"];
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:string ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        _animationView = [LOTAnimationView animationNamed:@"data" inBundle:bundle];
        
        _animationView.frame = _backImageView.frame;
        _animationView.animationSpeed = 1.2;
        _animationView.cacheEnable = NO;
        _animationView.loopAnimation = YES;
        [_animationView play];
        [_backImageView addSubview:_animationView];
    }
    return _animationView;
}

-(UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.backImageView.frame) + 100, 180, 28)];
        _tipLabel.text = @"动画开启/关闭";
        _tipLabel.font = [UIFont systemFontOfSize:15];
        _tipLabel.textColor = [UIColor blueColor];
        [self.contentView addSubview:_tipLabel];
    }
    return _tipLabel;
}
-(UISwitch *)anmitionSwitch {
    if (!_anmitionSwitch) {
        _anmitionSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_tipLabel.frame) + 40, CGRectGetMaxY(self.backImageView.frame) + 100, 80, 44)];
        [self.contentView addSubview:_anmitionSwitch];
        [_anmitionSwitch setOn:YES];
        [_anmitionSwitch addTarget:self action:@selector(anmitionSwitchClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _anmitionSwitch;
}
-(void)anmitionSwitchClick:(UISwitch *)sender {
    if (sender.isOn) {
        [_animationView play];
    } else {
        [_animationView stop];
    }
}


@end
