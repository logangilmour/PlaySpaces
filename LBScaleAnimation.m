//
//  LBScaleAnimation.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-26.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBScaleAnimation.h"


@implementation LBScaleAnimation
- (void) initialize{
	[super initialize];
	from=1;
	self.animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
	self.animationName=@"ScaleAnimation";
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
	self.view.transform = CGAffineTransformMakeScale(ammount, ammount);
}
- (void) finishBackwardAnimation{
	CGRect frame = self.view.frame;
	self.view.transform=CGAffineTransformMakeScale(from, from);
}
-(void) resolve{
	[super resolve];
	self.view.transform=CGAffineTransformConcat(self.view.transform, CGAffineTransformMakeScale(from, from));
}
@end
