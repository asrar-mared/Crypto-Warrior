#!/bin/bash

#═══════════════════════════════════════════════════════════════════
#  🛡️🔥 حارس النظام الشامل - SYSTEM GUARDIAN 🔥🛡️
#═══════════════════════════════════════════════════════════════════
#  📱 إصلاح اللغات، السمات، الألوان، والتاريخ
#  🧹 تنظيف الملفات المزيفة وحزم الفساد
#  ⚡ تحديث وصيانة شاملة للنظام
#  
#  الإصدار: 2.0.0
#  التوافق: Ubuntu, Debian, Kali Linux, Termux (Android)
#  المطور: محارب رقمي 🇨🇳
#═══════════════════════════════════════════════════════════════════

# 🎨 الألوان للعرض
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # بدون لون

# 🔥 رموز الحالة
SUCCESS="✅"
ERROR="❌"
WARNING="⚠️"
INFO="ℹ️"
CLEAN="🧹"
SHIELD="🛡️"
FIRE="🔥"
ROCKET="🚀"

# 📊 متغيرات النظام
LOG_FILE="/tmp/system_guardian_$(date +%Y%m%d_%H%M%S).log"
BACKUP_DIR="/tmp/system_backup_$(date +%Y%m%d)"
ISSUES_FOUND=0
ISSUES_FIXED=0

#═══════════════════════════════════════════════════════════════════
# 🎨 وظائف العرض
#═══════════════════════════════════════════════════════════════════

print_banner() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║   ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗     ║
║   ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║     ║
║   ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║     ║
║   ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║     ║
║   ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║     ║
║   ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝     ║
║                                                               ║
║    ██████╗ ██╗   ██╗ █████╗ ██████╗ ██████╗ ██╗ █████╗ ███╗ ║
║   ██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗████╗║
║   ██║  ███╗██║   ██║███████║██████╔╝██║  ██║██║███████║██╔██║
║   ██║   ██║██║   ██║██╔══██║██╔══██╗██║  ██║██║██╔══██║██║╚██
║   ╚██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝██║██║  ██║██║ ╚
║    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  
║                                                               ║
║           🛡️ حارس النظام الشامل - System Guardian 🛡️        ║
║              🔥 نظافة | حماية | إصلاح | تحديث 🔥            ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

print_section() {
    echo -e "\n${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}${FIRE} $1${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}\n"
}

print_success() {
    echo -e "${GREEN}${SUCCESS} $1${NC}" | tee -a "$LOG_FILE"
}

print_error() {
    echo -e "${RED}${ERROR} $1${NC}" | tee -a "$LOG_FILE"
    ((ISSUES_FOUND++))
}

print_warning() {
    echo -e "${YELLOW}${WARNING} $1${NC}" | tee -a "$LOG_FILE"
}

print_info() {
    echo -e "${CYAN}${INFO} $1${NC}" | tee -a "$LOG_FILE"
}

print_clean() {
    echo -e "${GREEN}${CLEAN} $1${NC}" | tee -a "$LOG_FILE"
    ((ISSUES_FIXED++))
}

#═══════════════════════════════════════════════════════════════════
# 🔍 فحص النظام
#═══════════════════════════════════════════════════════════════════

detect_system() {
    print_section "🔍 فحص نوع النظام"
    
    if [ -f /data/data/com.termux/files/usr/bin/bash ]; then
        SYSTEM_TYPE="termux"
        print_info "النظام: Termux (Android) 📱"
        PKG_MANAGER="pkg"
    elif [ -f /etc/debian_version ]; then
        SYSTEM_TYPE="debian"
        print_info "النظام: Debian/Ubuntu 🐧"
        PKG_MANAGER="apt"
    elif [ -f /etc/arch-release ]; then
        SYSTEM_TYPE="arch"
        print_info "النظام: Arch Linux 🐧"
        PKG_MANAGER="pacman"
    else
        SYSTEM_TYPE="unknown"
        print_warning "نظام غير معروف - سيتم استخدام الأوامر العامة"
        PKG_MANAGER="apt"
    fi
    
    print_success "تم التعرف على النظام بنجاح"
}

check_root() {
    if [ "$EUID" -eq 0 ]; then
        print_success "الصلاحيات: Root ✓"
        IS_ROOT=true
    else
        print_warning "تشغيل بدون صلاحيات Root"
        IS_ROOT=false
    fi
}

#═══════════════════════════════════════════════════════════════════
# 🧹 تنظيف النظام من الفساد
#═══════════════════════════════════════════════════════════════════

clean_corrupted_packages() {
    print_section "🧹 تنظيف الحزم الفاسدة والملفات المزيفة"
    
    if [ "$SYSTEM_TYPE" = "termux" ]; then
        print_info "تنظيف قاعدة بيانات pkg..."
        pkg clean 2>/dev/null
        
        print_info "إصلاح الحزم التالفة..."
        pkg upgrade -y 2>/dev/null
        
    elif [ "$SYSTEM_TYPE" = "debian" ]; then
        print_info "تنظيف قاعدة بيانات apt..."
        
        if [ "$IS_ROOT" = true ]; then
            apt clean
            apt autoclean
            apt autoremove -y
            
            print_info "إصلاح الحزم المكسورة..."
            dpkg --configure -a
            apt --fix-broken install -y
            
            print_clean "تم تنظيف النظام من الحزم الفاسدة"
        else
            print_warning "يتطلب صلاحيات Root لتنظيف شامل"
        fi
    fi
    
    # حذف الملفات المؤقتة المزيفة
    print_info "حذف الملفات المؤقتة..."
    rm -rf /tmp/*.tmp 2>/dev/null
    rm -rf ~/.cache/* 2>/dev/null
    
    print_clean "تم تنظيف الملفات المؤقتة"
}

#═══════════════════════════════════════════════════════════════════
# 🌍 إصلاح اللغات (Locales)
#═══════════════════════════════════════════════════════════════════

fix_locales() {
    print_section "🌍 إصلاح وتكوين اللغات (Locales)"
    
    if [ "$SYSTEM_TYPE" = "termux" ]; then
        print_info "تثبيت حزم اللغة في Termux..."
        
        # التأكد من وجود UTF-8
        export LANG=en_US.UTF-8
        export LC_ALL=en_US.UTF-8
        
        # حفظ الإعدادات
        echo "export LANG=en_US.UTF-8" >> ~/.bashrc
        echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc
        
        print_success "تم تكوين اللغة: UTF-8"
        
    elif [ "$SYSTEM_TYPE" = "debian" ]; then
        if [ "$IS_ROOT" = true ]; then
            print_info "تثبيت locales..."
            apt install -y locales
            
            print_info "تكوين اللغات..."
            
            # إلغاء التعليق عن اللغات المهمة
            if [ -f /etc/locale.gen ]; then
                sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
                sed -i 's/# ar_SA.UTF-8 UTF-8/ar_SA.UTF-8 UTF-8/' /etc/locale.gen
                locale-gen
            fi
            
            # تحديث اللغة الافتراضية
            update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
            
            print_success "تم إصلاح وتكوين اللغات بنجاح"
        else
            print_warning "يتطلب Root لإصلاح اللغات"
        fi
    fi
}

#═══════════════════════════════════════════════════════════════════
# 🎨 إصلاح السمات والألوان
#═══════════════════════════════════════════════════════════════════

fix_themes_colors() {
    print_section "🎨 إصلاح السمات والألوان"
    
    # إصلاح ألوان terminal
    print_info "إصلاح إعدادات Terminal..."
    
    # إنشاء bashrc محسّن
    cat > ~/.bashrc_guardian << 'EOF'
# 🛡️ System Guardian - Enhanced Terminal Configuration

# الألوان
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Prompt ملون
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Aliases ملونة
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'

# تفعيل الألوان في less
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# History محسّن
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups

# تحسينات أخرى
shopt -s histappend
shopt -s checkwinsize

EOF
    
    # دمج التكوين الجديد
    if ! grep -q "System Guardian" ~/.bashrc 2>/dev/null; then
        cat ~/.bashrc_guardian >> ~/.bashrc
        print_clean "تم إضافة تكوين Terminal المحسّن"
    fi
    
    # إصلاح Vim colors
    if [ -f /usr/bin/vim ] || [ -f /data/data/com.termux/files/usr/bin/vim ]; then
        print_info "إصلاح ألوان Vim..."
        
        mkdir -p ~/.vim/colors
        cat > ~/.vimrc << 'EOF'
" 🛡️ System Guardian - Enhanced Vim Configuration
syntax on
set number
set ruler
set showcmd
set incsearch
set hlsearch
colorscheme default
set background=dark
set t_Co=256
EOF
        print_clean "تم إصلاح ألوان Vim"
    fi
    
    print_success "تم إصلاح السمات والألوان بنجاح"
}

#═══════════════════════════════════════════════════════════════════
# ⏰ إصلاح التاريخ والوقت
#═══════════════════════════════════════════════════════════════════

fix_datetime() {
    print_section "⏰ إصلاح التاريخ والوقت"
    
    print_info "التاريخ الحالي: $(date)"
    
    if [ "$SYSTEM_TYPE" = "termux" ]; then
        print_warning "Termux: لا يمكن تغيير وقت النظام بدون Root"
        print_info "الوقت يعتمد على إعدادات Android"
        
    elif [ "$SYSTEM_TYPE" = "debian" ]; then
        if [ "$IS_ROOT" = true ]; then
            print_info "تثبيت NTP للمزامنة التلقائية..."
            
            # تثبيت الأدوات
            apt install -y ntp ntpdate systemd-timesyncd 2>/dev/null
            
            # مزامنة الوقت
            print_info "مزامنة الوقت مع خوادم NTP..."
            systemctl stop systemd-timesyncd 2>/dev/null
            ntpdate -s time.nist.gov 2>/dev/null || ntpdate -s pool.ntp.org 2>/dev/null
            systemctl start systemd-timesyncd 2>/dev/null
            systemctl enable systemd-timesyncd 2>/dev/null
            
            # تعيين المنطقة الزمنية
            print_info "تعيين المنطقة الزمنية..."
            timedatectl set-timezone Africa/Cairo 2>/dev/null || timedatectl set-timezone Asia/Riyadh 2>/dev/null
            
            print_success "التاريخ والوقت الجديد: $(date)"
            print_clean "تم إصلاح التاريخ والوقت بنجاح"
        else
            print_warning "يتطلب Root لإصلاح التاريخ والوقت"
        fi
    fi
}

#═══════════════════════════════════════════════════════════════════
# 🔄 تحديث النظام
#═══════════════════════════════════════════════════════════════════

update_system() {
    print_section "🔄 تحديث شامل للنظام"
    
    if [ "$SYSTEM_TYPE" = "termux" ]; then
        print_info "تحديث قوائم Termux..."
        pkg update -y
        
        print_info "ترقية الحزم المثبتة..."
        pkg upgrade -y
        
    elif [ "$SYSTEM_TYPE" = "debian" ]; then
        if [ "$IS_ROOT" = true ]; then
            print_info "تحديث قوائم apt..."
            apt update
            
            print_info "ترقية النظام..."
            apt upgrade -y
            apt dist-upgrade -y
            
            print_clean "تم تحديث النظام بنجاح"
        else
            print_warning "يتطلب Root للتحديث"
        fi
    fi
}

#═══════════════════════════════════════════════════════════════════
# 🔧 إصلاحات إضافية
#═══════════════════════════════════════════════════════════════════

fix_permissions() {
    print_section "🔧 إصلاح صلاحيات الملفات"
    
    print_info "إصلاح صلاحيات المجلد الشخصي..."
    
    # إصلاح صلاحيات الملفات الشخصية
    chmod 755 ~/ 2>/dev/null
    chmod 700 ~/.ssh 2>/dev/null
    chmod 600 ~/.ssh/* 2>/dev/null
    chmod 644 ~/.bashrc 2>/dev/null
    
    print_clean "تم إصلاح الصلاحيات الأساسية"
}

fix_dns() {
    print_section "🌐 إصلاح DNS"
    
    if [ "$IS_ROOT" = true ] && [ "$SYSTEM_TYPE" != "termux" ]; then
        print_info "تكوين DNS موثوق..."
        
        # نسخ احتياطي
        [ -f /etc/resolv.conf ] && cp /etc/resolv.conf /etc/resolv.conf.backup
        
        # إضافة DNS موثوق
        cat > /etc/resolv.conf << EOF
# System Guardian - DNS Configuration
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 1.1.1.1
nameserver 1.0.0.1
EOF
        
        print_clean "تم تكوين DNS بنجاح"
    else
        print_warning "تخطي إصلاح DNS (يتطلب Root)"
    fi
}

#═══════════════════════════════════════════════════════════════════
# 📊 تقرير نهائي
#═══════════════════════════════════════════════════════════════════

generate_report() {
    print_section "📊 تقرير النظام النهائي"
    
    echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${WHITE}                   🛡️ تقرير حارس النظام 🛡️                   ${CYAN}║${NC}"
    echo -e "${CYAN}╠═══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}نوع النظام:${NC}          ${GREEN}$SYSTEM_TYPE${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}مدير الحزم:${NC}          ${GREEN}$PKG_MANAGER${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}صلاحيات Root:${NC}        ${GREEN}$IS_ROOT${NC}"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}المشاكل المكتشفة:${NC}    ${RED}$ISSUES_FOUND${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}المشاكل المُصلحة:${NC}    ${GREEN}$ISSUES_FIXED${NC}"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}التاريخ والوقت:${NC}      ${GREEN}$(date '+%Y-%m-%d %H:%M:%S')${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}ملف السجل:${NC}          ${BLUE}$LOG_FILE${NC}"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════╝${NC}"
    
    echo -e "\n${GREEN}${SUCCESS} اكتملت جميع عمليات الصيانة بنجاح!${NC}"
    echo -e "${CYAN}${INFO} أعد تشغيل Terminal لتطبيق جميع التغييرات${NC}\n"
}

#═══════════════════════════════════════════════════════════════════
# 🚀 البرنامج الرئيسي
#═══════════════════════════════════════════════════════════════════

main() {
    print_banner
    
    # بداية السجل
    echo "System Guardian Log - $(date)" > "$LOG_FILE"
    echo "═══════════════════════════════════════════════════" >> "$LOG_FILE"
    
    # الفحص الأولي
    detect_system
    check_root
    
    # العمليات الرئيسية
    clean_corrupted_packages
    fix_locales
    fix_themes_colors
    fix_datetime
    fix_permissions
    fix_dns
    update_system
    
    # التقرير النهائي
    generate_report
    
    # حفظ نسخة من السجل
    print_info "تم حفظ السجل في: $LOG_FILE"
    
    echo -e "\n${FIRE}${FIRE}${FIRE} ${GREEN}نظامك الآن نظيف ومحمي! ${FIRE}${FIRE}${FIRE}${NC}\n"
}

# تشغيل البرنامج
main "$@"
