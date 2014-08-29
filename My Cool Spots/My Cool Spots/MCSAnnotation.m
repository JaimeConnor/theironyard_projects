//
//  MCSAnnotation.m
//  My Cool Spots
//
//  Created by Jaime Connor on 8/18/14.
//  Copyright (c) 2014 Jaime Connor. All rights reserved.
//

#import "MCSAnnotation.h"

@implementation MCSAnnotation

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    _coordinate = newCoordinate;
}
-(void)setTitle:(NSString *)title
{
    _title = title;
}

@end
