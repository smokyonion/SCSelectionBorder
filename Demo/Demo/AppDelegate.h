//
//  AppDelegate.h
//  Demo
//
//  Created by Vincent Wang on 12/13/11.
//  Copyright (c) 2011 Vincent S. Wang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CTQuartz2DController.h"

@class MyImageView;


@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    MyImageView *_imageView;
    CTQuartz2DController *_controller;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet MyImageView *imageView;


@end
