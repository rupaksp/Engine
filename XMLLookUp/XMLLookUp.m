//
//  XMLLookUp.m
//  Controller
//
//  Created by RupakParikh on 05/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//change as per requirment 
#import "XMLLookUp.h"


@implementation XMLLookUp

+(NSMutableArray*)getArrayTag:(NSString*)reqID{
    NSMutableArray *arraytag;
    
    if(reqID==PUBLIC_PROFILE_QUESTION){
        arraytag=[NSMutableArray arrayWithObjects:@"obj1",nil];
    }
   
    else{
        arraytag=[NSMutableArray arrayWithObjects:nil];
    }
    return arraytag;
}

+(NSMutableArray*)getDicTag:(NSString*)reqID{
    NSMutableArray *dicttag;
    
    if (reqID==JOBSEEKER_LOGIN){
        dicttag=[NSMutableArray arrayWithObjects:@"obj1", nil];
    }
   
    else{
        dicttag=[NSMutableArray arrayWithObjects:@"obj1",nil];
    }
    return dicttag;
}
@end
