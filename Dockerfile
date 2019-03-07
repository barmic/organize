FROM gradle:5.2-jdk8 AS BUILD_IMAGE
COPY back /root
WORKDIR /root
RUN gradle build

FROM java:8
COPY front /static
COPY --from=BUILD_IMAGE /root/back/build/organize.jar /root/organize.jar
