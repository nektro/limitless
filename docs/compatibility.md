# Supported Platforms

Support of a given platform is indicated by a tier system. The tiers are as follows:

> Note: this list is incomplete and being developed in tandem with the rest of the server currently.

0. The os/arch combo is supported in some official capacity by upstream and a potential candidate.
1. A script exists in [`generate/`](../generate) that can automatically build a reusable QEMU base image.

|              | x86_64 | arm64 | x86 | arm | riscv64 | ppc64el | mips64el | sparcv9 | s390x |
|--------------|--------|-------|-----|-----|---------|---------|----------|---------|-------|
| linux/debian | 1      | 0     | 1   | 0   |         | 0       | 0        |         | 0     |

<!--
| linux/alpine | 0      | 0     | 0   | 0   |         | 0       |          |         | 0     |
| windows      | 0      | 0     | 0   | 0   |
| macos        | 0      | 0     |
| freebsd      | 0      | 0     | 0   | 0   | 0       | 0       |
| netbsd       | 0      | 0     | 0   | 0   |         |         |          | 0       |       |
| openbsd      | 0      | 0     | 0   |     |         | 0       |          | 0       |       |
| dragonflybsd | 0      |
| plan9        | 0      |       | 0   |     |
| solaris   `^`|
| illumos   `^`|
| haiku     `^`|
| fuscia    `^`|
| serenity  `^`|
| essence   `^`|
| android   `^`|
-->


<!-- https://docs.drone.io/pipeline/exec/syntax/platform/#supported-platforms -->
<!-- https://man.sr.ht/builds.sr.ht/compatibility.md -->
<!-- https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#github-hosted-runners -->
<!-- https://docs.gitlab.com/runner/install/ -->
