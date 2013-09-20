//
//  ViewController.m
//  GeometryDemo
//
//  Created by Iftekhar Mac Pro on 9/17/13.
//  Copyright (c) 2013 Canopus. All rights reserved.
//

#import "ViewController.h"
#import "AngleViewController.h"
#import "TransformViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController
{
    NSArray *demonstrations;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Geometry Demo";
    
    demonstrations = [[NSArray alloc] initWithObjects:
                      @"Angle+Point+Distance",
                      @"AffineTransform+Rect",
                      nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return demonstrations.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    [cell.textLabel setText:[demonstrations objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            [self.navigationController pushViewController:[[AngleViewController alloc] init] animated:YES];
            break;
            
        case 1:
            [self.navigationController pushViewController:[[TransformViewController alloc] init] animated:YES];
            break;
 
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    tableViewGeometry = nil;
    [super viewDidUnload];
}
@end
