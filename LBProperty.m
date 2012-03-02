//
//  LBProperty.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBProperty.h"


@implementation LBProperty
@synthesize name;
@synthesize value;
+(LBProperty*) create:(NSString*) n:(NSString*)v{
	LBProperty* this = [LBProperty alloc];
	this.name=n;
	this.value=v;
	return this;
}
@end
