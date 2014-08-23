//
//  HttpConnection.h
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HttpModel;
@interface HttpConnection : NSObject {
    id urlConnection;
    NSMutableData *recData;
    NSString *reqID;
    NSDictionary *paramDict;
}
@property (nonatomic,retain) id urlConnection;
@property (nonatomic,retain) NSString *reqID;
@property (nonatomic,retain) NSMutableData *recData;
@property (nonatomic,retain) NSDictionary *paramDict;


-(BOOL)isEqualURLConnection:(id)urlConnection_;
-(BOOL)isRequestIDEquals:(NSString*)reqID_;
-(BOOL)isParameterEquals:(NSDictionary*)param_;
-(void)setData:(NSData*)data;

@end
