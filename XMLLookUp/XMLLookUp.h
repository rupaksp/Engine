//
//  XMLLookUp.h
//  Controller
//
//  Created by RupakParikh on 05/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMLLookUp : NSObject {
    
}
+(NSMutableArray*)getArrayTag:(NSString*)reqID;
+(NSMutableArray*)getDicTag:(NSString*)reqID;
@end
