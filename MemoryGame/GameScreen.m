//
//  GameScreen.m
//  MemoryGame
//
//  Created by Fr099yz on 4/18/14.
//  Copyright (c) 2014 Fr099y. All rights reserved.
//

#import "GameScreen.h"

@interface GameScreen ()
{
    UILabel *timerLabel;
    UILabel *scoreLabel;
    UIView *gameView;
    UIView *finishView;
    UILabel *maxScoreLabel;
    UILabel *playerScore;
    UIButton *playAgain;
    NSMutableArray *objectTagArray;
    NSMutableArray *objectImageArray;
    UIButton *selectedButton;
    UIView *selectedView;
    int shuffleLoopCount;
    bool isObjectSelected;
    int lastSelectedTag;
    int time;
    int score;
    int totalAviableObject;
    int tryCount;
    bool isGameRunning;
    int default_time;
    NSTimer *timer;
}

@end

@implementation GameScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    default_time=5;
    time=default_time;
    score=0;
    lastSelectedTag=0;
    isObjectSelected=false;
    totalAviableObject=30;
    isGameRunning=true;
    tryCount=0;
    shuffleLoopCount=500;
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initMyView];
    }
    return self;
}
-(void)initMyView
{
    NSMutableArray *subTagArray1=[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:1]
                           ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSMutableArray *subTagArray2=[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:4]
                       ,[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],[NSNumber numberWithInt:5], nil];
    NSMutableArray *subTagArray3=[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:6],[NSNumber numberWithInt:6]
                        ,[NSNumber numberWithInt:7],[NSNumber numberWithInt:7],[NSNumber numberWithInt:8], nil];
    NSMutableArray *subTagArray4=[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9]
                        ,[NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10], nil];
    NSMutableArray *subTagArray5=[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:11],[NSNumber numberWithInt:11]
                        ,[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13], nil];
    NSMutableArray *subTagArray6=[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:13],[NSNumber numberWithInt:14]
                        ,[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15], nil];
    
    objectTagArray=[[NSMutableArray alloc] initWithObjects:subTagArray1, subTagArray2, subTagArray3, subTagArray4, subTagArray5, subTagArray6, nil];
    
    objectImageArray=[[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"shape_01.png"],[NSString stringWithFormat:@"shape_02.png"],[NSString stringWithFormat:@"shape_03.png"],[NSString stringWithFormat:@"shape_04.png"],[NSString stringWithFormat:@"shape_05.png"], [NSString stringWithFormat:@"shape_06.png"], [NSString stringWithFormat:@"shape_07.png"], [NSString stringWithFormat:@"shape_08.png"], [NSString stringWithFormat:@"shape_09.png"], [NSString stringWithFormat:@"shape_10.png"], [NSString stringWithFormat:@"shape_11.png"], [NSString stringWithFormat:@"shape_12.png"], [NSString stringWithFormat:@"shape_13.png"], [NSString stringWithFormat:@"shape_14.png"], [NSString stringWithFormat:@"shape_15.png"], nil];
    
    UIView *backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H, DISPLAY_W, DISPLAY_H-STATUS_BAR_H)];
    backgroundView.backgroundColor=[UIColor whiteColor];
    UIView *titleView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, DISPLAY_W, TITLE_H)];
    titleView.backgroundColor=[UIColor lightGrayColor];
    
    
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 7, DISPLAY_W, 30)];
    titleLabel.text=@"Memory";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];

    
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"Буцах" forState:UIControlStateNormal];
    backButton.frame=CGRectMake(10, 7, 50, 30);
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    timerLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, TITLE_H+10, DISPLAY_W, 30)];
    timerLabel.text=[NSString stringWithFormat:@"Хугацаа: %i секунд", time];
    
    scoreLabel=[[UILabel alloc] initWithFrame:CGRectMake(DISPLAY_W-110, TITLE_H+10, 100, 30)];
    scoreLabel.text=[NSString stringWithFormat:@"Оноо = %i", score];
    scoreLabel.textAlignment=NSTextAlignmentRight;
    
    
    gameView=[[UIView alloc] initWithFrame:CGRectMake(0, TITLE_H+30+10+10, DISPLAY_W, DISPLAY_H-STATUS_BAR_H-TITLE_H-30-10-10)];
    gameView.backgroundColor=[UIColor darkGrayColor];
    
    
    finishView=[[UIView alloc] initWithFrame:gameView.frame];
    finishView.backgroundColor=[UIColor lightGrayColor];
    
    maxScoreLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 40, DISPLAY_W, 50)];
    maxScoreLabel.text=[NSString stringWithFormat:@"Дээд оноо = %i", score];
    maxScoreLabel.textAlignment=NSTextAlignmentCenter;
    playAgain=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    playAgain.frame=CGRectMake(0, 160, DISPLAY_W, 50);
    [playAgain setTitle:@"Дахин тоглох" forState:UIControlStateNormal];
    [playAgain addTarget:self action:@selector(playAgain:) forControlEvents:UIControlEventTouchUpInside];
    
    playerScore=[[UILabel alloc] initWithFrame:CGRectMake(0, 100, DISPLAY_W, 50)];
    playerScore.text=@"";
    playerScore.textAlignment=NSTextAlignmentCenter;
    
    [finishView addSubview:playerScore];
    [finishView addSubview:maxScoreLabel];
    [finishView addSubview:playAgain];
    
    
    [backgroundView addSubview:gameView];
    [backgroundView addSubview:scoreLabel];
    [backgroundView addSubview:timerLabel];
    [titleView addSubview:titleLabel];
    [titleView addSubview:backButton];
    [backgroundView addSubview:titleView];
    [self.view addSubview:backgroundView];
    
    [self createGameViews];
}
-(void)createObjectTags
{
    
    for (int i=0; i<shuffleLoopCount; i++)
    {
        int temp_i=arc4random()%6;
        int temp_j=arc4random()%5;
        int tempTag=[[[objectTagArray objectAtIndex:temp_i] objectAtIndex:temp_j] integerValue];
        int i=rand()%6;
        int j=rand()%5;
        int tempTag2=[[[objectTagArray objectAtIndex:i] objectAtIndex:j] integerValue];
        
        [[objectTagArray objectAtIndex:temp_i] replaceObjectAtIndex:temp_j withObject:[NSNumber numberWithInt:tempTag2]];
        [[objectTagArray objectAtIndex:i] replaceObjectAtIndex:j withObject:[NSNumber numberWithInt:tempTag]];
    }
}
-(void)runTimer
{
    if(time==0)
    {
        [self finishGame];
        [timer invalidate];
    }
    else
    {
        time-=1;
        timerLabel.text=[NSString stringWithFormat:@"Хугацаа: %i секунд", time];
    }

}
- (void)saveToFile:(int)newmax
{
	BOOL success;
	NSError *error;
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
	
	success = [fileManager fileExistsAtPath:filePath];
	if (!success) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
		success = [fileManager copyItemAtPath:path toPath:filePath error:&error];
	}
	
	NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
	// scopeType.plist File dotorx ugugdul xadgalax
    [plistDict setValue:[NSString stringWithFormat:@"%d",newmax] forKey:@"maxscore"];
	[plistDict writeToFile:filePath atomically: YES];
}

-(int)getMaxScore
{
    BOOL success;
	NSError *error;
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
	
	success = [fileManager fileExistsAtPath:filePath];
	if (!success) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
		success = [fileManager copyItemAtPath:path toPath:filePath error:&error];
	}
	
	NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    NSString *maxScore = [plistDict objectForKey:@"maxscore"];
    return [maxScore integerValue];
}
-(void)finishGame
{
    [[gameView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    int maxScore=[self getMaxScore];
    if(maxScore>score)
    {
        maxScoreLabel.text=[NSString stringWithFormat:@"Дээд оноо = %i", maxScore];
        playerScore.text=[NSString stringWithFormat:@"Таны оноо = %i", score];
    }
    else
    {
        maxScoreLabel.text=[NSString stringWithFormat:@"Дээд оноо = %i", score];
        playerScore.text=[NSString stringWithFormat:@"Баяр хүргье. Шинэ дээд оноо"];
        [self saveToFile:score];
    }

    [timer invalidate];
    isGameRunning=false;
    isObjectSelected=false;
    totalAviableObject=30;
    timer=nil;
    
//    BOOL success = NO;
//    NSString *alertString = @"Data Insertion failed";
//
//    success = [[DBManager getSharedInstance]saveData:@"Fr099y" score:score];
//
//    if (success == NO) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
//                              alertString message:nil
//                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
//    }
    
    [UIView transitionFromView:gameView toView:finishView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
        
    }];
}
-(void)playAgain:(UIButton*)sender
{
    score=0;
    time=default_time;
    timerLabel.text=[NSString stringWithFormat:@"Хугацаа: %i секунд", time];
    scoreLabel.text=[NSString stringWithFormat:@"Оноо = %i", score];
    isGameRunning=true;
    [UIView transitionFromView:finishView toView:gameView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
        [self createGameViews];
    }];
}
-(void)createGameViews
{
    
    [[gameView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self createObjectTags];
    int shape_size=40;
    int between_space=20;
    int first_x=(DISPLAY_W-shape_size*5-between_space*4)/2;
    int first_y=40;
    int tag_index=0;
    UIImage *image=[UIImage imageNamed:@"pattern-background.png"];
    for (int i=0; i<6; i++) {
        for (int j=0; j<5; j++) {
            UIView *container=[[UIView alloc] initWithFrame:CGRectMake(first_x+j*shape_size+j*between_space, first_y+i*shape_size+i*between_space, shape_size, shape_size)];
            container.backgroundColor=[UIColor lightGrayColor];
            container.tag=tag_index;
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame=CGRectMake(0, 0, shape_size, shape_size);
            [btn setTitle:[[[objectTagArray objectAtIndex:i] objectAtIndex:j] stringValue] forState:UIControlStateNormal];
            [btn setTitle:[[[objectTagArray objectAtIndex:i] objectAtIndex:j] stringValue] forState:UIControlStateDisabled];
            btn.tag=[[[objectTagArray objectAtIndex:i] objectAtIndex:j] integerValue];
            [btn addTarget:self action:@selector(objectClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btn setBackgroundImage:image forState:UIControlStateNormal];
            
            [container addSubview:btn];
            [gameView addSubview:container];
            tag_index++;
        }
        
    }
}
-(void)backClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)objectClicked:(UIButton*)sender
{
    if(timer==nil)
        timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
    UIView *toView=[[UIView alloc] initWithFrame:sender.frame];
    NSString *imageName=[objectImageArray objectAtIndex:[[sender titleForState:UIControlStateDisabled] integerValue]-1];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:imageName] drawInRect:toView.frame];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    toView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    [UIView transitionFromView:(UIView*)sender toView:toView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished)
    {
        if(isGameRunning)
        {
            if(isObjectSelected)
            {
                isObjectSelected=false;
                if(![selectedButton isEqual:sender])
                {
                    if(lastSelectedTag==[sender tag])
                    {
                        sender.superview.hidden=YES;
                        selectedButton.superview.hidden=YES;
                        totalAviableObject-=2;
                        if(tryCount==1)
                            score+=4;
                        else
                            score+=2;
                        if(totalAviableObject==0)
                        {
                            isGameRunning=false;
                            score+=2+time;
                            [self finishGame];
                            NSLog(@"Game Finished");
                        }
                        scoreLabel.text=[NSString stringWithFormat:@"Оноо = %i", score];
                        tryCount=0;
                        toView.hidden=YES;
                        selectedView.hidden=YES;
                    }
                    else
                    {
                        [UIView transitionFromView:selectedView toView:selectedButton duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
                        
                        [UIView transitionFromView:toView toView:sender duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
                        tryCount+=1;
                    }
                }
            }
            else
            {
                lastSelectedTag=[sender tag];
                isObjectSelected=true;
                selectedButton=sender;
                selectedView=toView;
                tryCount+=1;
            }
        }
    }];
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
