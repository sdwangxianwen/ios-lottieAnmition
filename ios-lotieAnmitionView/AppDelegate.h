//
//  AppDelegate.h
//  ios-lotieAnmitionView
//
//  Created by 王文文 on 2018/7/15.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

