//
//  TRAPokemonController.h
//  PokeDexC
//
//  Created by DevMountain on 9/11/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRAPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRAPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(TRAPokemon * _Nullable))completion;
//static func fetchPokemon(for searchTerm: String, completion:((Pokemon?) -> (Void))?);

@end

NS_ASSUME_NONNULL_END
