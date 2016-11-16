//
//  GradrViewController.m
//  Gradr
//
//  Created by Sarat Tallamraju on 11/2/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "GradrViewController.h"
#import "SRTDigitRecognizer.h"
#import "CanvasView.h"

@interface GradrViewController ()
@property (strong, nonatomic) IBOutlet UILabel *totalScoreLabel;
@property (strong, nonatomic) SRTDigitRecognizer *digitRecognizer;
@property (strong, nonatomic) IBOutlet CanvasView *canvasView;

@end

@implementation GradrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.digitRecognizer = [[SRTDigitRecognizer alloc] initWithString:@"initString"];
    NSString* classifierFileName = [self.digitRecognizer getInputString];
    NSLog(@"%@", classifierFileName);
}

- (IBAction)onEraseButtonClicked:(id)sender {
    NSLog(@"Erase button clicked");
    UIImage *canvasImage = self.canvasView.drawing;
    int recognizedNumber = [self.digitRecognizer recognizeDigitFromImage: canvasImage atFrame: self.canvasView.frame];
    NSLog(@"Recognized digit: %i", recognizedNumber);
    [self.canvasView erase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
