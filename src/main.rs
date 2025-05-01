#![no_std]
#![no_main]

use core::panic::PanicInfo;

fn main() {
    loop {}
}



#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    // Your panic handling logic here.
    // This might involve logging an error, resetting hardware, etc.

    // The '!' type indicates that this function never returns.
    loop {}
}
