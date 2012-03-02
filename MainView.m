//
//  MainView.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-04.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"

@implementation MainView
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (void)loadView{
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
	LBParser* parser = [[LBParser alloc] initLBParser:[[LBViewRegistry alloc]init]];
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ebook" ofType:@"xml"];  
	NSData *myData = [NSData dataWithContentsOfFile:filePath];
	LBView* view = [parser parse:myData];
	self.view=view.view;
}

- (void)dealloc {
    [super dealloc];
}
@end

// Ensures the shake is strong enough on at least two axes before declaring it a shake.
// "Strong enough" means "greater than a client-supplied threshold" in G's.
