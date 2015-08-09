//
//  MeCollectionViewCell.m
//  YueJiApp
//
//  Created by admin on 15/8/9.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import "MeCollectionViewCell.h"

@interface MeCollectionViewCell ()
@property (nonatomic, strong) UIImageView *MeImageView;
@end

@implementation MeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) [self setupImageView];
    return self;
}

#pragma mark - Setup Method
- (void)setupImageView
{
    // Clip subviews
    self.clipsToBounds = YES;
    
    // Add image subview
    self.MeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, IMAGE_HEIGHT)];
    self.MeImageView.backgroundColor = [UIColor redColor];
    self.MeImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.MeImageView.clipsToBounds = NO;
    [self addSubview:self.MeImageView];
}

# pragma mark - Setters

- (void)setImage:(UIImage *)image
{
    // Store image
    self.MeImageView.image = image;
    
    // Update padding
    [self setImageOffset:self.imageOffset];
}

- (void)setImageOffset:(CGPoint)imageOffset
{
    // Store padding value
    _imageOffset = imageOffset;
    
    // Grow image view
    CGRect frame = self.MeImageView.bounds;
    CGRect offsetFrame = CGRectOffset(frame, _imageOffset.x, _imageOffset.y);
    self.MeImageView.frame = offsetFrame;
    
}

@end
