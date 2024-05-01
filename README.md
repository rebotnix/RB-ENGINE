# RB-Engine
REBOTNIX RB-Engine is a static, fast and strong middleware application to act as middleware. Developed by Gary Hilgemann and published the first time on 1th may 2024.

![image](https://github.com/rebotnix/RB-Engine/assets/566761/f577b919-5acd-40a5-98fb-bdf1c10702ad)

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

![image](https://github.com/rebotnix/RB-Engine/assets/566761/0e494d6c-7744-4332-82de-c0ee93bceabf)

# Note:

This project is only possible because great people, amazing hardware and software developers from all over the world have put a lot of work, heart, and soul into their projects and are making their scientific work available. With this project, we pursue this approach in https://www.jetson-ai-lab.com/research.html and want to create incentives to either rethink what has already been developed or revive old ideas in order to achieve the optimum yield. It doesn't matter whether you want to supplement your commercial business idea with the open-source part using our tools and documentation or simply want to discuss the scientific results and controversies.

# Why a another runtime environment, the RB-Engine?
The Unix operating system was first developed in 1971 by Ken Thompson and Dennis Ritchie at Bell Labs. One of the main goals of Unix was to provide programs for different hardware platforms, minicomputers, and mainframes in a simple and modular way. 

Node.js JavaScript, Python runtime, and native compiled C++ applications represent the industry standard. We're currently exploring experiments with Node.js versions beyond 21 to develop static binaries with embedded script files.

With RB-Engine, we segment the development process into distinct production and deployment phases. We prioritize minimizing runtime to its utmost compression level on edge devices, along with thoroughly packing and encrypting executing scripts for heightened security.
Simultaneously, our aim is to reduce the physical strain on flash memory, thereby extending the lifespan of intensive AI applications required to maintain 24/7 stability even in the most challenging outdoor environments.

Today, Unix and its various derivatives such as Linux are among the most widely used operating systems in the world, including Nvidia Jetson, based on ARM CPU architecture. It has become common practice to take the original idea of a static binary and add various installations of runtimes, including hardware and software drivers, to large complex applications. 

Attempts are being made to tackle this complexity by packaging development and production environments into Docker runtimes for ease of management. While this approach is acceptable for desktop applications and data center operations, edge devices have now found their way into industrial environments. Various compression technologies, intelligent runtime inference packagers are still being avoided to ensure that runtimes and applications remain as compact as possible when edge programs, or part or complex web services with API load balancers, need to be deployed around the world.

![image](https://github.com/rebotnix/RB-Engine/assets/566761/9680b3b3-d8ac-4de6-a727-63f1d932d6cb)

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


| Feature                | RB-Engine   | RB-Engine Enterprise | Nodejs  
| ---------------------- | ----------- | -------------------  | ------- 
| memory license server  | NO          | YES                  | NO










