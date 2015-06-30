#include <stdbool.h>

bool cgm_dbus_connect(void);
void cgm_dbus_disconnect(void);
bool cgm_create(const char *cg, int *existed);
bool cgm_autoremove(const char *cg);
bool cgm_enter(const char *cg);
bool cgm_chown(const char *cg, uid_t uid, gid_t gid);
char **cgm_list_controllers(void);
