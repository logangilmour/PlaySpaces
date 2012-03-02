//
//  iPadProjectAppDelegate.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-06-15.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "iPadProjectAppDelegate.h"

@implementation iPadProjectAppDelegate

@synthesize window;
@synthesize mainView;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch
	MainView *main = [[MainView alloc]
					  initWithNibName:@"MainView" bundle:[NSBundle mainBundle]];
	[self setMainView:main];
	[main release];
    [window makeKeyAndVisible];

	[window addSubview:[mainView view]];
	
    
    return YES;
}


- (void)dealloc {
	[mainView release];
    [window release];
    [super dealloc];
}


@end
