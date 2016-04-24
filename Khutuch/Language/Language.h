//
//  Language.h
//  iRestaurantRepo
//
//  Created by Sodtseren Enkhee on 3/30/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Language : NSObject

+ (Language *)sharedInstance;

- (NSString *) localizedString:(NSString *)key;

@end
