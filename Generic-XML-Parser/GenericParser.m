//
//  GenericParser.m
//  Controller
//
//  Created by RupakParikh on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GenericParser.h"
#import "ArrayContainer.h"
#import "DictionaryContainer.h"
#import "XMLLookUp.h"
//No need to expose below methods because they are for internal use while doing parsing.
@interface GenericParser (private)

-(int) getParentTypeFor:(NSString *)tagName;

@end


@implementation GenericParser

@synthesize dictTags, arrayTags;

-(void) dealloc
{
      [parentStack release];
      [dictTags release];
      [arrayTags release];
      [collectedString release];
      [super dealloc];
}

- (id)init
{
      self = [super init];
      if (self)
      {
            parentStack = [[NSMutableArray alloc]init];
      }    
      return self;
}



-(id) startParse:(NSData *)data withReqID:(NSString*)reqID
{ 
    
    NSData *xmlData=data;
    self.dictTags=[XMLLookUp getDicTag:reqID];
    self.arrayTags=[XMLLookUp getArrayTag:reqID];
    [parentStack removeAllObjects]; 

      if( xmlData == nil ||
          xmlData.length == 0 ||
          ([arrayTags count] == 0 && [dictTags count] == 0) )
            return nil;
      
      id response = nil;
      @try
      {
            NSXMLParser *myParser = [[NSXMLParser alloc] initWithData:xmlData];	
            [myParser setDelegate:self]; 
            [myParser setShouldResolveExternalEntities: YES];
            [myParser parse];
            [myParser release];      
            
            if(parentStack.count > 0)
            {
                  if([[parentStack objectAtIndex:0] isKindOfClass:[DictionaryContainer class]])
                  {
                        DictionaryContainer *container = [parentStack objectAtIndex:0];
                        response = container.dictionary;
                  }
                  else
                  {
                        ArrayContainer *container = [parentStack objectAtIndex:0];
                        response = container.array;
                  }
            }            
      }
      @catch (NSException *exception)
      {
            response = nil;
      }
      return response;
}

-(void)parser:(NSXMLParser*)parser
didStartElement:(NSString*)elementName
 namespaceURI:(NSString*)namespaceURI
qualifiedName:(NSString*)qualifiedName
   attributes:(NSDictionary*)attributeDict
{
      NSAutoreleasePool * pool = [NSAutoreleasePool new];

      if ([self getParentTypeFor:elementName] == ARRAY_CONTAINER)
      {
            ArrayContainer *container = [[ArrayContainer alloc]init];
            
            if(parentStack.count > 0 && [[parentStack lastObject] isKindOfClass:[DictionaryContainer class]])
            {
                  container.key = elementName;
            }
            //collectCharacters = NO;
            [parentStack addObject:container];
            [container release];
      }
      else if([self getParentTypeFor:elementName] == DICTIONARY_CONTAINER)
      {
            DictionaryContainer *container = [[DictionaryContainer alloc]init];
            
            if( parentStack.count > 0 && [[parentStack lastObject] isKindOfClass:[DictionaryContainer class]])
            {
                  container.key = elementName;
            }
            //collectCharacters = NO;
            [container.dictionary addEntriesFromDictionary:attributeDict];
            [parentStack addObject:container];
            [container release];
      }
      else
      {
            if(attributeDict.count > 0 && parentStack.count > 0 && [[parentStack lastObject] isKindOfClass:[DictionaryContainer class]])
            {
                  DictionaryContainer *container = [parentStack lastObject];
                  [container.dictionary addEntriesFromDictionary:attributeDict];
                  //collectCharacters = NO;
            }
            else
                  collectCharacters = YES;
      }            

      [pool drain]; 
      pool = nil;
}

-(void)parser:(NSXMLParser*)parser foundCharacters:(NSString*)string
{
  
//      if(collectCharacters == NO)
//            return;
      
      NSAutoreleasePool * pool = [NSAutoreleasePool new];
      
      if(collectedString == nil)
            collectedString = [[NSMutableString alloc] initWithString:string];
      else
          [collectedString appendString:string];
      
      [pool drain]; 
      pool = nil;
}

-(void)parser:(NSXMLParser*)parser
didEndElement:(NSString*)elementName
 namespaceURI:(NSString*)namespaceURI
qualifiedName:(NSString*)qualifiedName
{
      NSAutoreleasePool * pool = [NSAutoreleasePool new];
      
      if ([self getParentTypeFor:elementName] == ARRAY_CONTAINER)
      {
            if (parentStack.count > 1)
            {
                  ArrayContainer *container = [[parentStack lastObject]retain];
                  [parentStack removeLastObject];

                  if ([[parentStack lastObject] isKindOfClass:[DictionaryContainer class]])
                  {
                        DictionaryContainer *dicContainer = [parentStack lastObject];
                        [dicContainer.dictionary setObject:container.array forKey:container.key];
                  }
                  else
                  {
                        ArrayContainer *arrContainer = [parentStack lastObject];
                        [arrContainer.array addObject:container.array];
                  }
                  
                  [container release];
            }            
            //collectCharacters = NO;
      }      
      else if ([self getParentTypeFor:elementName] == DICTIONARY_CONTAINER)
      {
            if (parentStack.count > 1)
            {
                  DictionaryContainer *container = [[parentStack lastObject]retain];
                 [parentStack removeLastObject];
                
                if(collectedString != nil)
                {
                    [container.dictionary setObject:collectedString forKey:elementName];
                    [collectedString release];
                    collectedString = nil;
                }
                
                 

                  if ([[parentStack lastObject] isKindOfClass:[DictionaryContainer class]])
                  {
                        DictionaryContainer *dicContainer = [parentStack lastObject];
                        [dicContainer.dictionary setObject:container.dictionary forKey:container.key];
                  }
                  else
                  {
                        ArrayContainer *arrContainer = [parentStack lastObject];
                        [arrContainer.array addObject:container.dictionary];
                  }
                  
                  [container release];
            }            
           // collectCharacters = NO;
      }      
      else
      {
            if(collectedString != nil)
            {
                  DictionaryContainer *container = [parentStack lastObject];
                  [container.dictionary setObject:collectedString forKey:elementName];
            }
            else{
                DictionaryContainer *container = [parentStack lastObject];
                [container.dictionary setObject:@"" forKey:elementName];
            }
            [collectedString release];
            collectedString = nil;
      }
      
     [pool drain]; 
      pool = nil;
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
      [parser abortParsing];
}

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
      [parser abortParsing];
}

-(int) getParentTypeFor:(NSString *)tagName
{
      if([dictTags containsObject:tagName])
            return DICTIONARY_CONTAINER;
      else if([arrayTags containsObject:tagName])
            return ARRAY_CONTAINER;
      else
            return NO_CONTAINER;
}


@end
