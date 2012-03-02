//
//  CustomUIView.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-04.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CustomUIView.h"


@implementation CustomUIView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		LBParser* parser = [[LBParser alloc] initLBParser:[[LBViewRegistry alloc]init]];
		NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ebook" ofType:@"xml"];  
		NSData *myData = [NSData dataWithContentsOfFile:filePath];
		LBView* view = [parser parse:myData];
		[self addSubview:view];
		bound = CGRectMake(100, 100, 200, 200);
		tap = CGPointMake(0, 0);
		UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc]
													initWithTarget:self action:@selector(handleTap:)];
		singleFingerDTap.numberOfTapsRequired = 1;
		[self addGestureRecognizer:singleFingerDTap];
		[singleFingerDTap release];
    }
    return self;
}

- (IBAction)handleTap:(UIGestureRecognizer *)sender {
    CGPoint tapPoint = [sender locationInView:sender.view];
	if(CGRectContainsPoint(bound, tapPoint)){
		bound.origin.x+=20;
		
	}
	tap = tapPoint;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
	
	CGContextRef contextRef = UIGraphicsGetCurrentContext();

	CGContextClearRect(contextRef, rect);
	CGContextSetRGBFillColor(contextRef, 0, 0, 255, 1);
	CGContextSetRGBStrokeColor(contextRef, 0, 0, 255, 1);
	
	// Draw a circle (filled)
	CGContextFillEllipseInRect(contextRef, bound);
	UIFont * f = [UIFont systemFontOfSize:20];
	NSString * str = NSStringFromCGPoint(tap);
	[str drawAtPoint:CGPointMake(0,0) withFont:f];
}

- (void)dealloc {
    [super dealloc];
}


@end
