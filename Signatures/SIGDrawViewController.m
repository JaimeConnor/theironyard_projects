//
//  SIGDrawViewController.m
//  Signatures
//
//  Created by Jaime Connor on 8/14/14.
//  Copyright (c) 2014 Jaime Connor. All rights reserved.
//

#import "SIGDrawViewController.h"
#import "SIGDrawView.h"

@interface SIGDrawViewController ()

@end

@implementation SIGDrawViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
//        self.signatures = [@[] mutableCopy];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.drawView = [[SIGDrawView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,200)];
    [self.view addSubview:self.drawView];
    
//    [self.tableView registerClass
    // Do any additional setup after loading the view.
    
//    SIGDrawView * drawView = [[SIGDrawView alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:drawView];
    
    self.drawView = [[SIGDrawView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.view addSubview:self.drawView];
}

- (void)clearSignature
{
    [self.drawView.scribbles removeAllObjects];
    [self.drawView setNeedsDisplay];
}

- (UIImage *)getSignature
{
    UIImage * image = self.drawView.scribblesImage;
    [self clearSignature];
    return image;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self.drawView];
    
    NSValue * pointValue = [NSValue valueWithCGPoint:location];
    
    self.drawView.currentScribble = [@[pointValue] mutableCopy];
    
    [self.drawView.scribbles addObject:self.drawView.currentScribble];
    
    [self.drawView setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self.drawView];
    
    NSValue * pointValue = [NSValue valueWithCGPoint:location];
    
    [self.drawView.currentScribble addObject:pointValue];
    
    [self.drawView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
