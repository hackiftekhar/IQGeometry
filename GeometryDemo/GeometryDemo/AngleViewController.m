//
//  AngleViewController.m
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/17/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import "AngleViewController.h"
#import "IQPanRecognizerView.h"
#import "IQGeometry.h"
#import "DummyView.h"
#import <QuartzCore/QuartzCore.h>
#import "InfoViewController.h"

@interface AngleViewController ()<IQPanRecognizerViewDelegate>

@end

@implementation AngleViewController
{
    IQPanRecognizerView* lineBeginPoint;
    IQPanRecognizerView* lineEndPoint;

    IQPanRecognizerView* centerPoint;
    IQPanRecognizerView* firstPoint;
    IQPanRecognizerView* secondPoint;
    
    IQPanRecognizerView* angleFirstPoint;
    IQPanRecognizerView* angleSecondPoint;
    
    IQPanRecognizerView* midFirstPoint;
    IQPanRecognizerView* midSecondPoint;
    
    IQPanRecognizerView* intersectFirstPoint;
    IQPanRecognizerView* intersectSecondPoint;

    IQPanRecognizerView* centroidPoint;
    IQPanRecognizerView* angledPoint;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Angle";
        // Custom initialization
    }
    return self;
}

-(IQPanRecognizerView*)createAView
{
    IQPanRecognizerView *view = [[IQPanRecognizerView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [view setBackgroundColor:[UIColor blackColor]];
    [view.layer setCornerRadius:5.0];
    [view setDelegate:self];
    [self.view addSubview:view];
    return view;
}

- (void)infoClicked:(UIButton *)sender {
    InfoViewController *info = [[InfoViewController alloc] init];
    [info setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:info animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [button addTarget:self action:@selector(infoClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    
    lineBeginPoint = [self createAView];
    [lineBeginPoint setCenter:CGPointMake(50, 150)];
    [lineBeginPoint setBackgroundColor:[UIColor blackColor]];
    
    lineEndPoint = [self createAView];
    [lineEndPoint setCenter:CGPointMake(270, 150)];
    [lineEndPoint setBackgroundColor:[UIColor blackColor]];
    
    centerPoint = [self createAView];
    [centerPoint setCenter:CGPointMake(160, 50)];
    [centerPoint setBackgroundColor:[UIColor redColor]];
    
    firstPoint = [self createAView];
    [firstPoint setCenter:CGPointMake(270, 300)];
    [firstPoint setBackgroundColor:[UIColor purpleColor]];
    
    secondPoint = [self createAView];
    [secondPoint setCenter:CGPointMake(50, 300)];
    [secondPoint setBackgroundColor:[UIColor greenColor]];
    
    angleFirstPoint = [self createAView];
    [angleFirstPoint setUserInteractionEnabled:NO];
    [angleFirstPoint setBackgroundColor:[UIColor darkGrayColor]];
    
    angleSecondPoint = [self createAView];
    [angleSecondPoint setUserInteractionEnabled:NO];
    [angleSecondPoint setBackgroundColor:[UIColor darkGrayColor]];
    
    midFirstPoint = [self createAView];
    [midFirstPoint setUserInteractionEnabled:NO];
    [midFirstPoint setBackgroundColor:[UIColor blueColor]];
    
    midSecondPoint = [self createAView];
    [midSecondPoint setUserInteractionEnabled:NO];
    [midSecondPoint setBackgroundColor:[UIColor blueColor]];
    
    intersectFirstPoint = [self createAView];
    [intersectFirstPoint setUserInteractionEnabled:NO];
    [intersectFirstPoint setBackgroundColor:[UIColor orangeColor]];
    
    intersectSecondPoint = [self createAView];
    [intersectSecondPoint setUserInteractionEnabled:NO];
    [intersectSecondPoint setBackgroundColor:[UIColor orangeColor]];
    
    centroidPoint = [self createAView];
    [centroidPoint setUserInteractionEnabled:NO];
    [centroidPoint setBackgroundColor:[UIColor brownColor]];
    
    angledPoint = [self createAView];
    [angledPoint setUserInteractionEnabled:NO];
    [angledPoint setBackgroundColor:[UIColor magentaColor]];
    
    
    [labelDegree.layer setCornerRadius:10.0];
    [labelDegree.layer setBorderColor:[UIColor cyanColor].CGColor];
    [labelDegree.layer setBorderWidth:1.0];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateUI
{
    IQLine lineFirstPoint;
    lineFirstPoint.beginPoint = centerPoint.center;
    lineFirstPoint.endPoint = firstPoint.center;
    
    IQLine lineSecondPoint;
    lineSecondPoint.beginPoint = centerPoint.center;
    lineSecondPoint.endPoint = secondPoint.center;
    
    IQLine line;
    line.beginPoint = lineBeginPoint.center;
    line.endPoint = lineEndPoint.center;

    
    angleFirstPoint.center = IQPointWithDistance(centerPoint.center, firstPoint.center, 50);
    angleSecondPoint.center = IQPointWithDistance(centerPoint.center, secondPoint.center, 50);

    midFirstPoint.center = IQPointGetMidPoint(centerPoint.center, firstPoint.center);
    midSecondPoint.center = IQPointGetMidPoint(centerPoint.center, secondPoint.center);

    intersectFirstPoint.center = IQPointOfIntersect(lineFirstPoint, line);
    intersectSecondPoint.center = IQPointOfIntersect(lineSecondPoint, line);

    centroidPoint.center = IQPointCentroidOfPoints([NSArray arrayWithObjects:[NSValue valueWithCGPoint:centerPoint.center],[NSValue valueWithCGPoint:firstPoint.center],[NSValue valueWithCGPoint:secondPoint.center], nil]);

    angledPoint.center = IQPointRotate(centerPoint.center, firstPoint.center, IQDegreeToRadian(10));
    
    
    dummyView.centerPoint = centerPoint.center;
    dummyView.startPoint = angleFirstPoint.center;
    dummyView.endPoint = angleSecondPoint.center;

    
    dummyView.lines = [[NSArray alloc] initWithObjects:[NSValue valueWithIQLine:lineFirstPoint],[NSValue valueWithIQLine:lineSecondPoint],[NSValue valueWithIQLine:line],nil];
    [dummyView setNeedsDisplay];

    CGFloat angle = IQPointGetAngle(centerPoint.center, firstPoint.center, secondPoint.center);
    CGFloat distance = IQPointGetDistance(intersectFirstPoint.center, intersectSecondPoint.center);
    CGFloat distanceOfPoint = IQPointGetDistanceOfPoint(centerPoint.center, line);

    labelDegree.center = IQPointGetMidPoint(centerPoint.center, IQPointRotate(centerPoint.center, angleFirstPoint.center, angle/2));
    
    labelPointDistance.text = [NSString stringWithFormat:@"%.2f",distanceOfPoint];
    labelDistance.text = [NSString stringWithFormat:@"%.2f",distance];
    labelRadian.text = [NSString stringWithFormat:@"%.2f",angle];
    labelDegree.text = [NSString stringWithFormat:@"%.2f",IQRadianToDegree(angle)];
}

-(void)panRecognizer:(IQPanRecognizerView*)panRecognizer beginTouchAtPoint:(CGPoint)point
{
    [self updateUI];
}

-(void)panRecognizer:(IQPanRecognizerView*)panRecognizer moveTouchAtPoint:(CGPoint)point
{
    [self updateUI];
}

-(void)panRecognizer:(IQPanRecognizerView*)panRecognizer endTouchAtPoint:(CGPoint)point
{
    [self updateUI];
}


- (void)viewDidUnload {
    labelDegree = nil;
    labelRadian = nil;
    dummyView = nil;
    labelDistance = nil;
    labelPointDistance = nil;
    [super viewDidUnload];
}
@end
