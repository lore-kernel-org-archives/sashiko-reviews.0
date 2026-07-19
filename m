Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F4C38D6A9
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784473991; cv=none; b=t5ZgCI6jQQ7RW/o/4ei5SMY5S4nmRSaL8wLe9xaH8HMUgpeVNOtgTmQNG2TVDgOdvHILkXqpGtvZQk9SLVOA878GSJFm5IDBGgXv3ecHGuAMma0AvX/GxTEssZJdaKMX4MDrkU+DSeML5rTm0O14TKpBxGFvZQuAoPIqfPfOHAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784473991; c=relaxed/simple;
	bh=MD59CK3QQysWMnxCfGdnDSvMtuVD9pPnifDPBB5elbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DR92ZDkS6hVnyZNHQmzSY6QVBis0gv9kko+GsgCtnChdPqSXNyWFWkjP4M7V8Ph7WOa9tbsPtXuXo27G2Aa/44EgLacKFm6McGU60E/DqA3dcuKYO5x88NjHB1kQdusv5Y846Xp8p++Bwo1cDGHQile48krge+2lw6REZJv+yCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTlJfbGC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTlJfbGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEC11F00A3A
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784473989;
	bh=D+8MChE3E/8mzRAH16kW2uYtH8JUv/UhkhLZCdVeGV4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=bTlJfbGClEKb/Q/6Ns6xA44USc+LTKlciAd6hfcI/hnpMcoVgjrjPvUKcZVPLE+zQ
	 xDwUdzquvprqU4Y1n/Y45SXCbbOlXBH9YFIuYpv+3dL/22YmDZDjmBHpn80oUollqx
	 hkKQdxksVVXnOLFE/ggH9LXU1UWdeLKBwyM4VTAGuqv+/2qLOB0JPvmOJOUAX0+V0R
	 7bNDrTAnL02oVVh33RJwBEIaKFLlkpjFdjmsDpzFYoOSkmkr4nQ5WDzHX4v99bgqTw
	 f+HJlrlzXzPdAbOHOJNuORUxXQKnXv4aFxuf/k2cDFeyDQfU7iWQQw3tY/dO+zQzMM
	 9/vm+jylOG0Ow==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39ca0a30148so76396801fa.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 08:13:08 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy8Uq7EmKiVh8JUD3YxqhjtQu+V5B8il5CBQVFk5exIelBpeglb
	s4CPlHhMr8R6I8+04StL7XQ9d14foqCeN+VcTaPKs6siEv3kvlFdHmyyZ12dPKk3ieXv3rEQmna
	yhuw1QUOIusf8OK/OrjY+HEUq32uVBfM=
X-Received: by 2002:a05:651c:a11:b0:39c:7919:fcf1 with SMTP id
 38308e7fff4ca-39eb28e00eamr23399521fa.33.1784473987401; Sun, 19 Jul 2026
 08:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
 <20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com> <20260717154005.444E41F000E9@smtp.kernel.org>
 <CAGb2v65PmMnm=gusbVRJqwHkMFAdKpFyk8coXK=pf0-dBgv8kw@mail.gmail.com> <1jqzkzds54.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jqzkzds54.fsf@starbuckisacylon.baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 19 Jul 2026 23:12:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v67n7=TtGtThhMvRY=0YwohAOCtvGUO_2A46SynK10axfQ@mail.gmail.com>
X-Gm-Features: AUfX_myvVG7ADgJJXLtTSAVbNpOGFeUtBp63taMiVGNacocgHbMpjmjv0ND4nhU
Message-ID: <CAGb2v67n7=TtGtThhMvRY=0YwohAOCtvGUO_2A46SynK10axfQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: sunxi-ng: div: add read-only operation support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, 
	linux-rtc@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 9:29=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On dim. 19 juil. 2026 at 18:59, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> >
> >> > +
> >> > +     } else {
> >>
> >> [ ... ]
> >>
> >> > @@ -143,3 +157,15 @@ const struct clk_ops ccu_div_ops =3D {
> >> >       .set_rate       =3D ccu_div_set_rate,
> >> >  };
> >> >  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
> >> > +
> >> > +const struct clk_ops ccu_rodiv_ops =3D {
> >> > +     .disable        =3D ccu_div_disable,
> >> > +     .enable         =3D ccu_div_enable,
> >> > +     .is_enabled     =3D ccu_div_is_enabled,
> >> > +
> >> > +     .get_parent     =3D ccu_div_get_parent,
> >> > +
> >> > +     .determine_rate =3D ccu_div_determine_rate,
> >> > +     .recalc_rate    =3D ccu_div_recalc_rate,
> >> > +};
> >>
> >> [Severity: High]
> >> Could the missing .set_parent callback in ccu_rodiv_ops lead to a sile=
nt
> >> desynchronization between the software clock tree and the hardware?
> >>
> >> The struct provides reparenting capabilities via .get_parent and
> >> .determine_rate, but omits .set_parent. If a rate request causes
> >> ccu_mux_helper_determine_rate() to evaluate and select a new parent, t=
he
> >> Common Clock Framework will apply this new parent in software but skip
> >> updating the hardware since .set_parent is NULL.
> >
> > This is an issue. I'm not sure if what Sashiko says actually happens.
>
> I think it could. I've defenitely made a mistake here.
>
> > But 1. this is "read-only divider", not "read-only mux & divider",
>
> The correct way to choose between the 2 is CLK_SET_RATE_NO_REPARENT I thi=
nk.

For standard muxes, just dropping the .set_parent and .determine_rate
callbacks works. The core will just pass the determine_rate request
to the current parent. In fact that is what the basic clk-mux does.
However we have to deal with the pre-dividers, so we need the
.determine_rate callback.

On the other hand CLK_SET_RATE_NO_REPARENT just says that the rate change
cannot reparent the clock. And it requires the ops to actually check for
it. (In the past we didn't always check ...). So we should still drop the
.set_parent op for clarity.

But I think the main thing is that the naming and your intention in
this patch is that the divider is read-only, not the mux.

> > so the .set_parent callback should be provided. And 2. this is using
> > the ccu_mux_determine_rate_helper, so it's possible a clk_set_rate()
> > call is going to cause a reparent.
> >
> > I can add it while applying if there are no other issues.
>
> As you prefer, I don't mind sending another version in a few days
> (giving some review time to patch #1)

That also works if you want to do it. It does help with preserving
history.


Thanks
ChenYu
