#import "BPGraphViewController.h"
#import "BPGraphView.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BPGraphViewControllerSpec)

describe(@"BPGraphViewController", ^{
    __block BPGraphViewController *controller;

    beforeEach(^{
        controller = [[BPGraphViewController alloc] init];
        controller.view should_not be_nil;
    });

    it(@"should have a BPGraph", ^{
        controller.view should contain(an_instance_of([BPGraphView class]));
    });
});

SPEC_END
