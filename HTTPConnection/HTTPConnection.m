//
//  HttpConnection.m
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HttpConnection.h"
#import "HttpModel.h"

@implementation HttpConnection
@synthesize urlConnection;
@synthesize recData;
@synthesize reqID;
@synthesize paramDict;
-(void)dealloc{
    [reqID release];
    [urlConnection release];
    [recData release];
    [paramDict release];
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self)
    {
        NSMutableData *data=[[NSMutableData alloc]init];
        self.recData=data;
        [data release];
    }
    return self;
}
#pragma mark -

-(BOOL)isEqualURLConnection:(id)urlConnection_{
    if (urlConnection_==self.urlConnection) {
        return TRUE;
    }
    return FALSE;
}
-(BOOL)isRequestIDEquals:(NSString*)reqID_{
    if (reqID_==self.reqID) {
        return TRUE;
    }
    return FALSE;
}
-(BOOL)isParameterEquals:(NSDictionary*)param_{
    if ([self.paramDict isEqualToDictionary:param_]) {
        return TRUE;
    }
    return FALSE;
}
-(void)setData:(NSData*)data{
    [self.recData appendData:(NSMutableData*)data];
}
@end
