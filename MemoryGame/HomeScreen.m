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
    PLAY_H=50;
    PLAY_W=150;
    DISTANCE_H=30;
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
    
    UIButton *playButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    playButton.frame=CGRectMake((DISPLAY_W-PLAY_W)/2, ((DISPLAY_H-STATUS_BAR_H)/2-PLAY_H-DISTANCE_H/2), PLAY_W, PLAY_H);
    [playButton setTitle:@"Тоглох" forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:playButton];
    
    UIButton *scoreButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    scoreButton.frame=CGRectMake((DISPLAY_W-PLAY_W)/2, ((DISPLAY_H-STATUS_BAR_H)/2+DISTANCE_H/2), PLAY_W, PLAY_H);
    [scoreButton setTitle:@"Оноонууд" forState:UIControlStateNormal];
    [scoreButton addTarget:self action:@selector(scoresClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *infoButton=[UIButton buttonWithType:UIButtonTypeInfoDark];
    infoButton.frame=CGRectMake(DISPLAY_W-40, DISPLAY_H-STATUS_BAR_H-40, 30, 30);
    [infoButton addTarget:self action:@selector(infoClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *settingsButton=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    settingsButton.frame=CGRectMake(10, DISPLAY_H-STATUS_BAR_H-40, 30, 30);
    [settingsButton addTarget:self action:@selector(settingsClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 7, DISPLAY_W, 30)];
    titleLabel.text=@"Memory";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];
    [titleView addSubview:titleLabel];
//    [backgroundView addSubview:settingsButton];
    [backgroundView addSubview:infoButton];
    [backgroundView addSubview:playButton];
    [backgroundView addSubview:scoreButton];
    [backgroundView addSubview:titleView];
    [self.view addSubview:backgroundView];
    
}
-(void)playClicked:(id)sender
{
    [self presentViewController:[[GameScreen alloc] init] animated:YES completion:nil];
}
-(void)scoresClicked:(id)sender
{
    [self presentViewController:[[ScoreScreen alloc] init] animated:YES completion:nil];
}
-(void)infoClicked:(id)sender
{
    [self presentViewController:[[InformationView alloc] init] animated:YES completion:nil];
}
-(void)settingsClicked:(id)sender
{
    NSLog(@"settings");
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
