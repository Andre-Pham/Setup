# XCTests

#### Adding a test class.

If you go "Show the test navigator" in the navigator, then bottom left "More", and click "New unit test class", scroll down and select the "XCTest Unit Test" file type, name your class, for Targets it should only have your Tests target "YourProjectNameTests", then click "create" to create the file. It should show up in your test navigator automatically. You will also need to drag the file from your project's root directory into the "YourProjectNameTests" directory.

If your test file isn't working and `XCTAssertEqual` isn't autofilling correctly, go to your Project navigator on the left, select the problematic file (remember - not the test navigator, the file navigator) then use the shortcut `option` + `command` + `1`. That should reveal the right sidebar. Under **Target Membership**, you need to ensure there's only one target there, your test target "YourProjectNameTests".

#### Deleting a test target.

Go to the project file in the Project navigator, and under **TARGETS** in the left panel, select the test target and delete it.

In the Project navigator, also delete the test files.

---

If you open the test navigator, and it's still there with the error message "(missing)", do the following:

Open your DEBUG `.xcscheme` file using a text editor (i.e. go to your project's `.xcodeproj` file, Show Package Contents, xcshareddata, xcschemes, right click scheme, Open With > TextEdit.app)

Delete the `TestableReference` to the old test target. It will look like:

```
<TestableReference
    skipped = "NO"
    parallelizable = "YES">
    <BuildableReference
        BuildableIdentifier = "primary"
        BlueprintIdentifier = "B6E308912BD002B80032B923"
        BuildableName = "FamUITests.xctest"
        BlueprintName = "FamUITests"
        ReferencedContainer = "container:Fam.xcodeproj">
    </BuildableReference>
</TestableReference>
```

Restart Xcode.