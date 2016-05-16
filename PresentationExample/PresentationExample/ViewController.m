#import "ViewController.h"
#import "PresentationController.h"
#import "MyAlertViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)touchButtonOne:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Action" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)touchButtonTwo:(id)sender
{
    MyAlertViewController *alert = [[MyAlertViewController alloc] init];
    PresentationController *presenter = [[PresentationController alloc] initWithPresentedViewController:alert presentingViewController:self];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
