Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246562;
	b=uOOq0Lo5z++p9ZTlz1TEvgV6ZiU+4V2lqsOZ5n6GD7Fr3/PRPkAvscfnNRghPLKI4c1b
	 Cz1/NT48FTPh9mp3u5lrA7J+3lkTREwbT9GAd8ceWhk6gPlkUhlcuvtcAvhG1T1fr2Mxj
	 t/A3MWXDSGJzIZN5csJmoNp4SqgJoTWE6QhfzmpO4M1SGfPmkVIvBU4q8jzJNi3pRJoBT
	 axhRphPKSv952eYK2xGk9C3ZHwQwC4TBnXNrdUg+vx4/5W3WpJsNta7mECLR7WAym1gea
	 fbffmz4Vvg/uwC8p51xJSqDK4hYN6xalTnW3BVbuFOyYJjXSryWhng2l+stMKhFKTPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=hjP6rmCKcWRaM55etmAtyp814yoxD6r3cUAtIs9ccJ8=;
	b=m498ColPHteT0EteqonW5B3LCXO4FuEx6sO6eaE01WeE409Pw9q0wZY0kPzZpB5hlVNs
	 Oo6BzeIW2JjUhUydzfKCmcPNEXoOmT+uJ28WmTr67Pe7qDQth40qV7jzzWWUmw4kFD7oc
	 mVdmFX4t4bJIelFmtaUbRMKgp3HZ3tn4gIkubEu+Tc2jqhGGxiG0ufe25THK5IEXwioGC
	 lUzK+wgRJ0ShjkW0fCBUD/G1c++zhWUBJUcexTm9PoSh4UcNl+gzFvj7JZx0vXKUBzkUF
	 jDREzyyzfa/w6OoB9FPcIqtDS3r0EXFEUqJNc6Nxyj88u2GWFoV70AgTQvUDqfUxqtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4ZmSJqE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EBC606A325
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 17:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EBC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4ZmSJqE
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e8938fd01so12628356d6.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 09:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794246561; cv=none;
        d=google.com; s=arc-20260327;
        b=dLLi5Uaft1tKLnhH4DPR62pTmKh3KzyQZ+lXJ8qqkoRh4Tm1rrAhUMMSOz2v7w4H2e
         QxB+HhG3pMMjnhuNnOXEJjTlaesTROArzVSwXWMQYePYgBj0gl9sO9/UE+OXuimGdNum
         dH/TAhN6ya6BQ8tHbwlhF2JNkyN1ZSRHOJVVNGiFBHonA5YAjwfymY/phe7nemYOIqc2
         4UksM7jVv5rc4DJqNj8C69Ln+DAvVhMPnSsPboFAnqUd+QZVmc+WMSlIoR2Np/AVwS99
         EaytkRw1ZtNweu6gnBa4w4flXhVXz0q7W1SteGxoEDZ+SlYYcA2EWtXbpYl6BKa9RSTP
         cocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hjP6rmCKcWRaM55etmAtyp814yoxD6r3cUAtIs9ccJ8=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=kDRvoBAifGvYtw3UaxBN16EkUaxDR/oeLrdXDpOHOOQHHngLIxzQYzFGSYspocoH2k
         oSB8NGW2EQXCKumJR8VeApBVoLTGUfJILEr+d7750qufagZciQqUHAnz44SLCtmD669b
         n2t7F/Lc/4tY0OxOaioOgJSGvU6lv96RZlL83I+B4okDnE/TblUH0zclcnJe1Bx2njal
         1tnAlKxUDxOguJsGejBgmbbZoSVEUc7pi6eY0Cw6DP1+hadWBZBREbfz8W6r2wgtelZb
         fFxM0NKQ6BZBLmflgjTQTLrwIazdEjXXxPmnNoxGt+EsSQ01Yx4+V34t4BveAJAysEPF
         p9Vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246561; x=1794851361; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hjP6rmCKcWRaM55etmAtyp814yoxD6r3cUAtIs9ccJ8=;
        b=l4ZmSJqEMrmOZiXrulGItZ8xhMySqg8bEa59vu22vr2ojbZo/3t7micKZXeFmWUkIf
         sncyVWdeuVz711KNQAORUy7zmsIdn2od6RfVz7YVQ5vRXaE2NRNfBz3yFR8QPJCUlYCI
         IsFKRbWAwOdq4RYfvIxS4t4WD5KoLr3k3DcUPa8mJxhWOYnChtb7y5rHUTa9i94nVeHa
         wfWNBgkMtOX61gcG132OiCL+MMSaTYxn9MT16tIdNtZrJRrE7gxsDIGEDM3nIqhqJrjJ
         wTwxHaQQluNR0u5GP89If+M/7ZwDnyTaYF8xW/SaVh3myDCCtQKqVTmmYIQbRhZgrm65
         q0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246561; x=1794851361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjP6rmCKcWRaM55etmAtyp814yoxD6r3cUAtIs9ccJ8=;
        b=tKFtsTLgrp/blWLs6FVuh2isFh8A8E0JIiRPqjCXwRDkCdtO9csBogDhdjBpTaPuKL
         09GztClqcdCc/gOM4HYZ8kW/7x9dxRS5AxmDAyr+QjzQoYiA7dn7EyZ5JeOrnN47VrGl
         phnjcHMO8zLj6q3R8uBkB+1OTt4mZBmhRcOHD3OZ8NKfPRDYS52Tk9+mD/zrkoFWyev1
         yz42xs+XetJNHKPqesoLKeI4MTQBD2Jfw4HUEmqhajZ+HDgB8FpXAwkFkpOEVG3ItvIh
         nK9hsr9lWXk+thoGClTgFGvCkkvVdcyHDEUFgU0kVmgmZf0n7qQ7lGT79mkhUw9+diid
         lb1A==
X-Gm-Message-State: APuU4Z8DKRFkm8v942HWctucdKoOuy9Ui3TETV0eCQy2rGlp0s0AGRys
	+x0VGI6AnH3kcxgYQj3knxqAnxp5VLdgqJUOPdQVwn+0DQ0k/0GwpSZ2pQm2E5Ej/czmqqgciAN
	UyTNUaKmsbcJWZLyZUdx9vmrQBhD7oNpILTO2P+0=
X-Gm-Gg: AYBFou1sMVblzBqNrw6IQqittl8zTzVPyqyd3m+qhghjyaJL8j3lkFqySggDL/LryVP
	DvDNe34yVVwB3ImYFZhK5i22T5vg5+EWztJYeLpzkr0GPtcDnjU03jM7ojJiU0cGTpeNNApiQwM
	AeRAr0rH6DptUKbIHsp/fDNKfyC6/2eCMp59oMyT4fOkH6JtXuC7UIohUAniYU/zINB5KpwRGV6
	mbCjwDeJlNF/M6t7NRhb1Acx5Y5pHvD5/99HRE1/c28Q3e/TZo/2J8bNcefUB66/0IrekxULOlu
	pgfVCpJ9fm67m2RsXDw3GfO9GbKjX/ifo1wNWa7Run9vj4FIMVN2BovcgjjaKGrgNsw4Hiz9kll
	P9fRM/whSOH1POL2Kc9zKsR2ifJbXNk+m5l51n1s8C9eQz/OB3TtHYwsESD1stEBdxNfP
X-Received: by 2002:a05:6214:518e:b0:91e:b874:12a8 with SMTP id
 6a1803df08f44-91eef90b51dmr6045326d6.24.1794246561412; Mon, 09 Nov 2026
 09:49:21 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109172155.1851386-1-hj351016@gmail.com> <sashiko-outbox-205326@kernel.org>
In-Reply-To: <sashiko-outbox-205326@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 02:49:09 +0900
X-Gm-Features: AclHuK-SNqa6w4k3WZEkGgV9OK01eh5S7VPHF6S3sDKsccoV_mm5EI8qfmCF-w8
Message-ID: <CAGr5VtMyaAp+xG4YthcKLPKD5XZwWQxmHPveOhwpnGKuw76m_Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5659: cancel jack detect work on removal to avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, and apologies - this is already fixed by ca3efbaa8aeb ("ASoC:
rt5659: cancel jack_detect_work on component removal"), which I missed
as I was working against an older tree. Please disregard.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 2:43, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: rt5659: unguarded cancel_delayed_work_sync() in
>   rt5659_i2c_shutdown()
> - [Medium] ASoC: rt5659: unguarded disable_irq() in
>   rt5659_i2c_shutdown()
> --
>
> commit cfae689e1e0a124463e941d5a4ef73f9a8712aac
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> ASoC: rt5659: cancel jack detect work on removal to avoid use-after-free
>
> This commit disables the client IRQ and cancels jack_detect_work in
> rt5659_i2c_shutdown(), and wires rt5659_i2c_shutdown() into a new i2c
> .remove callback.
>
> > diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> > index 68f7d5673e190..721c742c0efda 100644
> > --- a/sound/soc/codecs/rt5659.c
> > +++ b/sound/soc/codecs/rt5659.c
> > @@ -4337,9 +4337,18 @@ static void rt5659_i2c_shutdown(struct i2c_clien=
t *client)
> >  {
> >       struct rt5659_priv *rt5659 =3D i2c_get_clientdata(client);
> >
> > +     if (client->irq)
> > +             disable_irq(client->irq);
>
> [Severity: Medium]
> Can this cause an unbalanced double disable_irq() on client->irq, or
> disable an IRQ that this driver never acquired?
>
> The component remove callback rt5659_remove(), added in ca3efbaa8aeb
> ("ASoC: rt5659: cancel jack_detect_work on component removal"), already
> disables the IRQ:
>
> sound/soc/codecs/rt5659.c:rt5659_remove() {
>         ...
>         if (rt5659->irq_acquired) {
>                 disable_irq(i2c->irq);
>                 rt5659->irq_disabled =3D true;
>         }
>         ...
> }
>
> When unbinding an i2c device that is bound to a sound card,
> rt5659_i2c_remove() -> rt5659_i2c_shutdown() calls disable_irq(), and
> devres teardown of devm_snd_soc_register_component() then invokes
> rt5659_remove(), calling disable_irq() a second time.  Conversely, if the
> card was already unbound before i2c unbind or system shutdown,
> rt5659_remove() has already set irq_disabled =3D true and
> rt5659_i2c_shutdown() disables client->irq again.
>
> In addition, devm_request_threaded_irq() failure in rt5659_i2c_probe() is
> non-fatal, leaving client->irq non-zero while rt5659->irq_acquired is
> false, so checking client->irq alone disables a line the driver does not
> own.
>
> > +     cancel_delayed_work_sync(&rt5659->jack_detect_work);
>
> [Severity: Medium]
> Can this call cancel_delayed_work_sync() on an uninitialized
> rt5659->jack_detect_work?
>
> In rt5659_i2c_probe(), INIT_DELAYED_WORK(&rt5659->jack_detect_work, ...)
> and rt5659->jack_detect_work_inited =3D true only run when pdata.jd_src i=
s
> RT5659_JD3 or RT5659_JD_HDA_HEADER.  When pdata.jd_src is RT5659_JD_NULL
> (for example when the optional realtek,jd-src property is omitted),
> jack_detect_work is never initialized and unbinding or shutting down the
> device triggers WARN_ON(!work->func) in __flush_work().
>
> Guarding this call with if (rt5659->jack_detect_work_inited), as
> rt5659_remove() does, avoids canceling uninitialized work.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172155.18=
51386-1-hj351016@gmail.com?part=3D1
