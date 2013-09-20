//
//  DummyView.m
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/17/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import "DummyView.h"
#import "IQGeometry.h"

@implementation DummyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    for (NSValue* lineValue in _lines)
    {
        IQLine line = [lineValue lineValue];
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState                 (context);
        CGContextSetStrokeColorWithColor    (context, [[UIColor blackColor]CGColor]);
        CGContextSetLineWidth               (context, 1.0);
        CGContextMoveToPoint                (context, line.beginPoint.x, line.beginPoint.y);
        CGContextAddLineToPoint             (context, line.endPoint.x, line.endPoint.y);
        CGContextStrokePath                 (context);
        CGContextRestoreGState              (context);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSaveGState                 (context);
    
    CGFloat beginAngle = IQPointGetAngle(_centerPoint, CGPointMake(_centerPoint.x+10, _centerPoint.y), _startPoint);
    CGFloat endAngle = IQPointGetAngle(_centerPoint, CGPointMake(_centerPoint.x+10, _centerPoint.y), _endPoint);
    CGFloat radius = IQPointGetDistance(_centerPoint, _startPoint);
    
    CGContextAddArc(context,
                    _centerPoint.x,
                    _centerPoint.y,
                    radius,
                    beginAngle,
                    endAngle,
                    0);
    
//    CGContextMoveToPoint(context, _centerPoint.x, _centerPoint.y);
//    
//    CGContextAddLineToPoint(context, _centerPoint.x, _centerPoint.y);
//
//    CGContextAddArcToPoint(context,100,100,200,100,30);
//    
//    CGContextAddLineToPoint(context, _centerPoint.x, _centerPoint.y);
    CGContextStrokePath(context);
//    CGContextRestoreGState              (context);
}

@end
