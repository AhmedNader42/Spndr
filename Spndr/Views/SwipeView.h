//
//  SwipeView.h
//  Spndr
//
//  Created by ahmed on 2/8/19.
//  Copyright © 2019 ahmed. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol SwipeViewDelegate
- (void) didFinishSwipe: (BOOL) shouldRemove;

@end

@interface SwipeView : UIView <NSObject>
- (void) setThresholdPoints: (double) rightBound : (double) leftBound;
@property double rightBound;
@property double leftBound;
@property (nonatomic, weak) id delegate;
@end
