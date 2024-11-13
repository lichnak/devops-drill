# Install Java 8 on macOS

1. Install and upgrade Homebrew.
2. The brew search java has no java8?

    ```bash
    % brew search java        
    ==> Formulae
    app-engine-java           java                      javacc                    jslint4java               pdftk-java
    google-java-format        java11                    javarepl                  libreadline-java
    ```

3. The Java 8 is available at the openjdk@8 formula. The openjdk is the same as the java formula, and it always contains the latest JDK GA version; the openjdk@11 is the same as the java11 formula, containing JDK 11.

    ```bash
    % brew search openjdk
    ==> Formulae
    openjdk                                   openjdk@11                                  openjdk@8  
    ```

4. We can use the openjdk@8 formula to install Java 8 on macOS.

    ```bash
    % brew install openjdk@8
    ```

5. The openjdk@8 is also a keg-only; we need to create a symbolic link so that the macOS java wrapper can find it.

    ```bash
    % sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk  
    ```

6. Done.

    ```bash
    % java -version

    openjdk version "1.8.0_275"
    OpenJDK Runtime Environment (build 1.8.0_275-bre_2020_11_16_15_09-b00)
    OpenJDK 64-Bit Server VM (build 25.275-b00, mixed mode)
    ```

7. What if we have multiple Java versions installed?

    ```bash
    ls -lsah /Library/Java/JavaVirtualMachines/

    openjdk-8.jdk -> /usr/local/opt/openjdk@8/libexec/openjdk.jdk
    openjdk.jdk -> /usr/local/opt/openjdk/libexec/openjdk.jdk
    ```

    We can update the $PATH at ~/.zshrc, so that the macOS can find the correct installed Java.

    ```bash
    java -version

    openjdk version "15.0.1" 2020-10-20
    OpenJDK Runtime Environment (build 15.0.1+9)
    OpenJDK 64-Bit Server VM (build 15.0.1+9, mixed mode, sharing)

    % echo 'export PATH="/usr/local/opt/openjdk@8/bin:$PATH"' >> ~/.zshrc  

    % source ~/.zshrc

    % java -version

    openjdk version "1.8.0_275"
    OpenJDK Runtime Environment (build 1.8.0_275-bre_2020_11_16_15_09-b00)
    OpenJDK 64-Bit Server VM (build 25.275-b00, mixed mode)
    ```
