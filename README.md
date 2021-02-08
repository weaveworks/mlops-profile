# MLOps profile

This is a Kubeflow-based MLOps profile for EKS (with `eksctl`) and Firekube (with `wksctl`).

## Production Notes

It is an experimental profile, and for demonstration only. Secrets are provided in plain texts in this repo so this profile cannot be used directly on production systems.

Please remove all secrets out of this repository and use [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) for production setup.

## Getting Started with Firekube


## Getting Started with EKS

1. Create an EKS cluster with `eksctl`. To run a proper MLOps pipeline, we need `p3.8xlarge` nodes.

```
$ eksctl create cluster eks-kubeflow \
  --node-type=p3.8xlarge \
  --nodes=2 \
  --region=us-west-2 \
  --timeout=40m
```

2. Prepare an empty Github repo to store YAML files for our GitOps operations.
In this example, it's at `git@github.com:user/eks-profile-demo`.
We refer to this repo as our *GitOps repo*.

3. Enable MLOps profile for this cluster into the GitOps repo.

```
$ EKSCTL_EXPERIMENTAL=true eksctl \
    enable profile \
    --git-url=git@github.com:user/eks-profile-demo \
    --git-email=user@email.com \
    --cluster=eks-kubeflow \
    --region=us-west-2 \
    git@github.com:weaveworks/mlops-profile
```

4. The `eksctl` command will display a public key for us to add as a "Deploy Key" in our GitOps repo.

## Get in touch

[Create an issue](https://github.com/weaveworks/mlops-profile/issues/new), or
login to [Weave Community Slack (#eksctl)][slackchan] ([signup][slackjoin]).

[slackjoin]: https://slack.weave.works/
[slackchan]: https://weave-community.slack.com/messages/eksctl/

Weaveworks follows the [CNCF Code of Conduct](https://github.com/cncf/foundation/blob/master/code-of-conduct.md). Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting a Weaveworks project maintainer, or Alexis Richardson (alexis@weave.works).
