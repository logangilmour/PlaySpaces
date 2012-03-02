//
//  LBTranslationAnimation.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBHorizontalTranslationAnimation.h"


@implementation LBHorizontalTranslationAnimation
- (void) initialize{
	[super initialize];	
	self.animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
	self.animationName=@"HorizontalTranslationAnimation";
	[self setUpAnimation];
}
- (void) startForwardAnimation{
	self.animation.fromValue=[NSNumber numberWithFloat:0];
	self.animation.toValue=[NSNumber numberWithFloat:ammount];
}
- (void) startBackwardAnimation{
	self.animation.fromValue=[NSNumber numberWithFloat:0];
	self.animation.toValue=[NSNumber numberWithFloat:-ammount];
}
- (void) finishForwardAnimation{
	CGRect frame = self.view.frame;
	frame.origin.x+=ammount;
	self.view.frame=frame;
}
- (void) finishBackwardAnimation{
	CGRect frame = self.view.frame;
	frame.origin.x-=ammount;
	self.view.frame=frame;
}
@end
