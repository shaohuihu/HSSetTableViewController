//
//  UIView+HSFrame.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Cohsright © 2017年 ZLHD. All rights reserved.
//

#import "UIView+HSFrame.h"

@implementation UIView (HSFrame)

- (void)setHs_x:(CGFloat)hs_x
{
    CGRect frame = self.frame;
    frame.origin.x = hs_x;
    self.frame = frame;
}

- (CGFloat)hs_x
{
    return self.frame.origin.x;
}

- (void)setHs_centerX:(CGFloat)hs_centerX
{
    CGPoint center = self.center;
    center.x = hs_centerX;
    self.center = center;
}

- (CGFloat)hs_centerX
{
    return self.center.x;
}

-(void)setHs_centerY:(CGFloat)hs_centerY
{
    CGPoint center = self.center;
    center.y = hs_centerY;
    self.center = center;
}

- (CGFloat)hs_centerY
{
    return self.center.y;
}

- (void)setHs_y:(CGFloat)hs_y
{
    CGRect frame = self.frame;
    frame.origin.y = hs_y;
    self.frame = frame;
}

- (CGFloat)hs_y
{
    return self.frame.origin.y;
}

- (void)setHs_size:(CGSize)hs_size
{
    CGRect frame = self.frame;
    frame.size = hs_size;
    self.frame = frame;
    
}

- (CGSize)hs_size
{
    return self.frame.size;
}

- (void)setHs_height:(CGFloat)hs_height
{
    CGRect frame = self.frame;
    frame.size.height = hs_height;
    self.frame = frame;
}

- (CGFloat)hs_height
{
    return self.frame.size.height;
}

- (void)setHs_width:(CGFloat)hs_width
{
    CGRect frame = self.frame;
    frame.size.width = hs_width;
    self.frame = frame;
    
}

-(CGFloat)hs_width
{
    return self.frame.size.width;
}

- (void)setHs_origin:(CGPoint)hs_origin
{
    CGRect frame = self.frame;
    frame.origin = hs_origin;
    self.frame = frame;
}

- (CGPoint)Hs_origin
{
    return self.frame.origin;
}

@end

@implementation CALayer(HSFrame)

- (void)setHs_x:(CGFloat)hs_x
{
    CGRect frame = self.frame;
    frame.origin.x = hs_x;
    self.frame = frame;
}

- (CGFloat)hs_x
{
    return self.frame.origin.x;
}

- (void)setHs_y:(CGFloat)hs_y
{
    CGRect frame = self.frame;
    frame.origin.y = hs_y;
    self.frame = frame;
}

- (CGFloat)hs_y
{
    return self.frame.origin.y;
}

- (void)setHs_size:(CGSize)hs_size
{
    CGRect frame = self.frame;
    frame.size = hs_size;
    self.frame = frame;
    
}

- (CGSize)hs_size
{
    return self.frame.size;
}

- (void)setHs_height:(CGFloat)hs_height
{
    CGRect frame = self.frame;
    frame.size.height = hs_height;
    self.frame = frame;
}

- (CGFloat)hs_height
{
    return self.frame.size.height;
}

- (void)setHs_width:(CGFloat)hs_width
{
    CGRect frame = self.frame;
    frame.size.width = hs_width;
    self.frame = frame;
    
}

-(CGFloat)hs_width
{
    return self.frame.size.width;
}



@end

