//
//  LBAudio.m
//  iPadProject
//
//  Created by Logan Gilmour on 11-05-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LBAudio.h"


@implementation LBAudio
@synthesize player;
- (void) addProperty:(NSString*) name:(NSString*) value{
	if([name caseInsensitiveCompare:@"src"]==NSOrderedSame){
		NSURL *URL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:value ofType:@"mp3"]];
		self.player = [[AVAudioPlayer alloc] initWithContentsOfURL: URL
															 error: nil];
	}
	else{
		[super addProperty:name:value];
	}
}
-(void)consumeEvent:(LBEvent *)event{
	if([event.message caseInsensitiveCompare:@"play"]==NSOrderedSame){
		[self.player play];
	}
	else if([event.message caseInsensitiveCompare:@"reset"]==NSOrderedSame){
		[self.player stop];
		self.player.currentTime=0;
	}
}
@end
