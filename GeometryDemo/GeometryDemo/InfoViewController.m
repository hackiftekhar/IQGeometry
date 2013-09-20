//
//  InfoViewController.m
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/19/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import "InfoViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface InfoViewController ()

@end

@implementation InfoViewController

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
    
    [viewCyan setBackgroundColor:[UIColor clearColor]];
    [viewCyan.layer setBorderColor:[UIColor cyanColor].CGColor];
    [viewCyan.layer setBorderWidth:1.0];
    
    [viewCyan.layer setCornerRadius:viewCyan.bounds.size.height/3];
    [viewBrown.layer setCornerRadius:viewBrown.bounds.size.height/2];
    [viewMajenta.layer setCornerRadius:viewMajenta.bounds.size.height/2];
    [viewOrange.layer setCornerRadius:viewOrange.bounds.size.height/2];
    [viewBlue.layer setCornerRadius:viewBlue.bounds.size.height/2];
    [viewGray.layer setCornerRadius:viewGray.bounds.size.height/2];
    [viewGreen.layer setCornerRadius:viewGreen.bounds.size.height/2];
    [viewPurple.layer setCornerRadius:viewPurple.bounds.size.height/2];
    [viewBlack.layer setCornerRadius:viewBlack.bounds.size.height/2];
    [viewRed.layer setCornerRadius:viewRed.bounds.size.height/2];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    viewMajenta = nil;
    viewBrown = nil;
    viewOrange = nil;
    viewBlue = nil;
    viewGray = nil;
    viewGreen = nil;
    viewPurple = nil;
    viewBlack = nil;
    viewRed = nil;
    [super viewDidUnload];
}
@end
