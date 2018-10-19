//
//  ViewController.m
//  X1PlayerSDK
//
//  Created by 彦彰 on 2017/10/9.
//  Copyright © 2017年 channelsoft. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "X1PlayerView.h"


#define  YZCoverImage @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528784045&di=5af380dccd3bc861ce94895417de0250&imgtype=jpg&er=1&src=http%3A%2F%2Fold.bz55.com%2Fuploads%2Fallimg%2F140526%2F137-140526103942.jpg"

#define YZCoverImage2 @"http://live.v114.com/data/attachment/20171031/1509434569689.png"


@interface ViewController ()

@property(nonatomic, assign) NSTimeInterval startTime; //开始时间

@property(nonatomic, strong) NSString *imageUrl;//封面Url

@property(nonatomic, strong) UIImage *image1;

@property(nonatomic, strong) UIImage *image2;


@property (nonatomic, assign) NSInteger type;// 1 直播  2 录播  3 距离开始XX

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) wself = self;
    
    

    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onClickFloatView:) name:X1PlayerViewOnClickFloatViewNotification object:nil];
  


    self.view.backgroundColor =[UIColor whiteColor];
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击进入直播页面" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor greenColor]];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    btn.frame = CGRectMake(self.view.frame.size.width/2 - 100, 100, 200, 50);

    
    
    
    UIButton *btn2 =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"点击进入录播页面" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor redColor]];
    btn2.titleLabel.font =[UIFont systemFontOfSize:15];
    
    [btn2 addTarget:self action:@selector(clickBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    btn2.frame = CGRectMake(self.view.frame.size.width/2 - 100, CGRectGetMaxY(btn.frame), 200, 50);
    
    
    UIButton *btn3 =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTitle:@"点击进入未开播视频" forState:UIControlStateNormal];
    [btn3 setBackgroundColor:[UIColor blueColor]];
    btn3.titleLabel.font =[UIFont systemFontOfSize:15];
    
    [btn3 addTarget:self action:@selector(clickBtn3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    btn3.frame = CGRectMake(self.view.frame.size.width/2 - 100, CGRectGetMaxY(btn2.frame), 200, 50);

    
    UIButton *btn4 =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setTitle:@"当前页面播放续集" forState:UIControlStateNormal];
    [btn4 setBackgroundColor:[UIColor purpleColor]];
    btn4.titleLabel.font =[UIFont systemFontOfSize:15];
    
    [btn4 addTarget:self action:@selector(clickBtn4:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    btn4.frame = CGRectMake(self.view.frame.size.width/2 - 100, CGRectGetMaxY(btn3.frame), 200, 50);

    
}

#pragma mark --点击进入直播页面
-(void)clickBtn:(UIButton *)sender{

    
    
    
    TestViewController *test =[[TestViewController alloc] init];
    test.type = 1;
    self.type = 1;
    test.image = self.image1;
    

    [self.navigationController pushViewController:test animated:YES];

}



#pragma mark --点击进入录播页面
-(void)clickBtn2:(UIButton *)sender{

    
    TestViewController *test =[[TestViewController alloc] init];
    test.type = 2;
    self.type = 2;
     test.image = self.image2;
    
    [self.navigationController pushViewController:test animated:YES];
    
}

#pragma mark -- 点击进入未开播之前视频
-(void)clickBtn3:(UIButton *)sender{

    
    
    
    TestViewController *test =[[TestViewController alloc] init];
    NSDate *date = [NSDate date];
    
    NSTimeInterval time = [date timeIntervalSince1970];
    
    
    test.startTime = time+30;
    test.image = self.image2;
    test.type = 3;
    self.type = 3;
    
    [self.navigationController pushViewController:test animated:YES];
}


-(void)clickBtn4:(UIButton *)sender{
    
    TestViewController *test =[[TestViewController alloc] init];
    test.startTime = self.startTime;
    test.image = self.image2;
    test.type = 4;
    self.type = 4;
    
    [self.navigationController pushViewController:test animated:YES];
    
}

-(void)clickBtn5:(UIButton *)sender{
    
    TestViewController *test =[[TestViewController alloc] init];
    test.startTime = self.startTime;
    test.imageUrl = self.imageUrl;
    test.type = 5;
    self.type = 5;
    
    [self.navigationController pushViewController:test animated:YES];
    
}


#pragma mark ---  点击小窗处理
-(void)onClickFloatView:(NSNotification *)sender{
    
    TestViewController *test =[[TestViewController alloc] init];
    test.type = self.type;
    test.image = self.image2;
    
    [self.navigationController pushViewController:test animated:YES];
}


@end