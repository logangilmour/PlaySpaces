//
//  LBParser.m
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LBParser.h"
#import "LBView.h"

@implementation LBParser
@synthesize registry;
@synthesize currentView;

- (LBParser *) initLBParser:(LBViewRegistry*) reg{
	[super init];
	self.registry = reg;
	return self;
}
- (LBView*) parse:(NSData*) xmldata{
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmldata];
	
	//Initialize the delegate.
	//Set delegate
	[xmlParser setDelegate:self];
	
	//Start parsing the XML file.
	[xmlParser parse];
	return self.currentView;
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	LBView* view =[self.registry getLBView:elementName];
	for(NSString* key in [attributeDict allKeys]){
		[view addProperty:key :[attributeDict objectForKey:key]];
	}
	if(self.currentView!=nil){
		[self.currentView addChild: view];
		NSLog(@"added %@",view.name);
	}
	self.currentView=view;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	LBView* p = self.currentView.parent;
	  if(p!=nil){
		  [self.currentView resolve];
		  self.currentView=p;
	  }
}

- (void) dealloc {
	[super dealloc];
}

@end