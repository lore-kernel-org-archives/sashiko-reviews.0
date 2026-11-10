Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310858;
	b=m+B142SRyfvcuCl0ZXX7n9xoq719qzVMo194Hu57Bd29f65pJV7UsORTwgZB4dpuccTo
	 G+3x5iOcU4nR92zL5L1jSCh+8mIxibtJt5vqoJqKZ91pa/rkmGw6XWJ7d+i91swUWKFxL
	 3QqnJYG3e5fDpFrwzCG70ZjS1mn0YC1XsbmxJRqtxx8V310f9O2O8DCrsWt8r0McLigVh
	 g4H+ecljzqKbf/cA3kM83SZh0jN6PJvXj7FtKZBaIXPX87+5OK3NP8bjmBN3TMml/UsaH
	 yPMTnTK5MK5+zdQEDSkXY0W0RSkka1Z5gv7THkKMRZYAFJn0NFSrMyc1CyLgdevGe1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yOns8afdH57msgp9zNnSSwBgpZ3DYVzL6nqt0tH+JOY=;
	b=PB3vpGkcZElXOACDFO7elXrAd3WKGLOPzE3FdMhyvP70Aju36BiHKX0I0fHj6U76CTBC
	 Pe6W7mK3O45zpj0cj7OeWnu4QFOzaaMe808Zglc2FjJUACSgzTxOb3WoOntnLTmsNH8vu
	 6hn1+IgmmCaA5LqSG/h+F+UJws5sP2aABFSGvhGqpkcHqyPRFcwb7tkoIJnhIpYLlLKPg
	 vFMdr+4FfFS0n68vS05qTL5o3regWwmTlSQzPo7aSpWtourVuP/oJYZITMKgzFqXi7meT
	 Laq03zLhzWtJnA0mnonNVr0GWW4Q3Yx2gYb+oMAEBT116N+5nnbl9fbTiMy7l63VoGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3ACx4ou;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B9606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 11:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3ACx4ou
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ea5600c9cso24525886d6.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 03:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794310857; cv=none;
        d=google.com; s=arc-20260327;
        b=dU784b5VoYYiFtLl0IlbavnEfQ768XO//JTW7ciYwamY2YZVq7K+WAcmoODmfJTmSR
         7cEtuIeJH3Ku0IhSMXimLIN182XGUsHNad5BQ2UaoIigH6tpPOnQfwIwacvSnFvoWoFe
         cuH1/DoDD2Qx59+5HDY1eE0xhJWBND0+NzSvxhiS7zcz/qjRcJ678zzXi4L3FMv9Lhv5
         PaCaBTTi3/o3wAoDaFOVOyufD0qibE31NMEpn/HpwqhwsRPvGUvgTov3y3E6o1tHKAQY
         pnkI0I9tg29iEiK1n83oPx0/IavFy27bRtxwKVXaUohEGYVocfOJrFiczJz2IsVvvRlv
         6QbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yOns8afdH57msgp9zNnSSwBgpZ3DYVzL6nqt0tH+JOY=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=TIFuEzxIk471sCGBR0rsNE+TtO01DRxIfGz6Wj3j9JpZZQgNeBoe9Gs2LiMc4eh47/
         exp6+lA6zYR4OaxA72MRF7CUcGBBXe5aE5ENbvYsPwdouuDRrmae6I69VoyKkJMfQc/O
         XISxJQohFDVBMV36Cr/N1DRYs2cgDPIds16vRt/a6fdT0yzERbnHTg3pV8FWj4/9SNvi
         0Z6SwpfSsNs3RQWzguX4VXYIphaMqY6l0f8hFubAamLlU/ZqOUeKkr2XQ0NCLVh5EdFm
         JbLxYsAz1vG4wIz8znzvmFoQDXrp9xUWeeVWfHvY0A0K6JAp0uv90YVNMBCFoiCXCf5R
         O5wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794310857; x=1794915657; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yOns8afdH57msgp9zNnSSwBgpZ3DYVzL6nqt0tH+JOY=;
        b=i3ACx4ou5VHF3dSvhmvRTUEA8hhZPnKlH3+IcLMnanLVtULaOKEO2Fdq3QlBxJ9gHE
         oAjN4hTgUtdiALmWPehDq104TzxpGjVIyAwCjJ5Z0J2snwAhq2b58c+YxGvOZWzdKKh9
         0vUuhHyLrqfxFsFNjy/Q8GsEkKmrkDCHtfoXw2d72KLHE8G21iTmO3BIstdiO/FRFRRy
         KHsNvXKZ3Txr1cI83htRXYksE/SnqAUD6A6mOj3Mu5EzjhVnErTSECCMv34DW9Zwe3er
         eIBThsQQpF0fo6cTEKSdxJsh0ccr0W9YxOsg9gnhsRmDNzXkRNvNTJGawiikOMIFNXeo
         n5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310857; x=1794915657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOns8afdH57msgp9zNnSSwBgpZ3DYVzL6nqt0tH+JOY=;
        b=gVryckJsi+xYOXDWV3mYadLb9Rn69i21zdxSCLLn75aPZIvT95HRAUa46HlYWAq5YZ
         HOqxNPCfwVCN/JUHNJ/kgBcCCcooYk+EVNafMqMNTRLfvo268XrMEBZjvSmGjT9vyEOR
         OkKwxt5Fw+Yf7DzS1htiqbECUSdj33HUm55HWJyoROm9muHtxw6DSL3zlZf28Xn7CpXE
         kD33Tgbv/dblHJG/5jbQe2+/9Nsi2d30/xOzHbdXASJLfg/2YGhqFNE4Tu3xJYgsSBSf
         JeXK1Q23XWtYKBCvQ8cn7E88aLgX7F3hbBDiCdbnR3lXZjXgrxraevQuLZ/tntW19cDL
         ywUA==
X-Gm-Message-State: APuU4Z9E7JnNM3QjYWf8wqh+w8kJGuBc9Z3VVzcyzvl6WOpQTHyC3eL1
	scotsmh9dbPm0SbmuXXXHrZcoA5VgUWTKv/X1WvkeiRlidSMMV8hA3CsBe7BFK2PokF8oXa0ft/
	b+iIphM6T5dkhK2Mtp0klbqGsj34/IyuKCngWTIg=
X-Gm-Gg: AYBFou0FJ5BMITdI1S6qit9a0xIEyt13eaPB0SFrQKFwVqO8atwYUwHMZWLEtb5fJL8
	2CNtw6hNVUSqYURIQaT+oW9C6HBT3G6cZsrgElNKOFiyzU8eU3AFwJI22Xk4hbVf51yu1KZyMzZ
	bCFPQ6XBES+4WSBEHrv7JxN+cZHJemIHFP+HChgMS/BOI0JLZnYca74dvDpeOw8g6kBU/Mf2PFn
	fVjtMravWzxaj5kKxlzl+tQiz1idkCycwp5cbl44OQs00x1i9Gt+Xk2Cy3T1mbJ5KbP4KqmOvFd
	r/j0wt9qEnBQ5ZszzfNN6XnRwBtoYlzZKKFu9c4XAad5ZhBnMVn4wXjmbDpmk7tJwwETnnKxtir
	6nPNDkKZfSVepdlAbX0asymPToFRgU4w1BiANATr3rPs86G1ot1iO96VSXUfiDzlXJTfVbctO4F
	7CwN9aqF6aANrhDQ==
X-Received: by 2002:a05:6214:daf:b0:91c:144e:fb71 with SMTP id
 6a1803df08f44-91ef0255616mr33151936d6.24.1794310855984; Tue, 10 Nov 2026
 03:40:55 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110105436.2487822-1-hj351016@gmail.com> <sashiko-outbox-206921@kernel.org>
In-Reply-To: <sashiko-outbox-206921@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 20:40:44 +0900
X-Gm-Features: AclHuK95HtKLSfOqbTSyErDz1GpIXJGgGnTKcIi6bWHaVEa1K4fFqz8zx3nLc5E
Message-ID: <CAGr5VtP-Sb3k9dT5zuJ0D=AQYVfsBN4igVE2ocArZ3=s050rNg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: drain the vq work before
 freeing the mailbox
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- both are correct, and my patch is wrong.

[High] The AB-BA deadlock is real. imx_dsp_rproc_free_mbox() runs from the
pm_runtime suspend path (__rproc_shutdown() -> rproc_unprepare_device() ->
imx_dsp_rproc_unprepare() -> pm_runtime_put_sync() ->
imx_dsp_runtime_suspend()),
and __rproc_shutdown() holds rproc->lock across that. imx_dsp_rproc_vq_work=
()
also takes rproc->lock, so cancel_work_sync() there waits for the work whil=
e the
work waits for the lock -- a deadlock. The cancel must not run under
rproc->lock,
so it cannot live in free_mbox().

[Critical] You're right that the unbind path can skip free_mbox() entirely:
devm_rproc_add() is registered before devm_pm_runtime_enable(), so on unbin=
d
devres disables runtime PM before devm_rproc_remove() runs rproc_del() /
__rproc_shutdown(). pm_runtime_put_sync() then returns -EACCES without call=
ing
imx_dsp_runtime_suspend(), so free_mbox() never runs -- the mailbox channel=
s and
rproc_work stay live while the rproc / imx_dsp_rproc are freed (UAF + the c=
lk
leak you note). So my one-liner does not even fix the unbind UAF it targete=
d.

So this needs a teardown rework rather than a cancel in free_mbox(): e.g.
reorder devm_pm_runtime_enable() before devm_rproc_add() so the suspend pat=
h
(and mailbox free) actually runs on unbind, and drain rproc_work from a con=
text
that does not hold rproc->lock. Since that touches the driver's probe/teard=
own
ordering, I'd rather not guess at the shape -- Mathieu, Frank, how would yo=
u
prefer this handled? I'm happy to send a v2 once the preferred
direction is clear.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 8:08, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] remoteproc: imx_dsp_rproc: AB-BA deadlock in
>   imx_dsp_rproc_free_mbox()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] remoteproc: imx_dsp_rproc: use-after-free and resource
>   leaks on unbind [1]
> --
>
> commit 17e3fec9a8c6e436afd532f653405b5a78e316af
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox
>
> This commit calls cancel_work_sync(&priv->rproc_work) in
> imx_dsp_rproc_free_mbox() after freeing the mailbox channels to drain any
> pending virtqueue work item.
>
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 96d619daf3f5b..89c72d916b1e4 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -642,6 +642,13 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp=
_rproc *priv)
> >       mbox_free_channel(priv->tx_ch);
> >       mbox_free_channel(priv->rx_ch);
> >       mbox_free_channel(priv->rxdb_ch);
> > +
> > +     /*
> > +      * The mailbox rx callback schedules rproc_work; the channels are=
 now
> > +      * freed, so no new work can be queued. Drain any pending work be=
fore
> > +      * the rproc (which the work dereferences) can be freed.
> > +      */
> > +     cancel_work_sync(&priv->rproc_work);
> >  }
>
> [Severity: High]
> Can calling cancel_work_sync(&priv->rproc_work) in imx_dsp_rproc_free_mbo=
x()
> cause an ABBA deadlock with rproc->lock?
>
> CPU0                              CPU1
> ----                              ----
> mutex_lock(&rproc->lock)
>                                   imx_dsp_rproc_vq_work()
> cancel_work_sync(&priv->rproc_work)
>                                     mutex_lock(&rproc->lock)
>
>  *** DEADLOCK ***
>
> CPU0: __rproc_shutdown() -> rproc_unprepare_device() ->
>       imx_dsp_rproc_unprepare() -> pm_runtime_put_sync() ->
>       imx_dsp_runtime_suspend() -> imx_dsp_rproc_free_mbox()
> CPU1: process_one_work() -> imx_dsp_rproc_vq_work()
>
> Because priv->rx_ch remains active until mbox_free_channel(priv->rx_ch) r=
uns
> inside imx_dsp_rproc_free_mbox(), an inbound mailbox interrupt before or
> during shutdown can queue priv->rproc_work while __rproc_shutdown() holds
> rproc->lock.  imx_dsp_rproc_vq_work() then blocks on rproc->lock while
> imx_dsp_rproc_free_mbox() waits in cancel_work_sync(&priv->rproc_work).
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can unbinding an active
> DSP remoteproc device skip imx_dsp_rproc_free_mbox() entirely [1] and
> leave both the mailbox channels and priv->rproc_work active when the rpro=
c is
> freed?
>
> drivers/remoteproc/imx_dsp_rproc.c:imx_dsp_rproc_probe() {
>         ...
>         ret =3D devm_rproc_add(dev, rproc);
>         if (ret)
>                 return dev_err_probe(dev, ret, "rproc_add failed\n");
>
>         rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
>
>         return devm_pm_runtime_enable(dev);
> }
>
> Because devm_rproc_add() is registered before devm_pm_runtime_enable(),
> devres teardown disables runtime PM before devm_rproc_remove() calls
> rproc_del() and __rproc_shutdown().  When imx_dsp_rproc_unprepare() then
> calls pm_runtime_put_sync(), rpm_suspend() fails with -EACCES without
> calling imx_dsp_runtime_suspend() or imx_dsp_rproc_free_mbox(), leaving
> priv->clks enabled and the mailbox channels and priv->rproc_work able to
> dereference the freed rproc and imx_dsp_rproc structures.
>
> [1] https://sashiko.dev/#/bug/linux-a6e902ee-9958-4d44-96cc-d854c6256124
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110105436.24=
87822-1-hj351016@gmail.com?part=3D1
