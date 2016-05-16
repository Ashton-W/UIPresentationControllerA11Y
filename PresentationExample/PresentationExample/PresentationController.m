#import "PresentationController.h"

@interface PresentationController ()

@property (nonatomic) UIView *dimmingView;

@end

@implementation PresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self) {
        _dimmingView = [[UIView alloc] init];
        _dimmingView.backgroundColor = [UIColor blackColor];
    }
    
    return self;
}

- (UIModalPresentationStyle)presentationStyle
{
    return UIModalPresentationCustom;
}

- (BOOL)shouldPresentInFullscreen
{
    return YES;
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect container = self.containerView.bounds;
    CGRect frame = CGRectMake(CGRectGetMidX(container) - 100, CGRectGetMidY(container) - 100, 200, 200);
    return frame;
}

- (void)presentationTransitionWillBegin
{
    self.dimmingView.frame = self.containerView.frame;
    self.dimmingView.alpha = 0.0;
    
    [[self containerView] addSubview:self.dimmingView];
    [[self containerView] addSubview:self.presentedView];
    
    id <UIViewControllerTransitionCoordinator> transitionCoordinator =
    [[self presentingViewController] transitionCoordinator];
    
    [transitionCoordinator animateAlongsideTransition:
     ^(id<UIViewControllerTransitionCoordinatorContext> context) {
         self.dimmingView.alpha = 0.4;
     } completion:nil];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    // Remove the dimming view if the presentation was aborted.
    if (!completed) {
        [self.dimmingView removeFromSuperview];
    }
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed) {
        [self.dimmingView removeFromSuperview];
    }
}

@end
