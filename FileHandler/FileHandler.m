//
//  FileHandler.m
//  Controller
//
//  Created by RupakParikh on 02/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FileHandler.h"


@implementation FileHandler

+(void)writeToFile:(NSDictionary*)dictToWrite withFileName:(NSString*)filename{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentsDirectory = [paths objectAtIndex:0]; 
    NSString *path = [documentsDirectory stringByAppendingPathComponent:filename];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]){
        path = [documentsDirectory stringByAppendingPathComponent:filename];
    }
    
    NSMutableDictionary *data;
    if ([fileManager fileExistsAtPath: path]){
        data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    }
    else{
        // If the file doesn’t exist, create an empty dictionary
        data = [[NSMutableDictionary alloc] init];
    }
    
    [data setDictionary:dictToWrite];
    [data writeToFile: path atomically:YES];
    [data release];
}
+(NSDictionary*)readFromFile:(NSString*)fileName{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentsDirectory = [paths objectAtIndex:0]; 
    NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDictionary *data;
    if ([fileManager fileExistsAtPath: path]) 
    {   //To reterive the data from the plist
        data = [[[NSDictionary alloc] initWithContentsOfFile: path] autorelease];
        return data;
    }
    return nil;
}
@end
