//
//  ViewController.m
//  SuspendDemo
//
//  Created by Seven on 2017/9/12.
//  Copyright © 2017年 Seven. All rights reserved.
//

#import "ViewController.h"
#import "SuspendImgV.h"

#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SuspendImgV * v = [[SuspendImgV alloc] initWithFrame:CGRectMake(100, 100, kItemWidth, kItemHeight) topMargin:66 btomMargin:44];
    v.backgroundColor = [UIColor redColor];
    v.image = [UIImage imageNamed:@"lufei.jpg"];
    [self.view addSubview:v];
    
    UIView  * topV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 66)];
    topV.backgroundColor = [UIColor yellowColor];
    UIView  * centerV = [[UIView alloc] initWithFrame:CGRectMake(0, 66, kScreenWidth, kScreenHeight - 110)];
    centerV.backgroundColor = [UIColor lightGrayColor];
    UIView  * btomV = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 44, kScreenWidth, 44)];
    btomV.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:topV];
    [self.view addSubview:centerV];
    [self.view addSubview:btomV];
    
    //将悬浮视图扔到最顶层
    [self.view bringSubviewToFront:v];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
