//
//  MBProgressHUD+hud.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/20.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "MBProgressHUD+hud.h"


@interface HUDCustomView ()

@end


@implementation HUDCustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 80, 80)];
    if (self) {
      
    }
    return self;
}

-(void)setJson:(NSString *)json {
    _json = json;
    [self animView];
}

-(LOTAnimationView *)animView {
    if (!_animView) {
        _animView = [LOTAnimationView animationNamed:self.json];
        self.animView.frame = self.bounds;
        [self addSubview:self.animView];
//        self.animView.loopAnimation = YES;
        [self.animView play];
    }
    return _animView;
}


- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        [self.animView play];
    } else {
        [self.animView stop];
    }
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(80, 80);
}

@end


@implementation MBProgressHUD (hud)

+(void)show {
    [self showWith:nil json:@"loading" view:nil isHid:NO];
}
+(void)showWith:(NSString *)status json:(NSString *)json view:(UIView *)view  isHid:(BOOL)ishid{
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.backgroundColor = [UIColor clearColor];
    hud.mode = MBProgressHUDModeCustomView;
    [hud setUserInteractionEnabled:YES];
    HUDCustomView *customView = [[HUDCustomView alloc] init];
    customView.json = json;
    customView.animView.loopAnimation = !ishid;
    hud.detailsLabel.text = status;
    hud.customView = customView;
    
    if (ishid) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hid];
        });
    }
}

+(void)showLoading {
    [self show];
}

+(void)showError {
    [self showError:nil];
}
+(void)showError:(NSString *)status {
    [self showWith:status json:@"error" view:nil isHid:YES];
}
+(void)showSuccess:(NSString *)status {
    [self showWith:status json:@"success" view:nil isHid:YES];
}
+(void)showSuccess {
    [self showSuccess:nil];
}


+(void)hid {
    [self hidInView:nil];
}
+(void)hidInView:(UIView *)view {
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
