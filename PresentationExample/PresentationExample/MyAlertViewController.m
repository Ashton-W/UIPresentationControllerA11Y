#import "MyAlertViewController.h"
#import "PresentationController.h"

@interface MyAlertViewController () <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

@end

@implementation MyAlertViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (IBAction)touchDismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark <UIViewControllerAnimatedTransitioning>

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    if (presented != self) {
        return nil;
    }
    
    return [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


@end
