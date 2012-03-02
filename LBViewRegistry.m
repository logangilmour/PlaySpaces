//
//  LBViewRegistry.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBViewRegistry.h"


@implementation LBViewRegistry
-(LBView*) getLBView:(NSString*) name{
	LBView * view;
	if([name caseInsensitiveCompare:@"page"]==NSOrderedSame){
		view = [[LBContentView alloc] init];
	}
	else if([name caseInsensitiveCompare:@"pagemanager"]==NSOrderedSame){
		view = [[LBPageManager alloc] init];
	}
	else if([name caseInsensitiveCompare:@"audio"]==NSOrderedSame){
		view = [[LBAudio alloc] init];
	}
	else if([name caseInsensitiveCompare:@"web"]==NSOrderedSame){
		view = [[LBWebView alloc] init];
	}
	else if([name caseInsensitiveCompare:@"video"]==NSOrderedSame){
		view = [[LBVideoView alloc] init];
	}
	else if([name caseInsensitiveCompare:@"image"]==NSOrderedSame){
		view = [[LBImageView alloc] init];
	}
	else if([name caseInsensitiveCompare:@"listener"]==NSOrderedSame){
		view = [[LBEventListener alloc] init];
	}
	else if([name caseInsensitiveCompare:@"horizontaltranslationanimation"]==NSOrderedSame){
		view = [[LBHorizontalTranslationAnimation alloc] init];
	}
	else if([name caseInsensitiveCompare:@"verticaltranslationanimation"]==NSOrderedSame){
		view = [[LBVerticalTranslationAnimation alloc] init];
	}
	else if([name caseInsensitiveCompare:@"scaleanimation"]==NSOrderedSame){
		view = [[LBScaleAnimation alloc] init];
	}
	else if([name caseInsensitiveCompare:@"opacityanimation"]==NSOrderedSame){
		view = [[LBOpacityAnimation alloc] init];
	}
	else{
		NSLog(@"%@ does not exist.", name);
	}
	return view;
}
@end
