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
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeDetection:)];
    [leftSwipe setDirection: UISwipeGestureRecognizerDirectionLeft];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeDetection: )];
    [rightSwipe setDirection: UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeDetection:)];
    [upSwipe setDirection: UISwipeGestureRecognizerDirectionUp];
    
    
    [self.view addGestureRecognizer: leftSwipe];
    [self.view addGestureRecognizer: rightSwipe];
    [self.view addGestureRecognizer: upSwipe];
}

- (void) swipeDetection: (UISwipeGestureRecognizer*) gesture {
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"RIGHT");
    } else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"LEFT");
    } else if (gesture.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"UP");
    }

}

- (void) setupUI {
    // Views Initialization
    _centerView = [[UIView alloc] init];
    [self.view addSubview: _centerView];
    
    
    // Views customization
    _centerView.translatesAutoresizingMaskIntoConstraints = false;
    [_centerView.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor].active = true;
    [_centerView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor].active = true;
    CGFloat height = 0.75 * self.view.bounds.size.height;
    CGFloat width = 0.85 * self.view.bounds.size.width;
    [_centerView.heightAnchor constraintEqualToConstant:height].active = true;
    [_centerView.widthAnchor constraintEqualToConstant:width].active = true;
    
    _centerView.layer.cornerRadius = 0.2*width;
    _centerView.layer.borderWidth = 5;
    _centerView.layer.borderColor = UIColor.redColor.CGColor;
}


@end
