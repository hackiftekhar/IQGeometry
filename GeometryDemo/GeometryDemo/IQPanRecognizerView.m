//
//  IQPanRecognizerView.m
//  IQPhotoEditor
//
//  Created by Mohd Iftekhar Qurashi on 25/08/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import "IQPanRecognizerView.h"
#import "IQGeometry.h"

@implementation IQPanRecognizerView
{
    UILabel *labelPoint;
    CGPoint _beginTouchPoint;
    CGPoint _beginCenter;
}

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUserInteractionEnabled:YES];
        [self initialize];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}

-(void)initialize
{
    labelPoint = [[UILabel alloc] initWithFrame:CGRectMake(-15, -10, 40, 10)];
    [labelPoint setBackgroundColor:[UIColor clearColor]];
    [labelPoint setTextAlignment:NSTextAlignmentCenter];
    [labelPoint setFont:[UIFont boldSystemFontOfSize:8.0]];
    [self addSubview:labelPoint];

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [longPress setMinimumPressDuration:0.1];
    [self addGestureRecognizer:longPress];
    
    _recommendSize = CGSizeMake(44.0, 44.0);
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [labelPoint setText:[NSString stringWithFormat:@"{%d,%d}",(int)self.center.x,(int)self.center.y]];
}

-(void)setCenter:(CGPoint)center
{
    @try {
        [super setCenter:center];
        [labelPoint setText:[NSString stringWithFormat:@"{%d,%d}",(int)self.center.x,(int)self.center.y]];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {

    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    //Getting bounds.
    CGRect bounds = self.bounds;
    
    //Calculating delta size movement.
    CGFloat widthDelta = _recommendSize.width - bounds.size.width;
    CGFloat heightDelta = _recommendSize.height - bounds.size.height;
    
    CGSize scale = IQAffineTransformGetScale(self.transform);
    
    widthDelta = widthDelta/scale.width;
    heightDelta = heightDelta/scale.height;
    
    //If values less than 0. Then view size should be larger than it's bounds.
    widthDelta = (widthDelta>0)?widthDelta:0;
    heightDelta = (heightDelta>0)?heightDelta:0;
    
    //Calculating it's dummy bounds.
    bounds = CGRectInset(bounds, -0.5*widthDelta, -0.5*heightDelta);
    
    //If point contains in it's bounds. then return yes. Else no.
    return CGRectContainsPoint(bounds, point);
}

-(void)panGestureRecognizer:(UILongPressGestureRecognizer*)gesture
{
    CGPoint location = [gesture locationInView:self.superview];
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        _beginTouchPoint = location;
        _beginCenter = self.center;
        
        if ([_delegate respondsToSelector:@selector(panRecognizer:beginTouchAtPoint:)])
            [_delegate panRecognizer:self beginTouchAtPoint:location];
    }
    else if(gesture.state == UIGestureRecognizerStateChanged)
    {
        self.center = CGPointMake(_beginCenter.x+(location.x-_beginTouchPoint.x), _beginCenter.y+(location.y-_beginTouchPoint.y));
        
        if ([_delegate respondsToSelector:@selector(panRecognizer:moveTouchAtPoint:)])
            [_delegate panRecognizer:self moveTouchAtPoint:location];
    }
    else if(gesture.state == UIGestureRecognizerStateEnded)
    {
        if ([_delegate respondsToSelector:@selector(panRecognizer:endTouchAtPoint:)])
            [_delegate panRecognizer:self endTouchAtPoint:location];
    }
}

@end
