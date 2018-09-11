//
//  TRAPokemonController.m
//  PokeDexC
//
//  Created by DevMountain on 9/11/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "TRAPokemonController.h"

static NSString * const baseURLString = @"http://pokeapi.co/api/v2/pokemon/";

@implementation TRAPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(TRAPokemon * _Nullable))completion{
    
    //Ensure that the completion is not nil
    if (!completion) {
        completion = ^(TRAPokemon *p){};
    }
    
    //1) Construct URL/ URL Request
    NSURL *baseURL = [NSURL URLWithString: baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    NSLog([searchURL absoluteString]);
    //2) URLSession.shared.dataTask with completion and don't forget to .resume
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"There was an error in %s:  %@, %@", __PRETTY_FUNCTION__ , error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response){
            NSLog(@"%@", response);
        }
        if (data){
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: data options:0 error: &error];
            if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]){
                NSLog(@"Error parsing the json: %@", error);
                completion(nil);
                return;
            }
            TRAPokemon *pokemon = [[TRAPokemon alloc] initWithDictionary:dictionary];
            completion(pokemon);
        }
        
        
    }] resume];
}

@end
