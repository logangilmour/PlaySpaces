//
//  LBParser.h
//  iPadProject
//
//  Created by Logan Gilmour on 10-08-19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBViewRegistry.h"
#import "LBView.h"


@interface LBParser : NSObject {
	LBViewRegistry* registry;
	LBView* currentView;
}
@property(nonatomic,retain)LBViewRegistry* registry;
@property(nonatomic,retain)LBView* currentView;
- (LBParser*) initLBParser:(LBViewRegistry*)reg;
- (LBView*) parse:(NSData*) xmldata;
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict;

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
@end
