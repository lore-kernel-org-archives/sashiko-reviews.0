Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118559;
	b=SPuOUs+0CQ8v/ks59BarsIPfWIxxidFz+aKAX7Q1IAKRCfgLiV2x9fy4V3390IlStuQG
	 Ay8NJlLZkbkQsHW1QYrOhUl1tSJ7kJL799W0aBRkohMFPOsr2mjxYr6eJwFGj9A5uaVH8
	 ut2bT1ZrqFBR1vpV1AoB5BNXQ/lTdRcxZLiNy92inGfLc1dDYMHv2uKkGb7e+2gT9T3Cp
	 qjlpw4aqIiBiUdFvYIC1x9ZlD0vb16WzIXnlxselB//AwZVFJiQoJYgqcxIcksxc7AY5k
	 hEyO3Z4R8Ot867/k5D0QU3GMMEEjbWNanEf9u6G7866YJ3bhPuNrfZdW0cVHoYpEJ2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=mo5vPLF6zP/RraszuGpsMvag6Tig15KjbqgR0fa8MIk=;
	b=SJH+T5G6OukOIJsSWKVXIswb8DYPiA/dklcMx9GoNipPFDDbl10AdHLTOW/SvjXte9AO
	 N/ngh+PYbmxSx+gLaYJ3/PtHGXffkmy9QB/vtGsRlGt3LWdCHCc+dWqIeHUwU1JSQESNi
	 JiyYUMIuaO8iOr5TT3E4ezlCsmpwEp/aGcQkqWNe5A92OZ3ne6JGzghJc57KqvGhjU0PR
	 7ajtv8lyUje1E3iJpsAYl3/Vosua1IVYYCu+Nld/+Dld+Un/K+XqJ0DB+RfWmAbtvu+cz
	 n3BoXJgOxS0zxZYNxHXN6WHRUqDoJZY/Mq/yOAK5aieERI4akesiW3sZBueYZ+jR+Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXTOm+PE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B98E606A327
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 16:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B98E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXTOm+PE
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c322cbc998so683942137.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 09:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118558; cv=none;
        d=google.com; s=arc-20260327;
        b=Bu/pU9znlqgPoO7WlavzLF3hxUF/hqXAoPZsOQP28cKUQIlQdoX/ZzAmUceTKTq5T7
         Bc3bouNE9LZ12m8yuKu+v/x+6fWWRKsYBwR8MjrfKSlYt6Zb0WMa/hz3CjsWBg99usnt
         FtG9dc7otriG3X4VdEMl8QsUaaPjLzda/c/8N4kFkF0GxR+n+WYqnS28+ZUUHA2OCZrr
         OafMGxfnSxQcqYZztiE1lSmUpWJthpKblCtEnwDMykNaeu1+0jgcZIER5FktL35i0boK
         Jgnh5JKLqWIZYh9yfd5EfuBHaLovWFk8wRKEfuS1I4uFVv69IVRS8obNBGSLCHZ4F3AO
         JoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mo5vPLF6zP/RraszuGpsMvag6Tig15KjbqgR0fa8MIk=;
        fh=IKSByBvevL+dkugA/P1WirWrrZG6Vz4cE9M3k7KrT8Y=;
        b=AFbCgp8gq/NXXtMDWcZYN1Qp/7SAqAlFRu36qO37a0fHYvjQ4rnI0EtRLqaOBNHb8P
         Zx6bdFw3WswIbtE55cXdvpso8Vyn9S30qI3w6lSG3Cz6EsCwojjPwLrfK/Mlb1wpR/J8
         QnuL8IR8UTVugNPw6OI5+qQCqN2bsKK4Vwr8j0ECj+sw6xL7ORLyuRpoXrfkeOqCb6kZ
         Ah6ydkevlhEHxFCF0jKwJesitUgxDcj8U91Yt8aBjkKn9tqec4QWvmqOpyA4VD3wq/Wa
         fbPJbeYOUUHgQQGDcvgO1ccOUhJZ4/Pl1VbNZf556BSG7MRwQGW7393LYjuHdke10dXn
         7H0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118558; x=1793723358; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mo5vPLF6zP/RraszuGpsMvag6Tig15KjbqgR0fa8MIk=;
        b=cXTOm+PEYn9RVQi8+tCiGYqGBQi2ILFZPH/nviajPjhSwA1yhVytguOpWuBE+1ERVh
         2GOeL1OMKyJvJRG806b8TxdeA8xpmlCvzXWwvTmT5MTja3X4xiWnHiig4sdGNd9ch4/0
         kpeptQS9cnqHJKphyzhZK4zIuQY4mUYbBaK7q/fSdpY7W2MeJAc2cxSav2ZCwOhsA2ws
         2OXZO0Iz2oQ2vxCEO79/gzU5MwxMylrKkK00QS1AWaBWSK7a3rkCCVykQ8DtB+sFs01h
         bKELL1a5/MV6GvXUPCKpLA7KSD4i3nh3MNOltnWwzDtCjCyDrfG6tP0LpJ9eFDJGsADo
         +oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118558; x=1793723358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo5vPLF6zP/RraszuGpsMvag6Tig15KjbqgR0fa8MIk=;
        b=grw8lZMtsrw2sYn5HpcU4wBHf3uSnX7SlRz7ww91LMDHcR1TV5WUT0t7f6TTPD/FG7
         pdgM2NGVjygKTKrSQFXg4ig0ow7/Rr2W0BX0/iXJByKP7GVmnPkTl+XrJP1w2y7zVPCu
         RDy2oGILH1YLbb6ItjXCkC0Ye9oh9pLBN4C6V/yx89Q/4P6ZBfKHkist8Jl8kofyP70Y
         NkD+aJ5rC3v+0DfnyIlrQSv1MAZ+DAnHFK9Qz7kqptT5q+v61gZn4MDefwYJz2y4O7d0
         b+zC8Lb9d5z210c+PDNjtJBM08hJK7SAus32s2LPdiCKpf122u2GAj5FFKJqbilWy3wi
         BLKQ==
X-Gm-Message-State: AFq9FYLLcXO7WJ/vlF3X71OjKnQp5QI7Zb9CyW2inuhT/DBMd/xjccx3
	HnG3YOt1+sQ/Mga++934T7vgmRgX3dbwpAnbE6k3+WwLn4HcZwiWu7WgGinlukWlAhuohCUByzi
	/ZnaAH+28nAoWrGvX81JsgOqqbtHCPBPKbEikqyE=
X-Gm-Gg: AYBFou0K/+EV1Ts/o3GA+EIak+lGYCvqftCfZ0glF5/WO97P0Vh+PAFC1r3ztOqPyDW
	7yfPuLFpS+CitTqnzMMC7tAr4MwYF49ROJ+H1aByLg8rNsWx8YDnUQV9ds43+IGvmNooRpEuR0r
	WcqMzHKcBw6DBA5rTMsTztRyJkhKQ0rR/q7z365Mpp8tiQyT//6A/VuoxB/cZ3vBfSYwhkYGOwi
	xNyxiJhfD3vOIOVzNFPSt4ZCgrsaxRzIgJv7t9wWWmWwNnni+cx1fnXHCtG8+KLsLa57r0fI5jW
	Eg5rRf5yyFHepuEOlhWbefkSSERD+LdPqVhNSeuT5pj37C/4uA4WLi/rCbBR60+QZkeSZGUOtMR
	ffGCPi84f5UOEqcGEqPLFimsdAsdU5mRwVG8aIJc3Gof59It3QVx+kUagch46JMy+WWDM66NvtF
	7uT51S9BAt3h9TC8q6JhZMkJ6lvgcFsyTG8YYix/dlrPon5ywm4MFbZzu8Ew7apAon4+T7JeVOV
	DMGB8EiOa7ZtM6QWD7BjOO6ffXn1g==
X-Received: by 2002:a05:6102:689b:b0:7cc:21cd:9b68 with SMTP id
 ada2fe7eead31-7ce5cd17515mr3954626137.15.1793118558471; Tue, 27 Oct 2026
 09:29:18 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
 <sashiko-outbox-180707@kernel.org> <auDNkfOAqm0QJK6v@lizhi-Precision-Tower-5810>
In-Reply-To: <auDNkfOAqm0QJK6v@lizhi-Precision-Tower-5810>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 10:29:06 -0600
X-Gm-Features: AclHuK9WqKBRujgE8EoIZ0GDGunOU9AvFKNfnMoPkDelbyaNHY9DJ0rWGQKrblU
Message-ID: <CADvTj4qtg+xeWJTKk4nS681fk+-N0pbYuZXVb6rLZtapizfYXw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: dw: synchronize completion callbacks
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, 
	vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:13=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Oct 21, 2026 at 09:31:42PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] dmaengine: dw: tasklet_kill() in dwc_synchronize() drops share=
d tasklet runs
> > --
> >
> > commit 095fd30b59df2969f093996b0e32af6cace0812f
> > Author: James Hilliard <james.hilliard1@gmail.com>
> >
> > dmaengine: dw: synchronize completion callbacks
> >
> > This commit implements the device_synchronize callback for the DesignWa=
re DMA
> > controller by calling tasklet_kill() on the shared controller tasklet t=
o wait
> > for in-flight completion callbacks.
> >
> > > diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> > > index dd75f97a33b3d..eb3f5ce471a22 100644
> > > --- a/drivers/dma/dw/core.c
> > > +++ b/drivers/dma/dw/core.c
> > > @@ -965,6 +965,14 @@ static int dwc_terminate_all(struct dma_chan *ch=
an)
> > >     return 0;
> > >  }
> > >
> > > +static void dwc_synchronize(struct dma_chan *chan)
> > > +{
> > > +   struct dw_dma *dw =3D to_dw_dma(chan->device);
> > > +
> > > +   /* Callbacks run outside the channel lock in the controller taskl=
et. */
> > > +   tasklet_kill(&dw->tasklet);
> > > +}
> >
> > [Severity: High]
> > Can calling tasklet_kill() on the shared dw->tasklet here drop a concur=
rent
> > tasklet_schedule() from another active channel and leave controller
> > interrupts permanently masked?
>
> Is it true?

Yes, for v1. tasklet_kill() holds TASKLET_STATE_SCHED while waiting for
the running tasklet. After that tasklet re-enables the controller
interrupts, another channel can interrupt and mask them again. Its
tasklet_schedule() sees the bit already set and does not queue another
run. tasklet_kill() then clears the bit, leaving the interrupts masked
without a queued tasklet to re-enable them.

This is already addressed in v3, patch 4/4 [0], which uses
tasklet_disable()/tasklet_enable(). That waits for an executing tasklet
without consuming scheduling requests from other channels.

Termination removes the target channel=E2=80=99s descriptors from the share=
d
lists; synchronization then waits for any callbacks the tasklet already
owns. Clients must still exclude new submissions on that channel until
synchronization finishes.

[0] https://lore.kernel.org/r/20261023-submit-dw-dma-synchronize-v1-v3-4-c6=
2bf048f5ce@gmail.com/

>
> Frank
>
> >
> > In kernel/softirq.c, tasklet_action_common() clears TASKLET_STATE_SCHED
> > before invoking dw_dma_tasklet(). When dwc_synchronize() calls
> > tasklet_kill(), it acquires TASKLET_STATE_SCHED via wait_on_bit_lock(),
> > waits for TASKLET_STATE_RUN to clear in tasklet_unlock_wait(), and then
> > clears TASKLET_STATE_SCHED:
> >
> > kernel/softirq.c:tasklet_kill() {
> >     ...
> >     wait_on_bit_lock(&t->state, TASKLET_STATE_SCHED, TASK_UNINTERRUPTIB=
LE);
> >
> >     tasklet_unlock_wait(t);
> >     tasklet_clear_sched(t);
> > }
> >
> > While tasklet_kill() holds TASKLET_STATE_SCHED, dw_dma_tasklet() can fi=
nish
> > and re-enable MASK.XFER and MASK.ERROR across all channels before clear=
ing
> > TASKLET_STATE_RUN:
> >
> > drivers/dma/dw/core.c:dw_dma_tasklet() {
> >     ...
> >     /* Re-enable interrupts */
> >     channel_set_bit(dw, MASK.XFER, dw->all_chan_mask);
> >     channel_set_bit(dw, MASK.ERROR, dw->all_chan_mask);
> > }
> >
> > If dw_dma_interrupt() fires for another active channel while tasklet_ki=
ll()
> > still holds TASKLET_STATE_SCHED, the interrupt handler masks XFER, BLOC=
K,
> > and ERROR across all channels and calls tasklet_schedule(&dw->tasklet):
> >
> > drivers/dma/dw/core.c:dw_dma_interrupt() {
> >     ...
> >     channel_clear_bit(dw, MASK.XFER, dw->all_chan_mask);
> >     channel_clear_bit(dw, MASK.BLOCK, dw->all_chan_mask);
> >     channel_clear_bit(dw, MASK.ERROR, dw->all_chan_mask);
> >     ...
> >     tasklet_schedule(&dw->tasklet);
> > }
> >
> > Because TASKLET_STATE_SCHED is already set by tasklet_kill(),
> > tasklet_schedule() sees test_and_set_bit(TASKLET_STATE_SCHED, &t->state=
)
> > return true and skips __tasklet_schedule(). When tasklet_kill() then ca=
lls
> > tasklet_clear_sched(), the scheduled run is lost without dw->tasklet ev=
er
> > being queued, leaving MASK.XFER and MASK.ERROR disabled for the entire
> > controller.
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-submit=
-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com?part=3D1
