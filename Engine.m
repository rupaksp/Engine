//
//  Engine.m
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Engine.h"
#import "AppDelegate.h"
@implementation Engine

-(void)dealloc{
   }
- (id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

-(void)responseSuccessfullyRecieved:(NSMutableDictionary*)response withRequestID:(NSString*)reqID{
}

-(void)stopIndicator{
    
}

-(void)responseFailed:(NSDictionary*)responseWithError withRequestID:(NSString*)reqID{
}

@end
