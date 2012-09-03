//
//  AppDelegate.m
//  Demo
//
//  Created by Vincent Wang on 12/13/11.
//  Copyright (c) 2011 Vincent S. Wang. All rights reserved.
//

#import "AppDelegate.h"
#import "MyImageView.h"
#import "CTQuartz2DController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize imageView = _imageView;

- (void)dealloc
{
    [_controller release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)awakeFromNib
{
    _controller = [[CTQuartz2DController alloc] initWithWindow:nil];
    [_controller showWindow:self];
}

@end
