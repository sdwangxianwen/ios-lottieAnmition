//
//  anmitionModel.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/18.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "anmitionModel.h"

@implementation anmitionModel

+(NSArray *)getata {
    NSArray *arr = @[@{@"backImage" :@"battle_pullulation_grey_1",
                       @"isAnmition" :@(YES),
                       @"bundleName" :@"image1"
                       },
                     @{@"backImage" :@"battle_pullulation_grey_2",
                       @"isAnmition" :@(NO),
                       @"bundleName" :@"image2"
                       },
                     @{@"backImage" :@"battle_pullulation_grey_3",
                       @"isAnmition" :@(NO),
                       @"bundleName" :@"image3"
                       },
                     @{@"backImage" :@"battle_pullulation_grey_4",
                       @"isAnmition" :@(NO),
                       @"bundleName" :@"image4"
                       },
                     @{@"backImage" :@"battle_pullulation_grey_5",
                       @"isAnmition" :@(NO),
                       @"bundleName" :@"image5"
                       },
                     @{@"backImage" :@"battle_pullulation_grey_6",
                       @"isAnmition" :@(NO),
                       @"bundleName" :@"image6"
                       },
                     @{@"backImage" :@"battle_pullulation_grey_7",
                       @"isAnmition" :@(NO),
                       @"bundleName" :@"image7"
                       }];
    
    return arr;
}

@end
