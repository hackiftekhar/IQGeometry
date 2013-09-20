//
//  TransformInfoViewController.m
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/19/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import "TransformInfoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TransformInfoViewController ()

@end

@implementation TransformInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)doneClicked:(UIBarButtonItem *)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [viewRed setBackgroundColor:[UIColor clearColor]];
    [viewRed.layer setBorderColor:[UIColor redColor].CGColor];
    [viewRed.layer setBorderWidth:1.0];

    [viewGreen setBackgroundColor:[UIColor clearColor]];
    [viewGreen.layer setBorderColor:[UIColor greenColor].CGColor];
    [viewGreen.layer setBorderWidth:1.0];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    viewRed = nil;
    viewGreen = nil;
    [super viewDidUnload];
}
@end
