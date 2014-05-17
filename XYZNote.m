//
//  XYZNote.m
//  test
//
//  Created by Art on 28.04.14.
//  Copyright (c) 2014 Artur. All rights reserved.
//

#import "XYZNote.h"

@implementation XYZNote

- (id)init {
    if (self = [super init]) {
        self.text = @"Новая заметка";
        self.date = [NSDate date];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.text forKey:@"text"];
    [coder encodeObject:self.date forKey:@"date"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.text = [aDecoder decodeObjectForKey:@"text"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
    }
    return self;
}

@end
