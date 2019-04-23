# Environment Controller

A small helm chart that is installed in a remote `Staging` or `Production` environment cluster which takes webhooks from the GitOps git repository for `Staging` or `Production` and applies them to the local namespace/cluster.

This is a component to implement [multi-cluster support in Jenkins X](https://jenkins-x.io/getting-started/multi-cluster/) and the chart is designed to be relatively small with minimal RBAC role requirements so it can be consumed in a typically locked down Production cluster.

You can install this chart directly with helm by specifying the [required values](https://github.com/jenkins-x-charts/environment-controller/blob/master/environment-controller/values.yaml#L3-L19) or you can use the [jx create addon envctl](https://jenkins-x.io/getting-started/multi-cluster/#installing) helper CLI
