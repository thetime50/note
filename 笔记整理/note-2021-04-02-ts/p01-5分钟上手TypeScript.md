## p01-5分钟上手TypeScript
https://www.tslang.cn/docs/home.html

[online code](https://www.typescriptlang.org/play)

[code->](https://github.com/thetime50/ts-practice/blob/main/p01-start/p01-start.ts)

## p04-JavaScript迁移
[code->](https://github.com/thetime50/ts-practice/tree/main/p04-jstrans)

### 书写配置文件
```json
// tsconfig.json
{
    "compilerOptions": {
        "outDir": "./built",
        "allowJs": true,
        "target": "es5"
    },
    "include": [
        "./src/**/*"
    ]
}
```
1. 读取所有可识别的src目录下的文件（通过include）。
2. 接受JavaScript做为输入（通过allowJs）。
3. 生成的所有文件放在built目录下（通过outDir）。
4. 将JavaScript代码降级到低版本比如ECMAScript 5（通过target）。

- noImplicitReturns 选项 会防止你忘记在函数末尾返回值。
- noFallthroughCasesInSwitch 选项 会防止在switch代码块里的两个case之间忘记添加break语句。
- 设置allowUnreachableCode和allowUnusedLabels选项 发现那些执行不到的代码和标签。

[ts结合gulp](https://www.tslang.cn/docs/handbook/gulp.html)

Webpack:  
ts-loader + source-map-loader
```cmd
npm install ts-loader source-map-loader
```

将 .js文件重命名为.ts文件。 如果你使用了JSX，则重命名为 .tsx文件。

**要注意的是ts-loader必须在其它处理.js文件的加载器之前运行**
```js
// webpack.config.js
module.exports = {
    entry: "./src/index.ts",
    output: {
        filename: "./dist/bundle.js",
    },

    // Enable sourcemaps for debugging webpack's output.
    devtool: "source-map",

    resolve: {
        // Add '.ts' and '.tsx' as resolvable extensions.
        extensions: ["", ".webpack.js", ".web.js", ".ts", ".tsx", ".js"]
    },

    module: {
        loaders: [
            // All files with a '.ts' or '.tsx' extension will be handled by 'ts-loader'.
            { test: /\.tsx?$/, loader: "ts-loader" }
        ],

        preLoaders: [
            // All output '.js' files will have any sourcemaps re-processed by 'source-map-loader'.
            { test: /\.js$/, loader: "source-map-loader" }
        ]
    },

    // Other options...
};
```
- 如果不想在发生错误的时候，TypeScript还会被编译成JavaScript，你可以使用*noEmitOnError*选项。
- 如果你不想让TypeScript将没有明确指定的类型默默地推断为 any类型，可以在修改文件之前启用*noImplicitAny* 选项

### 模块导入
如果有类似Cannot find name 'require'.和Cannot find name 'define'.的错误。 是使用导入模块引起的，需要申明 TypeScript它们是存在的：

```ts
// For Node/CommonJS
declare function require(path: string): any; //??
```
或
```ts
// For RequireJS/AMD
declare function define(...args: any[]): any;
```
最好是避免使用这些调用而改用TypeScript的导入语法。


Node/CommonJS的模块导入代码：
```js
var foo = require("foo");

foo.doStuff();
```
RequireJS/AMD的模块导入代码：
```js
define(["foo"], function(foo) {
    foo.doStuff();
})
```
可以转为下面的TypeScript代码：
```ts
import foo = require("foo");

foo.doStuff();
```

### 获取声明文件

```cmd
npm install -s @types/lodash
```
// lodash//todo
如果没有使用commonjs模块模块选项，要将*moduleResolution*选项设置为node


https://stackoverflow.com/questions/45668980/typescript-uncaught-referenceerror-exports-is-not-defined

https://stackoverflow.com/questions/43042889/typescript-referenceerror-exports-is-not-defined

browserify -e app.js -o bundle.js

估计还是要用webpack

