#import "BPGraphViewController.h"
#import "BPGRaphView.h"

@interface BPGraphViewController ()
@property (nonatomic, strong, readwrite) BPGraphView *bpGraphView;
@end

@implementation BPGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.bpGraphView];
}

- (BPGraphView *)bpGraphView {
    if (!_bpGraphView) {
        _bpGraphView = [[BPGraphView alloc] initWithFrame:self.view.bounds bezierPath:[[UIBezierPath alloc] init]];
    }
    return _bpGraphView;
}

@end
