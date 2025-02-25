###################
# Base Rocm Image #
###################
FROM rocm/pytorch as base

# Build Args
ARG HSA_OVERRIDE_GFX_VERSION=11.0.0

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8

# Set the ROCm environment variable for AMD GPUs
ENV HSA_OVERRIDE_GFX_VERSION $HSA_OVERRIDE_GFX_VERSION

RUN env

RUN apt-get update &&\
    apt-get install -y \
    wget \
    git \
    python3 \
    python3-pip \
    python-is-python3
RUN python -m pip install --upgrade pip wheel

#################
# Fooocus Setup #
#################
FROM base as fooocus-base 

# Set up Fooocus
RUN git clone https://github.com/lllyasviel/Fooocus /app

# Install Python dependencies
RUN python3 -m pip install --upgrade pip && \
    pip install -r /app/requirements_versions.txt

##############
# Fooocus UI #
##############
FROM fooocus-base as fooocus-ui

# Expose the models directory as a volume
# VOLUME /app/models

# Default command to launch Fooocus
# ENTRYPOINT ["python3", "entry_with_update.py", "--listen"]

WORKDIR /app
