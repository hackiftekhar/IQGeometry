//
//  IQPanRecognizerView.h
//  IQPhotoEditor
//
//  Created by Mohd Iftekhar Qurashi on 25/08/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IQPanRecognizerView;

@protocol IQPanRecognizerViewDelegate <NSObject>
@optional
-(void)panRecognizer:(IQPanRecognizerView*)panRecognizer beginTouchAtPoint:(CGPoint)point;
-(void)panRecognizer:(IQPanRecognizerView*)panRecognizer moveTouchAtPoint:(CGPoint)point;
-(void)panRecognizer:(IQPanRecognizerView*)panRecognizer endTouchAtPoint:(CGPoint)point;

@end

@interface IQPanRecognizerView : UIView
{

}

@property(nonatomic, unsafe_unretained) id<IQPanRecognizerViewDelegate> delegate;

@property(nonatomic, assign) CGSize recommendSize;

@end
