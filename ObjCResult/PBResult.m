//
//  PBResult.m
//  ObjCResult
//
//  Created by Andrii Serohin on 15.07.2020.
//  Copyright © 2020 Andrii Serohin. All rights reserved.
//

#import "PBResult.h"


NS_ASSUME_NONNULL_BEGIN


@interface PBResult ()

@property (nonatomic, assign) PBResultIdentifier identifier;

@property (nullable, nonatomic, strong) id value;
@property (nullable, nonatomic, strong) NSError *error;

@end

@implementation PBResult

+ (instancetype)success:(id)value {
    
    return [[PBResult alloc] initWithSuccess:value];
}

+ (instancetype)failure:(NSError *)error {
    
    return [[PBResult alloc] initWithFailure:error];
}

- (instancetype)initWithSuccess:(id)value {
    
    self = [super init];
    
    if (self) {
        _identifier = PBResultIdentifierSuccess;
        _value = value;
    }
    
    return self;
}

- (instancetype)initWithFailure:(NSError *)error {
    
    self = [super init];
    
    if (self) {
        _identifier = PBResultIdentifierFailure;
        _error = error;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
