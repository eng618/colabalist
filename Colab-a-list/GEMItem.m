//
//  GEMItem.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMItem.h"

@implementation GEMItem

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uuid forKey:@"uuid"];
    [aCoder encodeObject:self.item forKey:@"item"];
    [aCoder encodeFloat:self.qty forKey:@"qty"];
    [aCoder encodeFloat:self.price forKey:@"price"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.notes forKey:@"notes"];
    [aCoder encodeBool:self.inShoppingList forKey:@"inShoppingList"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        [self setUuid:[aDecoder decodeObjectForKey:@"uuid"]];
        [self setItem:[aDecoder decodeObjectForKey:@"item"]];
        [self setQty:[aDecoder decodeFloatForKey:@"qty"]];
        [self setPrice:[aDecoder decodeFloatForKey:@"price"]];
        [self setCategory:[aDecoder decodeObjectForKey:@"category"]];
        [self setNotes:[aDecoder decodeObjectForKey:@"notes"]];
        [self setInShoppingList:[aDecoder decodeObjectForKey:@"inShoppingList"]];
    }
    return self;
}

@end
