//
//  LBViewRegistry.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBView.h"
#import "LBContentView.h"
#import "LBPageManager.h"
#import "LBImageView.h"
#import "LBEventListener.h"
#import	"LBHorizontalTranslationAnimation.h"
#import "LBVerticalTranslationAnimation.h"
#import "LBScaleAnimation.h"
#import "LBOpacityAnimation.h"
#import "LBWebView.h"
#import "LBVideoView.h"
#import "LBAudio.h"

@interface LBViewRegistry : NSObject {
	
}
-(LBView*) getLBView:(NSString*) name;
@end
