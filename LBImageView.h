//
//  LBImageView.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBContentView.h"
#import "UIImageViewTouchable.h"

@interface LBImageView : LBContentView {
	UIImageView* imageView;
}
@property(nonatomic,retain)UIImageView* imageView;
@end
