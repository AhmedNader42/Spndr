//
//  ViewController.h
//  Spndr
//
//  Created by ahmed on 1/25/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeView.h"

@interface ViewController : UIViewController <SwipeViewDelegate>
@property SwipeView *swipeView;
@end

