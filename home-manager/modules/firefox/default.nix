{
  pkgs,
  config,
  home,
  ...
}:
let
  ffconfig = ''
    // Allow Firefox to install and run studies
    // Разрешить Firefox устанавливать и проводить исследования
    user_pref("app.shield.optoutstudies.enabled", true);

    // Do not allow Firefox to make prezonalized extension recommendations
    // Не разрешать Firefox давать персональные рекомендации расширений
    user_pref("browser.discovery.enabled", false);

    // Enable Backspace to go back to a previous web page
    // Включить переход на предыдущую страницу по нажатию Backspace
    user_pref("browser.backspace_action", 0);

    // Add "View Image Info" to the image context menu
    // Добавить в контекстное меню изображений пункт "Информация об изображении"
    user_pref("browser.menu.showViewImageInfo", true);

    // Turn off recommended extensions
    // Отключить рекомендации расширений
    user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);

    // Enable wallpaper for new tab page
    // Включить фоновый рисунок для новой вкладки
    user_pref("browser.newtabpage.activity-stream.newtabWallpapers.enabled", true);

    // Show Highlights in 4 rows
    // Отобразить избранные сайты в 4 столбца
    user_pref("browser.newtabpage.activity-stream.section.highlights.rows", 4);

    // Hide sponsored top sites in Firefox Home screen
    // Скрыть топ сайтов спонсоров на домашней странице Firefox
    user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

    // Show Top Sites in 4 rows
    // Отобразить топ сайтов в 4 столбца
    user_pref("browser.newtabpage.activity-stream.topSitesRows", 4);

    // Turn on "Firefox Experiments" settings page
    // Включить раздел "Эксперименты Firefox" в настройках
    user_pref("browser.preferences.experimental", true);

    // Hide "More from Mozilla" from Settings
    // Скрыть "Больше от Mozilla" в Настройках
    user_pref("browser.preferences.moreFromMozilla", false);

    // Show button to reset private browsing sessions in toolbar (120)
    // Отображать кнопку для сброса приватных сеансов на панели иснтрументов (120)
    // user_pref("browser.privatebrowsing.resetPBM.enable", true);

    // Show search suggestions in Private Windows
    // Отображать поисковые предложения в Приватных вкладках
    user_pref("browser.search.suggest.enabled.private", true);

    // Set number of saved closed tabs on 20
    // Установить количество закрытых вкладок для восстановления на 20
    user_pref("browser.sessionstore.max_tabs_undo", 20);

    // Set homepage and new windows on https://ya.ru
    // Установить домашнюю страницу страницу и новые окна на https://ya.ru
    //user_pref("browser.startup.homepage", "https://ya.ru");

    // Restore previous session
    // Восстанавливать предыдущую сессию
    user_pref("browser.startup.page", 3);

    // The last tab does not close the browser
    // Не закрывать браузер при закрытии последней вкладки
    user_pref("browser.tabs.closeWindowWithLastTab", false);

    // Show Title Bar
    // Отобразить заголовок
    user_pref("browser.tabs.inTitlebar", 1);

    // Show Drag Space
    // Отобразить место для перетаскивания окна
    user_pref("browser.tabs.extraDragSpace", true);

    // Open new tabs on the right
    // Открывать новые вкладки справа
    user_pref("browser.tabs.insertRelatedAfterCurrent", false);

    // Open bookmarks in a background tab
    // Открывать закладки в фоновых вкладках
    user_pref("browser.tabs.loadBookmarksInBackground", true);

    // Enable tab previews 
    // Включить предпросмотр вкладок
    user_pref("browser.tabs.cardPreview.enabled", true);


    // Do not warn when attempt to close multiple tabs
    // Не предупреждать при закрытии нескольких вкладок
    user_pref("browser.tabs.warnOnClose", false);

    // Show tab previews in the Windows taskbar
    // Отображать эскизы вкладок на панели задач
    user_pref("browser.taskbar.previews.enable", true);

    // Set the "Bookmarks menu" as default bookmark folder
    // Установить "Меню закладок" как папку по умолчанию для закладок
    user_pref("browser.toolbars.bookmarks.2h2020", true);
    user_pref("browser.bookmarks.defaultLocation", "menu________");

    // Never offer to translate page
    // Никогда не предлагать перевод страницы
    user_pref("browser.translations.automaticallyPopup", false);

    // Decode copied URLs, containing UTF8 symbols
    // Декодировать URL, содержащий UTF8-символы
    user_pref("browser.urlbar.decodeURLsOnCopy", true);

    // Do not send search term via ISP's DNS server
    // Не отправлять поисковый запрос через DNS-сервер провайдера
    user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0);

    // Enable Quick Actions
    // Включить Quick Actions
    user_pref("browser.urlbar.quickactions.enabled", true);
    user_pref("browser.urlbar.shortcuts.quickactions", true);

    // Automatically click on banners that request permission to use cookies on the sites
    // Автоматически нажимать на баннеры, которые запрашивают разрешение на использование файлов куки на сайтах
    user_pref("cookiebanners.cookieInjector.enabled", true);
    user_pref("cookiebanners.bannerClicking.enabled", true);
    user_pref("cookiebanners.service.mode", 2);
    user_pref("cookiebanners.service.mode.privateBrowsing", 2);

    // Turn on lazy loading for images
    // Включить отложенную загрузку для изображений
    user_pref("dom.dom.image-lazy-loading.enabled", true);

    // Do not allow websites to perform privacy-preserving as measurement
    // Не разрешать веб-сайтам проводить измерение рекламы с сохранением приватности
    user_pref("dom.private-attribution.submission.enabled", false);

    // Turn on Pocket
    // Включить Pocket
    user_pref("extensions.pocket.enabled", true);

    // Highlight all occurrences of the phrase when searching
    // Подстветить всех вхождения фразы в текст при поиске
    user_pref("findbar.highlightAll", true);

    // Use smooth scrolling
    // Использовать плавную прокрутку
    user_pref("general.autoScroll", false);

    // Do not select when double-clicking text the space following the text
    // Не выделять при выделении слова двойным нажатием идущий за ним пробел
    user_pref("layout.word_select.eat_space_to_next_word", false);

    // Turn on MMB for openning link a new tab
    // Включить открытие ссылки в новой вкладки по нажатию на СКМ
    user_pref("middlemouse.openNewWindow", true);

    // Enable Encrypted Client Hello (ECH)
    // Включить Encrypted Client Hello (ECH)
    user_pref("network.dns.echconfig.enabled", true);
    user_pref("network.dns.use_https_rr_as_altsvc", true);

    // Turn on HTTP3
    // Включить HTTP3
    user_pref("network.http.http3.enable", true);

    // https://wiki.mozilla.org/Trusted_Recursive_Resolver
    // Make DoH the browser's first choice but use regular DNS as a fallback
    // DoH используется по умолчанию, а стандартный DNS-сервер используется в качестве резервного
    user_pref("network.trr.mode", 2);
    // The URI for DoH server
    // URI для DoH-сервера 
    user_pref("network.trr.uri", "https://mozilla.cloudflare-dns.com/dns-query");
    // Set the IP address of the host name used in "network.trr.uri", to bypass using the system native resolver for it
    // Установить IP-адрес, используемого в "network.trr.uri", чтобы исключить использование системного резольвера
    user_pref("network.trr.bootstrapAddress", "1.1.1.1");
    user_pref("network.trr.excluded-domains", "local,pterox.website");

    // Enable image PDF editing feature
    // Включить возможность добавлять изображения в режиме редактирования PDF-файлов
    user_pref("pdfjs.enableStampEditor", 2);

    // Send websites a "Do Not Track" signal always
    // Передавать сайтам сигнал "Не отслеживать" всегда
    user_pref("privacy.donottrackheader.enabled", true);

    // Tell websites not to sell or share my data
    // Сообщать веб-сайтам, чтобы они не продавали и не разглашали мои данные
    user_pref("privacy.globalprivacycontrol.enabled", true);
    user_pref("privacy.globalprivacycontrol.was_ever_enabled", true);

    // Strips known tracking query parameters from URLs
    // Удалять известные отслеживающие параметры запроса из URL-адресов 
    user_pref("privacy.query_stripping.enabled.pbmode", true);

    // Turn on UI customizations sync
    // Включить синхронизацию кастомизации интерфейса
    user_pref("services.sync.prefs.sync.browser.uiCustomization.state", true);

    // Enable urlbar built-in calculator
    // Включить встроенный в адресную строку калькулятор
    user_pref("suggest.calculator", true);

    // Show matches next on top of scrollbar
    // Показывать совпадения поверх полосы прокрутки
    user_pref("ui.textHighlightBackground", "Fireprick");

    // Turn on Video Acceleration API (VA-API). For desktop environment based on Wayland
    // Включить Video Acceleration API (VA-API). Для окружений на базе Wayland
    // user_pref("widget.wayland-dmabuf-vaapi.enabled", true);

    // Turn on FFmpegDataDecoder. For display server based on Wayland
    // Включить FFmpegDataDecoder. Для окружений на базе Wayland
    // user_pref("widget.wayland-dmabuf-webgl.enabled", true);

    user_pref("intl.locale.requested", "ru,en-US");
  '';
  firefox-package = pkgs.firefox.override {
    nativeMessagingHosts = [
      pkgs.gnome-browser-connector
      (pkgs.callPackage ./firefox-profile-switcher-connector.nix { })
    ];
  };
in
{
  home.file = {
    "firefoxprofileswitcher/config.json" = {
      target = "${config.xdg.configHome}/firefoxprofileswitcher/config.json";
      text = builtins.toJSON { browser_binary = "${firefox-package}/bin/firefox"; };
    };
  };

  programs.firefox = {
    enable = true;
    package = firefox-package;
    # policies = {
    #   HardwareAcceleration = true;
    #   DefaultDownloadDirectory = "${config.xdg.userDirs.download}";
    #   DNSOverHTTPS = {
    #     Enabled = true;
    #     Locked = true;
    #     Fallback = false;
    #     ExcludedDomains = [
    #       "pterox.website"
    #       "local"
    #     ];
    #   };
    #   TranslateEnabled = false;
    #   SearchBar = "unified";
    #   RequestedLocales = [
    #     "ru"
    #     "en-US"
    #   ];
    #   PostQuantumKeyAgreementEnabled = true;
    #   ExtensionUpdate = true;
    #   EnableTrackingProtection = {
    #     Value = true;
    #     Cryptomining = true;
    #     Fingerprinting = true;
    #   };
    #   DisplayBookmarksToolbar = "newtab";
    # };
    profiles.egor = {
      name = "Личный";
      id = 0;
      extraConfig = ffconfig;
      extensions = with config.nur.repos.rycee.firefox-addons; [
        privacy-badger
        betterttv
        bitwarden
        onetab
        ublock-origin
        tampermonkey
        # smartproxy
        foxyproxy-standard
        tree-style-tab
        profile-switcher
        immersive-translate
      ];
      bookmarks = [
        {
          name = "YouTube";
          url = "https://www.youtube.com";
        }
        {
          name = "YouTube Music";
          url = "https://music.youtube.com";
        }
        {
          name = "Twitch";
          url = "https://twitch.tv";
        }
        {
          name = "YandexGPT";
          url = "https://a.ya.ru";
        }
        {
          name = "Yandex Music";
          url = "https://music.yandex.ru/home";
        }
      ];
    };
    profiles.eteron = {
      name = "Eteron";
      id = 1;
      extraConfig = ffconfig;
      extensions = with config.nur.repos.rycee.firefox-addons; [
        privacy-badger
        bitwarden
        onetab
        ublock-origin
        tampermonkey
        foxyproxy-standard
        tree-style-tab
        profile-switcher
        immersive-translate
      ];
      containersForce = true;
      containers = {
        private = {
          id = 0;
          name = "Private";
          icon = "fingerprint";
          color = "toolbar";
        };
        eteron = {
          id = 1;
          name = "Eteron";
          icon = "briefcase";
          color = "blue";
        };
      };
      bookmarks = [
        {
          name = "Yandex Cloud";
          url = "https://console.yandex.cloud";
        }
        {
          name = "GitLab";
          url = "https://gitlab.eteron.ru";
        }
        {
          name = "Grafana";
          url = "https://grafana.eteron.ru";
        }
        {
          name = "Prometheus";
          url = "https://prometheus.eteron.ru/alerts";
        }
        {
          name = "Zabbix";
          url = "https://zabbix.eteron.ru";
        }
        {
          name = "Graylog";
          url = "https://logs.eteron.ru";
        }
        {
          name = "Bareos";
          url = "https://backups.eteron.ru";
        }
        {
          name = "BigBird";
          url = "https://app.bigbird.ru";
        }
        {
          name = "BigBird2";
          url = "https://app2.bigbird.ru";
        }
        {
          name = "BigBird Demo";
          url = "https://demo.bigbird.ru";
        }
        {
          name = "BigBird2 Demo";
          url = "https://demo2.bigbird.ru";
        }
        {
          name = "YandexGPT";
          url = "https://a.ya.ru";
        }
      ];
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}
