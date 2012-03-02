//
//  LBImageView.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBImageView.h"


@implementation LBImageView
@synthesize imageView;
-(void) setTheView{
	[super setTheView];
	self.imageView=[[UIImageViewTouchable alloc] initWithImage:[UIImage imageNamed:@"default.png"]];
	[self.view addSubview:self.imageView];
}
-(void)addProperty:(NSString *)name :(NSString *)value{
	if([name caseInsensitiveCompare:@"src"]==NSOrderedSame){
		self.imageView.image = [UIImage imageNamed:value];
		CGRect frame = self.imageView.frame;
		frame.size.width=self.imageView.image.size.width;
		frame.size.height=self.imageView.image.size.height;
		self.view.frame=frame;
		self.imageView.frame=frame;
		NSLog(@"Image frame size: %f, %f\n",self.view.frame.size.width,self.view.frame.size.height);
	}
	else{
		[super addProperty:name:value];
	}
}
-(UIView*) getViewRecursive{
	return self.imageView;
}
@end
