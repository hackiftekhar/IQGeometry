//
//  AngleViewController.h
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/17/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DummyView;

@interface AngleViewController : UIViewController
{
    IBOutlet DummyView *dummyView;
    IBOutlet UILabel *labelDegree;
    IBOutlet UILabel *labelRadian;
    IBOutlet UILabel *labelDistance;
    IBOutlet UILabel *labelPointDistance;
}

@end
