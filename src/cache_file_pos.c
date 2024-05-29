#include "common.h"
#include "thunder.h"

extern FileInfo D_8004A4BC[FILES_COUNT];

void *func_80021490(void*, uint32_t);

void cache_file_pos(void)
{
	uint32_t i;

	for (i = 0; i < sizeof(D_8004A4BC) / sizeof(D_8004A4BC[0]); i++) {
		func_80021490(&D_8004A4BC[i], 1);
	}
}
