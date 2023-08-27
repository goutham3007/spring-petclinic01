FROM amazoncorretto:11-alpine3.17
LABEL author="goutham"
LABEL organization="learningthoughts"
RUN adduser -h /spc -s /bin/sh -D spc
WORKDIR  /spc
USER spc
ADD --chown=spc:spc https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /spc/spring-petclinic-2.4.2.jar
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-2.4.2.jar"]