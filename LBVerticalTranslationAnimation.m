//
//  LBVerticalTranslationAnimation.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBVerticalTranslationAnimation.h"


@implementation LBVerticalTranslationAnimation
- (void) initialize{
	[super initialize];	
	self.animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	self.animationName=@"VerticalTranslationAnimation";
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
	frame.origin.y+=ammount;
	self.view.frame=frame;
}
- (void) finishBackwardAnimation{
	CGRect frame = self.view.frame;
	frame.origin.y-=ammount;
	self.view.frame=frame;
}
@end
