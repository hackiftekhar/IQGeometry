//
//  BordereView.m
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/18/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import "BordereView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BordereView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setUserInteractionEnabled:NO];
        
        [self.layer setBorderWidth:1.0];
        // Initialization code
    }
    return self;
}

-(void)setBorderColor:(UIColor*)color
{
    [self.layer setBorderColor:color.CGColor];
}

@end
