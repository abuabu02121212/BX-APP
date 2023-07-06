# flutter_comm

Flutter  comm framework

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1. 使用Android studio创建好项目 
2. 安装https://pub.dev/packages/get_cli
3. 使用命令后创建模块
     get create page:splash
     get create page:home

项目结构：
   lib下面的app模块是本app业务相关的模块
   lib 下面除了app之外的其他模块，是所有项目的通用框架模块
        http http网络请求
        skin 换肤相关
        util 工具类模块
        widget 自定义UI组建模块
        navigator 导航相关模块
   依赖关系，lib下的app模块依赖依赖其他模块，但是其他模块不能依赖app模块
   以后其他模块会作为通用项目框架，以后搭建项目只需要删除app模块，其他模块稍微配置修改下就行了。
