//
//  DetailViewController.h
//  StoryboardNotes
//
//  Created by Art on 16.05.14.
//  Copyright (c) 2014 Artur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZNote.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) XYZNote *note;

@end
