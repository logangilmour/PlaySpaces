//
//  LBPageManager.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBPageManager.h"
#import "MyScrollView.h"

@implementation LBPageManager
@synthesize scroll;
@synthesize active;
@synthesize current;
-(void) setTheView{
	self.scroll = [[MyScrollView alloc] initWithFrame:CGRectMake(0,0,1,1)];
	self.view=self.scroll;
	//self.view.backgroundColor=[UIColor clearColor];
	[self.scroll setScrollEnabled:YES];
	[self.scroll setBounces:YES];
	[self.scroll setUserInteractionEnabled:NO];
	self.scroll.showsVerticalScrollIndicator=NO;
	self.scroll.showsHorizontalScrollIndicator=NO;
	[self.scroll setPagingEnabled:YES];
	self.scroll.delegate=self;
	self.scroll.contentSize = CGSizeMake(0,0);
	[self.scroll setScrollEnabled:NO];
}
-(void) addChild:(LBView*)view{
	NSLog(@"Got here\n");
	UIView* old = [[self.scroll subviews] lastObject];
	if(self.current=nil){self.current=view;}
	CGRect frame = view.view.frame;
	frame.size.width=self.view.frame.size.width;
	frame.size.height=self.view.frame.size.height;
	frame.origin.x=0;
	frame.origin.y=0;
	if(old!=nil){
		frame.origin.x=(old.frame.origin.x+self.view.frame.size.width);
	}
	view.view.frame=frame;
	CGSize s = self.scroll.contentSize;
	s.width+=view.view.frame.size.width;
	self.scroll.contentSize=s;
	[super addChild:view];
}
-(void)consumeEvent:(LBEvent *)event{
	for (int i=0; i<[self.children count]; i++) {
		LBView* child = [self.children objectAtIndex:i];
		if([child.name caseInsensitiveCompare:event.message]==NSOrderedSame){
			CGPoint off = child.view.frame.origin;
			[self.scroll setContentOffset:off animated:YES];
			self.current=child;
		}
	}
}
- (void) addProperty:(NSString*) name:(NSString*) value{
	if([name caseInsensitiveCompare:@"active"]==NSOrderedSame){
		[self.scroll setScrollEnabled:YES];
		[self.scroll setUserInteractionEnabled:YES];

	}
	else{
		[super addProperty:name:value];
	}
}
- (void)scrollViewDidScroll:(UIScrollView *)sender {
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	LBEvent* event = [[LBEvent alloc] init];
	UIView* last = [[self.scroll subviews] lastObject];
	self.current = [self.children objectAtIndex:(self.scroll.contentOffset.x/last.frame.size.width)+1];
	event.message=self.current.name;
	[self alertListeners:event];
}

@end
