//
//  ShakeUIView.m
//  iPadProject
//
//  Created by Logan Gilmour on 11-05-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShakeUIView.h"


@implementation ShakeUIView
-(BOOL)canBecomeFirstResponder
{
    return YES;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}
- (void)viewDidDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewDidDisappear:animated];
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
		NSLog(@"Detected shake.");
    }
	
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}

@end
