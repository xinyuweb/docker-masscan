FROM alpine:3.4
ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8

RUN apk --no-cache add build-base git libpcap-dev curl wget

RUN git clone https://github.com/robertdavidgraham/masscan /opt/masscan
WORKDIR /opt/masscan

# Make masscan
RUN make -j

# Copy binary
RUN cp /opt/masscan/bin/masscan /usr/local/bin

# Launch Bash
CMD ["/bin/bash"]
