#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "stack-ada-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "stack.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "stack.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "stack.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "stack.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "stack.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "stack.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "stack-ada.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "stack-ada.a", "libstack-ada.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "stack-ada-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "stack-ada-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
