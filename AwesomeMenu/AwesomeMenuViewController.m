//
//  AwesomeMenuViewController.m
//  AwesomeMenu
//
//  Created by Andrea Ottolina on 08/02/2012.
//  Copyright (c) 2012 Flubbermedia.com. All rights reserved.
//
//	Amended by Hajime Kimura on 03/24/2012
//  Copyright (c) 2012 nalabjp. All rights reserved.

#import "AwesomeMenuViewController.h"

static CGFloat const kStartPointLeftX = 30.0f;
static CGFloat const kStartPointRightX = 290.0f;
static CGFloat const kStartPointTopY = 30.0f;
static CGFloat const kStartPointMiddleY = 240.0f;
static CGFloat const kStartPointBottomY = 450.0f;
static CGFloat const kLeftNearRadius = 110.0f;
static CGFloat const kLeftEndRadius = 120.0f;
static CGFloat const kLeftFarRadius = 140.0f;
static CGFloat const kRightNearRadius = -110.0f;
static CGFloat const kRightEndRadius = -120.0f;
static CGFloat const kRightFarRadius = -140.0f;

@interface AwesomeMenuViewController()

@property (nonatomic) MenuPosition menuPosition;
@property (nonatomic, strong) QuadCurveMenu *menu;

@end

@implementation AwesomeMenuViewController

@synthesize menuPosition, menu;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
    
    [self createQuadCurveMenu];
	
    [self.view addSubview:menu];
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - QuadCurveMenu delegate method

- (void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d", idx);
    menuPosition = idx;
    [self performSelector:@selector(redrawQuadCurveMenu) withObject:nil afterDelay:0.5];}

#pragma mark - Menu botton method
- (NSArray *)createQuadCurveMenuItems 
{
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    UIImage *num1Image = [UIImage imageNamed:@"icon-1.png"];
    UIImage *num2Image = [UIImage imageNamed:@"icon-2.png"];
    UIImage *num3Image = [UIImage imageNamed:@"icon-3.png"];
    UIImage *num4Image = [UIImage imageNamed:@"icon-4.png"];
    UIImage *num5Image = [UIImage imageNamed:@"icon-5.png"];
    UIImage *num6Image = [UIImage imageNamed:@"icon-6.png"];
	
    QuadCurveMenuItem *starMenuItem1 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed 
                                                                   contentImage:num1Image contentHighlightedImage:nil];
    
	QuadCurveMenuItem *starMenuItem2 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed 
                                                                   contentImage:num2Image contentHighlightedImage:nil];
    
	QuadCurveMenuItem *starMenuItem3 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed 
                                                                   contentImage:num3Image contentHighlightedImage:nil];
    
	QuadCurveMenuItem *starMenuItem4 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed 
                                                                   contentImage:num4Image contentHighlightedImage:nil];
    
	QuadCurveMenuItem *starMenuItem5 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed 
                                                                   contentImage:num5Image contentHighlightedImage:nil];
    
	QuadCurveMenuItem *starMenuItem6 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed 
                                                                   contentImage:num6Image contentHighlightedImage:nil];
    
    return [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, starMenuItem6, nil];
}

- (QuadCurveMenuItem *)createQuadCurveMenuCenterButton
{
    return [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-addbutton.png"]
                                   highlightedImage:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                       contentImage:[UIImage imageNamed:@"icon-plus.png"]
                            contentHighlightedImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
}

- (void)createQuadCurveMenu
{
    NSArray *menus = [self createQuadCurveMenuItems];
    QuadCurveMenuItem *centerButton = [self createQuadCurveMenuCenterButton];    
    
    /*
     * - QuadCurveMenu property -
     * nearRadius;      // Distance to the point of reaching the 2nd of animation when the item button will be expanded
     * endRadius;       // Distance to the point of reaching the 3rd of animation when the item button will be expanded
     * farRadius;       // Distance to the point of reaching the 1st of animation when the item button will be expanded
     * startPoint;      // Coordinate of the center point of the menu button
     * timeOffset;      // Time offset of the item until the start button animation
     * rotateAngle;     // Angle of the item button
     * menuWholeAngle;  // Orientation of the angle of the item button
     */
    switch (menuPosition) {
        case MenuPositionLeftTop:
            self.menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds
                                                       menus:menus
                                                  startPoint:CGPointMake(kStartPointLeftX, kStartPointTopY)
                                                      button:centerButton
                                                      offset:CGAffineTransformIdentity];
            self.menu.rotateAngle = M_PI_2;
            self.menu.menuWholeAngle = M_PI_2 /  (menus.count - 1) * menus.count;
            self.menu.nearRadius = kLeftNearRadius;
            self.menu.farRadius = kLeftFarRadius;
            self.menu.endRadius = kLeftEndRadius;
            break;
            
        case MenuPositionLeftMiddle:
            self.menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds
                                                       menus:menus
                                                  startPoint:CGPointMake(kStartPointLeftX, kStartPointMiddleY)
                                                      button:centerButton
                                                      offset:CGAffineTransformIdentity];
            self.menu.rotateAngle = 0;
            self.menu.menuWholeAngle = M_PI /  (menus.count - 1) * menus.count;
            self.menu.nearRadius = kLeftNearRadius;
            self.menu.farRadius = kLeftFarRadius;
            self.menu.endRadius = kLeftEndRadius;
            break;
            
        case MenuPositionLeftBottom:
            self.menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds
                                                       menus:menus
                                                  startPoint:CGPointMake(kStartPointLeftX, kStartPointBottomY)
                                                      button:centerButton
                                                      offset:CGAffineTransformIdentity];
            self.menu.rotateAngle = 0;
            self.menu.menuWholeAngle = M_PI_2 /  (menus.count - 1) * menus.count;
            self.menu.nearRadius = kLeftNearRadius;
            self.menu.farRadius = kLeftFarRadius;
            self.menu.endRadius = kLeftEndRadius;
            break;
        
        case MenuPositionRightTop:
            self.menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds
                                                       menus:menus
                                                  startPoint:CGPointMake(kStartPointRightX, kStartPointTopY)
                                                      button:centerButton
                                                      offset:CGAffineTransformIdentity];
            self.menu.rotateAngle = M_PI*2;
            self.menu.menuWholeAngle = M_PI_2 /  (menus.count - 1) * menus.count;
            self.menu.nearRadius = kRightNearRadius;
            self.menu.farRadius = kRightFarRadius;
            self.menu.endRadius = kRightEndRadius;
            break;
        
        case MenuPositionRightMiddle:
            self.menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds
                                                       menus:menus
                                                  startPoint:CGPointMake(kStartPointRightX, kStartPointMiddleY)
                                                      button:centerButton
                                                      offset:CGAffineTransformIdentity];
            self.menu.rotateAngle = M_PI*2;
            self.menu.menuWholeAngle = M_PI /  (menus.count - 1) * menus.count;
            self.menu.nearRadius = kRightNearRadius;
            self.menu.farRadius = kRightFarRadius;
            self.menu.endRadius = kRightEndRadius;
            break;
            
        case MenuPositionRightBottom:
            self.menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds
                                                       menus:menus
                                                  startPoint:CGPointMake(kStartPointRightX, kStartPointBottomY)
                                                      button:centerButton
                                                      offset:CGAffineTransformIdentity];
            self.menu.rotateAngle = M_PI*2+M_PI_2;
            self.menu.menuWholeAngle = M_PI_2 /  (menus.count - 1) * menus.count;
            self.menu.nearRadius = kRightNearRadius;
            self.menu.farRadius = kRightFarRadius;
            self.menu.endRadius = kRightEndRadius;
            break;
    }
        
    menu.delegate = self;
}

#pragma mark - Timer method
- (void)redrawQuadCurveMenu
{
    [self.menu removeFromSuperview];
    [self createQuadCurveMenu];
    [self.view addSubview:self.menu];
}

@end
