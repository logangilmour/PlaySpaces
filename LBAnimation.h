//
//  LBAnimation.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBContentView.h"

@interface LBAnimation : LBContentView{
	CABasicAnimation* animation;
	NSString* animationName;
	CGFloat ammount;
	CGFloat from;
}
-(void)finishForward;
-(void)finishBackward;
- (void)finishForwardAnimation;
- (void)finishBackwardAnimation;
- (void)startForwardAnimation;
-(void) startBackwardAnimation;
-(void) setUpAnimation;
@property(nonatomic,retain)CABasicAnimation* animation;
@property(nonatomic,retain)NSString* animationName;
@end
