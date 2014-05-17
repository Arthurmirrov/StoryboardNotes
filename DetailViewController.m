//
//  DetailViewController.m
//  StoryboardNotes
//
//  Created by Art on 16.05.14.
//  Copyright (c) 2014 Artur. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.textView];
    
    if (self.note) {
        self.textView.text = self.note.text;
    }
    self.navigationItem.title = self.note.text;

}

- (void)viewWillDisappear:(BOOL)animated {
    self.note.text = self.textView.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
