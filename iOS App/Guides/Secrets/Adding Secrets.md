# Adding Secrets

First, create a new `Secrets` folder in your project. I recommend placing it in your root project directory.

```
MyProject
  > Secrets           // ADD HERE!
  ...
  > Model Layer
  > Controller Layer
  > View Layer
```

Drag in all the files in the provided **Files** folder next to this guide.

* `gyb`
* `gyb.py`
* `secrets.json`
* `Secrets.swift.gyb`

If you wish to pull the latest versions of `gyb` and `gyb.py`:

```bash
curl -O https://raw.githubusercontent.com/apple/swift/main/utils/gyb.py
curl -O https://raw.githubusercontent.com/apple/swift/main/utils/gyb
```

This guide assumes you're using folder references (not groups).

---

Next, update `secrets.json` with your secrets. `secrets.json` should contain the actual secrets - don't worry, the SCREAMING_SNAKE_CASE is auto-converted to camelCase during the build phase.

---

Next, we'll add a **Run Script Build Phase** whereby every time the project builds, GYB generates a `Secrets.swift` file from `Secrets.swift.gyb`.

In Xcode, select your project target, go to the **Build Phases** tab, and click the **"+"** button to add a new build phase. Choose **"New Run Script Phase"**.

Rename the new phase to "Generate Secrets" and drag the new phase **above** “Compile Sources” in the list so that the code generation runs before Xcode compiles Swift files.

In the script text area, enter a shell command to invoke GYB:

```bash
# Change directory to where the GYB files are located
cd "$SRCROOT/MyProject/Secrets"
# Ensure the executable has proper permissions
chmod +x gyb
# Run the executable directly to generate Secrets.swift
./gyb --line-directive '' -o Secrets.swift Secrets.swift.gyb
# If you wish to run gyb.py directly:
# /usr/bin/env python3 gyb.py --line-directive '' -o Secrets.swift Secrets.swift.gyb
```

**Replace "MyProject" with your project name.**

Make sure to **un-tick "Based on dependency analysis"** underneath. This makes it so `Secrets.swift` is re-generated on every build for extra security. The other checkboxes can be left alone (For install builds only unticked, Show environment variables in build log ticked, Use discovered dependency file unticked).

Add the following files to the **Input Files** list (underneath):

```
$(SRCROOT)/MyProject/Secrets/gyb
$(SRCROOT)/MyProject/Secrets/gyb.py
$(SRCROOT)/MyProject/Secrets/Secrets.swift.gyb
$(SRCROOT)/MyProject/Secrets/secrets.json
```

**Replace "MyProject" with your project name.**

Add the following file to the **Output Files** list (underneath):

```
$(SRCROOT)/MyProject/Secrets/Secrets.swift
```

**Replace "MyProject" with your project name.**

---

In Xcode, select your project target, go to the **Build Phases** tab, unfold the **Copy Bundle Resources** build phase. Remove all the files in the Secrets folder:

```
Secrets/gyb
Secrets/gyb.py
Secrets/secrets.json
Secrets/Secrets.swift.gyb
```

```diff
 membershipExceptions = (
     App/Info.plist,
+    Secrets/gyb,
+    Secrets/gyb.py,
+    Secrets/secrets.json,
+    Secrets/Secrets.swift.gyb,
 );
```

---

Finally, add the `.gitignore` file to the `Secrets` folder:

```
# Ignore the secrets file containing sensitive API keys
secrets.json

# Ignore the generated Secrets.swift file
Secrets.swift

# Ignore Python cache files
*.pyc
__pycache__/
```

Push everything.

---

All done. You may now build and run.

The `Secrets.swift` file is regenerated on every single build. Note that the very first build will fail because `Secrets.swift` won't exist yet - that's totally normal, just build again.