Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.227.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793785626;
	b=UVkqdUdqV7ke8CFW632B8ubyT7nv2L89rmURBdQIBCAUUE16UeIwYRgeItieHgSEp7pN
	 VdAGeEAwE73pCOZ5o2e0+v89O/jzYIjt+4ugpAl/24pdg7xUFTp+46t742G2H2zlQY+t0
	 hDeS5TVdJC584NhBi+ypt0lT4FhdxOAlypce2trSRwiFynC0mWxg+ynwWu/TQ6GB1eHud
	 tOc+v1fS1dNvYZkkS0ZGqlXLWsedB8JIV5uZank8dDD7MpEZgU2f2Jg2DSFz9qfoDk7Ra
	 gMZd8+z6oMJB7jUvbZpK0y1NrIOOusbcYGrFf3HeHvJPwNxbnxO972l3bKvR4MApA0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vDG54N36XWJPLC9BtF29WdqvzNITISdymLls5vslhFw=;
	b=qdpkeXlS5Dh3lyTj6iugNOsQy9goB0OwmWRn7ilP0KSdw+bMgI5q8mpLPklo6qFEI1FE
	 BjnYECpZK79ogYZatajDG4dmRbvjzpzZN9EYxcNEg80HXHMv+1pFgtciyr0G/Shdg/pN+
	 R/UQxBCoHihblV9x9KNd3MwAipXwVs70FY2pr3xsH1EGqNBibIcxQFOBhLs1n7cdHdKMT
	 h+sJqLiDPrl32p8hYL25KPNisD4dyPUGIbkf5gPk2Tt6A9VeI6krmzyPtIaXKLLHCDEeQ
	 /iv/MNiNRPmqRH0s+ClRt7N2SoIqHi2pEBzafphMfoA6kjjCEEQejcEQE42KDA2Chhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caKVnJ2Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B8F606A32C
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 09:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B8F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caKVnJ2Y
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3acc6625b70so42304a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 01:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793785625; cv=none;
        d=google.com; s=arc-20260327;
        b=qm4ktnUjGGQMWNDdEn6wmSjUYEYS9TRHuu7Co6rbxvp9yrxUVqb4AWmutLYaPiBvWs
         tYCyNwL5xdsbM/qVMRizdTRvkuIMJoKyq33hzpEUdBtLPnfhIuTUgTDPOpkBTUODf7VG
         WVLKG/PwqLlairPggnA0wYeftxz7rQG2RYHCw2Hp6Lo7nrl06D6k5cW6AnD9WQ96ThIt
         8wHyCDIVK5E1Cc/vqTzd+jxpoyrFSY982PDDgCYP3lzCtAH/pfBK4Jzc1knwM+z2tx3k
         lOPQMzs0OTJ1wqommr8HUklDx29y4I5EZ7Y+JnH+1W5m0O7EgbrSYTaqjJWV27ersmNb
         S+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDG54N36XWJPLC9BtF29WdqvzNITISdymLls5vslhFw=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=ilp7bQdXjtlN+v6IM4rgqy4Q5hMtsp8k87+OhHA8gYgH9RW8h0lrhLzsFquOR0I/Ru
         iaKSYn64EZRBEYesZ5gLg4+kZa6neX/3iMMNbKVIaoOPFsdalXnSWOYPvUyMTTks+iHf
         jO6hozTPe0cvnCml/KtP4sXKRPtva/7uK/XS47+8ZcmbDWdpXsDAXzhYNCW02L+BNkuO
         rJTI/Iv4ck2Q+Rr+BJcjLrHyHgK+D9wZQTbtmQxqoZxOgwSNtpHW/KvFX8gQnsP4w6YW
         7MtbBEvhSUHdr2M0xpUHkIgcuoGDvpEQ+IzVp1gU80qfbYMh8W0WrXp1uPbjHlWwSqWy
         jxuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785625; x=1794390425; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vDG54N36XWJPLC9BtF29WdqvzNITISdymLls5vslhFw=;
        b=caKVnJ2Y0+WlUXzzN58jeNpNkRaeYB1jMzMpD/0hx2BC2hp3EEyOmbw4s+oY40pFSP
         MvncU8JT4ALC5Ky+plUpFdUpl07bYhj/p9SJSj2xolH85W23C+468WrdecLvbne2fQBU
         VCA0nCG/wXog/SOZOx6EZGxTNIfQPUIER10dvb13w+e+O4gSLgM7M8ngno4gB6mKN0ld
         B8CuLvvqmc30cVBqmW+guYgvfp3I43Lgit/bU6pocR4kvzumogOGZL6DQvYfbCLg7SKc
         Epz237Y/RJaEY40BikTIo+hyMtvA7zolfS8BIXY9UCJ/vx/aIJN8vpi0WyT/jn9Pynm1
         kRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785625; x=1794390425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDG54N36XWJPLC9BtF29WdqvzNITISdymLls5vslhFw=;
        b=BAhQEkDm+nAbcp2C603z7jb/U4fn9yNxCcD2Znb52fuJMIdE3p8DmIDrP49Dfl2Cck
         eMeiF1RSlFoEZqI5ZjxdcsEJFyCK6fI+tjA2k9938uQ1dQoE1MClMxgJR6kfIbqklLhj
         br+QQ5/LNoPrzNaSZ6/lkrkRR1yiOa1KtrRSKR3UjtWclp+33YLDzkLxxzpt1z6Ur/50
         P6R+k0yKixBoQjV6+DcwAYGRRsa+mZcvHz4mWQeVJPdte47Ik/9+itxM6PYQ5fUoSgCl
         m/J/fPpBiAaz1ZCb0qDN0Y0KdahJSzI8YTGYk4r9qbSyDwxf/GdKsghQ6xDXkSDZAh1s
         IABw==
X-Gm-Message-State: APuU4Z/hyBoW2GdnXv9ltuCrhpqvcWCP8L1V5RD8KwfPdU4kEygm760L
	3JzSu0sgjyOGGzKxyn6G++EgtVxfW8nYUDHAq6aJbqGMMKP5OTifmGh95HhgvBoRkjl3TJXVeDU
	2JY9CDYLyaMSaAQofXO3tYyP7vSCMt/HfbRRM/D4pV31c
X-Gm-Gg: AYBFou1BwohwGh5lrm9DsmnEku4yz3p7Wf/hfPcqNLzkTGUArr59BKtOJiUWwfgI/D4
	6282Pt3iazFAr0R0VOtEpiDUHZW48NME3HJPaz/04/WVlO/NdIqdLl+KvjmBxH8sqmL96YWIRXO
	bpjOyrtXu7Q4IT9cm53CuEUvKqCB6bGn39NWMsuVpjMMW+t4f5ZrupYkimxl30h5yHfVUlfT2kP
	TitTbnJj+zsAPRM45ND1W1q1nWJL6WBrUaojx9/sWa6RwVvY6V9BYvY1k9M1LBl+Ti3PPla6/ov
	f6zFkb9h08RXDgBDEsoo7jXh/YuHA+n0URy4JIyMYPpExmNixvI7R43NNe42sWtqztr0crlSp9O
	xtGVzKQ7dY56WonEUcopPAFgHQaoBtoTuSinl4Q==
X-Received: by 2002:a17:90b:4487:b0:3ac:9c37:9422 with SMTP id
 98e67ed59e1d1-3ae89626108mr21996162a91.2.1793785624975; Wed, 04 Nov 2026
 01:47:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103163354.1599176-1-lui2012qwq@gmail.com> <sashiko-outbox-196924@kernel.org>
In-Reply-To: <sashiko-outbox-196924@kernel.org>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Wed, 4 Nov 2026 17:46:49 +0800
X-Gm-Features: AclHuK-_vtvq978zMu3PPwfacZUO0gUoRDIo_JkxJh6WSRWCG4KdPqfhdU7hFXQ
Message-ID: <CAE=Q7=6cC_vtSdpbkPaJYE6F1u5sYFQYb1VPMbFPL5RLqshkoQ@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: disable pending-reset work in hl_device_fini()
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review - this scenario is real, and the patch as posted
has exactly that problem.

A reset retry waiting on its timer holds reset_info.in_reset, and only
the work itself clears it (via out_err, because device_fini_pending is
set).  Disabling the work without running it strands in_reset, and
hl_device_fini() would then spin until HL_HARD_RESET_MAX_TIMEOUT and
return without tearing the device down.

v2 keeps the flush_delayed_work(), so a pending retry still runs and
clears in_reset, and adds disable_delayed_work_sync() only after
in_reset has been claimed for fini.  At that point no new reset can be
queued (the in_reset gate) and the reset thread does not re-arm
(because device_fini_pending is set), so nothing can be left pending
or running when the teardown proceeds.

One note on the second scenario in the review - a running callback
that already passed the device_fini_pending check and then returns
-EBUSY, after which the wrapper refuses to re-queue: that race exists
identically with the original flush-based code (the flush waits for
the callback, but nothing clears in_reset on that path either).  It is
pre-existing and unchanged by this fix.

Chengyu

On Wed, Nov 4, 2026 at 5:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] accel/habanalabs: disabling reset_work in hl_device_fini() s=
trands in_reset
> --
>
> commit eb768a82770d27a90572b30cd01bc34db4fd01ba
> Author: Chengyu Liu <lui2012qwq@gmail.com>
>
> accel/habanalabs: disable pending-reset work in hl_device_fini()
>
> This commit replaces flush_delayed_work() with disable_delayed_work_sync(=
) in
> hl_device_fini() to prevent device_hard_reset_pending() from re-arming
> hdev->device_reset_work.reset_work during device teardown.
>
> > diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/h=
abanalabs/common/device.c
> > index 09b27bac3a31d..4635dc8572f03 100644
> > --- a/drivers/accel/habanalabs/common/device.c
> > +++ b/drivers/accel/habanalabs/common/device.c
> > @@ -2487,7 +2487,7 @@ void hl_device_fini(struct hl_device *hdev)
> >       dev_info(hdev->dev, "Removing device %s\n", dev_name(&(hdev)->pde=
v->dev));
> >
> >       hdev->device_fini_pending =3D 1;
> > -     flush_delayed_work(&hdev->device_reset_work.reset_work);
> > +     disable_delayed_work_sync(&hdev->device_reset_work.reset_work);
>
> [Severity: Critical]
> Does cancelling and disabling hdev->device_reset_work.reset_work here lea=
ve
> hdev->reset_info.in_reset stuck at 1 and cause hl_device_fini() to time o=
ut
> and skip teardown?
>
> When a hard reset is initiated outside the reset thread, hl_device_reset(=
)
> sets hdev->reset_info.in_reset =3D 1 and hands off clearing it to
> hdev->device_reset_work.reset_work:
>
> drivers/accel/habanalabs/common/device.c:hl_device_reset() {
>         ...
>                 hdev->reset_info.in_compute_reset =3D !hard_reset;
>
>                 hdev->reset_info.in_reset =3D 1;
>
>                 spin_unlock(&hdev->reset_info.lock);
>         ...
>         if ((hard_reset) && (!from_hard_reset_thread)) {
>                 hdev->reset_info.hard_reset_pending =3D true;
>                 ...
>                 queue_delayed_work(hdev->reset_wq, &hdev->device_reset_wo=
rk.reset_work, 0);
>
>                 return 0;
>         }
> }
>
> When device_hard_reset_pending() runs hl_device_reset() and
> device_kill_open_processes() returns -EBUSY while device_fini_pending is =
0,
> hl_device_reset() returns -EBUSY directly without jumping to out_err, kee=
ping
> hdev->reset_info.in_reset set to 1 across the retry delay:
>
> drivers/accel/habanalabs/common/device.c:hl_device_reset() {
>         ...
>                 rc =3D device_kill_open_processes(hdev, 0, false);
>
>                 if (rc =3D=3D -EBUSY) {
>                         if (hdev->device_fini_pending) {
>                                 dev_crit(hdev->dev,
>                                         "%s Failed to kill all open proce=
sses, stopping hard reset\n",
>                                         dev_name(&(hdev)->pdev->dev));
>                                 goto out_err;
>                         }
>
>                         /* signal reset thread to reschedule */
>                         return rc;
>                 }
>         ...
> out_err:
>         ...
>         hdev->reset_info.in_reset =3D 0;
>
>         spin_unlock(&hdev->reset_info.lock);
>
>         return rc;
> }
>
> Previously, setting hdev->device_fini_pending =3D 1 and calling
> flush_delayed_work() forced any pending reset_work to execute immediately
> with device_fini_pending =3D=3D 1, which entered the goto out_err path an=
d
> cleared hdev->reset_info.in_reset =3D 0.
>
> With disable_delayed_work_sync(), if reset_work is waiting on its retry t=
imer
> (or queued on reset_wq before starting), or if a running callback already=
 read
> hdev->device_fini_pending =3D=3D 0 in hl_device_reset() before returning =
-EBUSY,
> or if a concurrent hl_device_reset() sets in_reset =3D 1 and queues reset=
_work
> before hl_device_fini() takes hdev->reset_info.lock, the work item never =
runs
> again to clear hdev->reset_info.in_reset.
>
> Won't hl_device_fini() then spin in while (device_in_reset) for the full
> HL_HARD_RESET_MAX_TIMEOUT (or HL_PLDM_HARD_RESET_MAX_TIMEOUT) and return
> early without cleaning up the device before hl_pci_remove() calls
> destroy_hdev()?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103163354.15=
99176-1-lui2012qwq@gmail.com?part=3D1
