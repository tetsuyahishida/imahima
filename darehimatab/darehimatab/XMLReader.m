//
//  XMLReader.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "XMLReader.h"
#import "Hima.h"

@implementation XMLReader
@synthesize himas;
-(id)loadXMLByURL:(NSString *)urlString
{
    himas       =[[NSMutableArray alloc]init];
    NSURL *url  =[NSURL URLWithString:urlString];
    parser      =[[NSXMLParser alloc]initWithContentsOfURL:url];
    parser.delegate=self;
    [parser parse];
    return self;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"friend"]){
        currentHima =[Hima alloc];
        currentNodeContent=[[NSMutableArray alloc] init];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"facebook_id"]){
        currentHima.content =currentNodeContent;
    }
    if([elementName isEqualToString:@"facebook_name"]){
        currentHima.createdAt =currentNodeContent;
    }    
    if([elementName isEqualToString:@"friend"]){
        [himas addObject:currentHima];
        [currentHima release];
        currentHima = nil;
        [currentNodeContent release];
        currentNodeContent = nil;
    }    


    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentNodeContent = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end
