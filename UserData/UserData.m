//
//  UserData.m
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserData.h"


@implementation UserData
@synthesize userID;
@synthesize userDataDict;

-(void)dealloc{
    [userID release];
    [userDataDict release];
    [super dealloc];
}

-(BOOL)isUserIDEqual:(NSString*)userID_{
    if ([self.userID isEqualToString:userID_]) {
        return TRUE;
    }
    return FALSE;
}
@end
