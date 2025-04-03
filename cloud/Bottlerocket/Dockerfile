# Container Image
FROM amazonlinux:latest

# Install XMLLINT,wget and gunzip
RUN dnf install -y libxml2 gzip wget

# Pull down bottlerocket Updates
RUN wget https://advisories.bottlerocket.aws/updateinfo.xml.gz

# Unzip
RUN gunzip updateinfo.xml.gz

# Prettify
CMD xmllint --format ./updateinfo.xml
