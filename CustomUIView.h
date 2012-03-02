//
//  CustomUIView.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-04.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBContentView.h"
#import "LBParser.h"
#import "LBViewRegistry.h"


@interface CustomUIView : UIView {
	CGRect bound;
	CGPoint tap;
}
- (IBAction)handleTap:(UIGestureRecognizer *)sender;
@end
