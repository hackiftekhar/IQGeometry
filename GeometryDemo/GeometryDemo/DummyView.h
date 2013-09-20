//
//  DummyView.h
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/17/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DummyView : UIView

@property(nonatomic, assign) CGPoint centerPoint;
@property(nonatomic, assign) CGPoint startPoint;
@property(nonatomic, assign) CGPoint endPoint;

@property(nonatomic, strong) NSArray* lines;

@end
