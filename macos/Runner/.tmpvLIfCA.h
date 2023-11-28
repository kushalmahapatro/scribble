#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
typedef struct _Dart_Handle* Dart_Handle;

typedef struct DartCObject DartCObject;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_LogEntry {
  int64_t time_millis;
  int32_t level;
  struct wire_uint_8_list *tag;
  struct wire_uint_8_list *user_id;
  struct wire_uint_8_list *user;
  struct wire_uint_8_list *msg;
} wire_LogEntry;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_dummy(int64_t port_, struct wire_LogEntry *a);

void wire_rust_set_up(int64_t port_);

void wire_create_log_stream(int64_t port_);

void wire_publish_message(int64_t port_, struct wire_uint_8_list *message);

void wire_print_hello(int64_t port_);

void wire_add(int64_t port_, int32_t a, int32_t b);

struct wire_LogEntry *new_box_autoadd_log_entry_0(void);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_dummy);
    dummy_var ^= ((int64_t) (void*) wire_rust_set_up);
    dummy_var ^= ((int64_t) (void*) wire_create_log_stream);
    dummy_var ^= ((int64_t) (void*) wire_publish_message);
    dummy_var ^= ((int64_t) (void*) wire_print_hello);
    dummy_var ^= ((int64_t) (void*) wire_add);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_log_entry_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
