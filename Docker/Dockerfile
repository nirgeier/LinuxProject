###
### Docker image to run our tasks
###
FROM ubuntu

### Setth eENV file to ignore pip install warnings
ENV PIP_ROOT_USER_ACTION=ignore

# Install required tools
RUN                   \
  apt update      &&  \
  apt upgrade -y  &&  \
  apt install -y      \
  git                 \
  pip                 \
  python3             \
  tree                \
  vim               

RUN                   \
  pip install         \
  --upgrade           \
  mdformat-gfm  

WORKDIR src