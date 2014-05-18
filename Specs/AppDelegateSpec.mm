#import "AppDelegate.h"
#import "BPGraphViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *appDelegate;

    beforeEach(^{
        appDelegate = [[AppDelegate alloc] init];
        [appDelegate application:nil didFinishLaunchingWithOptions:nil];
    });

    it(@"should have a BPGraphViewController", ^{
        appDelegate.window.rootViewController should be_instance_of([BPGraphViewController class]);
    });
});

SPEC_END
