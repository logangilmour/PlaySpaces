//
//  LBEvent.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LBEvent : NSObject {
	NSString *target;
	NSString *message;
	NSString *state;
}
@property(nonatomic,retain) NSString * target;
@property(nonatomic,retain) NSString * message;
@property(nonatomic,retain) NSString * state;
@end
