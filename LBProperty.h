//
//  LBProperty.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LBProperty : NSObject {
	NSString* name;
	NSString* value;
}
+(LBProperty*) create:(NSString*) n:(NSString*)v;
@property(nonatomic,retain) NSString * name;
@property(nonatomic,retain) NSString * value;

@end
