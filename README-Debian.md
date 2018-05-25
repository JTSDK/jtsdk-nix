# Debian Lauchpad PPA How-To

There is a lot of confusion about the different package schemas relating to
Ubuntu and Debian. Put simply, Ubuntu would not exist without Debian, as Ubuntu
derives its core packaging from Debian:

* Debian Sid Jessy, Stretch, Buster etc.

It stands to reason, if WSJT-X works on a given Ubuntu Release, it should also
run on its derivative Debian Release.

Before I begin, its acknowledged that the best solution would be an updated
version of WSJT-X and/or JTSDK in Debian proper. For several reasons, these
updates cannot happen at this time. As an alternative, the following is proposed.

## Debian Release Version
So, how does one figure this out. Each Ubuntu Release has a file called
```/etc/debian_version``` which contains the Debian Release corresponding
to the Ubuntu Release you are using.

### In the terminal
```bash
# command
cat /etc/debian_versoin

# results: will return something like

# Ubuntu 14.04
jessie/sid

# Ubuntu 16.04
stretch/sid

# Ubuntu 18.04
buster/sid
```

## Correlating Release Data and Launchpad
If we know which version of Debian a given Ubuntu Release was derived from, we
can use this information to coorelate a given Launchpad PPA. To save folks
a lot of wrestling around, here is the current Ubuntu LTS information:

| Ubuntu    | Version  | Debian      | Version     | Debian Release   |
|:---------:|:--------:|------------ |-------------|:----------------:|
| Trusty    | 14.04    | Jessie/Sid  | 8.x series  | May 2016         |
| Xenial    | 16.04    | Stretch/Sid | 9.x series  | June 2017        |
| Bionic    | 18.04    | Stretch/Sid | 10.x series | Not released yet |

## Launchpad PPA Usage on Debian
To use a Launchpad PPA on Debian, one must add the proper Launchpad repository.
Using the data from above perform the following (the example is JTSDK-Nix. It could also apply to the WSJT-X PPA’s)

> Note - The key is my PPA key. It would change for PPA’s from other
maintainers.

### In The terminal
```shell
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 862549F9

# Edit the source list
sudo nano /etc/apt/sources.list

# For Debian Jessie 8.x series
# -----
deb http://ppa.launchpad.net/ki7mt/jtsdk/ubuntu trusty main
# -----

# For Debian Stretch 9.x series
# -----
deb http://ppa.launchpad.net/ki7mt/jtsdk/ubuntu xenial main
# -----

# Ctrl+X to save and exit

```

## JTSDK Installation:

### In the terminal
```bash
sudo apt-get update
sudo add-apt-repository ppa:ki7mt/jtsdk
sudo apt-get update
sudo apt-get install jtsdk jtsdk-full
```

## Building WSJT-X:
The above will add the JTSDK PPA, update the repository, and install JTSDK
along with all required build dependencies. I tested this approach on Debian 9.4
with no build errors with WSJT-X.

Now that JTSDK is installed on your Debian instance, you can build what you like.

## Bugs and Suggestions
Please report any problems with the process to [JTSDK@groups.io](https://groups.io/g/JTSDK)