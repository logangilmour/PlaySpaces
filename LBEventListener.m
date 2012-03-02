//
//  LBEventListener.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBEventListener.h"


@implementation LBEventListener
@synthesize message;
@synthesize target;
@synthesize state;
@synthesize onEvent;
- (void) addProperty:(NSString*) name:(NSString*) value{
	if([name caseInsensitiveCompare:@"state"]==NSOrderedSame){
		self.state=value;
	}
	else if([name caseInsensitiveCompare:@"message"]==NSOrderedSame){
		self.message=value;
	}
	else if([name caseInsensitiveCompare:@"for"]==NSOrderedSame){
		self.onEvent=value;
	}
	else if([name caseInsensitiveCompare:@"target"]==NSOrderedSame){
		self.target=value;
	}
	else{
		[super addProperty:name:value];
	}
}
-(void) eventGenerated:(LBEvent*)event{
	NSLog(@"Heard an event: %@", event.message);
	if([event.message caseInsensitiveCompare:self.onEvent]==NSOrderedSame
		   && [self.state caseInsensitiveCompare:@"on"]==NSOrderedSame){
		LBEvent* event = [[LBEvent alloc] init];
		NSLog(@"Heard Correct Event");
		event.target=self.target;
		event.message = self.message;
		[self dispatchEvent:event];
	}
}
-(void)consumeEvent:(LBEvent *)event{
	if([event.message caseInsensitiveCompare:@"on"]==NSOrderedSame){
		self.state=@"on";	
	}
	else if([event.message caseInsensitiveCompare:@"off"]==NSOrderedSame){
		self.state=@"off";
	}
}

@end
