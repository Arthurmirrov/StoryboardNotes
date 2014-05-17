//
//  XYZNoteManager.h
//  test
//
//  Created by Art on 28.04.14.
//  Copyright (c) 2014 Artur. All rights reserved.
//

#import "XYZNote.h"


@interface XYZNoteManager : NSObject {
    NSMutableArray *_notes;
}

@property (nonatomic, strong, readonly) NSMutableArray *notes;

+ (instancetype)sharedManager;

- (void)saveToFile;
- (void)loadFromFile;
- (void)addOrUpdateNote:(XYZNote *)note;
- (void)removeNote:(XYZNote *)note;

@end
