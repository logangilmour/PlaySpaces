//
//  LBPageManager.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBContentView.h"


@interface LBPageManager : LBContentView <UIScrollViewDelegate>{
	UIScrollView* scroll;
	bool active;
	LBView* current;
}
@property(assign) bool active;
@property(nonatomic, retain) UIScrollView* scroll;
@property(nonatomic, retain) LBView* current;
@end
