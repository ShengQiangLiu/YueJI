//
//  CustomTabBarController.m
//  YueJiApp
//
//  Created by admin on 15/8/9.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import "CustomTabBarController.h"
#import "MeViewController.h"
#import "ShoppingViewController.h"
#import "HomeLeftMenuController.h"

static CustomTabBarController *tabbarController = nil;

@interface CustomTabBarController () {
    NSArray *_childrootControllers;
    NSMutableArray *_tabbars;
    UIImageView *_tabbarBg;
    HomeLeftMenuController *_leftMenu;
    UIPanGestureRecognizer *_panGesture;
    UIViewController *_selectedController;

}

@end
static float leftRatio = (float)DP_RATIO_HOMELEFTMENU;

@implementation CustomTabBarController

+ (instancetype)shareTabBarController {
    if (tabbarController == nil) {
        tabbarController = [[CustomTabBarController alloc] init];
        tabbarController.view.backgroundColor = [UIColor whiteColor];
        
    }
    return tabbarController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panDetected:)];
    [_panGesture delaysTouchesBegan];
    [self.view addGestureRecognizer:_panGesture];

    UIButton *mebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [mebutton setImage:[UIImage imageNamed:@"topic"] forState:UIControlStateNormal];
    [mebutton setImage:[UIImage imageNamed:@"topic_select"] forState:UIControlStateSelected];
    [mebutton setSelected:YES];
    mebutton.tag=0;
    [mebutton addTarget:self action:@selector(TapAction:) forControlEvents:UIControlEventTouchUpInside];
    MeViewController *meController = [[MeViewController alloc] init];
    UINavigationController *meNav = [[UINavigationController alloc]initWithRootViewController:meController];
    
    UIButton *Pencilbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [Pencilbutton setImage:[UIImage imageNamed:@"pencil"] forState:UIControlStateNormal];
    [Pencilbutton setImage:[UIImage imageNamed:@"pencil"] forState:UIControlStateSelected];
    Pencilbutton.tag=1;
    [Pencilbutton addTarget:self action:@selector(TapAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *shoppingbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shoppingbutton setImage:[UIImage imageNamed:@"ranking"] forState:UIControlStateNormal];
    [shoppingbutton setImage:[UIImage imageNamed:@"ranking_select"] forState:UIControlStateSelected];
    [shoppingbutton addTarget:self action:@selector(TapAction:) forControlEvents:UIControlEventTouchUpInside];
    shoppingbutton.tag=2;
    ShoppingViewController *shoppingController = [[ShoppingViewController alloc] init];
    UINavigationController*shoppingNav = [[UINavigationController alloc]initWithRootViewController:shoppingController];

    _childrootControllers = [NSArray arrayWithObjects:meController, shoppingController,nil];
    _tabbars = [NSMutableArray arrayWithObjects:mebutton, Pencilbutton, shoppingbutton, nil];
    [self addChildViewController:meNav];
    [self.view addSubview:meNav.view];
    [self addChildViewController:shoppingNav];
    
    
    _tabbarBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, DP_SCREEN_HEIGHT - 49, DP_SCREEN_WIDTH, 49)];
    _tabbarBg.image=[UIImage imageNamed:@"footer"];
    _tabbarBg.userInteractionEnabled=YES;
    [self.view addSubview:_tabbarBg];
    
    for (UIButton *bottom in _tabbars) {
        int index = (int)[_tabbars indexOfObject:bottom];
        if (bottom.tag == 1) { // 中间大的单独设置
            CGRect aframe = CGRectMake(DP_SCREEN_WIDTH/_tabbars.count*index, -20, DP_SCREEN_WIDTH/_tabbars.count, 69);
            bottom.frame=aframe;
        } else {
            CGRect aframe = CGRectMake(DP_SCREEN_WIDTH/_tabbars.count*index, 0, DP_SCREEN_WIDTH/_tabbars.count, 49);
            bottom.frame=aframe;
        }
        [_tabbarBg addSubview:bottom];
    }
    
    _leftMenu =[[HomeLeftMenuController alloc] initHomeLeftMenuWidth:(int)(DP_SCREEN_WIDTH*leftRatio)];
    _leftMenu.delegate = meController;
    [self.view addSubview:_leftMenu.view];



}


#pragma mark - 点击选择控制器
- (void)TapAction:(UIButton *)sender {
    if (sender.tag == 1) {
        
    } else {
        // 改变按钮选中图片
        for (UIButton *item in _tabbars) {
            if (sender.tag==item.tag) {
                [item setSelected:YES];
            }else{
                [item setSelected:NO];
            }
        }
        
        UINavigationController *selectVC = nil;
        if (sender.tag > 1) {
            selectVC = (UINavigationController *)[self.childViewControllers objectAtIndex:sender.tag-1];
        } else {
            selectVC = (UINavigationController *)[self.childViewControllers objectAtIndex:sender.tag];
        }
        _selectedController = [selectVC.viewControllers objectAtIndex:0];
        _leftMenu.delegate = selectVC;
        [selectVC didMoveToParentViewController:self];
        [self.view addSubview:selectVC.view];
        [self.view insertSubview:_tabbarBg aboveSubview:selectVC.view];
        [self.view insertSubview:_leftMenu.view aboveSubview:_tabbarBg];

        
    }
}

#pragma -mark 打开左边抽屉
- (void)leftMenyShow:(id)sender {
    
    if (DP_SYSTEM_VERSION>=7) {
        
    }
    [_leftMenu showHideSidebar];
}
#pragma -mark 手势检测
- (void)panDetected:(UIPanGestureRecognizer*)recoginzer {
    
    CGPoint point = [recoginzer translationInView:self.view];
    
    if(point.x>0)
    {
//        
//        if(![rightMenu rightMenyIsHide])
//        {
//            [rightMenu rightMenyHide];
//            return;
//        }
//        if (![rankRightMenu rightMenyIsHide]) {
//            [rankRightMenu rightMenyHide];
//            return;
//        }
    }
    else
    {
        if(!_leftMenu.isSidebarShown)
        {
            return;
        }
    }
    [_leftMenu panDetected:recoginzer];
}



@end
