hardware.i2c89.configure(CLOCK_SPEED_400_KHZ);

const accelerometer = 0x1D;

const out_x = 0x01;
const xyz_data = 0x0E;
const who_am_i = 0x0D;
const control_reg = 0x2A;
 
function start() {
server.log("trying to start");

    // i2c.write takes two arguments: address and string. 
    // here, we send 16 bits of data: the first byte is a register, the second is a command
    // your needs will vary with the device you are trying to communicate with
 
 local byte = hardware.i2c89.write(accelerometer, "\x0D");
 
 // server log returns -2, meaning communiation not recieved by slave
 
 imp.wakeup(0.5, read);
 
 
 
}

function read(){

local readbyte = hardware.i2c89.read(accelerometer, "\x0D", 1);

server.log(readbyte);

}


imp.configure("accel", [], []);
start();