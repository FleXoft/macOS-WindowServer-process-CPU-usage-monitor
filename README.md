# macOS WindowServer process CPU usage monitor

At an unfortunate moment (Link: [1](https://discussions.apple.com/thread/255413533?sortBy=best), [2](https://www.askwoody.com/forums/topic/forced-upgrade-to-macos-sonoma/), [3](https://www.reddit.com/r/MacOS/comments/193tmio/macos_monterey_automatically_updated_to_sonoma/), [4](https://eclecticlight.co/2024/01/25/avoiding-unintended-upgrades-to-macos/)), I also fell into that group of people whose operating system was accidentally updated by Apple from macOS Monterey to the latest macOS Sonoma against their consent. :-(

Since my system fell a bit "naturally" slow after this OS update, I started to observe what was consuming the most CPU resources on my machine and soon found the problem which was a certain function of a specific application.

With the new operating system, my old machine is not as fast as it was earlier but at least I managed to find a big "hidden" CPU consumer process.

Based on this monitoring process, I made a CLI shell script, which I still use sometimes to check if something is using extra WindowServer resources.