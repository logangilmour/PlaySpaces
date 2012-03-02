//
//  UIWebView.h
//  iPadProject
//
//  Created by Logan Gilmour on 11-05-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBContentView.h"


@interface LBWebView : LBContentView {
	UIWebView* webView;
}
@property(nonatomic,retain)UIWebView* webView;
@end

