//
//  LOTBundle.h
//  Lottie_iOS
//
//  Created by wang on 2018/7/23.
//  Copyright © 2018年 Airbnb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lottie.h"




@interface LOTBundle : NSBundle





// 初始化资源包方式
-(void)setResourceBundle:(NSBundle *) bundle path:(NSString *) path;


// 初始化本地目录方式 待定


// 清除缓存
-(void)clearCache;



@end
