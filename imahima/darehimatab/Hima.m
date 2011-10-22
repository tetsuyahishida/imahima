//
//  Hima.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Hima.h"

@implementation Hima
@synthesize facebook_id,facebook_name,facebook_photo_url,latitude,longitude,time,accesstoken,identifire;


-(id)init
{
    self=[self init];
    if(!self){
        return nil;
    }

    //識別子を作成する
    CFUUIDRef   uuid;
    uuid=CFUUIDCreate(NULL);
    identifire=(NSString*)CFUUIDCreateString(NULL,uuid);
    CFRelease(uuid);
    
    return self;
    
}

-(void)encodeWithCoder:(NSCoder*)encoder
{
    //インスタンス変数をエンコードする
    [encoder encodeObject:identifire forKey:@"identifire"];
    [encoder encodeObject:facebook_id forKey:@"facebook_id"];
    [encoder encodeObject:facebook_name forKey:@"facebook_name"];
    [encoder encodeObject:facebook_photo_url forKey:@"facebook_photo_url"];
    [encoder encodeObject:latitude forKey:@"latitude"];
    [encoder encodeObject:longitude forKey:@"longitude"];
    [encoder encodeObject:time forKey:@"time"];
}

-(id)initWithCoder:(NSCoder*)decoder
{
    self=[super init];
    if(!self){
        return nil;
    }
    //インスタンス変数をデコードする
    identifire=[[decoder decodeObjectForKey:@"identifire"]retain];
    facebook_id=[[decoder decodeObjectForKey:@"facebook_id"]retain];
    facebook_name=[[decoder decodeObjectForKey:@"facebook_name"]retain];
    facebook_photo_url=[[decoder decodeObjectForKey:@"facebook_photo_url"]retain];
    latitude=[[decoder decodeObjectForKey:@"latitude"]retain];
    longitude=[[decoder decodeObjectForKey:@"longitude"]retain];
    time=[[decoder decodeObjectForKey:@"time"]retain];
    
    return self;
}
-(void)dealloc
{
    //インスタンス変数を解放する
    [identifire release],identifire=nil;
    [facebook_id release],facebook_id=nil;
    [facebook_name release],facebook_name=nil;
    [facebook_photo_url release],facebook_photo_url=nil;
    [latitude release],latitude=nil;
    [longitude release],longitude=nil;
    [time release],time=nil;
    
    //親クラスのdeallocを呼び出す
    [super dealloc];
}
@end
