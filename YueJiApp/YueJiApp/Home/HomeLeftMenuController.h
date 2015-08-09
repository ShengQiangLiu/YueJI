//
//  HomeLeftMenuController.h
//  YueJiApp
//
//  Created by admin on 15/8/9.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import "LLBlurSidebar.h"

@interface HomeLeftMenuController : LLBlurSidebar
-(instancetype)initHomeLeftMenuWidth:(int) intHomeLeftMenuWidth;
@property (assign, nonatomic) id delegate;
@end
