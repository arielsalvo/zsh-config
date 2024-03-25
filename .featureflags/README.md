# Feature Flags

## Usage

### Setting

Creating a file in this directory will result in an entry being created with the filename as key and a `1` as value in the `ZI_FEATURES` array.
These files are ignored by version control and therefor, not carried over between deployments.
> Feature Flags are case sensitive.

# Turning off

To turn off a feature, simply delete the file or rename it to start with a dot.

### Querying

The helper function called `zi_featureflag_enabled` can be called with a single parameter being the name of the flag. It returns `0` if the flag is enabled and `1` otherwise.

## Purpose
Feature Flags can be used to turn on new features during implementation and testing on different platforms.
Sane defaults and controlled deployment of new features and a **MUST**.
By default, any feature without a file or with a hidden file is turned off.

## Example

1. Create a file named `TEST-FEATURE-1` in the `.featureflags` directory
1. Write your new feature in the appropriate file
1. Make sure the code is excluded from execution if the feature flag is not enabled:

### Exclude a section

```shell
if zi_featureflag_enabled "TEST-FEATURE-1"; then
  # FEATURE CODE HERE...
fi
```

### Exclude the rest of a file

```shell
zi_featureflag_enabled "TEST-FEATURE-1" || return
```
