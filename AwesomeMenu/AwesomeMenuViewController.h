//
//  AwesomeMenuViewController.h
//  AwesomeMenu
//
//  Created by Andrea Ottolina on 08/02/2012.
//  Copyright (c) 2012 Flubbermedia.com. All rights reserved.
//
//	Amended by Hajime Kimura on 03/24/2012
//  Copyright (c) 2012 nalabjp. All rights reserved.

#import <UIKit/UIKit.h>
#import "QuadCurveMenu.h"

typedef enum {
    MenuPositionLeftTop = 0,
    MenuPositionLeftMiddle,
    MenuPositionLeftBottom,
    MenuPositionRightTop,
    MenuPositionRightMiddle,
    MenuPositionRightBottom,
} MenuPosition;

@interface AwesomeMenuViewController : UIViewController <QuadCurveMenuDelegate>

@end
