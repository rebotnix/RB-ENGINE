# RB-ENGINE
REBOTNIX RB-Engine is a static, fast and strong runtime. Developed by Gary Hilgemann and published the first time on 1th may 2024.

<p align="center">
<img src="https://github.com/rebotnix/RB-Engine/assets/566761/f577b919-5acd-40a5-98fb-bdf1c10702ad" />
</p>

# About
The RB-Engine by REBOTNIX is a static, fast, and robust runtime environment specifically designed for smooth execution on Nvidia Jetson Orin Nano, NX, AGX, as well as Xavier NX and AGX series, which are based on ARM architecture. Written in C++, the RB-Engine uses V8 JS stack and we added compression and encryption method to the nodejs, new packaging to execute script files in the fastest possible manner with the highest level of compression and security.

The RB-Engine offers several advantages, including:

**Highest Performance**

By utilizing C++ and efficient compression techniques, the RB-Engine provides high performance for executing single file-based script files.

**Compactness**

Compared to conventional runtime environments, the RB-Engine is extremely compact, making it ideal for deployment on edge devices where storage space is limited.

**Security**

The RB-Engine is developed with a high-security standard to protect script execution on Nvidia Jetson devices.

**Optimized Compatibility**

Specifically tailored for Nvidia Jetson devices, the RB-Engine offers optimized compatibility and performance on these platforms. RB-Engine is 100% code execution compatible to javascript, python and c++. In development phase you still can use your standard node, execute the the same code with RB-Engine or the native runtime.

<p align="center">
<img src="https://github.com/rebotnix/RB-Engine/assets/566761/0e494d6c-7744-4332-82de-c0ee93bceabf" />
</p>

# Note:

This project is only possible because great people, amazing hardware and software developers from all over the world have put a lot of work, heart, and soul into their projects and are making their scientific work available. With this project, we pursue this approach in https://www.jetson-ai-lab.com/research.html and want to create incentives to either rethink what has already been developed or revive old ideas in order to achieve the optimum yield. It doesn't matter whether you want to supplement your commercial business idea with the open-source part using our tools and documentation or simply want to discuss the scientific results and controversies.

# Why a another runtime environment, the RB-Engine?
The Unix operating system was first developed in 1971 by Ken Thompson and Dennis Ritchie at Bell Labs. One of the main goals of Unix was to provide programs for different hardware platforms, minicomputers, and mainframes in a simple and modular way. 

Node.js JavaScript, Python runtime, and native compiled C++ applications represent the industry standard. We're currently exploring experiments with Node.js versions beyond 21 to develop static binaries with embedded script files.

With RB-Engine, we segment the development process into distinct production and deployment phases. We prioritize minimizing runtime to its utmost compression level on edge devices, along with thoroughly packing and encrypting executing scripts for heightened security.
Simultaneously, our aim is to reduce the physical strain on flash memory, thereby extending the lifespan of intensive AI applications required to maintain 24/7 stability even in the most challenging outdoor environments.

Today, Unix and its various derivatives such as Linux are among the most widely used operating systems in the world, including Nvidia Jetson, based on ARM CPU architecture. It has become common practice to take the original idea of a static binary and add various installations of runtimes, including hardware and software drivers, to large complex applications. 

Attempts are being made to tackle this complexity by packaging development and production environments into Docker runtimes for ease of management. While this approach is acceptable for desktop applications and data center operations, edge devices have now found their way into industrial environments. Various compression technologies, intelligent runtime inference packagers are still being avoided to ensure that runtimes and applications remain as compact as possible when edge programs, or part or complex web services with API load balancers, need to be deployed around the world.

<p align="center">
<img src="https://github.com/rebotnix/RB-Engine/assets/566761/7ee74720-993e-4fa0-b1b6-5967a1d1292f"/>
</p>

# RB-Engine aims to achieve two things 

**First**

Retain the original concept of Unix systems in dealing with static binary files.

**Secondly**, 

Integrate modern compression and encryption technologies to make web applications on so-called edge devices more secure. In short, it's about using the best practices of Unix while better protecting web applications on edge devices. From the hardware view, we want to reduce the number of access to the flash node cell of an SSD. 
To offer our own hardware and better place for sharing our ideas with new and existing customers.


| Runtime   | Filesize    | Packager | Encryptor | Version
| --------- | ----------- | -------- | --------- | ------- 
| Nodejs    | 2500 MB DEV | NO       | NO        | 21
| Nodejs    | 155 MB PRO  | NO       | NO        | 21
| RB-Engine | 23 MB       | YES      | YES       | 21

**Differences to RB-Engine and RB-Engine enterprise**

We offer a free standard version, a hardware-encrypted version and an enterprise version. All functions are included in the free standard version, but hardware encryption is only supported on hardware is only supported on hardware-certified devices and the storage license server is only available in the enterprise version.

| Feature                     | RB-Engine | RB-Engine Enterprise | Nodejs  
| --------------------------  | --------- | -------------------- | ------- 
| Memory license server       | NO        | YES                  | NO
| symmetric encryption        | YES       | YES                  | NO
| App packager                | YES       | YES                  | YES
| App Encryptor               | YES       | YES                  | NO
| Hardware encryption         | NO        | YES                  | NO
| Static Binary               | YES       | YES                  | NO
| Opensource                  | YES       | YES                  | YES
| Quantum qiskit support      | NO        | YES                  | NO
| COMMONJS & ESM & TYPESCRIPT | NO        | YES                  | NO
| INJECT DEBUG (-inspect)     | NO        | NO                   | YES
| BINDINGS FOR PY | JS        | YES       | NO                   | YES

# Symmetric encryption

RB-Engine uses symmetric AES de-cryption and an encryption method.  

<p align="center">
<img src="https://github.com/rebotnix/RB-Engine/assets/566761/ece008f6-8441-474c-8868-3bd00d3ebca4" width="600px"/>
</p>


# Is the encryption breakable?
Yes, every symmetric or a-symetric encryption is breakable. To break the encryption in RB-Engine, you need to debug and disassemble and extract the master keys. To add your own keys and other methods, you will need to re-compile and develop your strategy into the engine and encyptor.

# Note - IMPORTANT -  

This project demonstrates the capabilities of the RB-Engine with built in encryption and decryption. Encryption and security can be a very complex topic, and if you are not sure about to use these tools, please contact us to get support.

Nodejs itself does not support anything in this area at the moment. There are several programs that allow you to pack a single Nodejs into tons of pkg files, ending up with not a single and compact firmware, which is our focus with this research project. If you need stronger encryption method, we offer hardware crypto chip solutions on our carrier boards as well with our memory license server you can inject on the file the required applications from an 2 factor services. This required an enterprise license.

GUSTAV-I3 and GUSTAV I7 with hardware encryption support.

# App packager
The App packager is an MIT-based OpenSource application that allows you to pack your entire Nodejs application(s) into a single file. It does not yet use the file encryption method and we have no plans to add an encrypted version to this module.

To see the options, execute it (please note that rb_engine has added the version in its file name)
a) Go into the production folder and execute the package help dialog.
	./rb_engine packager/dist/ncc/cli.js -h
	Response:
	Usage: ncc <cmd> <opts>
 
Commands:
build <input-file> [opts]

run <input-file> [opts]
  		cache clean|dir|size
  		help
  		version
**Usage**
First you develop your nodejs application as before. You also can use the rb_engine to execute your developer code or the required nodejs version. 

**Example**
Let us create a hello world simple js app.
let hello = “hello rb-engine”
console.log(hello)

Save this as file as hellow.js and try to execute this file with:
Output is
./rb_engine  hellow.js
hello rb-engine

Now pack this hellow.js to a single application with the app packager:
 ./rb_engine packager/dist/ncc/cli.js build hello.js -o dist_hellow

The rb_engine generate an distribution folder dist_hellow

You can test the packing code with:
./rb_engine dist_hellow/hello.js

# App encryptor
To use the app encryptor, it is necessary that you before have packed the file with the file packager to one single file. 

Now to encrypt and generate an img file,  you can execute (execute it from the production folder)

./rb_engine encryptor encryptor/encryptor.img dist_hellow/index.js dist_hellow/index.img

To execute the created image, you can now use the rb_engine to execute the file.

../rb_engine dist_hellow/index.img

When you open the index.img you see that this file is now encrypted as a single image container.
	cat dist_hellow/index.img
  JJlumcATabMo/OPAg5aJz7QeqnHNvHbxnjWog0XdFBogG…..

# Hardware Encryption and signature (enterprise level yet):
RB-Engine in combination with GUSTAV-I3 and I7 support another encryption level that supports hardware crypto chips that we installed on the carrier board. In combination with the embedded GPU and the hardware crypto chip, you can sign application per device and bind every application to it.

<p align="center">
<a href="https://rebotnix.com"><img src="https://github.com/rebotnix/RB-Engine/assets/566761/7d64f926-f0ce-4b26-bb46-00e7f3519a56"/></a>
</p>

# In memory license server (only for enterprise)

You can use this feature to load an encrypted nodejs-based application that you have previously packed with the File Packager. 
The signature of the file contains different types of challenge response codes and data pipelines. The pipelines to receive a challenge response code are e-mail, SMS and VPN (virtual private network) support. The storage support can load and inject signed code or a key file to open the boot image. 

The file is transferred exclusively via secure https. The storage license server is a REBOTNIX Enterprise product that you do not necessarily need to create and run your own application.

# Technical environment 
The first version of rb_engine_a64_tegra_5.10.120 supports the ARM64 architecture, based on Linux ubuntu 22.xx or higher.

The system requirements:
Linux 5.10.120-tegra #1 SMP PREEMPT Tue Aug 1 12:32:50 PDT 2023 aarch64 GNU/Linux
NVIDIA Jetson Orin AGX 32 oder 64 GB
Jetson Orin NX with Linux 5.1.20.120 will tested soon


# Applications

**Web Server**
**Real-Time Communication**
**API Middleware**
**Internet of Things (IoT)**
**Data Processing and Streaming**
**Desktop Applications**
**Microservices Architecture**
**Serverless Computing**
**DevOps**
**Data Science and Machine Learning**
**Blockchain Development**
**Voice Assistant Applications**
**Gaming Applications**


#Requirements:
RB-Engine was developed as a static binary, you can execute it directly form one folder. The compiled binary supports
only ARCH64 (ARM) 

**Make sure that you have the right linux kernel for your jetson device, that is 5.10.120.** 

You can check this with the command
uname -a

**Supported jetson linux kernels **

**Linux gustavagx64 5.10.120-tegra #1 SMP PREEMPT Tue Aug 1 12:32:50 PDT 2023 aarch64 aarch64 aarch64 GNU/Linux**

Note:
If you do not use kernel 5.10.120 or higher, you will get an GLIB-C error, cause this kernel is just to old.

# Examples
Please take a look at the example folder to start some demos.

## Citation

```
@article{gh2024rb-engine,
  author    = {Gary Hilgemann},
  title     = {RB-Engine: secure and efficent runtime for NVIDIA JETSON},
  year      = {2024},
}
```
