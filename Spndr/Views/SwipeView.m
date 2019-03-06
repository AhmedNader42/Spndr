//
//  SwipeView.m
//  Spndr
//
//  Created by ahmed on 2/8/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

#import "SwipeView.h"

@interface SwipeView()

@end

@implementation SwipeView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _rightBound = INFINITY;
        _leftBound = -INFINITY;
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetection:)];
        pan.cancelsTouchesInView = false;
        pan.minimumNumberOfTouches = 1;
        pan.maximumNumberOfTouches = 1;
        self.backgroundColor = UIColor.blackColor;
        [self addGestureRecognizer: pan];
        
        
    }
    return self;
}

- (void) setThresholdPoints: (double) rightBound : (double) leftBound
{
    _rightBound = rightBound;
    _leftBound = leftBound;
}




- (void) panDetection: (UIPanGestureRecognizer *) panGesture {
    
    
    CGPoint translation = [panGesture translationInView: self];
    CGFloat factor = (self.bounds.size.width - fabs(translation.x) ) /  self.bounds.size.width;
    CGAffineTransform t = CGAffineTransformIdentity;

    if (panGesture.state == UIGestureRecognizerStateChanged){
        
        t = CGAffineTransformTranslate(t, translation.x, translation.y);
        self.transform = t;
        self.alpha = factor;
    }
    
    
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Right %f", _rightBound);
        NSLog(@"Left %f", _leftBound);
        NSLog(@"%f", translation.x);
        if (translation.x > _rightBound) {
            NSLog(@"Threshhold reached");
            t = CGAffineTransformTranslate(t, 10000, translation.y);
            self.transform = t;
        }
        
        if (translation.x < _leftBound) {
            NSLog(@"Negative Threshhold reached");
            t = CGAffineTransformTranslate(t, -10000, translation.y);
            self.transform = t;
            
        }
    }
    
    [self setNeedsDisplay];
}


@end



