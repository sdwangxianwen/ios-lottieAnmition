//
//  MyPullulationCollectionViewLayout.m
//  School
//
//  Created by Syzn on 2017/12/5.
//  Copyright © 2017年 51talk. All rights reserved.
//

#import "MyPullulationCollectionViewLayout.h"

@implementation MyPullulationCollectionViewLayout

//全部的布局所需对象
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributeArray = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attribute in attributeArray) {
        //计算与中心点之间的距离
        CGFloat disWithCenter = fabs((attribute.center.x - self.collectionView.contentOffset.x) - WIDTH);
        //确定缩放比例
        CGFloat scale = 1 - disWithCenter / (WIDTH) * 0.1;
        attribute.transform3D = CATransform3DMakeScale(1.0, scale, 1.0);
    }
    return attributeArray;
}

//布局的细节处理
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //获取当前偏移量
    CGPoint targetProposed = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    //获取当前范围内显示的cell
    NSArray *attributeArray = [super layoutAttributesForElementsInRect:CGRectMake(targetProposed.x, 0, self.collectionView.bounds.size.width, MAXFLOAT)];
    //寻找距离中心点最近的图片
    CGFloat minDis = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attributeArray) {
        CGFloat disWithCenter = (attr.center.x - targetProposed.x) - WIDTH;
        
        if(fabs(disWithCenter) < fabs(minDis)){
            minDis = disWithCenter;
        }
    }
    //停止滚动后可能没有图片在中间，所以我们要计算距离中间最近的图片，然后偏移过去
    targetProposed.x += minDis;
    if(targetProposed.x < 0){
        targetProposed.x = 0;
    }
    return targetProposed;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
