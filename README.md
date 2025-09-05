# meta-aeroboard

Yocto/OpenEmbedded layer for the **AeroBoard** custom machine.

---

## Description

`meta-aeroboard` provides:

- A **custom machine configuration** (`aeroboard.conf`)  
- A **custom image recipe** (`aeroboard-image.bb`) based on `core-image-minimal`  
- Space for **additional recipes**, `bbappend`s, and configuration  
- Optional extensions for **networking**, **SSH**, and **core utilities**  

It is designed to work with **Poky**, **meta-tegra**, and NVIDIA Jetson boards or compatible custom hardware.

---

## Dependencies

This layer depends on:

- [poky](https://git.yoctoproject.org/cgit/cgit.cgi/poky/) – Yocto reference distribution  
- [meta-openembedded](https://github.com/openembedded/meta-openembedded) – extra packages  
- [meta-tegra](https://github.com/OE4T/meta-tegra) – Tegra BSP support  

Make sure these layers are cloned alongside `meta-aeroboard`.

---

## Layer Setup

### Adding the Layer

From your Yocto build directory:

```bash
source poky/oe-init-build-env
bitbake-layers add-layer ../meta-aeroboard
