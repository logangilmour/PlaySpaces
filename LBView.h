//
//  LBView.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBEvent.h"
#import	"LBProperty.h"
#import "QuartzCore/CAAnimation.h"
#import "QuartzCore/CAMediaTimingFunction.h"


@interface LBView : NSObject{
	UIView* view;
	LBView* parent;
	NSMutableArray* children;
	NSString* name;
	NSString* currentState;
	NSMutableDictionary* variables;
}
@property(nonatomic,retain) UIView* view;
@property(nonatomic,retain) LBView* parent;
@property(nonatomic,retain) NSMutableArray* children;
@property(nonatomic,retain) NSString* currentState;
@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSMutableDictionary* variables;
-(void)dispatchEvent:(LBEvent*)event;
-(void)relayEvent:(LBEvent*)event;
-(void)consumeEvent:(LBEvent*)event;
- (void) addProperty:(NSString*) name:(NSString*) value;
- (void) addChild:(LBView*) view;
- (UIView*) getViewRecursive;
- (void) setLBParent:(LBView *)view;
+ (CGColorRef) hexToRGBA:(int)rgbaValue;
- (void) initialize;
- (void) alertListeners:(LBEvent*)event;
- (void) eventGenerated:(LBEvent*)event;
- (void) resolve;
-(void)setVariable:(NSString*) var:(NSString*) val;
-(NSString*) getVariable:(NSString*)name;	
@end
