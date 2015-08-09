//
//  MeCollectionViewCell.h
//  YueJiApp
//
//  Created by admin on 15/8/9.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IMAGE_HEIGHT 200
#define IMAGE_OFFSET_SPEED 25


@interface MeCollectionViewCell : UICollectionViewCell
/*
 
 image used in the cell which will be having the parallax effect
 
 */
@property (nonatomic, strong, readwrite) UIImage *image;

/*
 Image will always animate according to the imageOffset provided. Higher the value means higher offset for the image
 */
@property (nonatomic, assign, readwrite) CGPoint imageOffset;
@end
