CMake Commands Cheatsheet
========
> 基于 Cmake v3.7 文档

- [完整参考文档][full_doc]
- 命令名称大小写无关，官方用小写。本文用大写表示CMake变量
- 高亮为常用
- 个别很少用到的非跨平台、内部使用和GUI相关命令未列出

## 1. 流程控制类
CMake支持 **if**、**foreach**、**while** 三大类命令，进行分支和循环控制和一些其他流程控制命令。
这些命令包括：
#### 1.1 if类 — `if` `elseif` `else` `endif`
```cmake
if(expression)
  ...
elseif(expression2)
  ...
else()
  ...
endif()
```
- `Automatic evaluation`：由于历史原因，表达式中的变量不需要`${}`引用，直接使用名字。因此，表达式中的参数会被视为变量名，如果想使用字符串常量或`${}`必须加`""`。如果直接使用了`${}`引用变量，会将变量的值作为变量名访问。

    ```cmake
    if(var)      # ${var}
    if(${var})   # ${${var}}
    if("var")    # var
    if("${var}") # ${var}
    ```
- 表达式包含一些常量、变量、逻辑和比较运算、类型判断、存在性判断、文件相关操作等。具体写法请参考[官方文档][if_doc]

#### 1.2 while类 - `while` `endwile`
```cmake
while(condition)
  ...
endwhile()
```
- condition参考if的expression

#### 1.3 foreach类 - `foreach` `endforeach`
```cmake
foreach(loop_var arg1 arg2 ...)
  ...
endforeach(loop_var)

# 还支持以下几种
foreach(loop_var RANGE total)
foreach(loop_var RANGE start stop [step])
foreach(loop_var IN [LISTS [list1 [...]]]
                    [ITEMS [item1 [...]]])
```

#### 1.4 循环控制 - `break` `continue`
#### 1.5 `return`
- 从文件（被include的cmake文件）、目录（子目录中的CMakeLists.txt）或函数中返回

## 2. 函数与宏
可以作为一个命令调用
#### 2.1 创建函数 `function` `endfunction`
```cmake
function(<name> [arg1 [arg2 [arg3 ...]]])
  ...
endfunction(<name>)
```
- 除了使用函数签名种的变量名，函数内也可以使用 `ARGC` `ARGN` `ARGV` `ARG0` `ARG1` `ARG2` ... 等变量访问参数
- `set` 使用 `PARENT_SCOPE` 选项可以使函数对参数的修改在外部可见

#### 2.2 创建宏 `marco` `endmacro`
```cmake
macro(<name> [arg1 [arg2 [arg3 ...]]])
  ...
endmacro(<name>)
```
- 用法类似function，但是宏的参数会被替换为字符串，而不是以变量形式存在，修改无效

#### 2.3 函数/宏关键词参数解析 `cmake_parse_arguments` 
函数和宏可以使用关键词参数

```cmake
my_install(TARGETS foo bar DESTINATION bin OPTIONAL blub)
# 含义类似 my_install(TARGETS=foo;bar DESTINATION=bin OPTIONAL=blub)
```

## 3. 变量控制类
- ==`set`== 设置变量值，包括普通变量、缓存变量和环境变量
    - 环境变量要用 `set(ENV{<var>} <value>...) `
- `unset` 删除变量
- `list` 列表相关操作
- `string` 字符串相关操作
- `math` 数学表达式运算
- `separate_arguments` 将命令行参数转化为列表
- `variable_watch` 监控变量的变更并执行命令

## 4. 项目信息与控制类
- ==`cmake_minimum_required`== 设置 CMake 最低版本要求
- ==`project`== 设置项目名称、版本、语言等基本信息
    - 相关变量：
        - `PROJECT_SOURCE_DIR` `<PROJECT-NAME>_SOURCE_DIR`        
        - `PROJECT_BINARY_DIR` `<PROJECT-NAME>_BINARY_DIR`
        - `PROJECT_VERSION` `<PROJECT-NAME>_VERSION`等version相关变量
- `enable_language` 启用语言
- `include_regular_expression` 设置依赖检查时使用的正则表达式

#### property相关
- 通用方法: 
    - `define_property` 定义属性
    - ==`get_property`== 获取属性
    - ==`set_property`== 设置属性
- shortcuts:
    - `get_cmake_property`
    - `get_directory_property`
    - `get_source_file_property`
    - `get_target_property`
    - `get_test_property`
    - `set_directory_properties`
    - `set_source_files_properties`
    - `set_target_properties`
    - `set_tests_properties`

## 5. 文件相关类
#### 5.1 文件查找
- `aux_source_directory` 查找文件夹内所有源文件
    - 增加文件需要重新运行cmake
    - 注意用在target里不要引入多个带main函数的文件
- `find_file` 查找文件的完整路径
- `find_library` 查找库的完整路径
- `find_path` 查找包含文件的文件夹
- `find_program` 查找可执行文件的完整路径

#### 5.2 文件操纵
- `file` 文件操作命令
- `configure_file` 复制文件和内容修改
- `get_filename_component` 获取文件名的某个部分

## 6. 模块管理类
- `include` 载入并执行外部的cmake文件或模块
    - 可以使用`CMAKE_MODULE_PATH`设置自定义模块的路径
    
- ==`add_subdirectory`== 添加子目录/模块
    - 目录中带有CMakeLists.txt，可视作子模块（但不需要一定能独立cmake）

- ==`find_package`==： 导入外部项目的配置；配置外部项目
    - 可以使用`CMAKE_MODULE_PATH`设置自定义模块的路径
    - CMake 在模块路径中查找`Find<package>.cmake`文件并执行
    - 相关变量：`<package>_FOUND`
    - 如果设置`CONFIG`参数，这用于配置外部模块
    - 具体帮助需查看模块文档

## 7. 信息查找类
- `cmake_host_system_information` 获取 host system 信息
- `site_name` 获取计算机名称

## 8. build过程控制类
- ==`add_compile_options`== 增加C和C++的编译器选项
    - 可以使用变量`CMAKE_C_FLAGS`或`CMAKE_CXX_FLAGS`分别设置
        - 相关属性：`COMPILE_OPTIONS`
- `target_compile_options` 同上，但只限于单个target
- `target_compile_features` 增加单个target编译时的编译器特性
    - 特性必须在 `CMAKE_CXX_COMPILE_FEATURES`或`CMAKE_C_COMPILE_FEATURES`中存在
    - 如果该特性需要额外的编译器选项，会自动添加
- ==`install`== 项目安装(make install)时的规则配置
    - install的主要目的是把文件拷贝到系统的对应目录中
    - install中还可以指定安装时运行的cmake脚本文件(.cmake)或指令
    - 文件包括target、脚本、普通文件、目录
    - install可以有多条
- `add_custom_command` 在生成的构建系统中增加一个自定义的build rule


#### 预处理
- `add_definitions` 增加 preprocessor definitions
    - 相关属性：`COMPILE_DEFINITIONS` 
- `target_compile_definitions` 同上，但只限于单个target 
- `remove_definitions` 删除 preprocessor definitions

#### include
- ==`include_directories`== 增加项目include搜索路径
    - 相关变量：`INCLUDE_DIRECTORIES`
    - 默认增加到列表末尾，也可使用`CMAKE_INCLUDE_DIRECTORIES_BEFORE`变量控制增加的位置
- `target_include_directories` 同上，但只限于单个target 

#### link
- `link_directories` 设置linker查找链接库的搜索路径
- `link_libraries` 为所有target链接库
- ==`target_link_libraries`== 为单个target链接库


## 9. target控制类
- ==`add_executable`== 增加一个可执行文件类型的target
    - test是保留名称，不能作为可执行文件名称
    - 源代码包括需要生成.o文件并连接的所有cpp文件
- ==`add_library`== 增加一个library类型的target
    - 处于跨平台考虑，库名称（尤其是动态链接库）建议不要加后缀名
    - 可以用`ldd`(linux)或`otool -D`(Mac OS)查看target的动态链接库
- `add_custom_target` 增加一个无产物输出、总是被执行的target
- `target_sources` 向target中添加文件
- `export` 暴露一个target，允许外部项目导入
`- add_dependencies` 为target添加依赖关系

## 10. 测试相关
- `enable_testing` 启用测试
- `add_test` 增加一个CTest的test
- `create_test_sourcelist` 增加一个test driver 和 source list

## 11. 其他
- `cmake_policy` CMake Policy管理
- `execute_process` 执行shell命令
- `load_cache` 从某个项目的CMake缓存中读取值
- `mark_as_advanced` 将缓存的变量设为advanced，只在高级选项中展示
- ==`message`== 输出控制台信息
- `option` 增加一个可供用户选择的选项
- `try_compile` Try building some code.
- `try_run` Try compiling and then running some code.


[full_doc]: https://cmake.org/cmake/help/v3.7/manual/cmake-commands.7.html
[if_doc]: https://cmake.org/cmake/help/v3.7/command/if.html


