//
//  GEMItem.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMItem.h"

@implementation GEMItem

+ (GEMItem *)createItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes
{
    GEMItem *item = [[GEMItem alloc] init];
    
    // Configure Item
    [item setName:name];
    [item setQty:quantity];
    [item setPrice:price];
    [item setCategory:category];
    [item setNotes:notes];
    [item setInShoppingList:NO];
    [item setUuid:[[NSUUID UUID] UUIDString]];
    
    return item;
}





# pragma mark - Encoding methods

// Automatically called by OS to encode an object
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uuid forKey:@"uuid"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeFloat:self.qty forKey:@"qty"];
    [aCoder encodeFloat:self.price forKey:@"price"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.notes forKey:@"notes"];
    [aCoder encodeBool:self.inShoppingList forKey:@"inShoppingList"];
}

// Automatically called by OS to decode an object
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        [self setUuid:[aDecoder decodeObjectForKey:@"uuid"]];
        [self setName:[aDecoder decodeObjectForKey:@"name"]];
        [self setQty:[aDecoder decodeFloatForKey:@"qty"]];
        [self setPrice:[aDecoder decodeFloatForKey:@"price"]];
        [self setCategory:[aDecoder decodeObjectForKey:@"category"]];
        [self setNotes:[aDecoder decodeObjectForKey:@"notes"]];
        [self setInShoppingList:[aDecoder decodeBoolForKey:@"inShoppingList"]];
    }
    return self;
}

@end
