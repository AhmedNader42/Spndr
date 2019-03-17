//
//  ViewController.m
//  Spndr
//
//  Created by ahmed on 1/25/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int currentViewIndex;
@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _currentViewIndex = 0;
    _swipeViews = [[NSMutableArray alloc] initWithCapacity: 5];
    [self setupUI];
}

- (void) setupUI {
    for (int i = 4; i>=0 ; i--) {
        // Instantiate a view object
        SwipeView *swipeView = [self createSwipeView];
        
        // Add it to the array of 5 visible views on the screen.
        [_swipeViews addObject: (UIView *)swipeView];
        
        // Don't let any of the views be moved
        if (i > 0) {
            [swipeView setUserInteractionEnabled:NO];
        }
        
        [self setupView:swipeView :i];
    }
}


- (SwipeView *) createSwipeView {
    SwipeView *swipeView = [[SwipeView alloc] init];
    
    // Set the threshold points from the right and left
    [swipeView setThresholdPoints: (self.view.center.x - 40): (self.view.center.x - 220)];
    
    // Add the current ViewController as your delegate to receive messages.
    swipeView.delegate = self;
    return swipeView;
}

- (void) setupView: (SwipeView *)swipeView :(int) multiplier {
    // Add it as a subView to the main view.
    [self.view addSubview: swipeView];
    
    // Views customization
    swipeView.translatesAutoresizingMaskIntoConstraints = false;
    [swipeView.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor constant:-multiplier*10].active = true;
    [swipeView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant:-multiplier*5].active = true;
    
    CGFloat height = 0.70 * self.view.bounds.size.height;
    CGFloat width = 0.75 * self.view.bounds.size.width;
    [swipeView.heightAnchor constraintEqualToConstant:height].active = true;
    [swipeView.widthAnchor constraintEqualToConstant:width].active = true;
    
    swipeView.layer.cornerRadius = 0.2*width;
    swipeView.layer.borderWidth = 5;
    swipeView.layer.borderColor = UIColor.redColor.CGColor;
}

- (void)didFinishSwipe:(BOOL)shouldRemove {

    if (shouldRemove) {
        NSLog(@"Removing View");
        [_swipeViews[_currentViewIndex%5] removeFromSuperview];
        [_swipeViews removeObjectAtIndex:_currentViewIndex%5];
        
        _currentViewIndex += 1;
        SwipeView *nextView = [self createSwipeView];
        
        [self setupView:nextView : _currentViewIndex%5];
        [_swipeViews addObject:nextView];
        NSLog(@"%lu", (unsigned long)_swipeViews.count);
        [self.view setNeedsDisplay];
    } else {
        NSLog(@"Reseting View");
        [UIView animateWithDuration:0.5 animations:^{
            CGPoint p = CGPointMake(self.view.center.x, self.view.center.y);
            SwipeView *currentView = self->_swipeViews.lastObject;
            currentView.center = p;
            [self.view setNeedsDisplay];
        }];
        
    }
    
}

@end
