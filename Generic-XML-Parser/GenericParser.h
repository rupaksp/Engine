//
//  GenericParser.h
//  Controller
//
//  Created by RupakParikh on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// Tag value constants for identified types
#define ARRAY_CONTAINER                                           100
#define DICTIONARY_CONTAINER                                  200
#define NO_CONTAINER                                                 900

// This class is responsible for Parsing any kind of xml response.
// It takes the tag names for array and dictionary to create valid data structure from xml response.
// Use below code to parse the response.

// NSString *path = [[NSBundle mainBundle] pathForResource:@"Name_of_your_xml_file" ofType:@"xml"];
// NSData *xmlData = [[NSData alloc]initWithContentsOfFile:path];
//
// GenericParser *parser = [[GenericParser alloc]init];
// parser.arrayTags = [NSMutableArray arrayWithObjects:@"Array_Tag_1",@"Array_Tag_2",@"Array_Tag_3", nil];
// parser.dictTags = [NSMutableArray arrayWithObjects:@"Dict_Tag_1",@"Dict_Tag_2",@"Dict_Tag_3", nil];
// id response = [[parser startParse:xmlData]retain];  //Response could be either dictionary or array
//
//[parser release];

@interface GenericParser : NSObject <NSXMLParserDelegate>
{
      NSMutableArray *parentStack;
      BOOL collectCharacters;
      NSMutableString *collectedString;
      
      NSMutableArray *dictTags;     //Will be set by user for dictionary tags. For all these tag names, parser will create dictionaries.
      NSMutableArray *arrayTags;   //Will be set by user for array tags. For all these tag names, parser will create arrays. 
}

@property(retain, nonatomic) NSMutableArray *dictTags;
@property(retain, nonatomic) NSMutableArray *arrayTags;

//In case of all the required information and proper xml data, it will return complete data structure same as JSON format.
-(id) startParse:(NSData *)data withReqID:(NSString*)reqID;



@end

