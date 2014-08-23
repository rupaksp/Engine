//
//  HttpModel.h
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HttpConnection.h"


@protocol HttpModelDelegate 

@required
-(void)responseSuccessfullyRecieved:(NSDictionary*)response withRequestID:(NSString*)reqID;
-(void)responseFailed:(NSDictionary*)responseWithError withRequestID:(NSString*)reqID;

@end

@interface HttpModel : NSObject {
  
    NSMutableDictionary *requestList;
    id <HttpModelDelegate> delegate;
}

@property (nonatomic,assign) id <HttpModelDelegate> delegate;
@property (nonatomic,retain) NSMutableDictionary *requestList;
-(void)cancelRequest:(NSString*)reqID withData:(NSDictionary*)dict;
-(void)sendRequest:(NSDictionary*)reqDictionary withReqId:(NSString*)reqId;
-(void)addRequestInList:(id)conObj forKey:(NSString*)reqID;
-(void)removeRequestFromList:(NSString*)reqID;
-(HttpConnection*)findHTTPConnectionObj:(id)connection;

@end
