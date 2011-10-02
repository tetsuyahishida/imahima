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
    if([elementName isEqualToString:@"user"]){
        currentHima =[Hima alloc];
        currentNodeContent=[[NSMutableArray alloc] init];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"facebook_id"]){
        currentHima.facebook_id =currentNodeContent;
    }
    if([elementName isEqualToString:@"name"]){
        currentHima.facebook_name =currentNodeContent;
    }
    if([elementName isEqualToString:@"photo_url"]){
        currentHima.facebook_photo_url =currentNodeContent;
    }
    if([elementName isEqualToString:@"latitude"]){
        currentHima.latitude =currentNodeContent;
    }
    if([elementName isEqualToString:@"longtitude"]){
        currentHima.longitude=currentNodeContent;
    }
    if([elementName isEqualToString:@"imahima_time"]){
//        
//        NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
//        [inputDateFormatter setDateFormat:@"yyyy-MM-ddHH:mm:ss+Z"];
//        NSString*inputtext=
//        [currentNodeContent stringByReplacingOccurrencesOfString:@"T" withString:@""];
//
//        NSString *intputDateStr = inputtext;
//        NSDate *inputDate = [inputDateFormatter dateFromString:intputDateStr];
//        
//        NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
//        NSString *outputDateFormatterStr = @"yyyy/MM/dd HH:mm:ss";
//        [outputDateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"JST"]];
//        [outputDateFormatter setDateFormat:outputDateFormatterStr];
//        NSString *outputDateStr = [outputDateFormatter stringFromDate:inputDate];
//        NSLog(@"[in]%@ -> [out]%@(%@)", intputDateStr, outputDateStr, outputDateFormatterStr);
//        [inputDateFormatter release];
//        [outputDateFormatter release];
        currentHima.time=currentNodeContent;
    }
    if([elementName isEqualToString:@"user"]){
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
