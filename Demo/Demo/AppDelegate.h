//
//  AppDelegate.h
//  Demo
//
//  Created by Vincent Wang on 12/13/11.
//  Copyright (c) 2011 Vincent S. Wang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MyImageView;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet MyImageView *imageView;

@end
