FROM centos:6
MAINTAINER feedforce Inc.

# setup
RUN yum update -y
RUN yum install -y rpm-build tar

# ruby depends
RUN yum -y install readline-devel ncurses-devel gdbm-devel glibc-devel gcc openssl-devel libyaml-devel libffi-devel zlib-devel

# rpmbuild command recommends to use `builder:builder` as user:group.
RUN useradd -u 1000 builder

RUN mkdir -p /home/builder/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
RUN chown -R builder:builder /home/builder/rpmbuild

ADD script/build-ruby.sh /home/builder/rpmbuild/
RUN chmod a+x /home/builder/rpmbuild/build-ruby.sh

ADD ruby.spec /home/builder/rpmbuild/SPECS/

WORKDIR /home/builder/rpmbuild
