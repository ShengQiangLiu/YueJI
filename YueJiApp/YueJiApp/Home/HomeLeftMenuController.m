//
//  HomeLeftMenuController.m
//  YueJiApp
//
//  Created by admin on 15/8/9.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import "HomeLeftMenuController.h"

@interface HomeLeftMenuController ()

@end

@implementation HomeLeftMenuController
-(instancetype)initHomeLeftMenuWidth:(int) intHomeLeftMenuWidth {
    
    self = [super init];
    
    if (self) {
        [self setBgRGB:0x3B3C3E];//设置背景色
        self.leftMenuWidth=intHomeLeftMenuWidth;
        self.view.frame  = CGRectMake(0, 0,DP_SCREEN_WIDTH, DP_ROOTVIEW_HEIGHT+adoptValue(30));
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
