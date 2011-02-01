//
//  GraphViewController.h
//  GraphApp
//
//  Created by 荻野 雅 on 11/01/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "S7GraphView.h"


@interface GraphViewController : UIViewController<S7GraphViewDataSource> {
@private
	S7GraphView* graphView_;
}

@property (nonatomic, retain) IBOutlet S7GraphView* graphView;

@end
