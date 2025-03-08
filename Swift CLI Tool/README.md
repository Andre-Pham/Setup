# Swift CLI Tool Setup

Refer to [Swift CLI tools](https://www.swift.org/getting-started/cli-swiftpm/).

#### Creating a New CLI Tool

Init:

* *Copy and paste entire thing, replace `my-tool-name` with your tool's name*.

```bash
TOOL="my-tool-name" &&
mkdir "$TOOL" &&
cd "$TOOL" &&
swift package init --name "$TOOL" --type executable &&
cd ..
```

Build and run:

* *`my-tool-name` is actually the relative path to the directory that holds Package.swift.*

```bash
swift run --package-path my-tool-name
```

Build and run with flags:

* *The first `my-tool-name` is actually the relative path to the directory that holds Package.swift.*

```bash
swift run --package-path my-tool-name my-tool-name --my-flag
```

#### Building Executables

The command line tools can be built as executables to be ran on other people's machines.

1. In the tool's root directory, run `swift build -c release`
    * On Linux, use `swift build -c release --static-swift-stdlib` to bundle the Swift standard libraries inside the binary
2. Go to `./your-tool-name/.build/release/your-tool-name` (this should be an executable)

You may distribute this executable file. It will be compatible with only the platform you built on.

#### Adding to Path

First build the executable. Once done, in the `./your-tool-name/.build/release/` directory, run:

```bash
# macOS
sudo cp your-tool-name /usr/local/bin/
```

