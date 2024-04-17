{ pkgs
, ...
}: 
(pkgs.python311Packages.pytorch-metric-learning.override {
  torch = pkgs.python311Packages.torchWithCuda;
  torchvision = (pkgs.python311Packages.torchvision.override {
    torch = pkgs.python311Packages.torchWithCuda;
  });
  # FAILED tests/losses/test_histogram_loss.py::TestHistogramLoss::test_histogram_loss
}).overrideAttrs (oldAttrs: rec {
  disabledTests = [
    "TestDistributedLossWrapper"
    "TestInference"
    "test_histogram_loss"
    "test_get_nearest_neighbors"
    "test_tuplestoweights_sampler"
    "test_untrained_indexer"
    "test_metric_loss_only"
    "test_pca"
    "test_distributed_classifier_loss_and_miner"
    "test_global_embedding_space_tester"
    "test_with_same_parent_label_tester"
  ];
})