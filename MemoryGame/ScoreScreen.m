//
//  ScoreScreen.m
//  MemoryGame
//
//  Created by Fr099yz on 4/22/14.
//  Copyright (c) 2014 Fr099y. All rights reserved.
//

#import "ScoreScreen.h"

@interface ScoreScreen ()

@end

@implementation ScoreScreen

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
    backgroundView.backgroundColor=[UIColor whiteColor];
    UIView *titleView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, DISPLAY_W, TITLE_H)];
    titleView.backgroundColor=[UIColor lightGrayColor];
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 7, DISPLAY_W, 30)];
    titleLabel.text=@"Өндөр оноонууд";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"Буцах" forState:UIControlStateNormal];
    backButton.frame=CGRectMake(10, 7, 50, 30);
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:titleLabel];
    [titleView addSubview:backButton];
    [backgroundView addSubview:titleView];
    
    [self.view addSubview:backgroundView];
}
-(void)backClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
