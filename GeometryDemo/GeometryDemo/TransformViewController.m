//
//  TransformViewController.m
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/17/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import "TransformViewController.h"
#import "TransformInfoViewController.h"
#import "IQGeometry.h"
#import <QuartzCore/QuartzCore.h>

@interface TransformViewController ()<UIGestureRecognizerDelegate>

@end

@implementation TransformViewController
{
    UIView *aspectFitView;
    UIView *aspectFillView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)infoClicked:(UIButton *)sender {
    TransformInfoViewController *info = [[TransformInfoViewController alloc] init];
    [info setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:info animated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [button addTarget:self action:@selector(infoClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    

    
    aspectFitView = [[UIView alloc] init];
    [aspectFitView setUserInteractionEnabled:NO];
    [aspectFitView.layer setBorderColor:[UIColor redColor].CGColor];
    [aspectFitView.layer setBorderWidth:1.0];
    [self.view addSubview:aspectFitView];
    
    aspectFillView = [[UIView alloc] init];
    [aspectFillView setUserInteractionEnabled:NO];
    [aspectFillView.layer setBorderColor:[UIColor greenColor].CGColor];
    [aspectFillView.layer setBorderWidth:1.0];
    [self.view addSubview:aspectFillView];
    
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateGestureRecognized:)];
    rotateGesture.delegate = self;
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognized:)];
    pinchGesture.delegate = self;
    
    [myImageView.layer setBorderColor:[UIColor blackColor].CGColor];
    [myImageView.layer setBorderWidth:1.0];
    
    [myImageView addGestureRecognizer:rotateGesture];
    [myImageView addGestureRecognizer:pinchGesture];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void)updateUI
{
    [labelAngle setText:[NSString stringWithFormat:@"%.2f", IQRadianToDegree(IQAffineTransformGetAngle(myImageView.transform))]];
    CGSize scale = IQAffineTransformGetScale(myImageView.transform);
    [labelScale setText:[NSString stringWithFormat:@"{%.2f, %.2f}",scale.width, scale.height]];
    
    aspectFitView.frame = IQRectAspectFit(myImageView.image.size, myImageView.frame);
    aspectFitView.center = myImageView.center;

    aspectFillView.frame = IQRectAspectFillRect(myImageView.image.size, myImageView.frame);
    aspectFillView.center = myImageView.center;
}


-(void)rotateGestureRecognized:(UIRotationGestureRecognizer*)gesture
{
    [myImageView setTransform:CGAffineTransformRotate(myImageView.transform, gesture.rotation)];
    gesture.rotation = 0;
    [self updateUI];
}

-(void)pinchGestureRecognized:(UIPinchGestureRecognizer*)gesture
{
    [myImageView setTransform:CGAffineTransformScale(myImageView.transform, gesture.scale, gesture.scale)];
    gesture.scale = 1.0;
    [self updateUI];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    myImageView = nil;
    labelScale = nil;
    labelAngle = nil;
    [super viewDidUnload];
}
@end
