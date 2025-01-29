{
  programs.firefox.profiles.egor.containersForce = true;
  programs.firefox.profiles.egor.containers = {
    private = {
      id = 1;
      name = "Личное";
      icon = "fingerprint";
      color = "toolbar";
    };
    proxy = {
      id = 2;
      name = "Запрет";
      icon = "fence";
      color = "turquoise";
    };
    banking = {
      id = 3;
      name = "Банкинг";
      icon = "dollar";
      color = "green";
    };
    shopping = {
      id = 4;
      name = "Покупки";
      icon = "cart";
      color = "pink";
    };
    cit = {
      id = 1001;
      name = "СОГАУ ЦИТ";
      icon = "briefcase";
      color = "red";
    };
    eteron = {
      id = 1002;
      name = "Eteron";
      icon = "briefcase";
      color = "purple";
    };
  };
}
