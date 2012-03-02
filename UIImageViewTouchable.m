//
//  UIImageViewTouchable.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-26.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UIImageViewTouchable.h"


@implementation UIImageViewTouchable
- (id) initWithImage: (UIImage*) image{
	self.userInteractionEnabled=YES;
	return [super initWithImage: image];
}
- (BOOL) canBecomeFirstResponder{
	return YES;
}


@end
