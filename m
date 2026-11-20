Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795153361;
	b=rzXFehBHrB3IYBAoJY6KmCItnTAmIQdJ8yHqg+LXFoxgPK23uOkXAK3nnYv+OtXjpi7j
	 TuFJdPaEgXdLTPBZXtTD7i7W84WBu4V3uLV/HJN11B1TIclhTK9+TGalTsIn/9qFwV6FS
	 W9hKXXMpY/hzou9RQn5yPnywvfFfyqN9Quxu+xN0h8WHW5O8BRA84/fre9yFjX4pATSKF
	 98C39mlkSq+qQCFcSgUCTezjtRFAq6AinqAsIxM/7Bkz/bMDkVLagLKg0qLR874A8dVmb
	 A1HVxk3cec8SJd1gmSgPXhbmzSy7i++WLkD8f8tFUTyiXyxKERL5l0YRT1JbGNetGOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9qjgGXuBHBLvMHrjXiMEeKTNvTNqRqMclyrqR/WfruA=;
	b=B1m51tjY25ByDQ86ppbvyPUCORbfH0klSnmalrfLq1BXHEiujd9Jn8bVRjklMRu/5gZm
	 HmTjeWZCclFVYUIvasllalxZ7IzRQt50HQf/oWWNAYoUImAIGrcRqWz83vIXofky5Lz9b
	 GR3HMQ/rq1QWyJ2Ptop4uEuQ8/wkcvRxyYILcAPoS9eAsuMS6FU4M4cWZz0uBSWMsc8uk
	 uwwIJIUiWl7pZjWc/hFxOJFp+Yq39Lcd2JP2g/cGbchTMHyFEcBNZj7eWB0xXp2hekEJP
	 zul7/DNvmGVf08a0Qj+SyUIRHWiVunNQJibctFqIaj2FZBb/u5v2fV0q5Hb/TvIVDuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ5i6YIW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC53606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ5i6YIW
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso369984a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 21:42:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795153361; cv=none;
        d=google.com; s=arc-20260327;
        b=hM8E0+h9R9q/dLj6IOo/l96U+fcbI4HHWfLKC5nKap8lWPpJ5nlFPzvDgw9n/R1O5I
         iAqPeKggT7i1eugSisztlqZhBcRJQBv0o0ch/dahA7U9vmgttvjRWJA/fUE7WH36OG8z
         oivCjMjB+IAVqWYCp3e5u1CIZlyhb3Vwd2m0vzqHIbyG45N0at/X52RHvO9KJFxhVw7u
         7LD+w1d3mZKVfR58v7+jTPQCZ0ZWBVzVM8m8r8MThP3O+3peZ/8pMPUH5B6KJedChbCf
         PnrbAUPqPSlP9PCM1Nv3j1+Bu/B39asUhlR8JmqXUKg9lkXIY6XsLdJyImkxcmWJA7Qs
         3OJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9qjgGXuBHBLvMHrjXiMEeKTNvTNqRqMclyrqR/WfruA=;
        fh=IKSByBvevL+dkugA/P1WirWrrZG6Vz4cE9M3k7KrT8Y=;
        b=ITPbfSbSXVXnT1oXC4/KK47px8w7LHdEHZLZuhBrnIYoUFQDlkSdd3qTmDluIXdsi4
         QVGMUrF77EINv/AIGOVPlDGwM6Cc3NOb+fhCJ50vsG1qvd03C4Wg8+qEldgBVBQAMVb+
         RY5mzDXZUT5FlvSaWTtUBxYjL3D3CM5VrZ7QGKPi6WIxv89hk80xMeGkCOuEArIHYJB5
         LRpn2oNen8tZGjUYH8yjXP3iXcTsuZjpNaCB/ZN89BheKlHnA+BVPe6LAOQzX0NXgHPn
         1cv2dmnnHz4Xoq9VWGIVSc1AHE64swzdsI6mTzEbEII1oFa852MXxu7uyfEoNxyQ36rN
         gadQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795153361; x=1795758161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qjgGXuBHBLvMHrjXiMEeKTNvTNqRqMclyrqR/WfruA=;
        b=UQ5i6YIWaNpuoByus8t490Hr+yZtlntUdjq+NN9D+9eUfUI7rt7xnrPgAMOJKFh6cY
         a1CbMTlgMoSzfuESgEJDAVbog+7Co3E+ufJ5XAJ16jy+z4KU2zv2qjzhhebiIxLrGqAz
         hgq1xs3BaFHvyevceY7k90iYWEg11C5hW0OhbP5xN64ss9oodS4P7zZsLSwvKJpymrBC
         IZSKC8Pq+HY1fHBqD9kjcMCN65eBATxAJALGf7bNaBzLjSzIAYyEqCX1bPwOROcgt3PL
         laTIrwj8ltLCRXl2ELUCAgOfCyWxxzWVjZoq4/ZerR7lxyW7+Qif8do2jEY2gWRPS/W2
         MA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153361; x=1795758161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qjgGXuBHBLvMHrjXiMEeKTNvTNqRqMclyrqR/WfruA=;
        b=TDy6K7Vh1JCbB2gzQ2qXMJOSuENZqAoE2VPoYcKFliXvqwMgxlQh4iHGRJH3/f3Q/z
         HIyltp4zCfG90nIMuLXDwMYLHt2u2nBz4/443Ox33RjgiFgojtW/VztZgdIFv90AHy8a
         CFXwmZXgqzdeR8Ft5FKxk1zqnbjbqxCnaW2DTrs38TLaYvB4WlakOhDsXmDIQWN4PImM
         HcMO/ieVh5nIvz0RqQwoGLLLTt47ePwmb/cPB0hclD99OyAN18piNic5NsqOK5ZYH3rJ
         xH1obm23w73ajYd1rA/Dc0ncxCUPWQpNMZ7ew24/7IttWIuyf1TD5yf0pAmVds+crO0S
         ihgg==
X-Gm-Message-State: APuU4Z9RoXPEVnIsGMB8oVHByQcziNhqxMgGFVrYoBO8fbdovxQZwd0D
	9hO2IN688010CC23bGlZtJ0ciPFodtPOSABCZsQTRDc2GE9sXnoKuRYCeZg8v9ubjV7HRnJaiHb
	5rK2cYHah+TETBjxYyFbO+UP77nDyCCgzlg==
X-Gm-Gg: AZFdTZed2o4poYf/EfjC3z/u3oxrhiNHTMIK+EYChkjrKpfVpMjl+990Lsoh8QWpnhf
	55kURMorwKxI+W7elIBQ0iIwEDlahlkD05v392eLqYg+6ysri3gl8tro+BWMQi30qb1Qr4EmrvF
	nNmvgV5O6a11wLF+boy2vPZLqW5o+bwh0EVFOea7aV6SqiUosXZ/EEX4LOwPR5Ecm4HZp+C+cm9
	W2GeBUpjd9goC9uihWRtu89/QY/fzbKnDCwqwBrTXtD/VLvu7PuyFGcTWAIMrHNPnAqkl5efnTB
	mQNqNVmd8xn8lI+zTdC7PL1hzz2Cdwni9aId6zKvJgDOd3QTCKSVnGPDM15zWhggzq+ZGu7xzw4
	GYjkSJT83nMe9JZRbkf7znl+p2YGAx4SPuECTmI61G2bBLwrRguiK6ccckf8r+dcARyKXvNc=
X-Received: by 2002:a17:90b:50:b0:3b0:9e2c:9b5f with SMTP id
 98e67ed59e1d1-3b41c7b6044mr1574916a91.2.1795153360678; Thu, 19 Nov 2026
 21:42:40 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794315350.git.allen.lkml@gmail.com> <717bb0b82658f1dd800f6b1bc06b9cf283f77361.1794315350.git.allen.lkml@gmail.com>
 <sashiko-outbox-207180@kernel.org> <avt4PU04jy8a4e_i@SMW015318>
In-Reply-To: <avt4PU04jy8a4e_i@SMW015318>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 19 Nov 2026 22:42:26 -0700
X-Gm-Features: AclHuK9-2Bsk_aSPveBTWccQ93xL5tYOvp8iXytO_p3NzhyIMiI8TSBO85p9bjE
Message-ID: <CAOMdWS++nM+r8G+YUj-hk48KKvYH23yv2f-4X9C5F6n+KZqJ+w@mail.gmail.com>
Subject: Re: [PATCH v4 02/33] dmaengine: back channel BH helpers with WQ_BH
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, 
	vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Tue, Nov 10, 2026 at 02:15:38PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issues to consider:
> > - [High] dmaengine: dmaengine_kill_bh() returns with bh_work still
> >   queued on re-schedule
> > - [Medium] dmaengine: flush_work() in dmaengine_kill_bh() triggers flus=
h
> >   dependency warn
> > --
> >
> > commit e183b161b65ac0da135cdea21e6916bb3483d703
> > Author: Allen Pais <allen.lkml@gmail.com>
> >
> > dmaengine: back channel BH helpers with WQ_BH
> >
> > This commit replaces the per-channel BH tasklet implementation with a
> > dedicated WQ_BH | WQ_PERCPU workqueue while keeping the dmaengine_*_bh(=
) API
> > unchanged.
> >
> > > diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> > > index f3c1283b161b6..97d8f9667ae5f 100644
> > > --- a/drivers/dma/dmaengine.c
> > > +++ b/drivers/dma/dmaengine.c
> > [ ... ]
> > > @@ -1449,9 +1451,34 @@ static void dmaengine_destroy_unmap_pool(void)
> > [ ... ]
> > > +static void dmaengine_flush_bh_work(struct work_struct *work)
> > > +{
> > > +   if (!work)
> > > +           return;
> > > +
> > > +   flush_work(work);
> > > +}
> > > +
> > > +static void dma_chan_bh_entry(struct work_struct *work)
> > > +{
> > > +   struct dma_chan *chan =3D container_of(work, struct dma_chan, bh_=
work);
> > >     dmaengine_bh_work_fn fn =3D READ_ONCE(chan->bh_work_fn);
> > >
> > >     if (fn)
> > > @@ -1467,7 +1494,7 @@ void dmaengine_init_bh(struct dma_chan *chan, d=
maengine_bh_work_fn fn)
> > [ ... ]
> > > @@ -1487,7 +1513,7 @@ void dmaengine_kill_bh(struct dma_chan *chan)
> > >     if (!chan->bh_work_initialized)
> > >             return;
> > >
> > > -   tasklet_kill(&chan->bh_tasklet);
> > > +   dmaengine_flush_bh_work(&chan->bh_work);
> > >  }
> > >  EXPORT_SYMBOL_GPL(dmaengine_kill_bh);
> >
> > [Severity: High]
> > Can dmaengine_kill_bh() return with chan->bh_work still queued on the
> > workqueue?
> >
> > Unlike tasklet_kill(), which holds TASKLET_STATE_SCHED while waiting fo=
r a
> > running tasklet to finish so concurrent tasklet_schedule() calls cannot
> > re-queue it, process_one_work() clears WORK_STRUCT_PENDING_BIT before
> > invoking dma_chan_bh_entry().  When flush_work() runs while chan->bh_wo=
rk is
> > executing, insert_wq_barrier() places the flush barrier on worker->sche=
duled,
> > ahead of pool->worklist:
> >
>
> Can you check this one?

  I have a fix which I am validating, and will post it in a day.

Thanks,
Allen

>
> Frank
>
> > CPU0                                  CPU1 (bh_worker)
> >                                       process_one_work(&chan->bh_work)
> >                                         set_work_pool_and_clear_pending=
()
> >                                         dma_chan_bh_entry()
> > dmaengine_kill_bh(chan)
> >   flush_work(&chan->bh_work)
> >     insert_wq_barrier()
> >                                           ...
> >                                             dmaengine_schedule_bh(chan)
> >                                               queue_work(..., &chan->bh=
_work)
> >                                         /* dma_chan_bh_entry() returns =
*/
> >                                       process_scheduled_works()
> >                                         /* runs barrier from
> >                                          * worker->scheduled */
> >   /* flush_work() returns */
> > kfree(chan)
> >                                       /* processes pool->worklist */
> >                                       dma_chan_bh_entry()
> >                                         chan->bh_work_fn  <-- use-after=
-free
> >
> > This is a regression when chan->bh_work is re-queued while
> > dma_chan_bh_entry() is running, for example when a BH callback reschedu=
les
> > itself (such as dma_tasklet() in ste_dma40 or mv_chan_slot_cleanup() in
> > mv_xor) or when a driver calls dmaengine_kill_bh() before tearing down =
its
> > IRQ or timer (such as mtk_cqdma_remove() or tegra_adma_free_chan_resour=
ces()).
> > Using cancel_work_sync(&chan->bh_work) or disable_work_sync(&chan->bh_w=
ork)
> > depending on whether the channel may be used again would wait for any
> > in-flight execution while preventing or draining concurrent re-schedule=
s.
> >
> > > @@ -1687,15 +1713,28 @@ EXPORT_SYMBOL_GPL(dma_run_dependencies);
> > >
> > >  static int __init dma_bus_init(void)
> > >  {
> > > -   int err =3D dmaengine_init_unmap_pool();
> > > +   int err;
> > >
> > > +   dmaengine_bh_wq =3D alloc_workqueue("dmaengine_bh",
> > > +                                     WQ_BH | WQ_PERCPU, 0);
> >
> > [Severity: Medium]
> > Does calling dmaengine_kill_bh() from a WQ_MEM_RECLAIM workqueue or a
> > PF_MEMALLOC task trigger a WARN_ONCE() in check_flush_dependency()?
> >
> > dmaengine_bh_wq does not have WQ_MEM_RECLAIM set (and WQ_BH workqueues =
cannot
> > set WQ_MEM_RECLAIM).  Because dmaengine_kill_bh() calls flush_work(), w=
hich
> > passes from_cancel =3D false to __flush_work() -> check_flush_dependenc=
y(),
> > flushing a pending or running chan->bh_work from a WQ_MEM_RECLAIM conte=
xt
> > hits the dependency warning:
> >
> > kernel/workqueue.c:check_flush_dependency() {
> >       if (from_cancel || target_wq->flags & WQ_MEM_RECLAIM)
> >               return;
> >
> >       WARN_ONCE(current->flags & PF_MEMALLOC, ...);
> >       WARN_ONCE((worker && ((worker->current_pwq->wq->flags &
> >                              (WQ_MEM_RECLAIM | __WQ_LEGACY)) =3D=3D WQ_=
MEM_RECLAIM)), ...);
> > }
> >
> > For example, sdhci allocates host->complete_wq with WQ_MEM_RECLAIM and =
runs
> > sdhci_complete_work() -> sdhci_request_done() -> dmaengine_terminate_sy=
nc()
> > -> dmaengine_synchronize() -> vchan_synchronize() -> dmaengine_kill_bh(=
).
> > Using cancel_work_sync() or disable_work_sync() in dmaengine_kill_bh() =
sets
> > from_cancel =3D true and avoids this warning.
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.179431535=
0.git.allen.lkml@gmail.com?part=3D2



--
       - Allen
