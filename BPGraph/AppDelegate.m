#import "AppDelegate.h"
#import "BPGraphViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    BPGraphViewController *bpGraphViewController = [[BPGraphViewController alloc] init];
    self.window.rootViewController = bpGraphViewController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
