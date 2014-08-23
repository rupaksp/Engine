//
//  Engine.h
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericParser.h"
#import "UserData.h"
#import "FileHandler.h"
#import "HttpModel.h"
#import "CustomActivityIndicatorView.h"
@class AppDelegate;

@protocol EngineDelegate

-(void)responseSuccessfullyRecieved:(NSDictionary*)response withRequestID:(NSString*)reqID;
-(void)responseFailed:(NSDictionary*)responseWithError withRequestID:(NSString*)reqID;


@end

@interface Engine : NSObject <HttpModelDelegate> {
 
}

@end
