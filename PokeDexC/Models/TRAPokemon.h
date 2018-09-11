//
//  TRAPokemon.h
//  PokeDexC
//
//  Created by DevMountain on 9/11/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRAPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities;

@end

@interface TRAPokemon (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;
//init(with dictionary: [String : Any])


@end

NS_ASSUME_NONNULL_END
