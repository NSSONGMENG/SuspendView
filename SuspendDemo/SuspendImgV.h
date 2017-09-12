//
//  SuspendImgV.h
//  SuspendDemo
//
//  Created by Seven on 2017/9/12.
//  Copyright © 2017年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kItemWidth 60
#define kItemHeight 60

@interface SuspendImgV : UIImageView

- (instancetype)initWithFrame:(CGRect)frame
                    topMargin:(CGFloat)top
                   btomMargin:(CGFloat)btom;

@end
