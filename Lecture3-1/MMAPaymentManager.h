//
//  MMAPaymentManager.h
//  Lecture3-1
//
//  Created by Desislava Stoyanova on 4/3/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAPaymentManager : NSObject 

@property (nonatomic,strong) NSMutableArray* users;

+ (id)sharedUser;
- (id)getRandomUser;

@end
