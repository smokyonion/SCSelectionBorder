//
//  CTQuartz2DController.m
//  Demo
//
//  Created by Chun-Tang Wang on 9/3/12.
//  Copyright (c) 2012 Vincent S. Wang. All rights reserved.
//

#import "CTQuartz2DController.h"

@interface CTQuartz2DController ()

@end

@implementation CTQuartz2DController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (NSString *)windowNibName
{
    return @"Quartz2D";
}

@end
