//
//  XYZNote.h
//  test
//
//  Created by Art on 28.04.14.
//  Copyright (c) 2014 Artur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZNote : NSObject <NSCoding>

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *date;

@end
