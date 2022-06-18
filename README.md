# vChat

## Overview

vChat is a new generation of encrypted communication software that is secure and easy to use

## Implementation principle

The transmission encryption of vChat is based on the RSA encryption algorithm. 

Generate the public key and private key locally, and send the public key to the server, where it is stored with the user data.

All communications of vChat use the HTTPS protocol to ensure data security.

## Safety Commitment

vChat's server only stores the user's UID, nickname, user metadata and encrypted login credentials.

The server software does not have the decryption function,  only performs data exchange and forwarding.

The iOS and macOS versions of vChat are built using Swift and Objective-C. The Windows and Android versions are built using C# with the NET.Core architecture. All vChat distribution software is packaged to prevent unauthorized changes.

In addition, the code other than the vChat communication part will be open sourced.
