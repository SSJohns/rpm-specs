# rpm-specs
RPM Specs for NDLIB

# What is this spec?

Forked from feedforce's ruby-rpm project at https://github.com/feedforce/ruby-rpm.

# build SRPM and RPM

# Docker builder

1. Create the docker build with the following command while in this directory
`docker build -t "simple_flask:dockerfile" .`

2. Run the docker container with the following command
`docker run -p 5000:5000 simple_flask:dockerfile`

# If on windows

3. Windows machines will have improper file endings so run these commands to convert the files to unix endings
`yum install dos2unix`
`dos2unix build-ruby.sh`
`dos2unix ./SPECS/ruby.spec`

# Otherwise

4. Now we need to change the home settings and run our machine with the proper directories
`export HOME='/home'`
`mkdir /shared`
`./build-ruby.sh`
