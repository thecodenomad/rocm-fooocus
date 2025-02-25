# rocm-fooocus

To get going, you'll need make and podman. 

```
make fooocus
```

This is currently using the upstream rocm/pytorch container with the latest version, you will likely need to set
the `HSA_OVERRIDE_GFX_VERSION` in the `Makefile`.

Unfortunately, on integrated GPU with Ryzen 7 7840 (780M Navi 3) loads the fooocus UI, but can crash. YMMV.

