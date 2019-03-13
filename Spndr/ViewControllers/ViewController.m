//
//  ViewController.m
//  Spndr
//
//  Created by ahmed on 1/25/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    

    _swipeView.delegate = self;
    
    
}

- (void) setupUI {
    // Views Initialization
    _swipeView = [[SwipeView alloc] init];
    [_swipeView setThresholdPoints: (self.view.center.x - 40): (self.view.center.x - 220)];
    [self.view addSubview: _swipeView];
    NSLog(@"The x value of the center %f", self.view.center.x);
    NSLog(@"The y value of the center %f", self.view.center.y);
    
    // Views customization
    _swipeView.translatesAutoresizingMaskIntoConstraints = false;
    [_swipeView.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor].active = true;
    [_swipeView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor].active = true;
    
    CGFloat height = 0.75 * self.view.bounds.size.height;
    CGFloat width = 0.85 * self.view.bounds.size.width;
    [_swipeView.heightAnchor constraintEqualToConstant:height].active = true;
    [_swipeView.widthAnchor constraintEqualToConstant:width].active = true;
    
    _swipeView.layer.cornerRadius = 0.2*width;
    _swipeView.layer.borderWidth = 5;
    _swipeView.layer.borderColor = UIColor.redColor.CGColor;
}


- (void)didFinishSwipe:(BOOL)shouldRemove {

    if (shouldRemove) {
        NSLog(@"Should remove");
        [_swipeView removeFromSuperview];
    } else {
        NSLog(@"Should be reseting");
        [UIView animateWithDuration:0.5 animations:^{
            CGPoint p = CGPointMake(self.view.center.x, self.view.center.y);
            self.swipeView.center = p;
            [self.view setNeedsDisplay];
        }];
        
    }
    
}

@end
