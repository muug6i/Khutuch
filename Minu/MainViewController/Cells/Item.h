//
//  Item.h
//  Minu
//
//  Created by Kaizen-Mongolia on 1/18/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSArray  *subCategoryArray;

@property (nonatomic, assign) BOOL     isSelected;


@end
