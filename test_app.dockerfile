FROM codesimple/elm:0.17

ENV UPDATED_ON 2016-04-13

# Add the application and install packages
ADD . /usr/src
WORKDIR /usr/src/test/integration/test_app
RUN ./install-packages.sh

# Make sure code compiles
RUN elm make Main.elm

# Override entry point provided by codesimple/elm
ENTRYPOINT []

# Run the application when starting docker
CMD elm reactor

