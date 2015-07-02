//
//  MWKDataStore+TemporaryDataStore.m
//  Wikipedia
//
//  Created by Brian Gerstle on 3/23/15.
//  Copyright (c) 2015 Wikimedia Foundation. All rights reserved.
//

#import "MWKDataStore+TemporaryDataStore.h"
#import "WMFRandomFileUtilities.h"

NS_ASSUME_NONNULL_BEGIN

@implementation MWKDataStore (TemporaryDataStore)

+ (instancetype)temporaryDataStore {
    return [[MWKDataStore alloc] initWithBasePath:WMFRandomTemporaryPath()];
}

@end

NS_ASSUME_NONNULL_END
