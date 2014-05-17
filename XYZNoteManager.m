//
//  XYZNoteManager.m
//  test
//
//  Created by Art on 28.04.14.
//  Copyright (c) 2014 Artur. All rights reserved.
//

#import "XYZNoteManager.h"

@implementation XYZNoteManager

+ (instancetype)sharedManager {
    static dispatch_once_t token;
    static id shared = nil;
    dispatch_once(&token, ^{
        shared = [[super alloc] init];
    });
    
    return shared;
}

- (id)init
{
    if (self = [super init]) {
        _notes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    
    BOOL isDir = NO;
    NSError *error;
    
    if (! [[NSFileManager defaultManager] fileExistsAtPath:cachePath isDirectory:&isDir] && isDir == NO) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cachePath withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    return [NSString stringWithFormat:@"%@/mynotes.data", cachePath];
}

- (void)loadFromFile {
    NSData *frozenInfo = [NSData dataWithContentsOfFile:[self fileName]];
    _notes = [NSKeyedUnarchiver unarchiveObjectWithData:frozenInfo];
    
    if (!self.notes) {
        _notes = [[NSMutableArray alloc] init];
    }
}

- (void)saveToFile {
    NSData *frozenInfo = [NSKeyedArchiver archivedDataWithRootObject:self.notes];
    [frozenInfo writeToFile:[self fileName] atomically:NO];
}

- (XYZNote *)findNoteByDate:(NSDate *)date {
    for (XYZNote *note in self.notes) {
        if ([note.date isEqualToDate:date]) {
            return note;
        }
    }
    return nil;
}

- (void)addOrUpdateNote:(XYZNote *)note {
    XYZNote *noteToUpdate = [self findNoteByDate:note.date];
    
    if (noteToUpdate) {
        noteToUpdate.text = note.text;
    } else {
        [_notes insertObject:note atIndex:0];
    }
}

- (void)removeNote:(XYZNote *)note {
    XYZNote *noteToDelete = [self findNoteByDate:note.date];
    
    if (noteToDelete) {
        [_notes removeObject:noteToDelete];
    }
}

@end
