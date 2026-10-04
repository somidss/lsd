# ══ Windows Server 2019 · Railway Edition ══
FROM dockur/windows:latest

# ── نسخه و زبان ویندوز ──
ENV VERSION="2019"
ENV LANGUAGE="English"
ENV REGION="en-US"
ENV KEYBOARD="en-US"
ENV TZ="Asia/Tehran"

# ── منابع ماشین مجازی ──
ENV RAM_SIZE="4G"
ENV CPU_CORES="2"
ENV DISK_SIZE="64G"

# ── Railway چیپ KVM ندارد → شبیه‌سازی نرم‌افزاری (اجباری!) ──
ENV KVM="N"

# ── حساب کاربری ویندوز (رمز را حتماً عوض کن!) ──
ENV USERNAME="Administrator"
ENV PASSWORD="Omid@2024"

# ── اسکریپت تنظیمات که یک‌بار بعد از نصب ویندوز اجرا می‌شود ──
COPY run/once/setup.ps1 /run/once/setup.ps1

EXPOSE 8006 3389
VOLUME /storage
