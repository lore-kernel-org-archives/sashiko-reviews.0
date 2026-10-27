Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793106501;
	b=axiqeMAg95Sgn8urUjZZeqSLOfgVy1uoqsk519doy0JOATu+hYi4xkQDUoR/YPyK1pIQ
	 4U84puUXoZWWP7GdLyRZuqZrxOeVgosoKThmKCMuFOawXBOI6vWSWol8hlrlKVI8P2fQ0
	 Wd5YoV0VjdakTjcsgWt66kqO1TVmlczqv5wuybxARNBUVVyEwRAm+Q6TrsncdgTHK6Re3
	 KraoTw6jpEbRJ3R7pGRZUJmJbQArrp35phBY4TTm4UvLwIDcqJtCf95ckvicoHMo/IlyN
	 G39fVZNpOWo9SSD7ev9zpkOz9co93LlZv5emglrQwD0CU8EbkqM+4oYLnRD8XjR0FQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=U7ew36HJM6zDx5mHnsffxLmpBzrWBOm6UtQ1gw6Z4X8=;
	b=D2kzO8tbYL4IIfNmTF/Og5AlTT9fJ9OfhGeE378sIYdjC6midppQ7jIUi269xIMzPkfC
	 gJeWLKEFJS4XiLUKhB+6Ms8lcqLv2/TTqVltxudinJ9GmGWIrtczS6d1GzjMmc+3pN5dZ
	 4T8i/kuGlNOPJThcI3cDyLTDlBcTHGre+XSJ5dkqSj7cjB2RXbXyulBebSTdTePjL2HRc
	 l0dYaZRv24OPzB5x5ga/Kfu7oRdk+1t+kX/nSX1BeTfqoH1vp/blPlM5nzHH09hc3dyc6
	 26Hu//qWTsoh4LhCwKxM327K6pJkjbFwbEWdjmsyfb6nXWHOf2229XhLFdbJgYsqc4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b="a8rKBvV/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC4606A322
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 13:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAC4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=a8rKBvV/
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so28222901fa.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 06:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793106499; cv=none;
        d=google.com; s=arc-20260327;
        b=DyVU8U+LS240gEkIi+sP/2qxj/kfXL2XRcYQsBlSjcdjcWHfTfM5cOY1n2PCLdrCNY
         WUs4eKm7acl41SQsXb9orMnScrM1JkiWSQdUnaKSLtb3qIBm/mtWlAbOhkiyqjBQsj2u
         7XD7NxAfL+fbqPDS+vfkf2gxnLpPb5EmaNz8VnoEmHKhUEPJcXBxiHH3wjlZYksNUfSL
         5xCWiT0q3/KtHgfdTNUvfXjGxSgt9thhMPr22KrAWRaNRnHG3JzgxnUU1+YsoBo+fEtz
         hzE0aVo1717UpYUxXtSm4ktaM5QD4VUgtNHg9lUa5xcJ8xhDZ0+4WvlHFq5MdzTm2Eg1
         5qLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U7ew36HJM6zDx5mHnsffxLmpBzrWBOm6UtQ1gw6Z4X8=;
        fh=UDmiFjDUsl58/oI1pbxKLXmAuoEiB7qNSJQzd9c7Gr0=;
        b=tBO1KEjAvWQPcfgQh2idGn316dRKLoUVvn/d8w1yp71E5Qm3QkIuYbAtn7QCdpinbw
         AiSC1J4MreP2xppx4GlcPIoRZ0e5n0kCUeSI3tPlllE8xQT87s1bHMNmfKhC/dIdZYBL
         2k2SLvqN+vTfY12DzJPwvjDNCu1l7s+O9wYfP9wRJx4YQOCyFDfrwVIxYP5ZDu0YMCyZ
         YTvZr72tM/Rho0E8i7xqa4wkqFdfsg1qQqYsk74Tpy2AucM/Ay6kqVmglU+kln9QRHdc
         gYs1kUfrtk5IG2mZsfMB8CZIpfGwJx87ZwlR/wuRcJ9/pmHZkeRYsk75AzXgNsyQsPQ2
         nnSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1793106499; x=1793711299; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7ew36HJM6zDx5mHnsffxLmpBzrWBOm6UtQ1gw6Z4X8=;
        b=a8rKBvV/MYgWXCEa0C4lp42+leh8g8k4nb+0UfNP/TlcsRrbnK3wKPC8wzyhiSL6tY
         thBvuQJiz2mpWQYgk+ehP879MTPrJQ25jTUvxf/vbn+Fzm0Hmp3D1bSqeBq11chO4uKv
         N1miwsd8Bpik0N3ZnJkHFwLceAK56t6npMvTo1XgDvl7JhEX0XCBgOUk9GCnEbIXo6dN
         KAk5Dh0oQ00CaQHY2ZpYKvCsmJaxjbZDkIOeZpopLiHnoaAyJH6c+7zZ2x2h/fKd08TB
         IR3OmTzev2KpapZO+5vZivXmdUR1prQfFWCU0rcbMO6q7RBmhO4uN+kIeDB/WJSkk3V6
         0MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106499; x=1793711299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7ew36HJM6zDx5mHnsffxLmpBzrWBOm6UtQ1gw6Z4X8=;
        b=qURhGQKXyF6YBTg9zVRuM0/FkcKkaN7ezoHUrgvOiPFvTcwJ2MQsBTAcKu285JF03v
         bCducZRiKROgxv0RU13JcuyBS171WjUrFQOoqVA+M3nLs9TFa8/JNUUr9Fwmitv7jwzF
         qSnOEX0jbQohdFPsSdCeEMab7oIosC1jQi6DiZenjJqZEablBvQJBkBsRAqhw84BKDIS
         QwGLqNHTx2ycO6YiR4qTYVQogQOYzEME9y1tXVboTtMPB2qRnqUUbZjoNFPPr4Fcyq9+
         yayUO7+rHDO3CeOlE+oP6tX6WnChZhMpEOEqMLnM/6OsmEzK+Ih+k1ESoPAKjH3sUr0g
         grow==
X-Gm-Message-State: AFq9FYIgkSsgYmmmve1g/XOm3soTHft37j6hM5LIlhFyoRsVU/mEkKxQ
	96yKBntCgqDRSgHYXXB9uI3OlMHkX0WSfaUrtsewUTFZiqkn0ioUbgnl+PpIWIzzKRJdGU+YUD1
	3iIq+2d5LL20iUYW8ARyTQ7flogP94PcRWJhWVyuzwv7+RwxkWJKkkJgwjcC2xw==
X-Gm-Gg: AYBFou2SiYoZN72IzzD0zwgEpZlA+D5EBZnddnyqPE7dP8XBA0112fmDHMu7KczEcto
	ESp8zFvBGaqAEciJlpDq4q6ELynEb2vPlvM9cyCRXYzPhtcylb78/XpGUaNheTECqFEFWE7Sg4p
	eDtz+SmEzwbqNk6cXXG8wSbXwwCBURk+9wA/AwGndvUKSfCTzgMsa4i+1WKWjwDpovaDq6/TSZ7
	V3PHRI/H97FeTzVijHultSSxgoRGP9sGjgLe29+ufJpho1AhXiBNJT/HhRdBja3neuaD9v4ancD
	dxHCKD/YQKEYl+dHwtpeqAsPMD8nNWF3ktr4CyjK2cTPHG6sCeBMinzUA5qAIYtbyAhjg2H5PhW
	Q88kSeavfGc4OYECULO4bojvJLlAOzCk0JpRMTYmK+51i2rzOU3JC5/riUcbjxrBmpT0=
X-Received: by 2002:a05:651c:1612:b0:3a9:9b74:1ba1 with SMTP id
 38308e7fff4ca-3ac6fd15170mr26419661fa.8.1793106498024; Tue, 27 Oct 2026
 06:08:18 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793089479.git.zihanx@nebusec.ai> <92fe9d7fe3a7daa2cc7de740b15ec7eaa0638b98.1793089479.git.zihanx@nebusec.ai>
 <sashiko-outbox-186443@kernel.org>
In-Reply-To: <sashiko-outbox-186443@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Tue, 27 Oct 2026 21:08:04 +0800
X-Gm-Features: AclHuK_ELhzBMIBLExUxogl5p-CJCzI9z5rBHeQ0PDed3j7Q617lXXHvExqpqzA
Message-ID: <CAANe3eSqwdmMb43pK4cBx7syOrQkqUZSJo-WnW9iZx2Qg6BdSg@mail.gmail.com>
Subject: Re: [PATCH net 1/1] can: bcm: limit RX operation resource usage per socket
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Vincent Mailhol <mailhol@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] can: bcm: bcm_rx_setup() returns 0 on frame array allocation f=
ailure
> --
>
> commit 3aff0eb4ba8d41c989dbd64aa48ab75c3eecec89
> Author: Zihan Xi <zihanx@nebusec.ai>
>
> can: bcm: limit RX operation resource usage per socket
>
> This commit bounds the per-socket number and total memory allocation size=
 of
> CAN BCM RX operations, as well as the number of pending RCU receiver
> callbacks. When a socket reaches either limit, creating a new RX operatio=
n
> fails with -ENOBUFS.
>
> Link: https://bugtracker.nebusec.ai/f/11134
>
> > diff --git a/net/can/bcm.c b/net/can/bcm.c
> > index 3d637a1e0ac1a..96d3f050dec54 100644
> > --- a/net/can/bcm.c
> > +++ b/net/can/bcm.c
>
> [ ... ]
>
> > @@ -1425,26 +1518,22 @@ static int bcm_rx_setup(struct bcm_msg_head *ms=
g_head, struct msghdr *msg,
> >               op->nframes =3D msg_head->nframes;
> >               op->cfsiz =3D CFSIZ(msg_head->flags);
> >               op->flags =3D msg_head->flags;
> > +             op->rx_mem =3D rx_mem;
> >
> >               if (msg_head->nframes > 1) {
> >                       /* create array for CAN frames and copy the data =
*/
> >                       op->frames =3D kmalloc_array(msg_head->nframes,
> >                                                  op->cfsiz,
> >                                                  GFP_KERNEL);
> > -                     if (!op->frames) {
> > -                             kfree(op);
> > -                             return -ENOMEM;
> > -                     }
> > +                     if (!op->frames)
> > +                             goto free_op;
> >
> >                       /* create and init array for received CAN frames =
*/
> >                       op->last_frames =3D kcalloc(msg_head->nframes,
> >                                                 op->cfsiz,
> >                                                 GFP_KERNEL);
> > -                     if (!op->last_frames) {
> > -                             kfree(op->frames);
> > -                             kfree(op);
> > -                             return -ENOMEM;
> > -                     }
> > +                     if (!op->last_frames)
> > +                             goto free_op;
>
> [Severity: Medium]
> In net/can/bcm.c:bcm_rx_setup(), when creating a new RX operation with
> msg_head->nframes > 1, err is initialized to 0 at the start of the functi=
on:
>
>         int new_op =3D 0;
>         int err =3D 0;
>
> If kmalloc_array() for op->frames or kcalloc() for op->last_frames fails,
> jumping to free_op without setting err =3D -ENOMEM executes:
>
> free_op:
>         if (op->frames !=3D &op->sframe)
>                 kfree(op->frames);
>         if (op->last_frames !=3D &op->last_sframe)
>                 kfree(op->last_frames);
>         kfree(op);
>         bcm_rx_op_uncharge(bo, rx_mem);
>         return err;
>
> Doesn't this cause bcm_rx_setup() (and bcm_sendmsg()) to return 0 to
> userspace instead of -ENOMEM when either frame array allocation fails?

valid: failures of kmalloc_array()
or kcalloc() reach free_op with err =3D=3D 0, causing RX_SETUP to report
success. I=E2=80=99ll fix both paths to return -ENOMEM and re-review the cl=
eanup and
error-propagation paths before resubmitting.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793089479.=
git.zihanx@nebusec.ai?part=3D1
