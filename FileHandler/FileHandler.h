//
//  FileHandler.h
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FileHandler : NSObject {
    
}
+(void)writeToFile:(NSDictionary*)dictToWrite withFileName:(NSString*)filename;
+(NSDictionary*)readFromFile:(NSString*)fileName;
@end
