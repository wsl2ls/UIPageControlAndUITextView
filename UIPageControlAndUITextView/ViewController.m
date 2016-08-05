//
//  ViewController.m
//  UIPageControlAndUITextView
//
//  Created by 王双龙 on 16/8/4.
//  Copyright © 2016年 王双龙. All rights reserved.
//

#import "ViewController.h"
#import "GOVPageControl.h"

@interface ViewController ()
{
    GOVPageControl * _pageControl;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUIPageControl];
    
    [self setupUITextView];
    
    //创建UITextView的占位视图
    [self setupOccupancyView];
    
}

- (void)setupUITextView{
    
    NSString * title = @"我是且行且珍惜_iOS😄.如果喜欢的话，点个喜欢呗，点个关注呗,赏根辣条呗！哈萨米达！么么哒！https://github.com/wslcmk";
    
    //段落样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //调整行间距
    paragraphStyle.maximumLineHeight = 22;
    paragraphStyle.minimumLineHeight = 22;
    
    NSDictionary *attributeDictionary = @{NSFontAttributeName : [UIFont fontWithName:@"AmericanTypewriter" size:12],NSForegroundColorAttributeName :[UIColor whiteColor],NSParagraphStyleAttributeName : paragraphStyle };
    
    //文本存储
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:title];
    [textStorage addAttributes:attributeDictionary range:NSMakeRange (0, [title length])];
    
    //布局管理
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    
    //文本容器
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(self.view.frame.size.width - 16, 48)];
    textContainer.lineFragmentPadding = 0;
    textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
    
    //抠取容器UITextView的一部分
    CGRect btnRect = CGRectMake((self.view.frame.size.width - 16)/ 2 - 15,10,40,40);
    UIBezierPath *newPath = [UIBezierPath bezierPathWithRect:btnRect];
    CGRect imageRect = CGRectMake(0,0,20 + 4,20 + 2);
    UIBezierPath *newPath1 = [UIBezierPath bezierPathWithRect:imageRect];
    textContainer.exclusionPaths = @[newPath,newPath1];
    [layoutManager addTextContainer:textContainer];
    
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(8, 200, self.view.frame.size.width - 16, 48) textContainer:textContainer];
    [textView sizeToFit];
    textView.editable = NO;
    textView.backgroundColor = [UIColor orangeColor];
    //如果设置为YES，设置的lineBreakMode就没有作用了
    textView.scrollEnabled = NO;
    textView.textContainerInset = UIEdgeInsetsMake (0,0,0,0);
    
    //自动布局后容器的Frame
    CGRect containerRect = [[textView layoutManager] usedRectForTextContainer:textContainer];
    textView.frame = CGRectMake(8,200, containerRect.size.width, 48);
    [self.view addSubview:textView];
    
}


//创建UITextView的占位视图
- (void)setupOccupancyView{
    
    //占位视图UIButton
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 16)/ 2 - 8, 200 + 5, 38, 38)];
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"占位图" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font =[UIFont systemFontOfSize:10];
    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //占位视图UIImageView
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(8 + 3, 200 + 3, 20, 20)];
    imageView.image = [UIImage imageNamed:@"default"];
    [self.view  addSubview:imageView];
    
}

- (void)btnClicked:(UIButton *)btn{
    
    btn.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1.0];
}


- (void)setupUIPageControl{
    
    //    GOVPageControl * pageControl = [[GOVPageControl alloc] initWithFrame:CGRectMake(20, 100,0, 0)];
    //    pageControl.numberOfPages = 8;
    
    GOVPageControl * pageControl = [[GOVPageControl alloc] initWithFrame:CGRectMake(20, 100,0, 0) withNumberOfPages:8];
    pageControl.backgroundColor = [UIColor orangeColor];
    pageControl.space = 10;
    pageControl.pageSize = CGSizeMake(30, 30);
    pageControl.currentPage = 0;
    
    pageControl.currentImage = [UIImage imageNamed:@"current"];
    pageControl.defaultImage = [UIImage imageNamed:@"default"];
    
    //    pageControl.currenColor = [UIColor redColor];
    //    pageControl.defaultColor = [UIColor blueColor];
    
    [pageControl setUpDots];
    _pageControl = pageControl;
    [self.view addSubview:_pageControl];
    
    UIStepper * stepper = [[UIStepper alloc] init];
    stepper.center = CGPointMake(self.view.frame.size.width / 2, 64);
    stepper.minimumValue = -2;
    [stepper addTarget:self action:@selector(stepValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
}


- (void)stepValueChanged:(UIStepper *)steeper{
    
    if (_pageControl.numberOfPages == steeper.value) {
        steeper.value = 0;
    }
    if ( steeper.value == -1) {
        steeper.value = _pageControl.numberOfPages - 1;
    }
    _pageControl.currentPage = steeper.value;
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
