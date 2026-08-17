# 🚀 ROS Flutter GUI App — Install ကနေ Run ထိ Step-by-Step Guide

> **Project**: `ROS_Flutter_Gui_App` — ROS 2 robot GUI (Flutter frontend + C++ backend)
>
> **Path**: `--/ROS_Flutter_Gui_App/`

---

## Phase 1: System Dependencies Install

### 1.1 — ROS 2 Install

- [ ] ROS 2 (Humble / Jazzy) install ထားပြီးဖြစ်ရမည်
- [ ] ROS 2 environment source လုပ်ပါ
  ```bash
  source /opt/ros/humble/setup.bash
  ```
  > 💡 `.bashrc` ထဲ ထည့်ထားရင် terminal ဖွင့်တိုင်း auto source ဖြစ်ပါမယ်
  > ```bash
  > echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
  > ```

### 1.2 — Backend System Packages

- [ ] Backend build ဖို့ system library တွေ install ပါ
  ```bash
  sudo apt-get update
  sudo apt-get install -y \
    libsdl2-dev \
    libsdl2-image-dev \
    protobuf-compiler \
    libc-ares-dev \
    cmake \
    build-essential \
    clang \
    ninja-build \
    libgtk-3-dev \
    mesa-utils
  ```

### 1.3 — Flutter SDK Install

- [ ] Flutter SDK install ပါ (snap **မသုံးပါနဲ့** — LD_PRELOAD conflict ရှိနိုင်ပါတယ်)

  **နည်း (1) — Manual install (recommended):**
  ```bash
  cd ~
  git clone https://github.com/flutter/flutter.git -b stable
  ```
  PATH ထဲ ထည့်ပါ:
  ```bash
  echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  ```

  **နည်း (2) — Tarball download:**
  ```bash
  cd ~
  wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.29.3-stable.tar.xz
  tar xf flutter_linux_3.29.3-stable.tar.xz
  echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  ```

- [ ] Flutter install စစ်ပါ
  ```bash
  flutter doctor
  ```
  > ⚠️ `Dart SDK >= 3.7.0` လိုပါတယ် (`pubspec.yaml` requirement)

### 1.4 — Protobuf Dart Plugin

- [ ] `protoc-gen-dart` plugin install ပါ
  ```bash
  dart pub global activate protoc_plugin
  ```
- [ ] PATH ထဲ ထည့်ပါ (မထည့်ရသေးရင်)
  ```bash
  echo 'export PATH="$PATH:$HOME/.pub-cache/bin"' >> ~/.bashrc
  source ~/.bashrc
  ```
- [ ] Install ဖြစ်မဖြစ် စစ်ပါ
  ```bash
  which protoc-gen-dart
  # output: /home/<user>/.pub-cache/bin/protoc-gen-dart ဆိုရင် OK
  ```

---

## Phase 2: Source Code ရယူခြင်း

- [ ] Repo clone ပါ (ရပြီးသားဆိုရင် ဒီ step ကျော်ပါ)
  ```bash
  cd ~/Desktop/robot_sim/src/rom2109/
  git clone https://github.com/chengyangkj/ROS_Flutter_Gui_App.git
  ```

---

## Phase 3: Build

### Option A — One-Shot Build (အလွယ်ဆုံး ✅)

`build.sh` က protobuf generate → backend CMake build → flutter build web အကုန်လုပ်ပေးပါတယ်

- [ ] Build script run ပါ
  ```bash
  cd ~/Desktop/robot_sim/src/rom2109/ROS_Flutter_Gui_App
  ./build.sh
  ./build_cn.sh
  ```
  > ✅ Success ဆိုရင် ဒီ output တွေ မြင်ရပါမယ်:
  > ```
  > [build] Dart protobuf -> app/lib/protobuf
  > [build] Flutter web done (app/build/web)
  > [build] backend done (backend/build)
  > ```

### Option B — သီးသန့်စီ Build

**B1. Protobuf generate (`.proto` → Dart files):**
- [ ] Protobuf Dart code generate ပါ
  ```bash
  cd ~/Desktop/robot_sim/src/rom2109/ROS_Flutter_Gui_App
  mkdir -p app/lib/protobuf
  protoc --experimental_allow_proto3_optional \
    -Iprotocol \
    --dart_out=app/lib/protobuf \
    protocol/*.proto
  ```

**B2. Backend build:**
- [ ] Backend ကို CMake နဲ့ build ပါ
  ```bash
  cd ~/Desktop/robot_sim/src/rom2109/ROS_Flutter_Gui_App/backend
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=build/install
  cmake --build build --parallel
  cmake --install build
  ```

**B3. Flutter frontend build:**
- [ ] Flutter dependencies ရယူပါ
  ```bash
  cd ~/Desktop/robot_sim/src/rom2109/ROS_Flutter_Gui_App/app
  flutter pub get
  ```
- [ ] Localization generate ပါ
  ```bash
  flutter gen-l10n
  ```
- [ ] Web build ထုတ်ပါ (production)
  ```bash
  flutter build web
  ```

---

## Phase 4: Run

### 4.1 — Backend Start

- [ ] ROS 2 source ထားကြောင်း သေချာပါစေ
  ```bash
  source /opt/ros/humble/setup.bash
  ```
- [ ] Navigation stack (nav2) run ထားပါ (robot control လိုရင်)
- [ ] Backend server start ပါ
  ```bash
  cd ~/Desktop/robot_sim/src/rom2109/ROS_Flutter_Gui_App/backend/build/install/bin
  ./start.sh
  ```
  > ✅ Port **8080** မှာ HTTP server listen လုပ်ပါမယ်

### 4.2 — Frontend Open

**နည်း (1) — Browser ကနေ ဖွင့်ပါ (build.sh သုံးခဲ့ရင်):**
- [ ] Browser မှာ ဖွင့်ပါ
  ```
  http://127.0.0.1:8080
  ```
  > Backend က web dist ကို auto serve လုပ်ပေးပါတယ်

**နည်း (2) — Flutter dev mode (hot reload ပါ):**
- [ ] Development mode run ပါ
  ```bash
  cd ~/Desktop/robot_sim/src/rom2109/ROS_Flutter_Gui_App/app
  flutter run -d chrome
  ```
  > 💡 `-d linux` = Linux desktop app, `-d chrome` = Chrome browser

**နည်း (3) — Static serve (build/web ကို သီးသန့် serve):**
- [ ] Python HTTP server နဲ့ serve ပါ
  ```bash
  cd ~/Desktop/robot_sim/src/rom2109/ROS_Flutter_Gui_App/app/build/web
  python3 -m http.server 8000
  ```
  ပြီးရင် browser မှာ `http://127.0.0.1:8000` ဖွင့်ပါ

### 4.3 — App ထဲ ချိတ်ဆက်ခြင်း

- [ ] Connect screen ပေါ်လာရင်:
  - **IP** → Backend run နေတဲ့ machine IP (local ဆိုရင် `127.0.0.1`)
  - **Port** → `8080`
- [ ] **Connect** နှိပ်ပါ
- [ ] Map, Teleop, Navigation, Camera, SSH တို့ သုံးနိုင်ပါပြီ ✅

---

## 🐛 Troubleshooting

| ပြဿနာ | ဖြေရှင်းချက် |
|---|---|
| `protoc-gen-dart not found` | `dart pub global activate protoc_plugin` run ပြီး `~/.pub-cache/bin` PATH ထဲ ထည့်ပါ |
| `Flutter not initialized` | `flutter doctor` run ပြီး flutter SDK ကို initialize လုပ်ပါ |
| `LD_PRELOAD` snap error | Flutter ကို snap နဲ့ install ထားရင် ဖြုတ်ပြီး manual install နဲ့ ပြန်ထည့်ပါ |
| Backend connect မရ | ROS 2 source လုပ်ထားလား စစ်ပါ + port 8080 block ဖြစ်နေလား စစ်ပါ |
| `.proto` ပြောင်းပြီး error | `./build.sh` ပြန် run ပါ (protobuf regenerate လုပ်ပေးပါမယ်) |
| `cmake` error | system packages အကုန် install ပြီးပြီလား Phase 1.2 ပြန်စစ်ပါ |
| Web camera မပေါ် | CORS policy ကြောင့် ဖြစ်နိုင်၊ Settings ထဲ image topic စစ်ပါ |
| Dart SDK version error | `flutter upgrade` run ပြီး Dart ≥ 3.7.0 ဖြစ်အောင် update ပါ |
