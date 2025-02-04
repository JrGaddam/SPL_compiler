# **Compiler Construction: SPL Language Compiler**  
**CSE-4305 Academic Project**  

This repository contains the implementation of a **compiler** for the **SPL (Simple Programming Language)**, developed as part of the *Design and Construction of Compilers* course. The compiler is built in **Java** and **Scala**, and it follows a multi-phase approach to transform SPL code into executable machine code for the **MIPS instruction set**.  

---

## **Project Overview**  
The compiler is implemented in **six phases**, each building on the previous one:  

1. **Scanner**: Implements lexical analysis using the SPL language specification.  
2. **Parser**: Uses the scanner to parse tokens and build a syntax tree.  
3. **AST Generator**: Constructs an Abstract Syntax Tree (AST) from the parsed tokens.  
4. **Type Checking**: Validates the AST for type correctness.  
5. **Intermediate Code Generation**: Converts the AST into intermediate code.  
6. **Machine Code Generation**: Translates intermediate code into MIPS assembly instructions.  

---

## **Features**  
- **Lexical Analysis**: Tokenizes SPL code using a custom scanner.  
- **Syntax Parsing**: Implements a parser to validate syntax and build a parse tree.  
- **Abstract Syntax Tree (AST)**: Generates an AST for semantic analysis and code generation.  
- **Type Checking**: Ensures type safety and correctness in the AST.  
- **Code Generation**: Produces intermediate code and MIPS assembly instructions.  
- **Testing Framework**: Includes test cases for each phase to validate functionality.  

---

## **Technologies Used**  
- **Languages**: Java, Scala  
- **Tools**: JFlex (Scanner), CUP (Parser), Apache Maven (Build Automation)  
- **Platform**: Windows/Linux/MacOS  

---

## **Getting Started**  

### **Prerequisites**  
1. **Java SE 8 JDK**: Install from [Oracle](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html).  
2. **Scala 2.11**: Download from [Scala Lang](https://www.scala-lang.org/download/2.11.12.html).  
3. **Apache Maven**: Install from [Maven](https://maven.apache.org/install.html).  

### **Environment Setup**  
1. Set the `JAVA_HOME` environment variable to your JDK installation path (e.g., `C:\Java\jdk1.8.0_111`).  
2. Update the `PATH` variable to include:  
   - JDK bin directory (e.g., `C:\Java\jdk1.8.0_111\bin`).  
   - Maven bin directory (e.g., `C:\apache-maven-3.3.9\bin`).  
   - Scala bin directory (e.g., `C:\Program Files (x86)\scala\bin`).  

### **Build and Run**  
1. **Build the Project**:  
   ```bash  
   mvn clean install  
2. **Run the Compiler**:  
   ```bash  
   scala lib/spl.jar <compiler-phase> tests/hello.spl  
   Example:
   ```bash  
   scala lib/spl.jar 1 tests/hello.spl  
3. **Check Solutions**:  
   ```bash  
   scala spl-solution.jar <compiler-phase> tests/hello.spl    
   Example:
   ```bash  
   scala spl-solution.jar 1 tests/hello.spl   
