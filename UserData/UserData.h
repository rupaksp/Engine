//
//  UserData.h
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserData : NSObject {
    
    NSString *userID;
    NSMutableDictionary *userDataDict;
}

@property(nonatomic,retain) NSString *userID;
@property(nonatomic,retain) NSMutableDictionary *userDataDict;

-(BOOL)isUserIDEqual:(NSString*)userID_;
@end
