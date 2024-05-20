# RB-Engine based in V8 CC CHROME

RB-Engine is an open-source, cross-platform JavaScript, Python, C++ and GO  runtime environment. It´s main developed for ARM64 architecture like NVIDIA Jetson with kernal 5.1 or later. 

For information on using RB-Engine, see the https://github.com/rebotnix/RB-ENGINE.

The RB-Engine project uses an open model in the community version, without any gurantee of bugs, security issues or any other damage. 

Contributors are expected to act in a collaborative manner to move
the project forward. We encourage the constructive exchange of contrary
opinions and compromise. This reserves the right to limit or block contributors who repeatedly act in ways
that discourage, exhaust, or otherwise negatively affect other participants.

** RB-Engine Code lines and language **
---------------------------------------------------------------------------------------
Language                             files          blank        comment           code
---------------------------------------------------------------------------------------
Perl                                   352          29276          25395        1761185
C++                                   1955         172844         188690        1209869
C/C++ Header                          3446         137239         291864         653067
JavaScript                            6396          82750          97643         650858
Assembly                               323          49396          10191         571825
C                                     1630          82568          76499         531805
JSON                                   246             16              0         274635
HTML                                   751          17750            663         271832
Markdown                               407          53765              0         200392
Python                                 410          19073          23692          79431
TypeScript                             212           6236          28769          51757
Bourne Shell                           118           8763           8334          43474
m4                                      36           2716           1461          22532
make                                   117           2568           1806          17037
IDL                                     15            801              0           4285
Rust                                     5             15             11           4072
CSS                                     16            498             11           2543
CMake                                   21            523            550           2469
DOS Batch                               30            146             23           1119
XHTML                                    4            101             36            834
Fortran 90                               2             86            268            641
Starlark                                 3             55             65            607
PowerShell                              16             22             78            362
WiX source                               1             51              8            346
YAML                                    25             23             15            309
R                                        5             55             52            272
Lisp                                     2             42             38            258
Scheme                                   1             13             51            222
Windows Resource File                    4             48            105            209
D                                       12              0              0            190
Bourne Again Shell                       6             45             38            178
WebAssembly                             20             22             14            167
SVG                                      5              1              9            154
vim script                               3             28             30            147
TOML                                     3             15             31            145
Windows Module Definition                3              1              7             96
MSBuild script                           1              0              0             70
reStructuredText                         2             26             14             66
WiX string localization                  1             11              3             28
Fish Shell                               1              5             14             21
awk                                      1              1             10             18
CoffeeScript                             1              7              8             14
Ruby                                     1              4              6             14
INI                                      1              5              1             13
JSX                                      1              1              0             11
XML                                      3              0              0             10
Dockerfile                               1              3              0             10
sed                                      1              0              0              6
---------------------------------------------------------------------------------------
SUM:                                 16616         667614         756503        6359605
---------------------------------------------------------------------------------------



## Table of contents

* [Support](#support)
* [Release types](#release-types)
  * [Download](#download)
    * [Current and LTS releases](#current-and-lts-releases)
* [License](#license)

## Support

We support any issue without any gurantee support time over github issue tracker of this project.

## Release types

* **Current**: Under active development. Code for the Current release is in the
  branch for its major version numbe. RB-Engine releases a new
  major version, allowing for breaking changes without a specify time window. 


### Download

Binaries, installers, and source tarballs are available at
<https://github.com/rebotnix/RB-ENGINE/releases>.

#### Current and LTS releases

<https://github.com/rebotnix/RB-ENGINE/releases/>

The [latest](https://github.com/rebotnix/RB-ENGINE/releases>) directory is an
alias for the latest Current release. The latest-_codename_ directory is an
alias for the latest release from an LTS line. 

- RB-Engine crypto, located at lib/internal/crypto, is licensed as follows:

  (The MIT License)

    Copyright (c) 2024-now Gary Hilgemann

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
    (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify,
     merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
     furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
    WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
    OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
    ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

- RB-Engine node-fs-extra, located at lib/internal/fs/cp, is licensed as follows:
  """
    (The MIT License)

    Copyright (c) 2011-2017 JP Richardson

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
    (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify,
     merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
     furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
    WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
    OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
     ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  """

- base64, located at deps/base64/base64/, is licensed as follows:
  """
    Copyright (c) 2005-2007, Nick Galbreath
    Copyright (c) 2015-2018, Wojciech Muła
    Copyright (c) 2016-2017, Matthieu Darbois
    Copyright (c) 2013-2022, Alfred Klomp
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:

    - Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.

    - Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
    IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
    PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
    TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  """
