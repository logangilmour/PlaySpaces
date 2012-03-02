//
//  LBVideoView.m
//  iPadProject
//
//  Created by Logan Gilmour on 11-05-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LBVideoView.h"


@implementation LBVideoView
@synthesize player;

-(void)addProperty:(NSString *)name :(NSString *)value{
	if([name caseInsensitiveCompare:@"src"]==NSOrderedSame){
		NSURL *URL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:value ofType:@"m4v"]];
		
		self.player=[[MPMoviePlayerController alloc] initWithContentURL:URL];
		self.player.controlStyle=MPMovieControlStyleNone;
		[self.view addSubview:self.player.view];
		if([player loadState]==MPMovieLoadStateUnknown){
			NSLog(@"Couldn' load video");
		}
	}else{
		[super addProperty:name :value];
	}
	self.player.view.frame=self.view.frame;
}

-(UIView*) getViewRecursive{
	return self.player.view;
}
-(void)consumeEvent:(LBEvent *)event{
	if([event.message caseInsensitiveCompare:@"play"]==NSOrderedSame){
		[player play];
		
	}else if([event.message caseInsensitiveCompare:@"reset"]==NSOrderedSame){
		[player stop];
	}
}
@end
