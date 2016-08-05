//
//  GOVPageControl.m
//  GovCn
//
//  Created by 王双龙 on 16/8/3.
//  Copyright © 2016年 cdi. All rights reserved.
//

#import "GOVPageControl.h"


@interface GOVPageControl()

@property (nonatomic) CGSize size;

@end

@implementation GOVPageControl


- (instancetype)initWithFrame:(CGRect)frame withNumberOfPages:(NSInteger)numberOfPages{
    if (self == [super initWithFrame:frame]) {
        _pageSize = CGSizeMake(4, 4);
        _space = 5.0;
        _numberOfPages = numberOfPages;
        return self;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        _pageSize = CGSizeMake(4, 4);
        _space = 5.0;
        return self;
    }
    return self;
}

- (void)setUpDots{
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,self.space + self.numberOfPages * (self.pageSize.width + self.space), self.pageSize.height);
    
    for (int i = 0; i < self.numberOfPages; i++) {
        
        if ([self.subviews count] < self.numberOfPages) {
            UIImageView * imageView = [[UIImageView alloc] init];
            [self addSubview:imageView];
        }
        
        UIImageView * imageView = self.subviews[i];
        imageView.frame = CGRectMake(self.space + i * (self.pageSize.width + self.space), 0, self.pageSize.width, self.pageSize.height);
        
        if (i == self.currentPage) {
            if (self.currenColor == nil) {
                imageView.image = self.currentImage;
            }else{
                imageView.backgroundColor = self.currenColor;
                imageView.image = nil;
            }
        }else{
            if (self.defaultColor == nil) {
                imageView.image = self.defaultImage;
            }else{
                imageView.backgroundColor = self.defaultColor;
                imageView.image = nil;
            }
        }
    }
}

- (CGSize)sizeForNumberOfPages:(NSInteger)numberOfPages{
    
    return CGSizeMake(self.space + numberOfPages * (self.pageSize.width + self.space), self.pageSize.height);
}

#pragma mark --- Setter

- (void)setCurrentPage:(NSInteger)currentPage{
    
    _currentPage = currentPage;
    [self setUpDots];
}

- (void)setNumberOfPages:(NSInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    [self setUpDots];
}


@end
