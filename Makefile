
# full path to local kernel source !!!
KERNELPATH :=  /mnt/c/kernel/aufs4/aufs4-linux.git
LOCALI915 := $(KERNELPATH)/drivers/gpu/drm/i915

patch: 
	patch --forward -p1 --directory=$(KERNELPATH) \
			< i915_fhd.patch || \
			echo "Already patched"

unpatch: 
	patch --reverse -p1 --directory=$(KERNELPATH) \
			< i915_fhd.patch|| \
			echo "Already un-patched"


build: 
	make -C $(KERNELPATH) M="$(LOCALI915)"
	cp $(LOCALI915)/i915.ko   ./i915.ko
	modinfo ./i915.ko
	
diff:
	(cd $(KERNELPATH) && git diff)> i915_diff.txt
	cat i915_diff.txt

