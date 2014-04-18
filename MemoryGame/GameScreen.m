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
    NSMutableArray *objectTagArray;
    NSMutableArray *objectImageArray;
    UIButton *selectedButton;
    int shuffleLoopCount;
    bool isObjectSelected;
    int lastSelectedTag;
    int time;
    int score;
    int totalAviableObject;
    int tryCount;
    bool isGameRunning;
}

@end

@implementation GameScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    time=60;
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
//    objectTagArray={{1,1,2,2,3},{3,4,4,5,5}, {6,6,7,7,8},{8,9,9,10,10},{11,11,12,12,13},{13,14,14,15,15}};
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
    
    NSMutableArray *subImageArray1=[[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"], nil];
    
    NSMutableArray *subImageArray2=[[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"], nil];
    
    NSMutableArray *subImageArray3=[[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"], nil];
    
    NSMutableArray *subImageArray4=[[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"], nil];
    
    NSMutableArray *subImageArray5=[[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"], nil];
    
    NSMutableArray *subImageArray6=[[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"],[NSString stringWithFormat:@"image"], nil];
    
    objectImageArray=[[NSMutableArray alloc] initWithObjects:subImageArray1, subImageArray2, subImageArray3, subImageArray4, subImageArray5, subImageArray6, nil];
    
    UIView *backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H, DISPLAY_W, DISPLAY_H-STATUS_BAR_H)];
    backgroundView.backgroundColor=[UIColor whiteColor];
    UIView *titleView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, DISPLAY_W, TITLE_H)];
    titleView.backgroundColor=[UIColor lightGrayColor];
    
    
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 7, DISPLAY_W, 30)];
    titleLabel.text=@"Memory";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    

    
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    backButton.frame=CGRectMake(10, 7, 50, 30);
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    timerLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, TITLE_H+10, 100, 30)];
    timerLabel.text=[NSString stringWithFormat:@"Time %i", time];
    
    scoreLabel=[[UILabel alloc] initWithFrame:CGRectMake(DISPLAY_W-110, TITLE_H+10, 100, 30)];
    scoreLabel.text=[NSString stringWithFormat:@"Score = %i", score];
    scoreLabel.textAlignment=NSTextAlignmentRight;
    
    
    gameView=[[UIView alloc] initWithFrame:CGRectMake(0, TITLE_H+30+10+10, DISPLAY_W, DISPLAY_H-STATUS_BAR_H-TITLE_H-30-10-10)];
    gameView.backgroundColor=[UIColor darkGrayColor];
    
    
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
        int temp_i=rand()%5;
        int temp_j=rand()%4;
        int tempTag=[[[objectTagArray objectAtIndex:temp_i] objectAtIndex:temp_j] integerValue];
        int i=rand()%5;
        int j=rand()%4;
        int tempTag2=[[[objectTagArray objectAtIndex:i] objectAtIndex:j] integerValue];
        [[objectTagArray objectAtIndex:temp_i] replaceObjectAtIndex:temp_j withObject:[NSNumber numberWithInt:tempTag2]];
        [[objectTagArray objectAtIndex:i] replaceObjectAtIndex:j withObject:[NSNumber numberWithInt:tempTag]];
    }
}
-(void)createGameViews
{
    [[gameView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self createObjectTags];
    int shape_size=40;
    int between_space=20;
    int first_x=(DISPLAY_W-shape_size*5-between_space*4)/2;
    int first_y=40;
    for (int i=0; i<6; i++) {
        for (int j=0; j<5; j++) {
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame=CGRectMake(first_x+j*shape_size+j*between_space, first_y+i*shape_size+i*between_space, shape_size, shape_size);
            [btn setTitle:[NSString stringWithFormat:@"%i-%i", i, j] forState:UIControlStateNormal];
            btn.tag=[[[objectTagArray objectAtIndex:i] objectAtIndex:j] integerValue];
            [btn addTarget:self action:@selector(objectClicked:) forControlEvents:UIControlEventTouchUpInside];
            [gameView addSubview:btn];
        }
        
    }
}
-(void)backClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)objectClicked:(UIButton*)sender
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
                    sender.hidden=YES;
                    selectedButton.hidden=YES;
                    totalAviableObject-=2;
                    if(tryCount==1)
                        score+=4;
                    else
                        score+=2;
                    if(totalAviableObject==0)
                    {
                        isGameRunning=false;
                        score+=2+time;
                        NSLog(@"Game Finished");
                    }
                    scoreLabel.text=[NSString stringWithFormat:@"Score = %i", score];
                    tryCount=0;
                }
                else
                {
                    tryCount+=1;
                }

            }
        }
        else
        {
            lastSelectedTag=[sender tag];
            isObjectSelected=true;
            selectedButton=sender;
            tryCount+=1;
            NSLog(@"%i", [sender tag]);
        }
    }
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
