//
//  SuspendImgV.m
//  SuspendDemo
//
//  Created by Seven on 2017/9/12.
//  Copyright © 2017年 Seven. All rights reserved.
//

#import "SuspendImgV.h"

typedef NS_ENUM(NSInteger, Position) {
    PositionLeft = 0,
    PositionRight = 1,
};

#define kHeight self.superview.frame.size.height
#define kWidth  self.superview.frame.size.width

@interface SuspendImgV ()

@property (nonatomic, assign) Position  position;
@property (nonatomic, assign) CGFloat   topMargin;
@property (nonatomic, assign) CGFloat   btomMargin;

@end

@implementation SuspendImgV

- (instancetype)initWithFrame:(CGRect)frame topMargin:(CGFloat)top btomMargin:(CGFloat)btom;
{
    if (self = [super init]) {
        self.frame = frame;
        self.userInteractionEnabled = YES;
        
        _topMargin = top;
        _btomMargin = btom;
        [self addGesture];
    }
    return self;
}

- (void)addGesture
{
    UIPanGestureRecognizer  * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:pan];
}

- (void)configFrameWithAnimation:(BOOL)aniamtion
{
    CGPoint p = self.frame.origin;
    
    CGRect  aimR = CGRectZero;
    if (self.center.x < kWidth/2) {
        aimR = CGRectMake(2, p.y, kItemWidth, kItemHeight);
        _position = PositionLeft;
    }else{
        aimR = CGRectMake(kWidth - kItemWidth - 2, p.y, kItemWidth, kItemHeight);
        _position = PositionRight;
    }
    
    if (aniamtion) {
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.frame = aimR;
        } completion:nil];
    }else{
        self.frame = aimR;
    }
}

- (void)panAction:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateEnded
             || pan.state == UIGestureRecognizerStateCancelled){
        //结束
        [self configFrameWithAnimation:YES];
    }
    else {
        //移动
        //当然也可以相对于key window，只是self.superView的宽高和window不一致时，需要注意计算时的偏移量
        CGPoint p = [pan locationInView:self.superview];
        p.y = MAX(p.y, _topMargin + kItemHeight/2);
        p.y = MIN(kHeight - _btomMargin - kItemHeight/2, p.y);
        
        [UIView animateWithDuration:0.15 animations:^{
            self.center = p;
        }];
    }
}

@end
