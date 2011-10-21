//
//  XMLReader.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Hima;

@interface XMLReader : NSObject<NSXMLParserDelegate>{
    NSMutableString *currentNodeContent;
    NSMutableArray *himas;
    NSXMLParser *parser;
    Hima *currentHima;
}
@property(readonly,retain) NSMutableArray *himas;
-(id) loadXMLByURL:(NSString *)urlString;
-(void)NetworkIndicate;
@end
