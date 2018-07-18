//
//  anmitionModel.h
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/18.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface anmitionModel : NSObject
@property(nonatomic,copy) NSString *backImage;
@property(nonatomic,assign) BOOL isAnmition;
@property(nonatomic,copy) NSString *bundleName;
+(NSArray *)getata;

@end
