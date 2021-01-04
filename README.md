# dockerhub-image-remover

This is a simple repo to store a shell script used to remove some specific image tags from dokerhub.
It uses some docker hub apis and can be used to automate some CI workflows.


One of the possible use cases is in a multi architecture build for dotnet projects:at the moment  the `dotnet` cli does not run in the context of an ARM emulator (QEMU), hence one of the possibilities is to publish the arm binaries in an image for a different architecture and then use this image as a starting point for an ARM dedicated image build. In such a workflow the initial image is not really needed and at the end of the second docker build can be removed: this is where this tool can become useful.
