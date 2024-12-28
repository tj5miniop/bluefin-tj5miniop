[![build-ublue-custom](https://github.com/tj5miniop/bluefin-custom/actions/workflows/build.yml/badge.svg)](https://github.com/tj5miniop/bluefin-custom/actions/workflows/build.yml)

<p align="center">
  <img src="Bluefin-Logo.png" alt="Bluefin Logo" style="border-radius:12px; width:200px;">
</p>

# tj5miniop's Universal Blue Images: A Custom Variant of Universal Blue's Bluefin & Bazzite

# ****NOTICE - I AM CURRENTLY TESTING OUT BUILDING THE IMAGE USING DNF, so DO not expect any big updates for a while

**Bluefin-tj5miniop** is a personalized variant of Universal Blue's **Bluefin** and **Bazzite** OS, developed with additional features and optimizations aimed at creating a stable, capable and bleeding-edge OS for some of my systems, with an NVIDIA image for easier deployment on NVIDIA systems. Once fully developed and tested, this project will integrate advanced capabilities while maintaining a bleeding-edge experience. 

---

## Features

- **Distrobox Configuration**: Custom configuration of Distrobox, tailored to my workflow.
- **Pre-installed Virtualization**: QEMU and KVM pre-installed for easy virtualization.
- **Native Firefox**: Firefox installed as a native package for web browsing.
- **Gaming Support**: A custom script builds a Distrobox image using Arch Linux, utilizing CachyOS's repos and tweaks to enhance gaming performance.
- **Arch Linux Custom Container Integration**: Full support for Arch Linux-based custom container images (built by me).
- **X11 Support**: Ongoing work to enable proper X11 support for software like Unreal Engine 5.
- **Nvidia Driver Support**: Full integration of Nvidia drivers for enhanced performance.

---

## Rebasing from Bluefin

This repository is an enhancement of **Project Bluefin** so rebasing should (theoretically) be safe. **Note:** rpm-ostree is deprecated, and I'm currently investigating how to work with bootc.

## Contributing

If you’d like to contribute to this project, please feel free to fork the repository, submit a pull request, or open an issue for discussion. Contributions are welcome, and guidelines will be provided as the project matures.

---

## Credits

This project is based on **Universal Blue's Bluefin**, which provides an excellent foundation for making Linux future-ready. I have added my customizations and tweaks to create a personalized experience, but the core credit goes to the fantastic work of the Universal Blue team.


# TO REMOVE LATER
- Containers
  - https://www.youtube.com/watch?v=SnSH8Ht3MIc
  - https://www.mankier.com/5/Containerfile
- rpm-ostree
  - https://coreos.github.io/rpm-ostree/container/
- Fedora Silverblue (and other Fedora Atomic variants)
  - https://docs.fedoraproject.org/en-US/fedora-silverblue/
- Github Workflows
  - https://docs.github.com/en/actions/using-workflows

# How to Use

## Template

Select `Use this Template` and create a new repository from it. To enable the workflows, you may need to go the `Actions` tab of the new repository and click to enable workflows.

## Containerfile

This file defines the operations used to customize the selected image. It contains examples of possible modifications, including how to:
- change the upstream from which the custom image is derived
- add additional RPM packages
- add binaries as a layer from other images

## Workflows

### build.yml

This workflow creates your custom OCI image and publishes it to the Github Container Registry (GHCR). By default, the image name will match the Github repository name.

#### Container Signing

Container signing is important for end-user security and is enabled on all Universal Blue images. It is recommended you set this up, and by default the image builds *will fail* if you don't.

This provides users a method of verifying the image.

1. Install the [cosign CLI tool](https://edu.chainguard.dev/open-source/sigstore/cosign/how-to-install-cosign/#installing-cosign-with-the-cosign-binary)

2. Run inside your repo folder:

    ```bash
    cosign generate-key-pair
    ```

    
    - Do NOT put in a password when it asks you to, just press enter. The signing key will be used in GitHub Actions and will not work if it is encrypted.

> [!WARNING]
> Be careful to *never* accidentally commit `cosign.key` into your git repo.

3. Add the private key to GitHub

    - This can also be done manually. Go to your repository settings, under Secrets and Variables -> Actions
    ![image](https://user-images.githubusercontent.com/1264109/216735595-0ecf1b66-b9ee-439e-87d7-c8cc43c2110a.png)
    Add a new secret and name it `SIGNING_SECRET`, then paste the contents of `cosign.key` into the secret and save it. Make sure it's the .key file and not the .pub file. Once done, it should look like this:
    ![image](https://user-images.githubusercontent.com/1264109/216735690-2d19271f-cee2-45ac-a039-23e6a4c16b34.png)

    - (CLI instructions) If you have the `github-cli` installed, run:

    ```bash
    gh secret set SIGNING_SECRET < cosign.key
    ```

4. Commit the `cosign.pub` file into your git repository

### Examples
- [m2os](https://github.com/m2giles/m2os)
- [bos](https://github.com/bsherman/bos)
- [homer](https://github.com/bketelsen/homer/)
