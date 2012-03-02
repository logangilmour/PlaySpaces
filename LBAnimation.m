//
//  LBAnimation.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBAnimation.h"


@implementation LBAnimation
@synthesize animation;
@synthesize animationName;


-(void) addProperty:(NSString *)name :(NSString *)value{
	if([name caseInsensitiveCompare:@"duration"]==NSOrderedSame){
		self.animation.duration=[value floatValue];
	}
	else if([name caseInsensitiveCompare:@"ammount"]==NSOrderedSame){
		ammount=[value floatValue];
	}
	else if([name caseInsensitiveCompare:@"from"]==NSOrderedSame){
		from= [value floatValue];
	}
	else{
		[super addProperty:name:value];
	}
	
}
-(void) setTheView{
	[super setTheView];
}
-(void) setUpAnimation{
	self.currentState=@"begin";
	self.animation.repeatCount=1;
	self.animation.autoreverses=NO;
	self.animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[self.animation setRemovedOnCompletion:NO];
	[self.animation setFillMode:kCAFillModeForwards];
	self.animation.delegate=self;
}
-(void)consumeEvent:(LBEvent *)event{
	if([event.message caseInsensitiveCompare:@"end"]==NSOrderedSame && [self.currentState caseInsensitiveCompare:@"begin"]==NSOrderedSame){
		//if([self.view.layer animationForKey:self.animationName]==nil){
			self.currentState=@"end";
			[self startForwardAnimation];
			[self.view.layer addAnimation:self.animation forKey:self.animationName];
		//}	
	}
	else if([event.message caseInsensitiveCompare:@"begin"]==NSOrderedSame && [self.currentState caseInsensitiveCompare:@"end"]==NSOrderedSame){
		//if([self.view.layer animationForKey:animationName]==nil){
			self.currentState=@"begin";
			[self startBackwardAnimation];
			[self.view.layer addAnimation:self.animation forKey:animationName];
		//}	
	}else if([event.message caseInsensitiveCompare:@"reset"]==NSOrderedSame){
		[self.view.layer removeAnimationForKey:animationName];
		self.currentState=@"begin";
		
	}
}
- (void)finishForwardAnimation{
	
}
- (void)finishBackwardAnimation{
	
}
- (void)startForwardAnimation{
}
-(void) startBackwardAnimation{
}
-(void)finishForward{
	LBEvent* event = [[LBEvent alloc] init];
	event.message=@"atEnd";
	[self alertListeners:event];
}
-(void)finishBackward{
	LBEvent* event = [[LBEvent alloc] init];
	event.message=@"atBegin";
	[self alertListeners:event];
}
- (void)animationDidStop:(CABasicAnimation *)theAnimation finished:(BOOL)flag
{
	if([self.currentState caseInsensitiveCompare:@"end"]==NSOrderedSame){
		[self.view.layer removeAnimationForKey:self.animationName];
		[self finishForwardAnimation];
		[self finishForward];
	}
	else{
		[self.view.layer removeAnimationForKey:self.animationName];
		[self finishBackwardAnimation];
		[self finishBackward];
	}
}
-(void)addChild:(LBView*)child{
	if(child.view!=nil){
		for(LBView* ch in self.children){
			if(ch.view!=nil){return;}
		}
	}
	[super addChild:child];
}
-(void) resolve{
	for(LBView* child in self.children){
		if(child.view!=nil){
			CGRect frame = child.view.frame;
			frame.origin.x=0;
			frame.origin.y=0;
			self.view.frame=child.view.frame;
			child.view.frame=frame;	
			return;
		}
	}
}
	
	
@end
