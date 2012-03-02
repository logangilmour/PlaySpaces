//
//  ShakeWindow.m
//  iPadProject
//
//  Created by Logan Gilmour on 11-05-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShakeWindow.h"


@implementation ShakeWindow
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	NSLog(@"Device was shaken!");

    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DeviceShaken" object:self];
		NSLog(@"Device was shaken!");
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
    [super viewDidAppear:animated];
	
    //any extra set up code...
}
- (BOOL)canBecomeFirstResponder 
{ 
    return YES; 
}
@end
