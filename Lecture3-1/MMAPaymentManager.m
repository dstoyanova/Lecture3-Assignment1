//
//  MMAPaymentManager.m
//  Lecture3-1
//
//  Created by Desislava Stoyanova on 4/3/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "MMAPaymentManager.h"

@implementation MMAPaymentManager

+ (id)sharedUser {
    static MMAPaymentManager* sharedMyUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyUser = [[self alloc] init];
    });
    return sharedMyUser;
}

- (id)init {
    if (self = [super init]) {
        _users = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)getRandomUser {
    NSUInteger randomIndex = arc4random() % [self.users count];
    return [self.users objectAtIndex:randomIndex];
}

@end
