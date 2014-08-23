//
//  HttpModel.m
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HttpModel.h"
#import "ASIFormDataRequest.h"


@implementation HttpModel
@synthesize requestList;
@synthesize delegate;

-(void)dealloc{
    
    [requestList release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
        self.requestList=dict;
        [dict release];
    }
    return self;
}


#pragma mark -
-(void)sendRequest:(NSDictionary*)reqDictionary withReqId:(NSString*)reqId{
    
    HttpConnection *httpConn=[[HttpConnection alloc] init];  
    [httpConn setReqID:reqId];
    [httpConn setParamDict:reqDictionary];
    
    
    NSMutableString *requestString=[NSMutableString stringWithFormat:@"%@%@",IPADDRESSWITHHTTP,reqId];
    
   // NSLog(@"%@",VIDEO_UPLOAD);
    if ([reqId isEqualToString:VIDEO_UPLOAD]  ||  [reqId isEqualToString:POST_PUBLIC_VTERVIEW] || [reqId isEqualToString:REPORTED_BUGS]) {
        
       // NSLog(@"%@",reqDictionary);

        NSURL *url = [NSURL URLWithString:[requestString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        ASIFormDataRequest *asiHttpRequest = [ASIFormDataRequest requestWithURL:url];      
        //ASIFormDataRequest *asiHttpRequest = [[ASIFormDataRequest alloc]initWithURL:url];      
        
        for(int i =0;i<[[reqDictionary allKeys]count];i++){
            if ([[[reqDictionary allKeys] objectAtIndex:i] isEqualToString:FILE_PATH]) {
                [asiHttpRequest addFile:[reqDictionary objectForKey:FILE_PATH] forKey:FILE_PATH];
            }
            else if ([[[reqDictionary allKeys] objectAtIndex:i] isEqualToString:IMG_DATA]) {
                [asiHttpRequest addData:[reqDictionary objectForKey:IMG_DATA] withFileName:@"rupak_test" andContentType:@"image/png" forKey:@"file"];
            }
            else{
                [asiHttpRequest setPostValue:[[reqDictionary allValues]objectAtIndex:i] forKey:[[reqDictionary allKeys]objectAtIndex:i]];
            }
        
        }


        [asiHttpRequest setRequestMethod:POST_METHOD];
        [asiHttpRequest setDelegate:self];
        [asiHttpRequest setTimeOutSeconds:500];
        [asiHttpRequest setShouldAttemptPersistentConnection:NO];  
        
        [asiHttpRequest setDidFinishSelector:@selector(requestUploadDone:)];
        [asiHttpRequest setDidFailSelector:@selector(requestUploadFail:)];
        
        httpConn.urlConnection=asiHttpRequest;
        [self addRequestInList:httpConn forKey:reqId]; 
//        [asiHttpRequest startSynchronous];
        [asiHttpRequest startAsynchronous];
        
    }else{
        
        
        NSArray *valueArray=[reqDictionary allValues];
        NSArray *keyArray=[reqDictionary allKeys];
      
        for (int i=0; i<[reqDictionary count]; i++) {
            [requestString appendString:[NSString stringWithFormat:@"&%@=%@",[keyArray objectAtIndex:i],[valueArray objectAtIndex:i]]];
        }
        
        NSArray *array= [[requestString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding] componentsSeparatedByString:@"?"];
        
//        NSLog(@"1.%@",array);
        
        NSString *post =[array objectAtIndex:1];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
      //  NSLog(@"2.%@",[NSString stringWithUTF8String:[postData bytes]] );
        //creating request
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:[NSURL URLWithString:[array objectAtIndex:0]]];
        [request setHTTPMethod:POST_METHOD];
        [request setValue:postLength forHTTPHeaderField:CONTENT_LENGTH];
        [request setValue:HTTP_HEADER_FIELD_VALUE forHTTPHeaderField:HTTP_HEADER_FIELD_KEY];
        [request setHTTPBody:postData];
        [request setTimeoutInterval:60];
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        
        //making connection with request
        NSURLConnection *connection_ = [[NSURLConnection alloc]
                                        initWithRequest:request
                                        delegate:self
                                        startImmediately:YES];
        if(!connection_) {
            //NSLog(@"connection failed");
        } else {
            //NSLog(@"connection succeeded");          
            httpConn.urlConnection=connection_;
            [self addRequestInList:httpConn forKey:reqId];
        }
        
        [connection_ release];
        [request release];
       
    }
     [httpConn release];
}
#pragma mark -
-(void)addRequestInList:(id )conObj forKey:(NSString*)reqID{
    [self.requestList setObject:conObj forKey:reqID];
}

-(void)removeRequestFromList:(NSString*)reqID{
    [self.requestList removeObjectForKey:reqID];
}

#pragma mark NSURLConnection delegate methods
- (NSURLRequest *)connection:(NSURLConnection *)connection
 			 willSendRequest:(NSURLRequest *)request
 			redirectResponse:(NSURLResponse *)redirectResponse {
 	//NSLog(@"Connection received data, retain count");
    return request;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
 	HttpConnection *conObj=[self findHTTPConnectionObj:connection];
 	[conObj.recData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
 	//NSLog(@"Received %d bytes of data", [data length]); 
    HttpConnection *conObj=[self findHTTPConnectionObj:connection];
    [conObj setData:data];
}

-(HttpConnection*)findHTTPConnectionObj:(id)connection{
    HttpConnection *conObj=nil;
    NSArray *valueArray=[self.requestList allValues];
    for (int i=0; i<[valueArray count]; i++) {
        conObj=(HttpConnection*)[valueArray objectAtIndex:i];    
        BOOL isEqualUrlCon=[conObj isEqualURLConnection:connection];
        if (isEqualUrlCon) {
            break;
            
        }
    }
    return conObj;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
 	//NSLog(@"Error receiving response: %@", error);
    HttpConnection *conObj=[self findHTTPConnectionObj:connection];
    NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]init];
    [tempDict setObject:conObj.paramDict forKey:PARAM];
    [tempDict setObject:error forKey:ERROR];
    [self removeRequestFromList:conObj.reqID];
   	if ([(NSObject*)delegate respondsToSelector:@selector(responseFailed:withRequestID:)]) {
        //	NSLog(@"Calling the delegate"); 
 		[delegate responseFailed:tempDict withRequestID:conObj.reqID];
 	}
    [tempDict release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    HttpConnection *conObj=[self findHTTPConnectionObj:connection];
//    NSLog(@"%@",[[NSString alloc] initWithData:conObj.recData encoding:NSUTF8StringEncoding]);
    NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]init];
    [tempDict setObject:conObj.paramDict forKey:PARAM];
    [tempDict setObject:conObj.recData forKey:DATA];
    [delegate responseSuccessfullyRecieved:tempDict withRequestID:conObj.reqID];
    [self removeRequestFromList:conObj.reqID];
    [tempDict release];
}
-(void)cancelRequest:(NSString*)reqID withData:(NSDictionary*)dict{
    //NSLog(@"HTTp Model Class : cancel request methodname : %@, reqDict :%@",reqID,dict);

    HttpConnection *conObj;
    NSArray *valueArray=[self.requestList allValues];
    for (int i=0; i<[valueArray count]; i++) {
        conObj=(HttpConnection*)[valueArray objectAtIndex:i];    
        BOOL isReqIDEqual=[conObj isRequestIDEquals:reqID];
        
        if (isReqIDEqual) {
            BOOL isParamEquals=[conObj isParameterEquals:dict];
            if (isParamEquals) {
             //   NSLog(@"cancel request");
                [conObj.urlConnection cancel]; //cancel request
                [self removeRequestFromList:reqID]; //remove request from list
            }
        }
    }
}

#pragma mark -
#pragma mark ASIHttpRequest Delegate Method
-(void)requestUploadDone:(ASIFormDataRequest*)request{
    
   // NSLog(@"%@, %d",[request responseString],[request responseStatusCode]);
    NSData* data=[[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *conObj=[self findHTTPConnectionObj:request];
    [self removeRequestFromList:conObj.reqID];

    NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]init];
    [tempDict setObject:conObj.paramDict forKey:PARAM];
    [tempDict setObject:data forKey:DATA];
    [delegate responseSuccessfullyRecieved:tempDict withRequestID:conObj.reqID];
    [tempDict release];

    
}
-(void)requestUploadFail:(ASIFormDataRequest*)request{
   // NSLog(@"failed to upload video");
}

@end
