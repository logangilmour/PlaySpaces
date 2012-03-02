//
//  UIWebView.m
//  iPadProject
//
//  Created by Logan Gilmour on 11-05-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LBWebView.h"


@implementation LBWebView
@synthesize webView;
-(void) setTheView{
	[super setTheView];
	self.webView=[[UIWebView alloc] init];
	[self.view addSubview:self.webView];
}
-(void)addProperty:(NSString *)name :(NSString *)value{
	if([name caseInsensitiveCompare:@"url"]==NSOrderedSame){
		NSURL *url = [NSURL URLWithString:value];
		NSURLRequest *req = [NSURLRequest requestWithURL:url];
		[webView loadRequest:req];
	}
	else{
		[super addProperty:name:value];
	}
	self.webView.frame=self.view.frame;
}

-(UIView*) getViewRecursive{
	return self.webView;
}
-(void)consumeEvent:(LBEvent *)event{
	[webView stringByEvaluatingJavaScriptFromString:@"document.open();document.close()"];
	NSURL *url = [NSURL URLWithString:event.message];
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	[webView loadRequest:req];
}
@end
