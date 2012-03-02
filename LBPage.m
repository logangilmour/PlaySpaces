//
//  LBPage.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBPage.h"


@implementation LBPage
-(void)addProperty:(NSString*) name, (NSString*) value{
	if([name caseInsensitiveCompare:@"number"]==NSOrderedSame){
		CGRect r = self.frame;
		r.size.height= [value floatValue];
		self.frame=r;
	}
	else{
		[super addProperty:name:value];
	}
@end
