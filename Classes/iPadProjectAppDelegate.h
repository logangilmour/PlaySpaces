//
//  iPadProjectAppDelegate.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-06-15.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "ShakeWindow.h"

@class MainViewController;
@interface iPadProjectAppDelegate : NSObject <UIApplicationDelegate> {
    ShakeWindow *window;
	MainView *mainView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainView *mainView;
@end

