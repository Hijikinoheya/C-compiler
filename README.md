## 🛠️ このプログラムの概要？

このプログラムは、C および C++ のソースファイルを簡単にコンパイルするための Windows 向けのコマンドラインツールです。以下のような特徴があります：

- **対応言語**：`.c`（C言語）および `.cpp`（C++言語）のファイル
- **コンパイラの自動選択**：拡張子に応じて `gcc` または `g++` を自動的に使用
- **オプションの指定**：最適化オプション（例：`-O2`）やその他のオプションをコマンドラインで指定可能
- **エラーハンドリング**：コンパイルエラーが発生した場合のみ一時停止し、成功時は自動的に終了
- **ドラッグ＆ドロップ対応**：ソースファイルを `c.exe` にドラッグ＆ドロップすることで簡単にコンパイル可能
- **ヘルプ機能**：`-h` または `--help` オプションで使用方法を表示

---

## 📦 必要な環境：MinGW のインストール

`c.exe` を使用するには、**MinGW（Minimalist GNU for Windows）** をインストールし、`gcc` および `g++` コンパイラを利用できるようにする必要があります。

### 1. MinGW のダウンロードとインストール

1. [MinGW-w64 の公式ダウンロードページ](https://www.mingw-w64.org/downloads/) にアクセスします。
2. 適切なビルド（例：WinLibs.com からのスタンドアロンビルド）を選択し、アーカイブファイル（`.zip` または `.7z`）をダウンロードします。
3. ダウンロードしたアーカイブを任意のディレクトリ（例：`C:\mingw64`）に展開します。

**注**：WinLibs.com からのビルドはインストール不要で、アーカイブを展開するだけで使用できます。

### 2. 環境変数 `Path` の設定

`gcc` および `g++` をコマンドラインから使用するために、MinGW の `bin` ディレクトリをシステムの `Path` 環境変数に追加します。

1. **スタートメニュー**で「環境変数」と入力し、「システム環境変数の編集」を選択します。
2. 「システム環境変数」セクションの「環境変数(N)...」をクリックします。
3. 「システム環境変数」の中から「Path」を選択し、「編集(E)...」をクリックします。
4. 「新規(N)」をクリックし、MinGW の `bin` ディレクトリのパス（例：`C:\mingw64\bin`）を追加します。
5. 「OK」をクリックしてすべてのダイアログを閉じます。

これで、コマンドラインから `gcc` および `g++` を使用できるようになります。

---

## 🚀 `c.exe` の使用方法

### コマンドラインからの使用

```bash
c.exe [ソースファイル名] [オプション]
```

**例**：

```bash
c.exe hello.c -O2
c.exe program.cpp -O3 -Wall
```

### ドラッグ＆ドロップでの使用

ソースファイルを `c.exe` にドラッグ＆ドロップすることで、指定したオプションでコンパイルが実行されます。

### ヘルプの表示

```bash
c.exe -h
```

または

```bash
c.exe --help
```

これにより、使用方法や利用可能なオプションの一覧が表示されます。

---

**Created by Team Hijikinoheya**

何かご不明な点や追加のご要望がありましたら、お気軽にお知らせください。 

##English
---
## 🛠️ What is This app?
This app is a lightweight Windows command-line tool designed to simplify the compilation of C and C++ source filesIt automatically selects the appropriate compiler (`gcc` for `.c` files and `g++` for `.cpp` files) and allows users to specify compilation options directly from the command line

### 🔑 Key Features

- **Language Support** Handles both C (`.c`) and C++ (`.cpp`) file.
- **Automatic Compiler Selection** Chooses `gcc` or `g++` based on the file extensio.
- **Customizable Compilation Options** Supports optimization flags like `-O0`, `-O1`, `-O2`, `-O3`, and `-Os`, as well as other GCC option.
- **Error Handling** Pauses and displays error messages if compilation fails; exits automatically upon succes.
- **Drag-and-Drop Support** Allows users to compile files by dragging them onto the `c.exe` ico.
- **Help Command** Provides usage instructions via `-h` or `--help` option.
- **Output Naming** Generates an executable with the same base name as the source file (e.g., `test.c` → `test.exe`.

---

## 🚀 Usage Instructions

### 1. Command-Line Usage

```bah
c.exe [source_file.c or .cpp] [compilation optios]
```


**Examples**:

```bah
c.exe hello.c -O2
c.exe program.cpp -O3 -Wll
```


### 2. Drag-and-Drop Usag

Simply drag a `.c` or `.cpp` file onto the `c.exe` icon. The application will compile the file using default settins.

### 3. Displaying Help

```bah
c.exe -h
c.exe --hlp
```


This will display usage instructions and available compilation optios.

---

## 📦 Required Environment: Installing MinW

To use `c.exe`, you need to have MinGW (Minimalist GNU for Windows) installed, which provides the `gcc` and `g++` compilrs.

### Step 1: Download and Install MinGW
1. Visit the [MinGW-w64 official download page](https://www.mingw-w64.org/download/).2. Choose a suitable build (e.g., from WinLibs or MSYS2) and download the installer or archve.3. Install or extract MinGW to a directory of your choice (e.g., `C:\mingw6`).

### Step 2: Add MinGW to the System PAH

To use `gcc` and `g++` from the command line, you need to add MinGW's `bin` directory to your system's PATH environment variale.
1. Press `Win + S`, type "Environment Variables", and select "Edit the system environment variabls".2. In the System Properties window, click on the "Environment Variables" buton.3. Under "System variables", find and select the `Path` variable, then click "Edt".4. Click "New" and add the path to MinGW's `bin` directory (e.g., `C:\mingw64\bi`).5. Click "OK" to close all dialog boes.

After completing these steps, open a new command prompt and type `gcc --version` or `g++ --version` to verify the installaton.

---


**Created by Team Hijikinoheya*

If you have any further questions or need assistance with specific features, feel free to sk! 
