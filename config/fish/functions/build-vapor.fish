function build-vapor
    make clean
    make
    sudo make install
    sudo pkill php
end
