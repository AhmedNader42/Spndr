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
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetection:)];
        pan.cancelsTouchesInView = false;
        pan.minimumNumberOfTouches = 1;
        pan.maximumNumberOfTouches = 1;
        self.backgroundColor = UIColor.magentaColor;
        [self addGestureRecognizer: pan];
    }
    return self;
}


- (void) panDetection: (UIPanGestureRecognizer *) panGesture {
    
    CGPoint translation = [panGesture translationInView: self];
    CGFloat factor = (self.bounds.size.width - fabs(translation.x) ) /  self.bounds.size.width;
    
    CGAffineTransform t = CGAffineTransformIdentity;
    
    
    t = CGAffineTransformTranslate(t, translation.x, translation.y);
    
    self.transform = t;
    
    
    self.alpha = factor;

    
    
    
    NSLog(@"%f", translation.x);
    if (translation.x >= 100) {
        NSLog(@"Threshhold reached");
//        self.bounds.origin.x += 1000;
    }
    
    if (translation.x <= 0) {
        NSLog(@"Negative Threshhold reached");
//        self.bounds.origin.x -= 1000;
    }
    
    
    [self setNeedsDisplay];
}


@end



