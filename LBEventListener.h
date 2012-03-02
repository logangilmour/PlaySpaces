//
//  LBEventListener.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBView.h"


@interface LBEventListener : LBView {
	NSString* message;
	NSString* target;
	NSString* state;
	NSString* onEvent;
}
@property(nonatomic,retain)NSString* message;
@property(nonatomic,retain)NSString* target;
@property(nonatomic,retain)NSString* state;
@property(nonatomic,retain)NSString* onEvent;
@end
