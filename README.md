# Environment Controller

A small helm chart that is installed in a remote `Staging` or `Production` environment cluster which takes webhooks from the GitOps git repository for `Staging` or `Production` and applies them to the local namespace/cluster.

This is a component to implement [multi-cluster support in Jenkins X](https://github.com/jenkins-x/jx/issues/479) and the chart is designed to be relatively small with minimal RBAC role requirements so it can be consumed in a typically locked down Production cluster.
