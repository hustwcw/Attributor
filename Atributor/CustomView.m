//
//  CustomView.m
//  Atributor
//
//  Created by Chengwen Wang on 6/13/14.
//  Copyright (c) 2014 Microstrategy. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(50, 30, 100, 100)];
//    [rectPath stroke];
    [rectPath addClip];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(75, 10)];
    [path addLineToPoint:CGPointMake(160, 150)];
    [path addLineToPoint:CGPointMake(10, 150)];
    [path closePath];
    [path stroke];
    [[UIColor blueColor] setFill];
    [path fill];
}


@end
