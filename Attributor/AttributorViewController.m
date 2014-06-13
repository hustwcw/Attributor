//
//  AttributorViewController.m
//  Attributor
//
//  Created by Chengwen Wang on 6/10/14.
//  Copyright (c) 2014 Microstrategy. All rights reserved.
//

#import "AttributorViewController.h"
#import "TextStatsViewController.h"


@interface AttributorViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation AttributorViewController

- (IBAction)changeTextColor:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}


- (IBAction)outlineBodySelection {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName: @"-1",
                                          NSStrokeColorAttributeName: [UIColor blackColor] }
                                   range:self.body.selectedRange];
//    CGRect frame = self.body.frame;
//    frame.size.height += 10;
//    self.body.frame = frame;
    self.navigationController.navigationBarHidden = YES;
//    self.tabBarController.selectedIndex = 0;
    NSLog(@"%f, %f, %f, %f", self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
//    NSLog(@"%f, %f, %f, %f", self.body.bounds.origin.x, self.body.bounds.origin.y, self.body.bounds.size.width, self.body.bounds.size.height);
//    NSLog(@"%f, %f, %f, %f", self.outlineButton.bounds.origin.x, self.outlineButton.bounds.origin.y, self.outlineButton.bounds.size.width, self.outlineButton.bounds.size.height);
//    NSLog(@"%f, %f, %f, %f", self.navigationController.view.bounds.origin.x, self.navigationController.view.bounds.origin.y, self.navigationController.view.bounds.size.width, self.navigationController.view.bounds.size.height);
//    NSLog(@"%f, %f, %f, %f", self.navigationController.view.frame.origin.x, self.navigationController.view.frame.origin.y, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
}

- (IBAction)unoutlineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
//    CGRect frame = self.body.frame;
//    frame.size.height -= 10;
//    self.body.frame = frame;
    self.navigationController.navigationBarHidden = NO;
    NSLog(@"%f, %f, %f, %f", self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
//    NSLog(@"%f, %f, %f, %f", self.body.bounds.origin.x, self.body.bounds.origin.y, self.body.bounds.size.width, self.body.bounds.size.height);
//    NSLog(@"%f, %f, %f, %f", self.outlineButton.bounds.origin.x, self.outlineButton.bounds.origin.y, self.outlineButton.bounds.size.width, self.outlineButton.bounds.size.height);
//    NSLog(@"%f, %f, %f, %f", self.navigationController.view.bounds.origin.x, self.navigationController.view.bounds.origin.y, self.navigationController.view.bounds.size.width, self.navigationController.view.bounds.size.height);
//    NSLog(@"%f, %f, %f, %f", self.navigationController.view.frame.origin.x, self.navigationController.view.frame.origin.y, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
}


- (void)viewWillLayoutSubviews
{
    NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews
{
    NSLog(@"viewDidLayoutSubviews");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}
- (void)preferredFontChanged:(NSNotification *)notification
{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Analyze Text"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            ((TextStatsViewController *)segue.destinationViewController).textToAnalyze = self.body.textStorage;
        }
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
//    NSLog(@"%@", self.outlineButton.currentAttributedTitle.string);
//    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithAttributedString:self.outlineButton.currentAttributedTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName: @3,
                          NSStrokeColorAttributeName: self.outlineButton.tintColor }
                   range:NSMakeRange(0, title.length)];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
