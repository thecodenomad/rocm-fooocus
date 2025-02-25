HSA_OVERRIDE_GFX_VERSION="11.0.0"

.PHONY: build_cache 
build_cache:
	mkdir -p fooocus-models 

        # Build base container to grab pytorch dependencies 
	podman-compose build --build-arg HSA_OVERRIDE_GFX_VERSION="${HSA_OVERRIDE_GFX_VERSION}" \
	                     fooocus-base

fooocus: build_cache 
	podman pod rm -f pod_fooocus
	podman-compose --verbose up fooocus 

clean:
	# rm -rf build_cache
	podman pod rm -f pod_rocm-fooocus 
