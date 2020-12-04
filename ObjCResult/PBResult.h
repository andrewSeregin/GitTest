//
//  PBResult.h
//  ObjCResult
//
//  Created by Andrii Serohin on 15.07.2020.
//  Copyright © 2020 Andrii Serohin. All rights reserved.
//


typedef NS_ENUM(NSUInteger, PBResultIdentifier) {
    PBResultIdentifierSuccess = 1,
    PBResultIdentifierFailure = 2
};

NS_ASSUME_NONNULL_BEGIN


@interface PBResult<__covariant Success: id, __covariant Failure: NSError *> : NSObject

+ (instancetype)new NS_UNAVAILABLE;
+ (instancetype)success:(Success)value;
+ (instancetype)failure:(Failure)error;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithSuccess:(Success)value;
- (instancetype)initWithFailure:(Failure)error;

@property (nonatomic, assign, readonly) PBResultIdentifier identifier;

@property (nullable, nonatomic, strong, readonly) Success value;
@property (nullable, nonatomic, strong, readonly) Failure error;

@end


NS_ASSUME_NONNULL_END
