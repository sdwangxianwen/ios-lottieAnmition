//
//  MBProgressHUD+hud.h
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/20.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "MBProgressHUD.h"
#import <Lottie/Lottie.h>


@interface HUDCustomView : UIView
@property(nonatomic,strong) NSString  *json;
@property (nonatomic,strong) LOTAnimationView *animView;
@end

@interface MBProgressHUD (hud)

+(void)show;

+(void)showLoading;
+(void)hid;

+(void)showSuccess;
+(void)showSuccess:(NSString *)status;

+(void)showError;
+(void)showError:(NSString *)status;

@end
