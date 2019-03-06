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
    [self setupGestures];
    
    
}
- (void)setupGestures{
//    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeDetection:)];
//    [leftSwipe setDirection: UISwipeGestureRecognizerDirectionLeft];
//
//    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeDetection: )];
//    [rightSwipe setDirection: UISwipeGestureRecognizerDirectionRight];
//
//    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeDetection:)];
//    [upSwipe setDirection: UISwipeGestureRecognizerDirectionUp];
//
//    leftSwipe.delegate = self;
//    [self.view addGestureRecognizer: leftSwipe];
//    [self.view addGestureRecognizer: rightSwipe];
//    [self.view addGestureRecognizer: upSwipe];
    

    
}

- (void) setupUI {
    // Views Initialization
    _swipeView = [[SwipeView alloc] init];
    [_swipeView setThresholdPoints: (self.view.center.x - 40): (self.view.center.x - 220)];
    [self.view addSubview: _swipeView];
    
    
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


@end
