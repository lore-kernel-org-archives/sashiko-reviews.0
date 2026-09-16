Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5206346EC75
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547593; cv=none; b=rsnhuzLiy0qRbofw7GO97daFh8xiE7DZkUJafqJizc74jzBw9uXl4ZaCkpCpawae6drdHvF/MY+9vIqueWc1yQS57uS2XvdmedYifyvL0Bx9DMxeD22lDazEu3KeqXC8HaZB1Cv7wMvG8Mc+Uc0krkDxXfL0AhDCAo7yjzSrK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547593; c=relaxed/simple;
	bh=JbZ3L3Bi1MJNpFGC9yQphg4zXbJzYn8r/Y36y1MXXyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJBnNjcZMzEtHrV5af4xBkzetxtCeerMach82WSLUxDZfgA2YkYlCaIcYEOWwavNYW5GVtOGoxiYGGKH1aAlYcNjWph/HMDNP5ueowu+BtLC+QqkLdcLAD3RMyfHT7TWXDHrmpaxnv0vPyhMUHI94MsuNvOMj1icuFY0N9F+Ulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=K8SObpd6; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="K8SObpd6"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso3236039a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 01:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547590; x=1790152390;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7z64ej40n6dCON7Cv1l9byhMQUoa7kkgsfXULVKB6s=;
        b=RtC/sG18LV4TkzGmEMj8kDCcfCtXgBXuLAA2XGRBV8P9voJeYuAn/x8NwUuT8AepMe
         IU3YD2MwJQowwvsEw5n2GVAiZfi5v2t1T0S673cpWgaHNSlw+ZzrdQHOqu3x/JSx7/oa
         zOQrrIuFz/8zGQEsZq2GTA9bra3dhkqAE6jhGpXas4nPdWay+8lJb/Ix/WWjJZb7lKcv
         CAupNv6IvrWXiB/UxGKYDwEvvnK3lP0YzGb0eg5qy98p2paO57H1F5mm7GIPtzYazwpz
         ULdVJyihzkshD24Mo9OVMc3k/OtEphl/fxL4ViNsX4foZph0B9NTqdvXplJ45QvXvn3H
         ZT3g==
X-Gm-Message-State: AFuF++mj0gUQPViFGnHfh3jiYMrO0c2GqqmupfKdia+2QuSwO5h6jqqc
	QMuf4Eql9qTicIS4/JJKhN9T/sV+xuVqxnk7W/2ZEH3L2ptjpgRN5ld16SMgVY8Ik1c0hJTEzPQ
	eRiQ1o+0EvZD6QPpHlzXrqmX12FT1vwGTTBZFpwdn1DIk0GsEPlSzg68BmP9Bn4VKSH3vQBx0bB
	PK37/9HdED7s306lWW0O7F4Wj2R/afO5QlJckl3u5znF5vl/IbmOgOSLp63e6xZeSxVV2T0oNhw
	3BQNfiRmRhKvK51OlhVIz0=
X-Gm-Gg: AYBFou2yrOhJ+I4VinrlpFmCBSM8b+mzUMGryCn8MwRRVZkKSHnOKyxcSebWX9Bfevq
	dyRyFbezAwgTEkyf6vkvlfvnso/Z16RGIRNxD7wniGAYXBdXUMq/13nPe/tqyWFYL1tnYgwB0Yp
	KLQx5Id+MJfTTGjsFF+lLsat1/zFxWjoYT+jtRhqhgwvdjOfSFGWh94/9dDyoC9PcX3P4aRVWTK
	+aOQqaMWMVxHv2Q8ZnIeqqbEUXxeo3+sUzsl+qjzQeMh+uMybxPzxC1eF2vPRsYKoOOWKzEJWJi
	r7szhx0lWw3uU7EAAznAvX0iMBM3rqEdlbEMlv1Ni06IlEtx+nFEohTmEocRgJ4aRkoMD6xtsu3
	lzX/sqHQAUYw98qqk9awexYU/ezR4+WiRsbbhRKKbVDq2RTgulcU6ntbB5RJX8x89fBFoDNLxPG
	slVT6cLBug4vCLjkQok+W0W8oPuzvLLI5P569Y6w==
X-Received: by 2002:a17:90b:3b81:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39e1e49a276mr4049409a91.18.1789547590327;
        Wed, 16 Sep 2026 01:33:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e19fb7798sm241435a91.1.2026.09.16.01.33.09
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:33:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a9cdcbe249so4372904a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789547588; x=1790152388; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7z64ej40n6dCON7Cv1l9byhMQUoa7kkgsfXULVKB6s=;
        b=K8SObpd62e4Wc9Kuhk1p5GsdYbgDuRLkVUMIg2goMEyDKX519RkNFAmjrHP+WHg0M8
         sUJ4ULRnU6NdnM/pfyt8VsNsQMHzn2ULzTCJ1bq4BuLdCTYNN3eO7ddHCHIyl3+VmeQa
         0g3FVlIA+pNluKabbv6mtuJP6N5vGUEENOzzc=
X-Received: by 2002:a05:6402:3215:b0:6a7:ee56:6156 with SMTP id 4fb4d7f45d1cf-6aa223d83c5mr1292616a12.24.1789547588097;
        Wed, 16 Sep 2026 01:33:08 -0700 (PDT)
X-Received: by 2002:a05:6402:3215:b0:6a7:ee56:6156 with SMTP id
 4fb4d7f45d1cf-6aa223d83c5mr1292584a12.24.1789547587548; Wed, 16 Sep 2026
 01:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805110634.346670-1-ranjan.kumar@broadcom.com>
 <20260805110634.346670-8-ranjan.kumar@broadcom.com> <20260805113844.02E441F000E9@smtp.kernel.org>
In-Reply-To: <20260805113844.02E441F000E9@smtp.kernel.org>
From: Ranjan Kumar <ranjan.kumar@broadcom.com>
Date: Wed, 16 Sep 2026 14:02:53 +0530
X-Gm-Features: AcwNN1X6J0GKk6rN5G2oD2ULNfUh8xzSoO9-DUNvqZh0Dhkv64PEp27x-z7RnRw
Message-ID: <CAMFBP8MS97afjKPdmGOGECnMsXwwyAWvbyawyFrzxyQqk8ZSfQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] mpi3mr: Fix firmware event reference leak during cleanup
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000051d246065b958415"

--00000000000051d246065b958415
Content-Type: multipart/alternative; boundary="00000000000043dc54065b958414"

--00000000000043dc54065b958414
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.

All three findings here are pre-existing in mpi3mr_fwevt_add_to_list() and
mpi3mr_sas_port_add()/mpi3mr_sas_port_remove(),
not introduced by this patch =E2=80=94 confirmed by checking v1 through v4,=
 none of
which ever modified mpi3mr_fwevt_add_to_list(),
and the pending_at_sml assignment in sas_port_add()/sas_port_remove()
predates this patch's locking changes.

1. The TOCTOU on fwevt_worker_thread is already fixed upstream by commit
c94c746e6c80 ("scsi: mpi3mr: Fix use-after-free of the firmware event
workqueue"), which moves the check inside fwevt_lock.
2. The firmware event leak on that same early-return path (missing
mpi3mr_fwevt_put()) is still open.I will address it in a separate follow-up
patch.
3. The ABBA deadlock risk in mpi3mr_sas_port_add()/mpi3mr_sas_port_remove()
is addressed by patch 8 of this series,
   which adds a reset_in_progress/stop_drv_processing check before the
blocking  sas_rphy_add()/sas_port_delete()/sas_port_delete_phy() calls in
both functions.

Thanks,
Ranjan


On Wed, Aug 5, 2026 at 5:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider:
>
> Pre-existing issues:
> - [High] Race condition / TOCTOU when accessing fwevt_worker_thread can
> cause a NULL pointer dereference.
> - [High] Incomplete deadlock fix in SAS transport path allows ABBA
> deadlock with SCSI mid-layer.
> - [Medium] Memory leak of firmware event when workqueue is not available.
> --
>
> --- Patch [7]: [PATCH v4 07/10] mpi3mr: Fix firmware event reference leak
> during cleanup ---
> commit 02873552fdbb7ea8056e6479b78735dc33631a59
> Author: Ranjan Kumar <ranjan.kumar@broadcom.com>
>
> mpi3mr: Fix firmware event reference leak during cleanup
>
> This patch fixes a reference leak during firmware event cleanup when an
> event
> is currently executing or pending at the SCSI mid-layer. It also resolves
> multiple concurrency and deadlock issues in the firmware event handling
> paths.
>
> Closes:
> https://sashiko.dev/#/patchset/20260626114109.43685-1-ranjan.kumar@broadc=
om.com?part=3D7
> Closes:
> https://sashiko.dev/#/patchset/20260708183305.244485-1-ranjan.kumar@broad=
com.com?part=3D7
> Closes:
> https://sashiko.dev/#/patchset/20260724102505.115136-1-ranjan.kumar@broad=
com.com?part=3D7
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_os.c
> b/drivers/scsi/mpi3mr/mpi3mr_os.c
> > index 23a6a5e3df5f4..a34ea7e056900 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_os.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_os.c
> > @@ -282,32 +282,6 @@ void mpi3mr_hdb_trigger_data_event(struct
> mpi3mr_ioc *mrioc,
> >       mpi3mr_fwevt_add_to_list(mrioc, fwevt);
> >  }
>
> [Severity: High]
> This is a pre-existing issue, but can the lockless check in
> mpi3mr_fwevt_add_to_list() cause a race condition leading to a NULL point=
er
> dereference?
>
> If mpi3mr_fwevt_add_to_list() checks mrioc->fwevt_worker_thread locklessl=
y:
>
>         if (!mrioc->fwevt_worker_thread)
>                 return;
>
> And concurrently, during driver shutdown or unload, the workqueue pointer
> is
> set to NULL while holding fwevt_lock:
>
>         spin_lock_irqsave(&mrioc->fwevt_lock, flags);
>         wq =3D mrioc->fwevt_worker_thread;
>         mrioc->fwevt_worker_thread =3D NULL;
>         spin_unlock_irqrestore(&mrioc->fwevt_lock, flags);
>
> Could mpi3mr_fwevt_add_to_list() pass the lockless check, then block on
> fwevt_lock, and after acquiring the lock, unconditionally pass the now-NU=
LL
> mrioc->fwevt_worker_thread to queue_work()?
>
> [Severity: Medium]
> This is also a pre-existing issue, but does the early return in
> mpi3mr_fwevt_add_to_list() leak the firmware event?
>
>         if (!mrioc->fwevt_worker_thread)
>                 return;
>
> Since mpi3mr_alloc_fwevt() initializes the reference count to 1, if the
> worker
> thread is already gone and we take this early return, do we need to call
> mpi3mr_fwevt_put() to prevent leaking the allocated firmware event?
>
> > -/**
> > - * mpi3mr_fwevt_del_from_list - Delete firmware event from list
> > - * @mrioc: Adapter instance reference
> > - * @fwevt: Firmware event reference
>
> [ ... ]
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > index 240f67a8e2e3b..b309cfdf66873 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
>
> [ ... ]
>
> > @@ -1457,8 +1458,10 @@ static struct mpi3mr_sas_port
> *mpi3mr_sas_port_add(struct mpi3mr_ioc *mrioc,
> >       }
> >       rphy->identify =3D mr_sas_port->remote_identify;
> >
> > +     spin_lock_irqsave(&mrioc->fwevt_lock, flags);
> >       if (mrioc->current_event)
> >               mrioc->current_event->pending_at_sml =3D 1;
> > +     spin_unlock_irqrestore(&mrioc->fwevt_lock, flags);
> >
> >       if ((sas_rphy_add(rphy))) {
> >               ioc_err(mrioc, "failure at %s:%d/%s()!\n",
>
> [Severity: High]
> This is a pre-existing issue, but does this code allow an ABBA deadlock
> with
> the SCSI mid-layer?
>
> Unlike mpi3mr_report_tgtdev_to_host(), this function does not check
> mrioc->reset_in_progress or mrioc->stop_drv_processing before setting
> pending_at_sml =3D 1 and calling sas_rphy_add().
>
> If a controller reset initiates, it waits for the event worker via
> cancel_work_sync(). If the worker thread is here and calls sas_rphy_add()=
,
> the SML commands might receive SCSI_MLQUEUE_HOST_BUSY from
> mpi3mr_queuecommand() because the reset is active.
>
> Since SML will retry infinitely while the reset is underway, does this
> cause
> the event worker thread to deadlock against the thread waiting for the
> reset
> to complete?
>
> [ ... ]
>
> > @@ -1578,8 +1585,10 @@ static void mpi3mr_sas_port_remove(struct
> mpi3mr_ioc *mrioc, u64 sas_address,
> >
> >       spin_unlock_irqrestore(&mrioc->sas_node_lock, flags);
> >
> > +     spin_lock_irqsave(&mrioc->fwevt_lock, flags);
> >       if (mrioc->current_event)
> >               mrioc->current_event->pending_at_sml =3D 1;
> > +     spin_unlock_irqrestore(&mrioc->fwevt_lock, flags);
> >
> >       list_for_each_entry_safe(mr_sas_phy, next_phy,
> >           &mr_sas_port->phy_list, port_siblings) {
>
> [Severity: High]
> This is a pre-existing issue, but this appears to be susceptible to the
> same
> deadlock with the SCSI mid-layer.
>
> If a reset is in progress, setting pending_at_sml =3D 1 without a bailout
> check can cause the worker thread to hang if the SML commands retry
> infinitely due to the active reset. Should this have the same bailout che=
ck
> as mpi3mr_remove_tgtdev_from_host()?
>
> --
> Sashiko AI review =C2=B7
> https://sashiko.dev/#/patchset/20260805110634.346670-1-ranjan.kumar@broad=
com.com?part=3D7
>

--00000000000043dc54065b958414
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the review.<br><br>All three findings here a=
re pre-existing in mpi3mr_fwevt_add_to_list() and mpi3mr_sas_port_add()/mpi=
3mr_sas_port_remove(),<br>not introduced by this patch =E2=80=94 confirmed =
by checking v1 through v4, none of which ever modified mpi3mr_fwevt_add_to_=
list(), <br>and the pending_at_sml assignment in sas_port_add()/sas_port_re=
move() predates this patch&#39;s locking changes.<br><br>1. The TOCTOU on f=
wevt_worker_thread is already fixed upstream by commit c94c746e6c80 (&quot;=
scsi: mpi3mr: Fix use-after-free of the firmware event workqueue&quot;), wh=
ich moves the check inside fwevt_lock.<br>2. The firmware event leak on tha=
t same early-return path (missing mpi3mr_fwevt_put()) is still open.I will =
address it in a separate follow-up patch.<br>3. The ABBA deadlock risk in m=
pi3mr_sas_port_add()/mpi3mr_sas_port_remove() is addressed by patch 8 of th=
is series,<br>=C2=A0 =C2=A0which adds a reset_in_progress/stop_drv_processi=
ng check before the blocking=C2=A0 sas_rphy_add()/sas_port_delete()/sas_por=
t_delete_phy() calls in both functions.<br>=C2=A0 =C2=A0<br>Thanks,<br>Ranj=
an</div><br><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Aug 5, 2026 at 5:08=E2=80=AFPM &lt;<a=
 href=3D"mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thank you for=
 your contribution! Sashiko AI review found 3 potential issue(s) to conside=
r:<br>
<br>
Pre-existing issues:<br>
- [High] Race condition / TOCTOU when accessing fwevt_worker_thread can cau=
se a NULL pointer dereference.<br>
- [High] Incomplete deadlock fix in SAS transport path allows ABBA deadlock=
 with SCSI mid-layer.<br>
- [Medium] Memory leak of firmware event when workqueue is not available.<b=
r>
--<br>
<br>
--- Patch [7]: [PATCH v4 07/10] mpi3mr: Fix firmware event reference leak d=
uring cleanup ---<br>
commit 02873552fdbb7ea8056e6479b78735dc33631a59<br>
Author: Ranjan Kumar &lt;<a href=3D"mailto:ranjan.kumar@broadcom.com" targe=
t=3D"_blank">ranjan.kumar@broadcom.com</a>&gt;<br>
<br>
mpi3mr: Fix firmware event reference leak during cleanup<br>
<br>
This patch fixes a reference leak during firmware event cleanup when an eve=
nt<br>
is currently executing or pending at the SCSI mid-layer. It also resolves<b=
r>
multiple concurrency and deadlock issues in the firmware event handling pat=
hs.<br>
<br>
Closes: <a href=3D"https://sashiko.dev/#/patchset/20260626114109.43685-1-ra=
njan.kumar@broadcom.com?part=3D7" rel=3D"noreferrer" target=3D"_blank">http=
s://sashiko.dev/#/patchset/20260626114109.43685-1-ranjan.kumar@broadcom.com=
?part=3D7</a><br>
Closes: <a href=3D"https://sashiko.dev/#/patchset/20260708183305.244485-1-r=
anjan.kumar@broadcom.com?part=3D7" rel=3D"noreferrer" target=3D"_blank">htt=
ps://sashiko.dev/#/patchset/20260708183305.244485-1-ranjan.kumar@broadcom.c=
om?part=3D7</a><br>
Closes: <a href=3D"https://sashiko.dev/#/patchset/20260724102505.115136-1-r=
anjan.kumar@broadcom.com?part=3D7" rel=3D"noreferrer" target=3D"_blank">htt=
ps://sashiko.dev/#/patchset/20260724102505.115136-1-ranjan.kumar@broadcom.c=
om?part=3D7</a><br>
<br>
&gt; diff --git a/drivers/scsi/mpi3mr/mpi3mr_os.c b/drivers/scsi/mpi3mr/mpi=
3mr_os.c<br>
&gt; index 23a6a5e3df5f4..a34ea7e056900 100644<br>
&gt; --- a/drivers/scsi/mpi3mr/mpi3mr_os.c<br>
&gt; +++ b/drivers/scsi/mpi3mr/mpi3mr_os.c<br>
&gt; @@ -282,32 +282,6 @@ void mpi3mr_hdb_trigger_data_event(struct mpi3mr_=
ioc *mrioc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi3mr_fwevt_add_to_list(mrioc, fwevt);<br>
&gt;=C2=A0 }<br>
<br>
[Severity: High]<br>
This is a pre-existing issue, but can the lockless check in<br>
mpi3mr_fwevt_add_to_list() cause a race condition leading to a NULL pointer=
<br>
dereference?<br>
<br>
If mpi3mr_fwevt_add_to_list() checks mrioc-&gt;fwevt_worker_thread lockless=
ly:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!mrioc-&gt;fwevt_worker_thread)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
And concurrently, during driver shutdown or unload, the workqueue pointer i=
s<br>
set to NULL while holding fwevt_lock:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(&amp;mrioc-&gt;fwevt_lock, fl=
ags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wq =3D mrioc-&gt;fwevt_worker_thread;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mrioc-&gt;fwevt_worker_thread =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqrestore(&amp;mrioc-&gt;fwevt_loc=
k, flags);<br>
<br>
Could mpi3mr_fwevt_add_to_list() pass the lockless check, then block on<br>
fwevt_lock, and after acquiring the lock, unconditionally pass the now-NULL=
<br>
mrioc-&gt;fwevt_worker_thread to queue_work()?<br>
<br>
[Severity: Medium]<br>
This is also a pre-existing issue, but does the early return in<br>
mpi3mr_fwevt_add_to_list() leak the firmware event?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!mrioc-&gt;fwevt_worker_thread)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
Since mpi3mr_alloc_fwevt() initializes the reference count to 1, if the wor=
ker<br>
thread is already gone and we take this early return, do we need to call<br=
>
mpi3mr_fwevt_put() to prevent leaking the allocated firmware event?<br>
<br>
&gt; -/**<br>
&gt; - * mpi3mr_fwevt_del_from_list - Delete firmware event from list<br>
&gt; - * @mrioc: Adapter instance reference<br>
&gt; - * @fwevt: Firmware event reference<br>
<br>
[ ... ]<br>
<br>
&gt; diff --git a/drivers/scsi/mpi3mr/mpi3mr_transport.c b/drivers/scsi/mpi=
3mr/mpi3mr_transport.c<br>
&gt; index 240f67a8e2e3b..b309cfdf66873 100644<br>
&gt; --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c<br>
&gt; +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c<br>
<br>
[ ... ]<br>
<br>
&gt; @@ -1457,8 +1458,10 @@ static struct mpi3mr_sas_port *mpi3mr_sas_port_=
add(struct mpi3mr_ioc *mrioc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rphy-&gt;identify =3D mr_sas_port-&gt;remote=
_identify;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;mrioc-&gt;fwevt_lock, flag=
s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mrioc-&gt;current_event)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mrioc-&gt;curren=
t_event-&gt;pending_at_sml =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;mrioc-&gt;fwevt_lock,=
 flags);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((sas_rphy_add(rphy))) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioc_err(mrioc, &=
quot;failure at %s:%d/%s()!\n&quot;,<br>
<br>
[Severity: High]<br>
This is a pre-existing issue, but does this code allow an ABBA deadlock wit=
h<br>
the SCSI mid-layer?<br>
<br>
Unlike mpi3mr_report_tgtdev_to_host(), this function does not check<br>
mrioc-&gt;reset_in_progress or mrioc-&gt;stop_drv_processing before setting=
<br>
pending_at_sml =3D 1 and calling sas_rphy_add().<br>
<br>
If a controller reset initiates, it waits for the event worker via<br>
cancel_work_sync(). If the worker thread is here and calls sas_rphy_add(),<=
br>
the SML commands might receive SCSI_MLQUEUE_HOST_BUSY from<br>
mpi3mr_queuecommand() because the reset is active.<br>
<br>
Since SML will retry infinitely while the reset is underway, does this caus=
e<br>
the event worker thread to deadlock against the thread waiting for the rese=
t<br>
to complete?<br>
<br>
[ ... ]<br>
<br>
&gt; @@ -1578,8 +1585,10 @@ static void mpi3mr_sas_port_remove(struct mpi3m=
r_ioc *mrioc, u64 sas_address,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;mrioc-&gt;sas_no=
de_lock, flags);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;mrioc-&gt;fwevt_lock, flag=
s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mrioc-&gt;current_event)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mrioc-&gt;curren=
t_event-&gt;pending_at_sml =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;mrioc-&gt;fwevt_lock,=
 flags);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(mr_sas_phy, next_ph=
y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mr_sas_port-&gt;phy_list,=
 port_siblings) {<br>
<br>
[Severity: High]<br>
This is a pre-existing issue, but this appears to be susceptible to the sam=
e<br>
deadlock with the SCSI mid-layer.<br>
<br>
If a reset is in progress, setting pending_at_sml =3D 1 without a bailout<b=
r>
check can cause the worker thread to hang if the SML commands retry<br>
infinitely due to the active reset. Should this have the same bailout check=
<br>
as mpi3mr_remove_tgtdev_from_host()?<br>
<br>
-- <br>
Sashiko AI review =C2=B7 <a href=3D"https://sashiko.dev/#/patchset/20260805=
110634.346670-1-ranjan.kumar@broadcom.com?part=3D7" rel=3D"noreferrer" targ=
et=3D"_blank">https://sashiko.dev/#/patchset/20260805110634.346670-1-ranjan=
.kumar@broadcom.com?part=3D7</a><br>
</blockquote></div>

--00000000000043dc54065b958414--

--00000000000051d246065b958415
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
zZSItX49nLoa4TBbzuCzoINrv59QeSCVlVdAYussUS3840ZjvcYHSQx3tqYcBN+an07lDASmGEM5
7PEXJPVInjl/Fva3ksL3r8anR4PWc3Xz5jLD8Xg6BU4zmIcR/t1GlqWuz8uTWmQtm40C9m91Q9a+
2alIIV6BTs8IG2ELtt4EfcVvi5af+Hu878sGeBtMx6Z9ljoKl3MfvDdtUNO4bkJ97a7PXy/CKxiy
TApQj4qg9SKQcsH0xzQan67XeXjkvk4frNDhRikCAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZcmFuamFuLmt1bWFyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUfLdm66N7GfDsoL8cYp3s4YdO
isMwDQYJKoZIhvcNAQELBQADggIBAA/lnAxDb9jbesclnBxWIKUSxAMIrq4XKO5WKHUYIOOzd2sL
o59fH9AWg1AfVONfWIUNdWDrmNNLs0+drSKaZbGx2RWMbaL9ubo7+BTQV33ZRBxnnkmc9QszlOo5
m6FB9uPOGB9LvJMCkJ8S7hNc9G/p7dB79s1IKc8JGEDIrsgX3s4xSCJA20WdePHY5rLh5ySwXyI2
3sVTUC+oK0HJFRo+TpdMMtdpOetWzIkUbGceiOA2ur8372+0KOmvlIHA/jEnW3BRfmB2vmdk+raY
C/xbXY9JEfS6D881+X/90w+cCQ7nuA1OELebS1RbSdXT6YkRDPWYA/DPFhOYCAiMwVAPRaAH1AQc
8J8yTDigwRUCq4qKCYU9YnqQh3YZRbUYnW+i3+rAO2SUbKl0VM5y0tq+GOGLC7w+v6yGossZmy+6
3w72qp/Colr4r5ZaROb+L2FXqk4tL/HfkRhliyPPPNIjre2mIkvFuShk5A5FcvQYCzDtejAz9JHq
ZVJ1ZD+auQDbIUxT+Dn9bI5XkQnWJ9KrlcORtztdYTDafN8VQuweS3JY0X/VCNBNZkiYXd7fzOza
hvkw/S+v8cIfiakLKBREtiBHqWLdVf5CNDVYpd17yz0LGz0TKARbfuK/EiKflA10pnnnOB33Ru9D
WPp9aHW3szGYr3+H9AHS6IDwkIxyMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMDcMaKRu9LrbAxERoMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDVh8du
zqxpEpw7F5FCh7tSFPfc1P2L8ZTWERsdJ7ThLDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA5MTYwODMzMDhaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBBLJ8jqqg4SMekRHCaL4OnxCOpG+HXIjviqVqxV9J4
Ou6Lqj7IWQ6zS595DEPzHZXx1sVWBp+scstXIBYjYJbX71AdiM0TvNQaViaHCjcc7Qm1xYG0r0KP
Rf6hv4Ptv0+tY91hv5Jl151dhUhEs5Va+9VlpvYIDKuvIbc/jo7SUa0AvWWDh3+bgP9xK+OHG5LF
wBwZQXaOpcvEOPYyWZM7UP/huIwRpBYE6uljHDTV8kRtryLyLs44PnFTmUCa8HMeHnILF+DZJPYw
dR2c2pEdZCY9xnX/iseUy8ErnkMZJsWgj7wtpEovE80Bj2NHhsszMw7FnyLkp3RJf82NHYAQ
--00000000000051d246065b958415--
