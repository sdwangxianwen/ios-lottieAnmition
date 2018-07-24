//
//  LOTBundle.m
//  Lottie_iOS
//
//  Created by wang on 2018/7/23.
//  Copyright © 2018年 Airbnb. All rights reserved.
//

#import "LOTBundle.h"


@interface LOTBundle ()<LOTBundleDelegate>

// 私有缓存
@property(nonatomic,strong) NSMutableDictionary * cache;
// 资源目录
@property(nonatomic,copy) NSString* dir;
// 资源包
@property(nonatomic,strong) NSBundle* innerBundle;

@property(nonatomic,weak) id<LOTBundleDelegate>bundleDelegate;

@end


@implementation LOTBundle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cache = [NSMutableDictionary dictionary];
        self.bundleDelegate = self;
    }
    return self;
}

-(void)setResourceBundle:(NSBundle *) bundle path:(NSString *) path {
    [self clearCache];
    _innerBundle = bundle;
    _dir = path;
}


-(UIImage *)imageForKey:(NSString *)key {
    UIImage *image = [_cache objectForKey: key];
    if (image) {
        return image;
    }
    if (_innerBundle) {
        image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@",_dir,key]];
        [_cache setObject:image forKey:key];
    }
    
    return image;
}
-(void)clearCache {
    [self.cache removeAllObjects];
}


@end
