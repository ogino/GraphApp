//
//  GraphAppAppDelegate.h
//  GraphApp
//
//  Created by 荻野 雅 on 11/01/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject <UIApplicationDelegate> {
@private
	UIWindow* window_;
	UIViewController* viewController_;
}

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet UIViewController* viewController;

@end

