Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B3A3370EC
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183086; cv=pass; b=N/6u4qawa6i9M8s/hh/7ZZBfkYttq1UrOIPCniHsPtisvoqlPYXtXzjGHZGggGQV1jbp6PhE/p0taydJIYg9goS4xg2kc28LlWQfFVSjFYSAD3fMiApGxnQpMU43ae+VFN7TUBAi/2GBpVsxR7mr7dIetAqi/6ELnCvP996+3wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183086; c=relaxed/simple;
	bh=AQUQcUjRoYf4C9UbV6Nt5xsI+KWuVC3ynY9uYHP6YCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jx5iuSI4/PW1uIq5YzRk6UAjtehhamD3SMoqMo/2kcC+OzCXP5ObZhhOk0kf1wf2S61GvfyUQdUJJMvyOX0WZsJCuuc9mWjJdtKWqrnvLxmbbiQQYrdIzlL+yE4Xxhqsf236A12THG+0Qbrk6FpM2EKeuwJ1NXlsaec2MeXSrCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svp+i2xj; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svp+i2xj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce7d2adef4so5559165ad.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 02:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786183084; cv=none;
        d=google.com; s=arc-20260327;
        b=rZ/33Nho2VFPpJZh649TqIXj7lggUvK7eGYQSg0fayyjp4qH0vII0zFmGpLmGtm7GD
         L7Hq9ctzmp+kKNo2Q+ACRBbRW4pQ/DkkKfv7csen4HS7WvsSASEsJuHhbvAfRefRmHwu
         suttu2zqg2vaF9IOddIrj2Rh746rOd/9uX+UElW1jfwjheUj1wwx5lZO7dH1VG9yrquY
         EmC59A22LkUnHv0uuDL+UVe6f7uTSB7O3fW55AC4c50QeBpdupfp+762JAqCREYOpAmv
         4TKLPjL/LY4/AAr/uCu7QWwozLLIxOE6dMlbAhJfvrIt+riHhunN1kK44bNgtmYhTq0N
         iB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p99Oc2WulxAtBkn/1eRnUDyT/vg/oXBEufz/upvtijE=;
        fh=3mbWQc2KYnV1YBFEjtPx/1jzUpC/uZUzPfAesf3Pc0M=;
        b=dURc5qSxIaort+I1XTqJeU7LMKnmYcz8LZHub2gUYXuyZ1d0xMhMRdgr/fIdb1uVTU
         4Uw1Q+pdCSkPkrLm5uazK95e0S/75nfAWNfTOsuhf3qnf6SWkucgKFnuB+8azkM5aE5L
         uERu1je9eVL/RtN4DCuR5V7xWwEIY9qk40fx8f2WsGjs7i881PpjD5Lh49C8B/I3ktDz
         O52sKrwFx/U6wc4xZEKj1SQnsEy6WzCdpXaJO6WhjfabU25w/669NwQKPIdyHsbRLcAl
         33R9XzHJXIg9CCiCx6rNokF96TjpSnZLbyIF67gTRoorNyQlkykS3mrPzfPX4U5lR8cv
         T/AQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786183084; x=1786787884; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p99Oc2WulxAtBkn/1eRnUDyT/vg/oXBEufz/upvtijE=;
        b=svp+i2xj307qAgA0McTLy5D/GsT8vYIqxEErJcnGEqUeEOnqjG8RNAZEc4wFu1pAe7
         UMImsG7P/CrklxBiJOzLWEel45lqyEfceQz9GrM+Wd50k4wkFa5uJiNvjho0yn5wP2Nb
         65jkAK7yTvH2IEpPV1nELYzRp0rU4rhFNwrjDjTpHNfFVbDEC5yigSh1AOCPIb/39N7y
         DieDyITv0WfRxAgLbq62clqLNWlAFXALfaBagQVvmghKrEIEYkRGJFE9qwr96snFfVr3
         H3vWzLCWt2zB3PT5KzjxzqqIVd35gsm6+sOWucgehaLpmuDiASDrXpyZ3TvN+YxAiZeO
         0+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786183084; x=1786787884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p99Oc2WulxAtBkn/1eRnUDyT/vg/oXBEufz/upvtijE=;
        b=qNyce8+mBa3AqAZ1ZoSGmYGC8VSCyOAI1hBsTeQt+XtfiTirxjaJkfCRjts5F9PBSE
         OL7hSBYDcUWjai0XqQCQTyQrw8DatM+zkz0LAFcadJxHFLEBWL20vdU5Nm0zjVz91D6U
         +I/FxyLe9qUxqtpa70GVpQMbZh718CjkIOYdVEtgUAqk62hB1l5hLqe+R54APOhQ4zWC
         Bbhbds6IBxe2xuhhXZ8nZblXjiaRlpl1a8bUYnTHWbnWNNl2jmeHLgMvDPX3sHNjND7Y
         meSEaeeA9kYEpTnsXs8apQsbKPU41JeMnsFsG+WkJfTxidHMnA+bp9b9zVjx0sAR2DH5
         Iuhw==
X-Gm-Message-State: AOJu0YwFRMSabMR6FBP35FgG994Y/9SvcfYY8R3dR0SiRcnsoSwozT9H
	fLEdehDBGEv5WrOJaJY593f1uPvtklHlP7O/oSYqFIl6gDl3mXaeFDF7lY3kumcqdV4jnpLl03s
	3chpdD+DJxQOaB8xYMZZOIFmeT3Gxu59wm7h+
X-Gm-Gg: AR+sD13l3ApGv7MTH1UWvIXcrjxG/oXLGJnp0Qpa0EkjgPF5TbmlOIsZJRwjikJoSgu
	1xxzw94ALtr1qXwoiMaixGYnL3BVcDSFVYpuLPtIqm1qo9rCiyQF8MHIpFfqVtBcCkoy/twstgn
	eEWCcfTMb2mk9ZeffrQbjBR2ZDYdZoDASsp8o8KiBFAMOGMAUbd4C3EWactJFVw2PmWBJIP+bqc
	VCEgNP+1fmLk8O4MOu9qjihkd8y1bATXqVX3xwqtKReZwNIsXlVQZZieUiKjeij4VUfjSOShnYB
	i2Ju2x6VaD5tGTDMZgNSY7tfVRIHPizfh3rg88QxKkYr5Di1/DcOE/Xla9fv9AVNO0yyqE1k4VA
	1rwdUI9rgAq5wXq3nv3v5mnS/DJJ6oanuDWnm7zaUMyNkTsrRT8VV8ZsSOxTOvecC2K4MzPyAKt
	uS6cja+FBMeeKF3K4=
X-Received: by 2002:a17:903:37cd:b0:2ca:d9b3:715e with SMTP id
 d9443c01a7336-2d294b4b5b1mr129349815ad.9.1786183084203; Sat, 08 Aug 2026
 02:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807090945.41690-1-phucduc.bui@gmail.com> <20260807090945.41690-2-phucduc.bui@gmail.com>
 <20260807091846.2CCA01F000E9@smtp.kernel.org>
In-Reply-To: <20260807091846.2CCA01F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 16:57:50 +0700
X-Gm-Features: AUfX_mxbTUFPg7Di01lp35B6Qz2fWJS8SBUdIDBT4jVPvbSAez6A1XxwG-Js3g0
Message-ID: <CAABR9nH-zL25=rcmKtLLe1RVZ=P=-JBrATptV_ODsxh2exbqLg@mail.gmail.com>
Subject: Re: [PATCH 2/3] tty: serial: imx: Propagate errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The global `imx_uart_ports` array retains a dangling pointer to =
a freed `sport` object if `uart_add_one_port()` fails during probe, or afte=
r device unbind.
> --
>
> --- Patch [2]: [PATCH 2/3] tty: serial: imx: Propagate errors from option=
al IRQ lookup ---
> commit 1b33dc8f639bc337c3928860fbfd0de822e373c4
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> tty: serial: imx: Propagate errors from optional IRQ lookup
>
> This commit updates imx_uart_probe() to properly propagate error codes
> from platform_get_irq_optional(). It ensures that errors like probe
> deferrals are returned rather than ignored.
>
> > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > index 251a50c8aa387..4224454d360ef 100644
> > --- a/drivers/tty/serial/imx.c
> > +++ b/drivers/tty/serial/imx.c
> > @@ -2463,7 +2463,11 @@ static int imx_uart_probe(struct platform_device=
 *pdev)
> >       if (rxirq < 0)
> >               return rxirq;
> >       txirq =3D platform_get_irq_optional(pdev, 1);
> > +     if (txirq < 0 && txirq !=3D -ENXIO)
> > +             return txirq;
> >       rtsirq =3D platform_get_irq_optional(pdev, 2);
> > +     if (rtsirq < 0 && rtsirq !=3D -ENXIO)
> > +             return rtsirq;
> >
> >       sport->port.dev =3D &pdev->dev;
> >       sport->port.mapbase =3D res->start;
>
> [Severity: High]
> This is a pre-existing issue, but looking further down in imx_uart_probe(=
),
> does the error path for uart_add_one_port() leave a dangling pointer in t=
he
> global array?
>
> If uart_add_one_port() fails, we see this sequence:
>
> drivers/tty/serial/imx.c:imx_uart_probe() {
>     ...
>     imx_uart_ports[sport->port.line] =3D sport;
>     ...
>     ret =3D uart_add_one_port(&imx_uart_uart_driver, &sport->port);
>
> err_clk:
>     clk_disable_unprepare(sport->clk_ipg);
>     return ret;
> }
>
> When this returns an error, devres will free the memory for sport, but
> the global imx_uart_ports array still retains the pointer. Can a subseque=
nt
> console operation dereference this freed memory?
>
> Additionally, the same issue appears to exist in imx_uart_remove() when
> the device is unbound:
>
> drivers/tty/serial/imx.c:imx_uart_remove() {
>     struct imx_port *sport =3D platform_get_drvdata(pdev);
>
>     uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> }
>
> Should this removal function explicitly clear the pointer from
> imx_uart_ports to avoid leaving a dangling pointer?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807090945.41=
690-1-phucduc.bui@gmail.com?part=3D2

This is a pre-existing issue, so if it is confirmed to be a real problem,
I think it would be better to address it in a separate patch.
For the current patch, I'd prefer to keep the scope limited to propagating
errors from the optional IRQ lookup.
