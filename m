Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843DA3EB0E9
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456548; cv=pass; b=pcnMdtJHxADgfqnIxbfzh9oyvArsm19pR8Wv9/KtSzBaefJBzOfNdv4lB4gS+KibS957SzzxXAbkrzH0nhdoT3/+nqGZGcSG2Zx7lHMhq430l+JDF6hj2Fmoq1YdY8/nZh05/5jlLpFhnmfSuFN0ifGw0r63cgdvLpG6UN8CuCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456548; c=relaxed/simple;
	bh=iiZfiNLvQe753e5CbGbo/rwkzNBEF4NJy9hV6bLGPQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSFas8ez1u1nahDcKRcv2X2dVC9rDfCY27+LJfIe0c+Dou+OPQLuEX86p4vU2Unn5PEhRCnR3EjbCAfCrAyPl+8M6bR8Dwg8qUj+iJjVBaH5s6uDDIoyBQxpum/8pyPOTVp0yLKfwgj/m8GcO4kB/MkiggG/jKt4tWRf1x9qMZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=NTQpBlJZ; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="NTQpBlJZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381216921aaso4260236a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 13:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783456546; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/99Ond9shrqXGa5d6vHcHp7PQc9KnokTG00ihIbNy++0+X3F0szfDBf58OsF6sYIy
         FanBhc9Ts2LcKT4dCtg2WbVNs+REjIqHebQ4r9rxA7PJH9qtld530jjJ+UDod31MfaiG
         2RqF9+YaB3N6pLQbJC6xK1exhvEo29RfR2Drrt/NL26YdaqG2YCWq1cB4F2h7UXucDr1
         p3VTVGH+55N8j/8nqSssiJg1sXuJxUA4KqcMUaaudvD0cTmJ8MU1IlJS6oC2qjSDDdFl
         KiAfjpNIBUWbHwo06APOgx+2Yinh7vLS/pQ0UxYqxMCIDc4NcvtcDi4pBvDoAS9KPNo9
         xEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H6gF5hZRgMsv9HwOUXibH8yAddhJAsk4+IJHjYkOaeY=;
        fh=HNxY0imUIY80XyxXzmpYCPces3Mft1w27LivABBHfV0=;
        b=khAZVhM5GcVsYk8koSWjWaguoQSHIDV3ZxvSALNCjVgV63lIrsuWIX+bcqwPkKY5vq
         v0+klQjLw3gWAjDn86It+g8Nm/cpe3SpKtdwX0xqsvpq0puwO+0h3Ngoo0HCjzACoWn8
         CVIHzAJiSVWtVu2qDQwCDN5QQw8DlLKkSLidp3NC/5r0dYiBfFkNHSSHf2kwsTvTo/ou
         vk7o5dU71GX9nWCiWx2JLvfmxSy/st68jwJZRfTwiSwlenp6Mrx1VVBMEYOBYBG4yNwG
         ujoCyzspbPmCFdGajXpSD+VUR2E70ncqnTQAIKc6wa4YeOkLS9kgPqePiLdJy6cLTcrl
         SUKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783456546; x=1784061346; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H6gF5hZRgMsv9HwOUXibH8yAddhJAsk4+IJHjYkOaeY=;
        b=NTQpBlJZFhPmZNOkbv+wKXRlvQVKvRJ1uZ28i9kFkPOLkAQFq58Nx1TVxnnFTjB6BG
         Vly/oD9TE1WLt4eLgeBCE4P3XlJBYV8bE+hkfHXPtlzIgPjFZV7uA+fKm4B6o0bEQ/vq
         6u+BisedXFwZAgnFBgB5lkov2bWN/hTrR5+QZix5uHB/3yS+CdXYKiaNh5D4ZylhYgJN
         dUI9OQYG6kNC/G8K/X8xT9Gt/ghB0WuxXLpB4StKWk5Ayza3VVGPgZoLJytZ6+fVZn3H
         9nTySE1iwhcIUUFz6Or80fbdW9HG4xHawRYYM9X81YUilp7qXjFri+BzHlel3W9EfBHS
         36+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456546; x=1784061346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6gF5hZRgMsv9HwOUXibH8yAddhJAsk4+IJHjYkOaeY=;
        b=QjiBEF/xKiOIEf2Npdi5fzBMi3yLNl39sQy9Jfz3KdOqCv0OnjonZiXeIo9PNeg1vO
         j0c7F2xmFqdfaCPKxiY39jkCa5MWY21Yi5D0V4rTJLDCjPXybdxNc/2f1RNCKqi3vy8D
         rDtJu2gfGaUuuaiz0crtvy+6h68uFTWAYkzH+oTcPB2AJ1cxRwmJ+l83ETVVC5UJX0E1
         EGuR7QF4IJZAbRSZLJiBEHxVAzdaefIpfzYW7bA/3TMVpvde3sXdLSB1WHvpMr8XtGMD
         V0FB6zR6QI7o95WuIhoCdStLj8eyIyRT83VqE0nMNyx8qugpn+WTh/mBFmlZJdaUOaU2
         mIeQ==
X-Gm-Message-State: AOJu0YytzN661DFyQXin0K/QbjQn+gl+lerOK10AMAUNlERK0UbUXddC
	e/thCfnrGbockhSJKKEr0tz0DekuJRDYS8hfihWJ/Txq+DjrHRB/0tY6LUiy9eAJE2sUoltqdpQ
	bZ9cB/e5YZV0w45eRMW6Ci+ZUT/2pPU67wWYvy4Y3zNbRKXNFam9TaZvzZjY=
X-Gm-Gg: AfdE7cmgLcx81kV9/zhHI87QJLI9n4aba0scdXYrRRgFTZanYL+e4jaet9r+GjLNfcT
	bLvWbUFSuzGOfCN2AiOfUQPtzHQry+Mq/BenNyhG1j9BHlbV2ulqKUT1zpjAbPoq95sLLhP2WW1
	V1PwOeYGKlUmNSGIZt+s/CVFsPb8w2xOMqnrDe5Q+LG8fQ/9WGmPJLkeJRsdOQaAzE1dO9Te3ac
	e6f9fETHAC+Dme8eaW5dEAejcxc9WDCKLMWlfbQm//ZuvQI9FKutQK4cJBM8N61KWBQ5i1PkH9M
	/WV3J5hpH4sHGixjfU7UpNB3A+fP
X-Received: by 2002:a17:90b:2604:b0:381:a766:efcb with SMTP id
 98e67ed59e1d1-387565086a8mr6741808a91.4.1783456545860; Tue, 07 Jul 2026
 13:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260705010005.1169943-1-xmei5@asu.edu> <20260705011358.6D2181F000E9@smtp.kernel.org>
In-Reply-To: <20260705011358.6D2181F000E9@smtp.kernel.org>
From: Xiang Mei <xmei5@asu.edu>
Date: Tue, 7 Jul 2026 13:35:35 -0700
X-Gm-Features: AVVi8Cf5Fhcp-fmRuS4_CBozkIoQj-q5uUFd0omIdRZhH_1Kd3O9_nhaokPHsN8
Message-ID: <CAPpSM+TQv51ebrx_J2o3GKskGUUZP3G4-XAFj0mMSkZcH5-VDA@mail.gmail.com>
Subject: Re: [PATCH net] can: esd_usb: free_candev() after unlink_all_urbs()
 in disconnect
To: sashiko-reviews@lists.linux.dev
Cc: Vincent Mailhol <mailhol@kernel.org>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>, linux-can@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 6:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Moving `unlink_all_urbs()` before `unregister_netdev()` introd=
uces a memory leak race with `esd_usb_open()` on the RX path.
> --
>
> commit f21a9588c02c39e2094757bcdada4fb7aca593c8
> Author: Xiang Mei <xmei5@asu.edu>
>
> can: esd_usb: free_candev() after unlink_all_urbs() in disconnect
>
> This commit fixes a slab-use-after-free issue by killing URBs before free=
ing
> the CAN devices.
>
> > diff --git a/drivers/net/can/usb/esd_usb.c b/drivers/net/can/usb/esd_us=
b.c
> > index d257440fa01ff..34c0ca1872839 100644
> > --- a/drivers/net/can/usb/esd_usb.c
> > +++ b/drivers/net/can/usb/esd_usb.c
> > @@ -1385,6 +1385,7 @@ static void esd_usb_disconnect(struct usb_interfa=
ce *intf)
> >
> >       if (dev) {
> >               dev->in_usb_disconnect =3D 1;
> > +             unlink_all_urbs(dev);
>
> [Severity: Medium]
> Does moving unlink_all_urbs() before unregister_netdev() introduce a memo=
ry
> leak regression by racing with esd_usb_open() on the RX path?
>
> Previously, unregister_netdev() ran first, providing rtnl_lock
> synchronization. Now that unlink_all_urbs() runs before unregister_netdev=
(),
> esd_usb_open() could run concurrently if the interface is brought up at t=
he
> exact same time the device is disconnected.
>
> If this race occurs, unlink_all_urbs() could scan the buffers while they =
are
> still NULL:
>
> drivers/net/can/usb/esd_usb.c:unlink_all_urbs() {
>         ...
>         for (i =3D 0; i < ESD_USB_MAX_RX_URBS; ++i)
>                 usb_free_coherent(dev->udev, ESD_USB_RX_BUFFER_SIZE,
>                                   dev->rxbuf[i], dev->rxbuf_dma[i]);
>         ...
> }
>
> And concurrently, esd_usb_setup_rx_urbs() could allocate them immediately
> after the check:
>
> drivers/net/can/usb/esd_usb.c:esd_usb_setup_rx_urbs() {
>         ...
>         dev->rxbuf[i] =3D buf;
>         dev->rxbuf_dma[i] =3D buf_dma;
>         ...
> }
>
> Could these newly allocated DMA buffers be permanently leaked since
> unlink_all_urbs() has already completed its cleanup pass?
>
There is no leak race. RX buffers are only (re)allocated via
esd_usb_start() -> esd_usb_setup_rx_urbs(), but esd_usb_start() first
issues the IDADD control message. On a disconnecting device that
send fails with -ENODEV/-ESHUTDOWN and esd_usb_start() returns before
esd_usb_setup_rx_urbs() is reached, so nothing is allocated after
unlink_all_urbs().

This is also unchanged by the patch: the original order (unregister_netdev(=
)
first) has the same property against a racing open. The patch only moves th=
e
URB kill ahead of free_candev() to fix the UAF.

Xiang
> >               for (i =3D 0; i < dev->net_count; i++) {
> >                       if (dev->nets[i]) {
> >                               netdev =3D dev->nets[i]->netdev;
> >                               netdev_info(netdev, "unregister\n");
> >                               unregister_netdev(netdev);
> >                               free_candev(netdev);
> >                       }
> >               }
> > -             unlink_all_urbs(dev);
> >               kfree(dev);
> >       }
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705010005.11=
69943-1-xmei5@asu.edu?part=3D1
