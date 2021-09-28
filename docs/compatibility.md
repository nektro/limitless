# Supported Platforms

- `x` the target os/arch combo is supported by the upstream
- `O` the target os/arch combo is supported to use as a runner
- `^` the target has yet to be fully evaluated

|              | x86_64 | arm64 | x86 | arm | riscv64 | ppc64el | mips64el | sparcv9 | s390x |
|--------------|--------|-------|-----|-----|---------|---------|----------|---------|-------|
| linux/debian | `x`    | `x`   | `x` | `x` |         | `x`     | `x`      |         | `x`   |
| linux/alpine | `x`    | `x`   | `x` | `x` |         | `x`     |          |         | `x`   |
| windows      | `x`    | `x`   | `x` | `x` |
| macos        | `x`    | `x`   |
| freebsd      | `x`    | `x`   | `x` | `x` | `x`     | `x`     |
| netbsd       | `x`    | `x`   | `x` | `x` |         |         |          | `x`     |       |
| openbsd      | `x`    | `x`   | `x` |     |         | `x`     |          | `x`     |       |
| dragonflybsd | `x`    |
| plan9        | `x`    |       | `x` |     |
| solaris   `^`|
| illumos   `^`|
| haiku     `^`|
| fuscia    `^`|
| serenity  `^`|
| essence   `^`|
| android   `^`|


<!-- https://docs.drone.io/pipeline/exec/syntax/platform/#supported-platforms -->
<!-- https://man.sr.ht/builds.sr.ht/compatibility.md -->
<!-- https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#github-hosted-runners -->
<!-- https://docs.gitlab.com/runner/install/ -->
