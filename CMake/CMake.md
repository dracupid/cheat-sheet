CMake
=======
- [offical tutorial](https://cmake.org/cmake-tutorial/) 
- [wiki](https://cmake.org/Wiki/CMake)

## 基本语法规则
- 指令名不区分大小写，变量和参数区分大小写
- 指令格式为：`指令名(参数1 参数2 ...)`。参数之间用空格或;分割，遇到带空格的字符串或变量应该加**双引号**
- 使用`${name}`引用变量。一些控制语句中直接使用变量名，如if

## 备注
- CMakeLists里的代码文件一般不应出现头文件(.h .hpp)，头文件在编译时会合入引用它们的文件中，不需要单独管控。
- 源代码的扩展名可以省略，会自动查找，但一般不建议使用。
- CMake 不支持 make distclean，而是推荐使用out-of-source build
- 变量可视作直接替换为对应字符串，输出时应注意空格的问题
- CMake中的target包括可执行文件、动态链接库、静态链接库三种，在项目中target名称不能重复。若要构建不同类型但同名的target，可以用SET_TARGET_PROPERTIES修改OUTPUT_NAME和CLEAN_DIRECT_OUTPUT

## in-source vs out-of-source build
- 内部构建：在代码目录下运行`cmake`进行构建
- 外部构建（推荐）：另创建构建目录，在构建目录中运行`cmake ..`进行构建，不污染代码目录

## 基本示例
```
projectRoot
    |
    +-- math.hpp
    |
    +-- math.cpp
    |
    +-- main.cpp (include "math.hpp")
    |
    +-- CMakeLists.txt
```
```cmake
# CMake 最低版本要求
cmake_minimum_required(VERSION 2.6) 
# 项目名称
project(Tutorial) 	

# 生成可执行文件
add_executable(runner main.cpp math.cpp)

# 查找文件夹下所有源代码文件
aux_source_directory(. DIR_SRCS)
add_executable(runner ${DIR_SRCS})
```
## 多模块示例

```
projectRoot
    |
    +-- main.cpp (include "lib/math.hpp")
    |
    +-- CMakeLists.txt
    |
    +-- lib
        |
        +-- math.hpp
        |
        +-- math.cpp
        |
        +-- CMakeLists.txt
```


```cmake
cmake_minimum_required(VERSION 2.6) 
project(Tutorial) 	
# 设置变量
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")


# 添加模块子目录
add_subdirectory(lib)
add_executable(runner main.cpp)
# 添加链接库
target_link_libraries(runner lib)
```

```cmake
aux_source_directory(. DIR_SRCS)
# 生成链接库
add_library (lib ${DIR_SRCS})
```

## CMake Commands
[参见](CMake_commands.md)

## property & variable
- `property`  主要包括全局范围、目录、target、测试、源文件、缓存项、安装文件的属性
- `variable` 包括（项目和编译环境的）信息、行为控制、系统描述、构建控制和语言、测试、打包相关的内容
- 并不能很明确的区分，使用时应查阅文档分清类别，二者的get/set方法不同，不能混用

## 常用CMake变量
[完整参考文档](https://cmake.org/cmake/help/v3.7/manual/cmake-variables.7.html)
[wiki](https://cmake.org/Wiki/CMake_Useful_Variables)
### 预定义变量
- `PROJECT_NAME` 设置的项目名称
- `CMAKE_BINARY_DIR` `PROJECT_BINARY_DIR` `<project_name>_BINARY_DIR` 项目编译目录
- `CMAKE_SOURCE_DIR` `PROJECT_SOURCE_DIR` `<project_name>_SOURCE_DIR` 项目源代码目录

### 设置变量
- `EXECUTABLE_OUTPUT_PATH` 可执行文件的输出路径
- `LIBRARY_OUTPUT_PATH` 库文件输出路径
- `CMAKE_INSTALL_PREFIX` install路径前缀，如`/usr`
- `CMAKE_C_FLAGS` `CMAKE_CXX_FLAGS` 设置c/c++编译选项

### 相关环境变量
使用`$ENV{HOME}`访问和`set(ENV{HOME} ..)`设置环境变量

- CMAKE_INCLUDE_PATH 为find_file和find_path添加搜索路径
- CMAKE_LIBRARY_PATH 为find_library添加搜索路径


## Tips
- 使用make VERBOSE=1或者VERBOSE=1 make 命令来查看详细的make过程
- 使用make clean清理

