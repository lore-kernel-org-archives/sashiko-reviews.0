Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5B1A8F84
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560562; cv=none; b=n4xXge57gqZRB1kI/4ZbOk3pdYTRQWTUijIdh6y8caz9qAmZRgGizH4W2NPIq2Mpa0/1nd98v8wVCNx3FthwoRKWsXygt4x3LKWc3RgLijNEoGvRzy16Yml+Rmwdl3ZkmYwzWncPVV0Ov/KsJqQOkf8Yg87z/oM7IeY5N6IcZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560562; c=relaxed/simple;
	bh=kVXSRRu09MvbIZ/v4ibOUXuCN7EFvNW2Afke7TysLtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcWpOnOOR1tqsM3axXDwz++///enWPf4exBIz2mF40rcD2rx7WzqNMQOeFgjhG1ATQSssS+XqibvrOH15N9tKNEo1yDSFmn9iLejwxatMeOPPOd8/V3na9DF2VUrt3HxNmoYXHO9irqDD15BwrVB+K4p/7dOCxaE2NpQ9tZrMZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKZljw09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKZljw09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C101F00899
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780560560;
	bh=WzyglERegEMt8yEQznzxLvK0AAqBBpQavEa92vxHnHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UKZljw09K66uULRy3kx/uqI1GRtGUFbZBgXjkTAPoyS0DUaqV//OlAuFMASAmHfP5
	 BseA98RL1uLzFnihEy7pib47wei/mLumdgamgQZMP1/SU+tOIdqYsUrNBYXBllVg+t
	 jgVfobe4A6kIkfkNV35klWOeerUfC4SzMAofE1ND8tU0MWf00SkZoTJNiaN94NurEI
	 /pqwLusY7pMVFo/GdDQOZis3tctaRbL4x00KdOxX5bhq4CwrSMxWmDZzomOR0K+rKz
	 UL6M9TTMhSE4Q1HCMgCuMk9cv28kS7BcqkF500GbzTB0X1zWOJjwpZu/GYVLLyeQ7M
	 0M+WPJSn72sJA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa7a7ad4d3so299377e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 01:09:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YyX8ZwyG1zNfqYciK5nLMilYT36AYGeHerLbIItW6OXthA+Au36
	qf8/YFwkpEMJiYh3FITqi1zv065RV1XklKW6JKQzgriwlpDVw7t9offikqDJUrW1t2Rzm8FEJLZ
	bG2g2yCrMClZpNWRdAwakg0fPCWAwpiw=
X-Received: by 2002:a05:6512:3186:b0:5aa:6e8c:e6cd with SMTP id
 2adb3069b0e04-5aa7c13506cmr1985299e87.40.1780560559574; Thu, 04 Jun 2026
 01:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-ks8995-to-ksz8-v4-4-e15149ef21e7@kernel.org> <20260603231124.184B01F00899@smtp.kernel.org>
In-Reply-To: <20260603231124.184B01F00899@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Jun 2026 10:09:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=V48G13poLmJuQMKz5M2L9sDNp4tg_i0O4CsK1u513ZQ@mail.gmail.com>
X-Gm-Features: AVVi8CcDaB7cb-6Q3GyIdlfdpk4rI2XxWqgyIkAXMQjYqR1PG1nb3pyN5xYNIl8
Message-ID: <CAD++jL=V48G13poLmJuQMKz5M2L9sDNp4tg_i0O4CsK1u513ZQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/5] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 1:11=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> > -     if (speed & PORT_HP_MDIX)
> > -             *val |=3D KSZ886X_BMCR_HP_MDIX;
> > +     if (!ksz_is_ksz8995xa(dev)) {
> > +             if (speed & PORT_HP_MDIX)
> > +                     *val |=3D KSZ886X_BMCR_HP_MDIX;
> > +     }
> >
> >       if (restart & PORT_FORCE_MDIX)
> >               *val |=3D KSZ886X_BMCR_FORCE_MDI;
>
> [Severity: High]
> Does this code invert the Auto-Negotiation Enable bit polarity for KSZ899=
5XA?
>
> The KSZ8995XA falls into the else branch of ksz_is_ksz88x3(dev) earlier i=
n
> ksz8_r_phy_bmcr(), which treats BIT(7) of the P_FORCE_CTRL register as
> PORT_AUTO_NEG_DISABLE (where 1 =3D disable, 0 =3D enable).
>
> However, it appears the KSZ8995XA hardware uses BIT(7) for Auto-Negotiati=
on
> Enable (1 =3D enable, 0 =3D disable), matching the KSZ88X3.

No it does not, P_FORCE_CTRL is 0x0c for KSZ8995XA and the datasheet
says very clearly:

7 Disable Auto Negotiation

Again I think Sashiko is pattern matching and reading some other datasheet
with a similar name.

> > -     ret =3D ksz_prmw8(dev, port, regs[P_SPEED_STATUS], PORT_HP_MDIX, =
speed);
> > -     if (ret)
> > -             return ret;
> > +             ret =3D ksz_prmw8(dev, port, regs[P_SPEED_STATUS], PORT_H=
P_MDIX, speed);
> > +             if (ret)
> > +                     return ret;
> > +     }
> >
> >       ctrl =3D 0;
> >       if (ksz_is_ksz88x3(dev)) {
>
> [Severity: High]
> Does this function write incorrect bits to P_NEG_RESTART_CTRL for the
> KSZ8995XA?
>
> Later in ksz8_w_phy_bmcr(), it constructs a bitmask using KSZ8895-specifi=
c
> bits:
>
>     restart_mask =3D PORT_LED_OFF | PORT_TX_DISABLE | PORT_AUTO_NEG_RESTA=
RT |
>         PORT_POWER_DOWN | PORT_AUTO_MDIX_DISABLE | PORT_FORCE_MDIX;
>
> For KSZ8995XA, are these features mapped to different bits? Writing these
> might apply the wrong settings.

I have checked and this is a similar instance.

The KSZ8995XA does map all these bits the same way as KSZ8895.

> Additionally, because KSZ8995XA is not KSZ88X3, it calls
> ksz879x_set_loopback() which sets BIT(7) of REG_PORT_STATUS_3 (0x0F). Doe=
s
> 0x0F resolve to Port Control 15 (0x1F) on the KSZ8995XA and corrupt the 8=
02.1p
> priority mapping register instead of enabling loopback?

Again no, the KSZ8995XA does have the loopback bit in bit 7.

> > +const struct dsa_switch_ops ksz8995xa_switch_ops =3D {
> > +     .get_tag_protocol       =3D ksz8995xa_get_tag_protocol,
> > +     .get_phy_flags          =3D ksz_get_phy_flags,
> > +     .setup                  =3D ksz8_setup,
> > +     .teardown               =3D ksz_teardown,
> > +     .phy_read               =3D ksz8_phy_read16,
> > +     .phy_write              =3D ksz8_phy_write16,
> > +     .phylink_get_caps       =3D ksz8_phylink_get_caps,
> > +     .port_setup             =3D ksz8_dsa_port_setup,
>
> [Severity: High]
> Since global DCB initialization ksz_dcb_init() is explicitly skipped for =
the
> KSZ8995XA in ksz8_setup(), will configuring DCB at the port level cause i=
ssues
> here?
>
> ksz8_dsa_port_setup() unconditionally calls ksz_dcb_init_port(dev, port),
> which enables DiffServ and 802.1p priorities on the ports while the globa=
l
> DSCP mapping remains uninitialized.
>
> Could this cause unpredictable traffic classification, or corrupt unrelat=
ed
> port configurations by writing to bits 3:6 of offset 0x00 (REG_PORT_CTRL_=
0)
> on the KSZ8995XA?

This one is correct though!

Sometimes reading Sashiko reviews is a bit surreal, like a delicate
meal mixed up with garbage.

Yours,
Linus Walleij
