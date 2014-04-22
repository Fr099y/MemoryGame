//
//  InformationView.m
//  MemoryGame
//
//  Created by Fr099yz on 4/22/14.
//  Copyright (c) 2014 Fr099y. All rights reserved.
//

#import "InformationView.h"

@interface InformationView ()

@end

@implementation InformationView

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
    titleLabel.text=@"Тайлбар";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"Буцах" forState:UIControlStateNormal];
    backButton.frame=CGRectMake(10, 7, 50, 30);
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:titleLabel];
    [titleView addSubview:backButton];
    [backgroundView addSubview:titleView];
    
    UILabel *infoTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, TITLE_H+10, DISPLAY_W, TITLE_H)];
    infoTitle.text=[NSString stringWithFormat:@"Тоглох заавар"];
    infoTitle.textAlignment=NSTextAlignmentCenter;
    infoTitle.font=[UIFont fontWithName:@"Helvetica-Bold" size:15];
    
    UILabel *howToPlay=[[UILabel alloc] initWithFrame:CGRectMake(10, TITLE_H*2+10, DISPLAY_W-20, DISPLAY_H-TITLE_H*2+10)];
    
    howToPlay.text=[NSString stringWithFormat:@"1. 2 ижил дүрсийг олох замаар бүх дүрсийг олж дуусгаснаар тоглоомыг дуусгана \n\n%@\n\n%@\n\n%@\n\n%@\n\n\n%@", @"2. Хугацаа дууссан үед мөн тоглоом дуусна. ",@"3. Ижил дүрс олох бүрд 2 оноо", @"4. Эхний дүрсийг олсоны дараа дарааллан дараагын дүрсүүдийг шууд олвол 4 оноо", @"5. Цаг дуусахаас өмнө бүх дүрсийг олвол үлдсэн хугацааг оноон дээр шууд нэмнэ", @"Developer Fr099y (2014)"];
    howToPlay.textAlignment=NSTextAlignmentLeft;
    howToPlay.numberOfLines=0;
    [howToPlay sizeToFit];
    
    [backgroundView addSubview:infoTitle];
    [backgroundView addSubview:howToPlay];
    
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
