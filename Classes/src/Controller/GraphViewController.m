//
//  GraphViewController.m
//  GraphApp
//
//  Created by 荻野 雅 on 11/01/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GraphViewController.h"


@implementation GraphViewController

@synthesize graphView = graphView_;

#pragma mark -
#pragma mark Private Methods

- (void)createYFormatter {
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter new] autorelease];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[numberFormatter setMinimumFractionDigits:0];
	[numberFormatter setMaximumFractionDigits:0];
	self.graphView.yValuesFormatter = numberFormatter;
}

- (void)createXFormatter {
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter new] autorelease];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[numberFormatter setMinimumFractionDigits:0];
	[numberFormatter setMaximumFractionDigits:0];
	self.graphView.xValuesFormatter = numberFormatter;
}

- (void)initGraphView {
	self.graphView.backgroundColor = [UIColor blackColor];
	self.graphView.drawAxisX = YES;
	self.graphView.drawAxisY = YES;
	self.graphView.drawGridX = YES;
	self.graphView.drawGridY = YES;
	self.graphView.xValuesColor = [UIColor whiteColor];
	self.graphView.yValuesColor = [UIColor whiteColor];
	self.graphView.gridXColor = [UIColor whiteColor];
	self.graphView.gridYColor = [UIColor whiteColor];
	self.graphView.drawInfo = NO;
	self.graphView.info = @"Load";
	self.graphView.infoColor = [UIColor whiteColor];
}


#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}

- (id)init {
	return self = [super initWithNibName:nil bundle:nil];
}

- (void)loadView {
	[super loadView];
	self.graphView.dataSource = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createYFormatter];
	[self createXFormatter];
	[self initGraphView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
	self.view = nil;
	self.graphView = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark protocol S7GraphViewDataSource

- (NSUInteger)graphViewNumberOfPlots:(S7GraphView *)graphView {
    return 1;

}

- (NSArray *)graphViewXValues:(S7GraphView *)graphView {
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:101];
    for (int i = -50; i <= 50; i++) {
		[array addObject:[NSNumber numberWithInt:i]];
    }
    return array;

}

- (NSArray *)graphView:(S7GraphView *)graphView yValuesForPlot:(NSUInteger)plotIndex {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:101];
    switch (plotIndex) {
		case 0:
			for (int i = -50; i <= 50; i++) {
				[array addObject:[NSNumber numberWithInt:-i]]; // y = -x
			}
			break;
    }
    return array;
}

- (BOOL)graphView:(S7GraphView *)graphView shouldFillPlot:(NSUInteger)plotIndex {
	return NO;
}


@end
