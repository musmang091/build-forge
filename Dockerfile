FROM jupyter/datascience-notebook:latest

# 1. Switch to root explicitly
USER root

# 2. Install packages as root
RUN apt-get update && apt-get install -y \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# 3. Create a new non-root user
RUN useradd -m -s /bin/bash dockeruser

# 4. Grant passwordless sudo privileges to the new user
RUN echo 'jovyan ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Fix permissions on /home/jovyan
RUN fix-permissions /home/jovyan

# Switch back to jovyan (the default user)
USER jovyan

CMD ["/bin/bash"]


