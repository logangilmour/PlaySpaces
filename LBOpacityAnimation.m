//
//  LBOpacityAnimation.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBOpacityAnimation.h"


@implementation LBOpacityAnimation
- (void) initialize{
	[super initialize];
	from=1;
	self.animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
	self.animationName=@"OpacityAnimation";
	[self setUpAnimation];
}
- (void) startForwardAnimation{
	self.animation.fromValue=[NSNumber numberWithFloat:from];
	self.animation.toValue=[NSNumber numberWithFloat:ammount];
}
-(void)startBackwardAnimation{
	self.animation.fromValue=[NSNumber numberWithFloat:ammount];
	self.animation.toValue=[NSNumber numberWithFloat:from];
}
-(void)finishForwardAnimation{
	CGRect frame = self.view.frame;
	self.view.alpha=ammount;
}
- (void) finishBackwardAnimation{
	CGRect frame = self.view.frame;
	self.view.alpha=from;
}
-(void) resolve{
	[super resolve];
	self.view.alpha=from;
}

@end
