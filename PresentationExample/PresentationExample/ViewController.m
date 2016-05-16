#import "ViewController.h"
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
    [self presentViewController:alert animated:YES completion:nil];
}

@end
