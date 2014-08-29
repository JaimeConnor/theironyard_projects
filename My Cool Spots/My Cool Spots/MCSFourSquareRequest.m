//
//  MCSFourSquareRequest.m
//  My Cool Spots
//
//  Created by Jaime Connor on 8/18/14.
//  Copyright (c) 2014 Jaime Connor. All rights reserved.
//

#import "MCSFourSquareRequest.h"

//https://api.foursquare.com/v2/venues/explore?oauth_token=434FSFBIOPOWOGXLAUPDURU2HFLL1IX4Q5OE1OCMKMDNDIJ1&v=20140818&ll=-26.204103,28.047305

@implementation MCSFourSquareRequest

// create method that passes a lat, long and returns an array of venues

+ (NSDictionary *)requestUserInfo:(NSString *)name
{
    //take the username and call the github url
    
//    NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@?access_token=9572a1d7aff6d71c1931b92e83326937d0777191",username];
    
    NSString * urlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/explore?oauth_token=434FSFBIOPOWOGXLAUPDURU2HFLL1IX4Q5OE1OCMKMDNDIJ1&v=20140818&ll=%f,%f",1.3,1.4];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
    
    [mutableRequest setHTTPMethod:@"POST"];
    
    mutableRequest.HTTPMethod = @"POST";
    
    NSURLResponse * response = nil;
    
    NSError * error = nil;
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary * venueInfo =[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&error];
    
    NSLog(@"response data = %@", venueInfo);
    
    return venueInfo;
}
//
+ (void)saveUsers: (NSArray *)venues
{
    // path to what we are saving
    NSString * path = [MCSFourSquareRequest venuesArchivePath];
    
    // then we archive
    NSData * venueData = [NSKeyedArchiver archivedDataWithRootObject:venues];
    
    // then we save file
    [venueData writeToFile:path options:NSDataWritingAtomic error:nil];
}
//
+ (NSArray *)loadVenues
{
    // path to what we are loading
    NSString * path = [MCSFourSquareRequest venuesArchivePath];
    
    // then we unarchive
    NSArray * users = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    // then we return the array
    return users;
}

+ (NSString *)venuesArchivePath
{
    // returns array of directories
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // grab first path from above array
    NSString * documentDirectory = [documentDirectories objectAtIndex:0];
    //NSString * documentDirectory = documentDirectories[0];
    
    //return path/users.data
    return  [documentDirectory stringByAppendingPathComponent:@"venue.data"];
    
}


@end
