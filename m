Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793196869;
	b=n25i519UeVFS0M38DgQyItZ5k5L966vRcDG/Iv+6KuZOGpgYliIG5vPGgxkVQzc/JACP
	 KMRb6zzaD75rh7/rTU0G1gRV2ZZM8hfSkWRXs/lWPEcHchoqctwS6ffeQQjCnwxxWqNvs
	 PkfEDJpTtaPZHTYXYmXiy7ulcKluXk1JtgJ7glT2rc8tYuoYSpUTmGkj9F5kEZlEnsj0i
	 dxcxWIh9H/T8QeGQxATxMczqCHLi+jG4E7T6o9WXEuNjKf+z6t27SAJkoUQbpyZNsr/9c
	 wqy0sL5ICGJDKC/sHptyX/Phi4SNC6wrKlk/JZ/XoZNVlJK3CWzDBZh6mq9hmthwBTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=m6JPg6P2lQiXZAVVAvuoBXsXsYZGvkI8+hMDRwhaEtw=;
	b=CGTidE46mTY1M5L10xwL5JWZbivxbPgLTepC8TI9pbdzNXmulCwoGK0zT7APKS032lHB
	 mytRod3TvNqY7JSt5SFxe73zNejg1Jdhy24itzvuFwAD+QqIa9ax1VvaG4vTCFFK0ACr7
	 mXf9kwgCRs2fmrmnGIJXAzt+G/gyPyEC/4iljdC3VnO58iCSdECW1OKkZfWEapPRd3mqb
	 wq2ZDxsz5regnD4h9ETsCV7Smn3J0sMQIA5cqSGs/DIqlziTnnMsJe1RZdQsJnlxQ4/+3
	 /rYmv9J3Mm2PfIJRjdPspDeM2EcQ+y4x76LHyImABRg+Vz5Xed1CW74Atzr+52bTHbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=Wm8J3O3q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDC7606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 14:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=Wm8J3O3q
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a595487d43so8055051fa.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 07:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793196862; cv=none;
        d=google.com; s=arc-20260327;
        b=gtcbSxLkgg5dfbms+EHDtHGGeqZ3wThNrkH5mYV2Mgq8NSKtSI/p46y41V/XNSN+Sd
         aIUwGFHN/SH9cKvAEzN+8UtQft3jdd68MWpIEtCanHX+v15x8GA/e8tbuSwnuAWLTXHN
         THmSp2gVQ2Lp1sPDauoBUAy7/IKNn3dWswwpAgv8qUfbM6RV68BhvpXdFfMdRhOxk8Gl
         xSfbjQSMlEojWJWerR76fJsy45MEMtyL9kEx0KWlutB747MggsHIg749ITXRBNhgge5M
         qhWyRvHduUMjxSxYBlVhUVvBCYZfajA5VqUDxy/m0GLdHSNC+gTXPQ/WutBB1XQOBpou
         e8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6JPg6P2lQiXZAVVAvuoBXsXsYZGvkI8+hMDRwhaEtw=;
        fh=UDmiFjDUsl58/oI1pbxKLXmAuoEiB7qNSJQzd9c7Gr0=;
        b=oS7SnnLxbkg3ghbkJZ7YI8DS+xoUrnsgKv5a7z0NAHaHubjFmaQ5W73rYdYapJxURA
         k6Do4cyDTkCmI08igft4aIOqni62aohgcuDYidmBTJIhOVBaseSWIcsB5HygwOn6eUb5
         0jw15sVH8hSczpci4K4zgIDNnMoweo3LqCKJOSbYreY5MJMXR80v0/nw7mgi/D4SK6Hk
         QbYn1wXs0RSd24VUeYSpqI7og25d8oxpJwRgMQ4OIe1u9bzT1NS4zB/YZyRzwB84kcok
         wPwCEjDec9mEyWA9q/doicaNYYg0I3Gem5GdI/ZUJemS60rQZULVuEALsdM/rmONVLM6
         JfRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1793196862; x=1793801662; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m6JPg6P2lQiXZAVVAvuoBXsXsYZGvkI8+hMDRwhaEtw=;
        b=Wm8J3O3qHFxA15A+LK2W0Vo+Rgm0DaL7G2YdwFn8ym4A/9fVaOBJANzL0tb9c5zTd8
         Gl/8RkaVKzXj2FZj1lTiTCtXdxFF0OOzFX1bGgKRgQiKbM0friyuHKwLbRZaOJ337M4q
         n/H50IfX27E2TF3W71ZdqfqFkHOLjVTBdfm1yMVAcV/AMMO9gQmYU1d7Jwn27BoaqPuF
         pjWhmbWjyU9AvWJpLQHFmSUeI45vzbtCbHdKvCb/0cnP3N/50u6xQ4VGi6OxVOH37Nik
         0GG61cVi5Yo5y7qdef1/h435Agnpspvrhck/5BuoONp7MbabpPXSPI9V3Oi9phPj8caN
         9qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196862; x=1793801662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6JPg6P2lQiXZAVVAvuoBXsXsYZGvkI8+hMDRwhaEtw=;
        b=X7a/SAbvQDkumBdV89PmHUQHArq955rqQXYlBA3UG8ZvqNOtRd2QSoVzC02CusZiBS
         kRsUV2nYpIOJKg72tEO81zZDxPE7osE/6plAQdVMcU4rgKaFXa6MhIP+OqCfTUzYAb+Z
         uj9GdnF/aolZHjkyb/xern7F2P4fp9dkTTZM6NM5E8tPdnlnGHBctUQvo98cLThYCLKm
         KqFV5aTsdRI9s6Qez7UBRJDASMMwSUr/5PP7h98xcrZ9dbfu3BTo8XtdsgHFrXNzZAEE
         tkt0V/GyNDfb4WWGQ6hrMWN5nzuAXW/GeGS1mcvn+mWxTOmd0wCiYhDnfMTb9Y1UWjDW
         weRw==
X-Gm-Message-State: AFq9FYI5v52RLs7Q6wnKFo0PBiq/bjbOYgOGTvGbcqd6nX/Mf79Or//a
	eIqiNvuHCu/sa232cQ8vJtJMkMNMKBg6l3OjJF0tcyBEnKFnl6kY13tYD3uDlP5Y+u3wyPwIgNz
	gJiocVIVwUrKzK4C0+IQgKSw3PFoXJNxN34u7lHnC8KcyxK46BAaJETABJmlUpA==
X-Gm-Gg: AYBFou0K70Er2m3CV9D+pG765aph8OhSIIl/z1gu8ViQNyc/644QA+Bcms7JjP/Zlg1
	Pa7c/NGbTC2MSfnmMNVDLm6Zj060vdGgVKZdh6DWF6kfK06WIn3Mdz7tSIE6Ki59OcA928DBd5A
	o1/ncG8UkqNSKndW/Iab/4WjxQqXmWmHD0D9c+UmdZiULlECV7WjW2u/Z6erRFAL7vwD5QZ82HA
	jXQHDrlbxz6tGUZJePXRvBgvhKIb63DL0TPEZP14yqWxsIJp6VlNyUWVHlzGA89QeA8376LXhiz
	8yWdyDIh+G5zmapOcOq2+oyISDddjn9cYZgGqDqrhQ7cEvSJA56v9aOoXRIM5I098qGckjGBw65
	VQDGWK+zUuzsLIV74+RUfrAj4repG/V+2Y3BKtF9+rdP6Hwc/sWZErFWiO1sMMFJEJ2k=
X-Received: by 2002:a2e:b88a:0:b0:3ab:1fc4:8eb6 with SMTP id
 38308e7fff4ca-3ac9cf05a40mr5972811fa.5.1793196862374; Wed, 28 Oct 2026
 07:14:22 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793089479.git.zihanx@nebusec.ai> <cover.1793109154.git.zihanx@nebusec.ai>
 <50f8970ce7800947332f6203626abbe1933997eb.1793109154.git.zihanx@nebusec.ai> <sashiko-outbox-187949@kernel.org>
In-Reply-To: <sashiko-outbox-187949@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Wed, 28 Oct 2026 22:14:07 +0800
X-Gm-Features: AclHuK_JtpA67RPAe_iqQq1LpIMxrw3scYa5SbswP1AFrxd2B406TRRxC7SiLTU
Message-ID: <CAANe3eSvb040gP3PgkZ5jBj8gizfCFGuBCoCPVi59_E=T4ROPA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/1] can: bcm: limit RX operation resource usage
 per socket
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Vincent Mailhol <mailhol@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 9:53=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] can: misplaced kernel-doc comment above can_rx_register_internal(=
)
> --
>
> commit 6e185f899c0a564d22495ef1e055cc4b9c9b27f0
> Author: Zihan Xi <zihanx@nebusec.ai>
>
> can: bcm: limit RX operation resource usage per socket
>
> This patch bounds the number and total allocation size of RX operations p=
er
> BCM socket to prevent kernel memory exhaustion. It also introduces
> can_rx_register_with_release() so the socket's receiver count remains
> charged until the RCU grace period completes.
>
> Link: https://bugtracker.nebusec.ai/f/11134
>
> > diff --git a/net/can/af_can.c b/net/can/af_can.c
> > index 34fe3b28d576f..a3f0ed35fbb52 100644
> > --- a/net/can/af_can.c
> > +++ b/net/can/af_can.c
> > @@ -441,15 +441,20 @@ static struct hlist_head *can_rcv_list_find(canid=
_t *can_id, canid_t *mask,
> >   *  -ENOMEM on missing cache mem to create subscription entry
> >   *  -ENODEV unknown device
> >   */
> > -int can_rx_register(struct net *net, struct net_device *dev, canid_t c=
an_id,
> > -                 canid_t mask, void (*func)(struct sk_buff *, void *),
> > -                 void *data, char *ident, struct sock *sk)
> > +static int can_rx_register_internal(struct net *net, struct net_device=
 *dev,
> > +                                 canid_t can_id, canid_t mask,
> > +                                 void (*func)(struct sk_buff *, void *=
),
> > +                                 void *data, char *ident, struct sock =
*sk,
> > +                                 void (*release)(struct sock *sk))
>
> [Severity: Low]
> When splitting can_rx_register() into can_rx_register_internal() and the
> exported wrapper in net/can/af_can.c, can_rx_register_internal() is place=
d
> directly beneath the existing kernel-doc comment for can_rx_register():
>
> /**
>  * can_rx_register - subscribe CAN frames from a specific interface
> ...
>  */
> static int can_rx_register_internal(struct net *net, struct net_device *d=
ev,
>                                     canid_t can_id, canid_t mask,
>                                     void (*func)(struct sk_buff *, void *=
),
>                                     void *data, char *ident, struct sock =
*sk,
>                                     void (*release)(struct sock *sk))
>
> Doesn't this cause scripts/kernel-doc (under W=3D1 builds) to warn that t=
he
> prototype is for can_rx_register_internal() instead of can_rx_register()
> and that the release parameter is not described?
>
> Should the kernel-doc comment be moved down to the exported
> can_rx_register() wrapper (or updated to match the function it precedes)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793109154.=
git.zihanx@nebusec.ai?part=3D1

Thanks for the review. I=E2=80=99ll move the kernel-doc comment above the
exported can_rx_register() wrapper and verify it with a W=3D1 build and
scripts/kernel-doc.
