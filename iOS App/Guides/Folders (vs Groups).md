# Folders (vs Groups)

ALWAYS create folders. NEVER create groups.

A group is a virtual container in the Project Navigator. It’s used to organize your files within Xcode without necessarily reflecting any folder structure on disk.

A folder (often shown with a blue icon) is a reference to an actual directory on your file system. When you add a folder reference, Xcode reads the files and subfolders directly from the disk. Any changes you make to the folder structure outside of Xcode (in Finder) are automatically reflected in the project. This is the same behaviour as VSCode.