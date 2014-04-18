//
//  HomeScreen.m
//  MemoryGame
//
//  Created by Fr099yz on 4/18/14.
//  Copyright (c) 2014 Fr099y. All rights reserved.
//

#import "HomeScreen.h"

@interface HomeScreen ()
{
    int PLAY_W;
    int PLAY_H;
    int DISTANCE_H;
}

@end

@implementation HomeScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initMyView];
    }
    return self;
}
-(void)initMyView
{
    UIView *backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H, DISPLAY_W, DISPLAY_H-STATUS_BAR_H)];
    UIView *titleView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, DISPLAY_W, TITLE_H)];
    titleView.backgroundColor=[UIColor lightGrayColor];
    
    UIImageView *playImage=[[UIImageView alloc] initWithFrame:CGRectMake((DISPLAY_W-PLAY_W)/2, ((DISPLAY_H-STATUS_BAR_H)/2-PLAY_H-DISTANCE_H/2), PLAY_W, PLAY_H)];
    [playImage setImage:[UIImage imageNamed:@"play_button.gif"]];
    [backgroundView addSubview:titleView];
    [backgroundView addSubview:playImage];
    [self.view addSubview:backgroundView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    PLAY_H=50;
    PLAY_W=150;
    DISTANCE_H=30;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
