#include "common.h"
#include "thunder.h"
#include "psyq/LIBCD.H"
#include "psyq/LIBGTE.H"
#include "psyq/LIBGPU.H"

typedef struct DECENV {
	uint32_t *vlcbuf[2];
	int32_t vlcid;
	uint16_t *imgbuf[2];
	int32_t imgid;
	RECT rect[2];
	int32_t rectid;
	RECT slice;
	int32_t isdone;
	int32_t is24bit;
} DECENV;

extern const char S_time_out_in_decoding[];

INCLUDE_ASM("asm/slus_007.79/nonmatchings/movie", play_movie);

INCLUDE_ASM("asm/slus_007.79/nonmatchings/movie", strSetDefDecEnv);

INCLUDE_ASM("asm/slus_007.79/nonmatchings/movie", strInit);

INCLUDE_ASM("asm/slus_007.79/nonmatchings/movie", strCallback);

INCLUDE_ASM("asm/slus_007.79/nonmatchings/movie", strNextVlc);

INCLUDE_ASM("asm/slus_007.79/nonmatchings/movie", strNext);

void strSync(DECENV *dec, int mode)
{
	volatile uint32_t cnt = WAIT_TIME;

	while (dec->isdone == 0)
	{
		if (--cnt == 0)
		{
			printf(&S_time_out_in_decoding);

			dec->isdone = 1;
			dec->rectid = dec->rectid ? 0 : 1;
			dec->slice.x = dec->rect[dec->rectid].x;
			dec->slice.y = dec->rect[dec->rectid].y;
		}
	}

	dec->isdone = 0;
}

void strKickCD(CdlLOC *loc)
{
	u_char param;

	param = CdlModeSpeed;

	loop:
	while (CdControl(CdlSetloc, (u_char *)loc, 0) == 0);
	while (CdControl(CdlSetmode, &param, 0) == 0);

	VSync(3);

	if (CdRead2(CdlModeStream|CdlModeSpeed|CdlModeRT) == 0)
	{
		goto loop;
	}
}
