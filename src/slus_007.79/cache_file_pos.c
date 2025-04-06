#include "common.h"
#include "thunder.h"

extern FileInfo D_8004A4BC[FILES_COUNT];

extern void *find_file(FileInfo *files, uint32_t offset);

void cache_file_pos(void)
{
	uint32_t i;

	for (i = 0; i < sizeof(D_8004A4BC) / sizeof(D_8004A4BC[0]); i++) {
		find_file(&D_8004A4BC[i], 1);
	}
}
