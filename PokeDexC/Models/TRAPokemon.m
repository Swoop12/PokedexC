//
//  TRAPokemon.m
//  PokeDexC
//
//  Created by DevMountain on 9/11/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "TRAPokemon.h"

@implementation TRAPokemon

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities{
    
    self = [super init];
    if (self) {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation TRAPokemon (JSONConvertible)


-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary{
    
    NSString *name = dictionary[@"name"];
    //let name = dictionary["name"] as? String
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilitiesDictionaries = dictionary[@"abilities"];
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionaries isKindOfClass:[NSArray class]]) {
              return nil;
          }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in abilitiesDictionaries){
        NSString *abilityName = dictionary[@"ability"][@"name"];
        if (!abilityName) {
            continue;
        }
        [abilities addObject:abilityName];
    }
    
    return [self initWithName:name identifier:identifier abilities:abilities];
}


@end
