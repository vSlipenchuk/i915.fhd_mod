# i915.fhd_mod

This patch adds a new configuration for i915 driver for disable LVDS ghost display in linux kenel to support  x220/x230 nitrocaster or K.K. fhd mod.

Just add as boot option:  i915.fhd_mod=1 
If fhd_mod is not assinged (assuming default value 0), patched i915 drivers works as unmodified driver.


### Make
```
make patch
make build

This creates local file i915.ko . 
Move it to /lib/modules/KERNEL


