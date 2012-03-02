//
//  LBView.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBView.h"


@implementation LBView
@synthesize parent;
@synthesize children;
@synthesize currentState;
@synthesize view;
@synthesize name;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dispatchEvent:(LBEvent*)event {
	LBView* view = self.parent;
	if(view != nil){
		[view dispatchEvent:event];
	}
	else{
		[self relayEvent:event];
	}
}
- (void)relayEvent:(LBEvent*)event{
	if([event.target caseInsensitiveCompare:self.name]==NSOrderedSame || event.target==nil){
		[self consumeEvent:event];
	}
	for(LBView *view in self.children){
		[view relayEvent:event];
	}
}
- (void) consumeEvent:(LBEvent*)event{
}
- (LBView*) init{
	[super init];
	self.children = [[NSMutableArray alloc] initWithCapacity:1];
	[self initialize];
	return self;
}
- (void) initialize{

}
- (void) addProperty:(NSString*) name:(NSString*) value{
	if([name caseInsensitiveCompare:@"name"]==NSOrderedSame){
		self.name = value;
	}
}
- (void) addChild:(LBView*)view{
	[self.children addObject:view];
	[view setLBParent:self];
}

- (UIView*) getViewRecursive{
	if(self.view!=nil){
		return self.view;
	}
	if(self.parent!=nil){
		return [self.parent getViewRecursive];
	}
	return nil;
}
- (void) setLBParent:(LBView*)view{
	self.parent=view;
	UIView* nearest = [view getViewRecursive];
	if(self.view!=nil && nearest!=nil){
		[nearest addSubview:self.view];
	}
}
+ (CGColorRef) hexToRGBA:(int) rgbaValue{
	CGFloat vals[4];
	vals[0]=((float)((rgbaValue & 0xFF000000) >> 24))/255.0;
	vals[1]=((float)((rgbaValue & 0xFF0000) >> 16))/255.0;
	vals[2]=((float)((rgbaValue & 0xFF00) >> 8))/255.0;
	vals[3]=((float)(rgbaValue & 0xFF))/255.0;
	CGColorRef color = CGColorCreate (CGColorSpaceCreateDeviceRGB(), vals);
	return color;
}
- (void) alertListeners:(LBEvent*)event{
	for(LBView* view in self.children){
		NSLog(@"alerted %@",view.name);
		[view eventGenerated:event];
	}
}
- (void) eventGenerated:(LBEvent*)event{
}
- (void) resolve{
}
-(void)setVariable:(NSString*) var:(NSString*) val{
	[self.variables setObject:val forKey:val];
}
-(NSString*) getVariable:(NSString*)name{
	NSString* value = [self.variables valueForKey:name];
	if(value!=nil){return name;}
	if(self.parent!=nil){
		return [self.parent getVariable:name];
	}
	return nil;
}
@end
