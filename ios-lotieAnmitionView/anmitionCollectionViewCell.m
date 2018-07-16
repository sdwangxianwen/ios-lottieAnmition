//
//  anmitionCollectionViewCell.m
//  ios-lotieAnmitionView
//
//  Created by wang on 2018/7/16.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "anmitionCollectionViewCell.h"

@interface anmitionCollectionViewCell ()

@property(nonatomic,strong) UIImageView  *backImageView;

@end

@implementation anmitionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self backImageView];
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


@end
