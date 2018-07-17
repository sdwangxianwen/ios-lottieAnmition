//
//  anmitionCollectionViewCell.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/16.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "anmitionCollectionViewCell.h"


@interface anmitionCollectionViewCell ()

@property(nonatomic,strong) UIImageView  *backImageView; //背景图片


@property(nonatomic,strong) UILabel *tipLabel; //tishi
@property(nonatomic,strong) UISwitch  *anmitionSwitch; //动画开启关闭
@property(nonatomic,strong) UILabel  *titleLabel; //标题

@end

@implementation anmitionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(anmition:) name:@"anmition" object:nil];
        
        self.backgroundColor =  [UIColor clearColor];
        [self backImageView];
        [self titleLabel];
        
        [self tipLabel];
        [self anmitionSwitch];
    }
    return self;
}


-(void)anmition:(NSNotification *)notice {
    if (self.anmitionSwitch.isOn) {
        [_animationView play];
    }
    
}



-(UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44, self.bounds.size.width, self.bounds.size.height - 200)];
        
        _backImageView.layer.borderWidth = 10;
        _backImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _backImageView.layer.cornerRadius = 4;
        _backImageView.clipsToBounds = YES;
        [self.contentView addSubview:_backImageView];
    }
    return _backImageView;
}
-(LOTAnimationView *)animationView {
    if (!_animationView) {
        NSString *string = [NSString stringWithFormat:@"image%ld",self.index];
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:string ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        _animationView = [LOTAnimationView animationNamed:@"data" inBundle:bundle];
        
    
        _animationView.autoReverseAnimation = YES;
        _animationView.frame = _backImageView.frame;
        _animationView.animationSpeed = 1.2;
        _animationView.cacheEnable = NO;
        _animationView.loopAnimation = YES;
//        [_animationView play];
        [_backImageView addSubview:_animationView];
    }
    return _animationView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, _backImageView.frame.size.width, 18)];
        [_backImageView addSubview:_titleLabel];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
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
        [_anmitionSwitch setOn:NO];
        [_anmitionSwitch addTarget:self action:@selector(anmitionSwitchClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _anmitionSwitch;
}


-(void)setIndex:(NSInteger)index {
    _index = index;
    _backImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"bg%ld",index]];
    _titleLabel.text = [NSString stringWithFormat:@"第%ld个",index];
    [self animationView];
}

-(void)anmitionSwitchClick:(UISwitch *)sender {
    if (sender.isOn) {
        [_animationView play];
    } else {
        [_animationView stop];
    }
}



-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
