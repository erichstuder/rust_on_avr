#![no_std]
#![no_main]

use panic_halt as _;
use embassy_executor::{Spawner, main, task};
// use avr_device::entry;

// #[entry]
// fn main() -> ! {
//     // This is the entry point for the program. It is called by the bootloader.
//     // The `embassy_executor` crate provides a way to run async code on embedded devices.
//     // The `main` function is marked with `#[entry]` to indicate that it is the entry point.
//     embassy_executor::Executor::run(main);
// }

#[main]
async fn main(spawner: Spawner) {
    // let dp = arduino_hal::Peripherals::take().unwrap();
    // let pins = arduino_hal::pins!(dp);

    /*
     * For examples (and inspiration), head to
     *
     *     https://github.com/Rahix/avr-hal/tree/main/examples
     *
     * NOTE: Not all examples were ported to all boards!  There is a good chance though, that code
     * for a different board can be adapted for yours.  The Arduino Uno currently has the most
     * examples available.
     */

    // let mut led = pins.d13.into_output();

    loop {
        // led.toggle();
        // arduino_hal::delay_ms(100);

    }
}

// [task]
// async  
