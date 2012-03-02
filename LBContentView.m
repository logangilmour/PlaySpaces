//
//  LBContentView.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-17.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBContentView.h"


@implementation LBContentView
-(void)initialize{
	[self setTheView];
	self.view.backgroundColor=[UIColor clearColor];
	self.view.opaque=NO;
	UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc]
												initWithTarget:self action:@selector(handleTap:)];
	singleFingerDTap.numberOfTapsRequired = 1;
	[self.view addGestureRecognizer:singleFingerDTap];
	[singleFingerDTap release];
}
-(void) setTheView{
	self.view=[[ShakeUIView alloc] initWithFrame:CGRectMake(0,0,1,1)];
}
-(void)addProperty:(NSString *)name :(NSString *)value{
	
	if([name caseInsensitiveCompare:@"top"]==NSOrderedSame){
		CGRect r = self.view.frame;
		r.origin.y= [value floatValue];
		self.view.frame = r;
	}
	else if([name caseInsensitiveCompare:@"left"]==NSOrderedSame){
		CGRect r = self.view.frame;
		r.origin.x= [value floatValue];
		self.view.frame=r;
	}
	else if([name caseInsensitiveCompare:@"background"]==NSOrderedSame){
		[self setBackgroundColor:value];
	}
	else if([name caseInsensitiveCompare:@"width"]==NSOrderedSame){
		CGRect r = self.view.frame;
		r.size.width= [value floatValue];
		NSLog(@"Init Width: %f\n",r.size.width);
		self.view.frame=r;
	}
	else if([name caseInsensitiveCompare:@"height"]==NSOrderedSame){
		CGRect r = self.view.frame;
		r.size.height= [value floatValue];
		self.view.frame=r;
	}else if([name caseInsensitiveCompare:@"pressable"]==NSOrderedSame){
		UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc]
											   initWithTarget:self action:@selector(handleLongPress:)];
		press.minimumPressDuration=0.01;
		[self.view addGestureRecognizer:press];
		[press release];
	}
	else{
		[super addProperty:name:value];
	}
}
- (void)setBackgroundColor:(NSString*)value{
	unsigned int x;
	[[NSScanner scannerWithString:value] scanHexInt:&x];
	NSLog(@"Number: %d", x);
	self.view.backgroundColor=[UIColor colorWithCGColor:[LBView hexToRGBA:x]];
}
- (void)consumeEvent:(LBEvent*)event{
	NSLog(@"Recieved event!");
	if([event.message caseInsensitiveCompare:@"changecolor"]==NSOrderedSame){
	
	}
}
- (IBAction)handleTap:(UIGestureRecognizer *)sender {
	LBEvent* event = [[LBEvent alloc] init];
	event.message=@"singletap";
	NSLog(@"%@ was single-tapped!\n",self.name);
	[self alertListeners:event];
}
- (void)handleLongPress:(UIGestureRecognizer *)gr {
	LBEvent* event = [[LBEvent alloc] init];
	if (gr.state == UIGestureRecognizerStateBegan) {
		event.message=@"touchbegin";
		NSLog(@"%@ press event!\n",self.name);
		[self alertListeners:event];
	} else if(gr.state== UIGestureRecognizerStateEnded){
		event.message=@"touchend";
		NSLog(@"%@ release event!\n",self.name);
		[self alertListeners:event];
	}
}



@end
