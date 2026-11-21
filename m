Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795273449;
	b=dFHuIl2T9OabEE2NNLXzq27LcVbOvSfhZZKIi44aDShg5j5NwbnfH0MCc4x7sVF5+dQJ
	 +UWAlxUpQqPZEeB1i32okC9STotceYeN9ZuCgD5Xkz9V2NoZDijavNyzL6uk3ezM3SjIa
	 6uCw81dg+wy229nmtjV8/6eDx9u4QKKHMUxrHA5Ca4x5JgeVhP1GJ2EgewLJRidEAnPiR
	 9VgjOxjG+U26f/4BvTOA1F+GCofzGh8YI0gDo1EqoiqrYWLly2wDMiGllM/bdaZ+1XKMS
	 K2nyb0Oxppxb1+xJTZElOxhkMeLRdpxJx7gPW4qPmcPquf/QKY3XmRua53XTeL8k7Hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+vnjKAc1aPhQ1a04AtQXFZ9jvQM1qTw4IWbtRfYI5GY=;
	b=h98NI9+NrHc1R1Q27zwvtxULMXHKL+fkhNJ7uEgu7rJ38Het6/LhGXCFjJAh7wTke+jg
	 v9uSlImAkVod1ynjnVZUhgfQK7MbjsiT/YkRoidonxih/Qr6LL7ybQRHtNoUTyRNpmZpy
	 GiQILmJqovH5Uuy0AHX/2ZU4/0E29umIQlPf8IxcDrwhZl+Mi/3FcVpKBcFrVAoYQ/RaV
	 9JCghegcLNEiCOQOEVIvXSH+WyA7+LGcqtcESP0f/yUqDFShOEIYPY1S3iHywc2N4GQuX
	 uGn9XFAkIXivVFrCwgvspTd1K3kXQRtgHE6busl85jG1VJvSs8M3CyHBK8+Sem6OsHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIyBkPTr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63373606A32A
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 15:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63373606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIyBkPTr
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f01f296937so15138215ad.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 07:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795273449; cv=none;
        d=google.com; s=arc-20260327;
        b=En7r6KE4NKa1wXaoMFXRDTSW+5T4e9uPNAmuGRSWtwvQDTU8UhNzlwO6WaysMdYAGW
         5B+CKU+JXcdwArKKLDlJjqRNe0mSAo5gPxsrBPwLtp0jbYbVqVozeOo4d5aHa4fCclo6
         g9Q2SrstVDolkhZb4Ydk3Vzfpyg8/ByRS+rtCSoYpU/6L8W8uk0NIMUhF+S3vPEuzsXH
         tdmuFtEWPdBVlhrJCTofqIFiJ0JTlIiF2pEkXKxzHmrgY8LgQAVgObZIDCdMHFmmGF+6
         NBBQo6v8pCIWUwtnM4DT8EwLXJIY1uehgn+Xd+0elNYs9bfcSum/trpCtalzEKEZkCA5
         GNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vnjKAc1aPhQ1a04AtQXFZ9jvQM1qTw4IWbtRfYI5GY=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=W+fpa+2ARvQIIv31cJ2RVSHxXh3NzVFbSHo+4JLMPQkV/isMrO0b2750RAIX5F9uA5
         dwnkf5j6cGjYDvnz+PIO0A9A6VLA3HuBawdGuNLxUungmBkA3gfATWiEa7/BTCaG42xA
         raQWAszaESeTmwUydGcvLlisBh7xHVo0ASwuLzKFmhwqy3QFGc4FgK4GekFqUJ3QSHk+
         1GoDjLLE8WOwHXHNDzQT7Q9r1jgBYqXZhJ2SeFUWN9aHK2qUMFsGtfnVAbowhPpZTA3G
         RObZRsRAGI+Gw2dbIDNC1qWkz5vj9kM8NqldoJp2QkEWVneWBqUYidiNiWMj+Rt7JkaK
         lRCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795273449; x=1795878249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+vnjKAc1aPhQ1a04AtQXFZ9jvQM1qTw4IWbtRfYI5GY=;
        b=WIyBkPTr9pqgzOayO8ynBJF8di9Gc+q3de1REK+UuS/hJGy1KhY0BGfRRLILhL3hpJ
         hXuT2UhCbdkWTt+qxnMhCnQjgoOrPSf/A8Yaz6ym/LWATSl2Fi3rKQF6jOH68NFBWpF5
         nuvxFOVYV/s/5iPjRmpQOySioHTebFb9tHO5APpsawFiV7B9FfLmYQgOyKKTelcHNmnR
         GpNJgHT6qyROAoTj0SNUuZGd8J6RCXHfNwzBoU+kdYmVwsIcLh830r+D0fLV0s/bb7dJ
         RVGzmJD60tpKGIV2Bo5vSETi7/uBNcOydJgSK/lx8VcY31TXs9hIqpfpqwnfrWTFyk6X
         rRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795273449; x=1795878249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vnjKAc1aPhQ1a04AtQXFZ9jvQM1qTw4IWbtRfYI5GY=;
        b=VaqnFNy8gjpeV3Xnc9jBP5AyJr9QOpfnkoQTlE2BcSFcyJ8wLhMf8ah+jmmnjEEFkP
         DhuggcuAG1SWrPJyf0WBRpOGnYDDKqt//3g7gRbmgbpTxAjLwJLp8PQJ0YFiyohs/vI/
         Mx+98iK+6Ehn02JWbV322kSwHMdmXFzA48EAQyUGYJGn98341kgMAk+D3IS+5oQod6fJ
         de4UidgQIseOzrQI4fkwgUH5YqDdrM2U+kD2mMU/uFPoQRDv2azhrePdLdUGKBXhk3ZX
         DGIjDYAN4xESXPPjaWNuaBi+yud6Zp7rryohaRH12u6L3k55gui204My9y3pvCP3EByj
         b2xA==
X-Gm-Message-State: APuU4Z98bEF+DKnVVjwllHrGR5DufEYP90kr3J14RFxdQ33NhM/UEDzR
	U4hZV00zpINhxSjJlLyhSSDI+kkGwJZpzvZhS6wZnxch3QohV5El8AI4bQ94cxFE2u1DzZ7/o3A
	OhcQevgG/3SPF1bR2Op7rfdrWdeY5tpBYK0Yh1FTsig==
X-Gm-Gg: AZFdTZf7qiBBHL0OGjjoSrHkqvXdaXd+1pIrZRkeR1RUXs+iwHjTdq0UN8AkzPvDwV4
	j4iUBvO4/EU7MxAAEOgVl7bd6+9pd7jLLsQ3z5MDFn+nOncyXoLYK+F5DM7YzhOs668NeCnl80I
	O0kBsVYc1rJaA+wuwRr7VtsGqXf47sCWu0GBJ+1xM3kLV4+T3+YUiDU4mZ3gQcQaUhGQRYCjgts
	VXeb7mpxKcLMJnFW5hO00uyZffYzOXXwPiziN5NJugIDj6VkXEtNfAC4u3f2yy6GErvD6Z72OoF
	ZNY1PlE6FpAz1IgONTHC8ADcszEy9UGMaYffdIZ0XA57RcetJNmVFzimvrJbfz4CQdokcTq24vx
	+cNudqwubRrnFMw3vDX66+hDV5QjfAdzdMJ47Iw14Azp3mvOUTWzEPvLVyqT5OOiU6Rt+Pl27XP
	600SRySsieekYQ0o75DBdxZtcg
X-Received: by 2002:a17:902:ea08:b0:2f0:4667:7e36 with SMTP id
 d9443c01a7336-2f046677fc9mr55057675ad.23.1795273448562; Sat, 21 Nov 2026
 07:04:08 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121070804.26185-1-alfonsocvu@gmail.com> <sashiko-outbox-226770@kernel.org>
In-Reply-To: <sashiko-outbox-226770@kernel.org>
From: Alfonso Villalobos <alfonsocvu@gmail.com>
Date: Sat, 21 Nov 2026 09:03:57 -0600
X-Gm-Features: Aa3M54pUHrVxsUYU67iq6w3t8wW-swoPKsF6Xfxgln_fbTIjBun2oztD7Ewrh_4
Message-ID: <CAJ=mrFpob6_aCaWWGw3yyo8CfHY0Hgde2Mjm3dJcQQH0QYj6=A@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Re-add host router DP IN adapters after DPRX failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mika, and all hope you are well.

I'd like to check the direction with you before doing v2. After the
Sashiko review and looking closer at how host router DP IN adapters
are handled, I'm not sure v1 fixes this in the right place.

The DPRX failure happens when the RX 9070 XT feeding 0:10 is in BACO.
With runtime PM disabled for the GPU it always works. After the
failure the host router never sends a hotplug for 0:10, so it stays
unused until something triggers the re-check from v1, here me
replugging the dock at 00:27:26:

  [00:26:36] 0:10 <-> 1:11 (DP): activating
  [00:26:36] 0:11 <-> 1:12 (DP): activating
  [00:26:48] 0:10 <-> 1:11 (DP): not active, tearing down
  [00:26:48] 0:10: DP IN resource unavailable: DPRX negotiation failed
  [00:27:26] 0:10: DP IN resource available
  [00:27:26] 0:11 <-> 1:11 (DP): activating
  [00:27:26] 0:10 <-> 1:12 (DP): activating

The DP OUTs also end up swapped, so the ordering part of v1 doesn't
work as intended either.

The comment in tb_dp_tunnel_active() and the redrive code both seem
to expect a hotplug for host DP IN adapters. Is the ASM4242 supposed
to send one once the GPU starts driving the DP IN? If this is
ASM4242 specific I can limit the fix to it with a quirk.

v1 also only recovers on a new event. The alternative I had in mind
is retrying the DP IN a few times with a delay after DPRX fails, so
it recovers without a replug. Which is better?

I already have fixes for the Sashiko comments (the missing
tb_exit_redrive() and the ordering in tb_dp_resource_available()) and
one to skip DP IN adapters that are already in a tunnel, but I'd like
your opinion before spending more time on it.

Thanks,
Alfonso


On Sat, Nov 21, 2026 at 1:25=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] thunderbolt: missing tb_exit_redrive() in
>   tb_add_dp_resources() leaks RPM ref
> - [Medium] thunderbolt: list_add_tail() in tb_dp_resource_available()
>   breaks DP IN order
> --
>
> commit 4eedd8886dc180b45204d935f18725051dd0e6a0
> Author: Alfonso Villalobos Ulate <alfonsocvu@gmail.com>
>
> thunderbolt: Re-add host router DP IN adapters after DPRX failure
>
> This commit re-checks host router DP IN adapters when a new DP OUT adapte=
r
> becomes available or a device router is scanned, keeping host DP IN
> adapters ordered by adapter number on tcm->dp_resources.
>
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 418ad0a61a5de..1f3dea836067e 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -109,6 +109,29 @@ static void tb_queue_hotplug(struct tb *tb, u64 ro=
ute, u8 port, bool unplug)
> >
> >  /* enumeration & hot plug handling */
> >
> > +/*
> > + * Insert a host router DP IN adapter so that host DP IN adapters stay
> > + * in adapter number order. A DP IN that is re-added after it was
> > + * dropped (for example because DPRX negotiation failed) then gets
> > + * paired with the same DP OUT as before, instead of swapping DP OUT
> > + * adapters (and therefore monitors) with the other host DP IN.
> > + */
> > +static void tb_add_host_dp_in(struct tb_cm *tcm, struct tb_port *port)
> > +{
> > +     struct tb_port *p;
> > +
> > +     list_for_each_entry(p, &tcm->dp_resources, list) {
> > +             if (tb_port_is_dpin(p) && !tb_route(p->sw) &&
> > +                 p->port > port->port) {
> > +                     /* Insert before the first higher numbered one */
> > +                     list_add_tail(&port->list, &p->list);
> > +                     return;
> > +             }
> > +     }
> > +
> > +     list_add_tail(&port->list, &tcm->dp_resources);
> > +}
> > +
> >  static void tb_add_dp_resources(struct tb_switch *sw)
> >  {
> >       struct tb_cm *tcm =3D tb_priv(sw->tb);
> > @@ -118,6 +141,9 @@ static void tb_add_dp_resources(struct tb_switch *s=
w)
> >               if (!tb_port_is_dpin(port))
> >                       continue;
> >
> > +             if (!list_empty(&port->list))
> > +                     continue;
> > +
> >               if (!tb_switch_query_dp_resource(sw, port))
> >                       continue;
> >
> > @@ -130,7 +156,7 @@ static void tb_add_dp_resources(struct tb_switch *s=
w)
> >               if (tb_route(sw))
> >                       list_add(&port->list, &tcm->dp_resources);
> >               else
> > -                     list_add_tail(&port->list, &tcm->dp_resources);
> > +                     tb_add_host_dp_in(tcm, port);
> >
> >               tb_port_dbg(port, "DP IN resource available\n");
> >       }
>
> [Severity: Medium]
> Does re-adding a host router DP IN port through tb_add_dp_resources() lea=
k
> the runtime PM reference on sw->dev when the port was in redrive mode?
>
> On host routers with QUIRK_KEEP_POWER_IN_DP_REDRIVE, tb_enter_redrive()
> sets port->redrive and calls pm_runtime_get(&sw->dev).  When
> tb_add_dp_resources(tb->root_switch) now runs at runtime from
> tb_scan_port() or tb_dp_resource_available(), it adds the host DP IN port
> to tcm->dp_resources without calling tb_exit_redrive(port).  Any later
> tb_dp_resource_available() call for that DP IN port then returns early
> because the port is already on tcm->dp_resources (or already enabled by
> tb_tunnel_dp()), leaving port->redrive set and preventing the host router
> from suspending.
>
> [ ... ]
>
> > @@ -2234,6 +2272,14 @@ static void tb_dp_resource_available(struct tb *=
tb, struct tb_port *port)
> >       list_add_tail(&port->list, &tcm->dp_resources);
> >       tb_exit_redrive(port);
> >
> > +     /*
> > +      * Host router DP IN adapters removed because DPRX negotiation
> > +      * failed never get a hotplug event of their own. Give them
> > +      * another chance now that a DP OUT became available.
> > +      */
> > +     if (tb_port_is_dpout(port))
> > +             tb_add_dp_resources(tb->root_switch);
> > +
> >       /* Look for suitable DP IN <-> DP OUT pairs now */
> >       tb_tunnel_dp(tb);
> >  }
>
> [Severity: Medium]
> Should tb_dp_resource_available() also use tb_add_host_dp_in() when addin=
g
> a host router DP IN port?
>
> When a lower-numbered host DP IN port becomes available via hotplug in
> tb_dp_resource_available() (such as when exiting redrive mode or after
> resume) while a higher-numbered host DP IN port is already on
> tcm->dp_resources, list_add_tail() places the lower-numbered port after
> the higher-numbered one, breaking the adapter ordering that
> tb_add_host_dp_in() maintains.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121070804.26=
185-1-alfonsocvu@gmail.com?part=3D1
