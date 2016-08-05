//
//  GOVPageControl.h
//  GovCn
//
//  Created by 王双龙 on 16/8/3.
//  Copyright © 2016年 cdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GOVPageControl : UIView

@property (nonatomic)   UIImage * currentImage; //高亮图片
@property (nonatomic)   UIImage * defaultImage; //默认图片
@property (nonatomic,strong) UIColor * currenColor;//高亮颜色
@property (nonatomic,strong) UIColor * defaultColor;//默认颜色

@property (nonatomic,assign)   CGSize pageSize; //图标大小 默认（4，4）
@property (nonatomic,assign) float space;//图标间隔,默认5.0

@property (nonatomic,assign) NSInteger currentPage;

@property (nonatomic,assign) NSInteger numberOfPages;

 - (void)setUpDots;//刷新图标

- (CGSize)sizeForNumberOfPages:(NSInteger)numberOfPages;

- (instancetype)initWithFrame:(CGRect)frame withNumberOfPages:(NSInteger)numberOfPages;

@end
