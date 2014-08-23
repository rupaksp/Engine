//
//  XMLLookUp.m
//  Controller
//
//  Created by RupakParikh on 05/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XMLLookUp.h"


@implementation XMLLookUp

+(NSMutableArray*)getArrayTag:(NSString*)reqID{
    NSMutableArray *arraytag;
    
    if(reqID==PUBLIC_PROFILE_QUESTION){
        arraytag=[NSMutableArray arrayWithObjects:@"questions",nil];
    }
    else if(reqID==JOB_SEARCH){
        arraytag=[NSMutableArray arrayWithObjects:@"jobs",nil];
    }
    else if(reqID==JOB_DETAILS){
        arraytag=[NSMutableArray arrayWithObjects:@"questions",nil];
    }
    else if(reqID==GET_JOBS_FROM_BRIEFCASE){
        arraytag=[NSMutableArray arrayWithObjects:@"jobs",nil];
    }
    else if(reqID==PUBLIC_PROFILE_QUESTION){
        arraytag=[NSMutableArray arrayWithObjects:@"questions",nil];
    }
    else if(reqID==PURCHASED_QUESTIONS){
        arraytag=[NSMutableArray arrayWithObjects:@"generic_questions",@"purchased_questions",nil];
    }
    else if(reqID==QUESTIONS_CATEGORY){
        arraytag=[NSMutableArray arrayWithObjects:@"question_categories",nil];
    }
    else if(reqID==QUESTIONS_BY_CATEGORY){
        arraytag=[NSMutableArray arrayWithObjects:@"questions",nil];
    }
    else if(reqID==LIST_JOBS){
        arraytag=[NSMutableArray arrayWithObjects:@"jobs",nil];
    }
    else if(reqID==CHECK_APPLIED_FOR_A_JOB){
        arraytag=[NSMutableArray arrayWithObjects:@"questions",nil];
    }
    else if(reqID==LIST_VTERVIEW_BY_JOBS){
        arraytag=[NSMutableArray arrayWithObjects:@"interviews",@"questions",nil];
    }
    else if(reqID==INTERVIEW_STATUS_CODE){
        arraytag=[NSMutableArray arrayWithObjects:@"interview_status",nil];
    }
    else if(reqID==JOBSEEKER_STATUS){
        arraytag=[NSMutableArray arrayWithObjects:@"jobseeker_status",@"questions",nil] ;
    }
    else if(reqID==MULTIPLE_JOB_DETAILS){
        arraytag=[NSMutableArray arrayWithObjects:@"jobs",nil] ;
    }
    else if(reqID==GET_PUBLIC_PROFILE){
        arraytag=[NSMutableArray arrayWithObjects:@"jobs",@"questions", nil];
    }
    else if(reqID==INDUSTRYLIST){
        arraytag=[NSMutableArray arrayWithObjects:@"industries", nil];
    }
    else if(reqID==COUNTRYLIST){
        arraytag=[NSMutableArray arrayWithObjects:@"countries", nil];
    }
    else if(reqID==APPLICANT_SEARCH){
        arraytag=[NSMutableArray arrayWithObjects:@"applicants", nil];
    }
    else if(reqID==GET_MESSAGE){
        arraytag=[NSMutableArray arrayWithObjects:@"messages", nil];
    }
    else if(reqID==CAN_JOB_POST){
        
        arraytag=[NSMutableArray arrayWithObjects:@"messages", nil];
    }
    else if(reqID==UPDATE_RATING){
        
        arraytag=[NSMutableArray arrayWithObjects:@"messages", nil];
    }
    
    else if(reqID==GET_PACKAGE_PRIZE_ID){ // Used for In App Purchse
        
        arraytag=[NSMutableArray arrayWithObjects:@"packages_prices", nil];
    }
    else if(reqID==GET_ALL_SUBSCRIPTION_DETAILS){ // Used for In App Purchse
        arraytag=[NSMutableArray arrayWithObjects:@"subscriptions", nil];
    }
    else if(reqID==PURCHASE_COMPLETE){ // Used for In App Purchse
        arraytag=[NSMutableArray arrayWithObjects:nil];
    }
    else if(reqID==GET_QUESTIONS_BY_JOB){   // Added by Uttam for dec feedback, view by questions
        arraytag=[NSMutableArray arrayWithObjects:@"questions",nil];
    }
    else if(reqID==GET_APPLICANT_BY_QUESTION){   // Added by Uttam for dec feedback, view by questions
        arraytag=[NSMutableArray arrayWithObjects:@"interviews",@"questions",nil];
    }
    //    else if(reqID==REQUEST_JOBSEEKER){
    //        arraytag=[NSMutableArray arrayWithObjects:@"requests",nil];
    //    }
    else if(reqID==GET_REQUEST_JOBSEEKER){   // Added by Uttam for jobseeker notification when employer sends request
        arraytag=[NSMutableArray arrayWithObjects:@"requests",nil];
    }
    else if(reqID== MASTER_LIST){   // Added by Uttam for jobseeker job search
        arraytag=[NSMutableArray arrayWithObjects:@"education_levels",@"career_levels",@"industries",@"compensations",@"job_posted_on",@"experiences",@"distances",nil];
    }
    else if(reqID==GET_ALL_REQUEST_JOBSEEKER){   // Added by Uttam for getting all job requests for jobseeker
        arraytag=[NSMutableArray arrayWithObjects:@"requests",nil];
    }
    
    else{
        arraytag=[NSMutableArray arrayWithObjects:nil];
    }
    return arraytag;
}

+(NSMutableArray*)getDicTag:(NSString*)reqID{
    NSMutableArray *dicttag;
    
    if (reqID==JOBSEEKER_LOGIN){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==PUBLIC_PROFILE_QUESTION){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"ques", nil];
    }
    else if(reqID==GET_PROFILEDETAIL){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==GET_SUBSCRIPTION_DETAIL){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"subscriptions",@"package", nil];
    }
    else if(reqID==JOB_SEARCH){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"job", nil];
    }
    else if(reqID==JOB_DETAILS){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"job",@"ques", nil];
    }
    else if(reqID==SAVE_JOB_TO_BRIEFCASE){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==EMPLOYEE_LOGIN){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==JOBSEEKER_LOGIN){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==PACKAGE){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==FORGOT_PASSWORD){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==CHANGE_QUESTION_STATUS){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==GET_JOBS_FROM_BRIEFCASE){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"job", nil];
    }
    else if(reqID==REQUEST_JOBSEEKER){
        dicttag=[NSMutableArray arrayWithObjects:@"response" ,nil];
    }
    else if(reqID==REMOVE_JOBS_BRIEFCASE){
        dicttag=[NSMutableArray arrayWithObjects:@"message" ,nil];
    }
    else if(reqID==CAN_JOB_POST){
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    else if(reqID==PUBLIC_PROFILE_QUESTION){
        dicttag=[NSMutableArray arrayWithObjects:@"ques", nil];
    }
    else if(reqID==PURCHASED_QUESTIONS){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"ques", nil];
    }
    else if(reqID==QUESTIONS_CATEGORY){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"question_category", nil];
    }
    else if(reqID==QUESTIONS_BY_CATEGORY){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"ques", nil];
    }
    else if(reqID==LIST_JOBS){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"job", nil];
    }
    else if(reqID==CHECK_APPLIED_FOR_A_JOB){
        dicttag=[NSMutableArray arrayWithObjects:@"interview",@"ques", nil];
    }
    else if(reqID==LIST_VTERVIEW_BY_JOBS){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"interview",@"ques", nil];
    }
    else if(reqID==INTERVIEW_STATUS_CODE){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"code", nil];
    }
    else if(reqID==JOBSEEKER_STATUS){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"status",@"ques", nil];
    }
    else if(reqID==MULTIPLE_JOB_DETAILS){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"job", nil];
    }
    else if(reqID==GET_PUBLIC_PROFILE){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"job",@"ques", nil];
    }
    else if(reqID==INDUSTRYLIST){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"industry", nil];
    }
    else if(reqID==COUNTRYLIST){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"country", nil];
    }
    else if(reqID==APPLICANT_SEARCH){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"applicant", nil];
    }
    else if(reqID==GET_MESSAGE){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"msg", nil];
    }
    else if(reqID==UPDATE_RATING){
        
        dicttag=[NSMutableArray arrayWithObjects:@"response", nil];
    }
    //    else if(reqID==JOBSEARCH_DROPDOWN_DETAILS){
    //        dicttag=[NSMutableArray arrayWithObjects:@"response",@"education_level",@"career_level", nil];
    //    }
    
    else if(reqID==EMP_TandC || reqID==JS_TandC){
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"terms_conditions", nil];
    }
    
    else if(reqID==GET_PACKAGE_PRIZE_ID){ // Used for In App Purchse
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"package_price", nil];
    }
    else if(reqID==GET_ALL_SUBSCRIPTION_DETAILS){ // Used for In App Purchse
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"subscription", nil];
    }
    else if(reqID==PURCHASE_COMPLETE){ // Used for In App Purchse
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"subscriptions",@"package", nil];
    }
    else if(reqID==GET_QUESTIONS_BY_JOB){  // Added by Uttam for dec feedback, view by questions
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"ques", nil];
    }
    else if(reqID==GET_APPLICANT_BY_QUESTION){  // Added by Uttam for dec feedback, view by questions
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"applicant",@"interview",@"question", nil];
    }
    
    else if(reqID==GET_REQUEST_JOBSEEKER){  // Added by Uttam for jobseeker notification when employer sends request
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"request",@"employer",@"job", nil];
    }
    else if(reqID==MASTER_LIST){ // Added by Uttam for jobseeker job search
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"master_list",@"education_level",@"career_level",@"industry",@"compensation_amount", @"posted_on",@"experience_year",@"distance",nil];
    }
    else if(reqID==GET_ALL_REQUEST_JOBSEEKER){  // Added by Uttam  for getting all job requests for jobseeker
        dicttag=[NSMutableArray arrayWithObjects:@"response",@"request",@"employer",@"job", nil];
    }
    
    else{
        dicttag=[NSMutableArray arrayWithObjects:@"response",nil];
    }
    return dicttag;
}
@end
