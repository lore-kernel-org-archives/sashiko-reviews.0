Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794664097;
	b=v2gNG+uD9kwwCedVn+3nT0AB+ZTbq5c9tb+By/+glvlhMLUw2Bfp5SQzNYErr8POHvg2
	 QWRv5UFaBYZ03vxsMxiUzoyVYiZeEbpIhhLvy6F3mkC+bXFVXTOnCeMtXd9fqFBcnv5H+
	 rFRSGXvqjtYFeg5mBrvL3eUlOgXzxvwv9NgsU6lGL0vQd++cd3uZMLdc1pSBTimm6k/hZ
	 eojEzEy3JQHnWYiaSxViP3b6K+tX6O86roAERQLGxMN4Bz+8Q29g5PsWcnvtiyWl5Rwxb
	 og5oo05c6JBuvObD6u2CoJ8t/TP0tlewtovU5LwjP68wBLQE6q9JujbY9xOtVAkRfmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
	b=AxJPcTZtRYKXaKhygR88+6tAyw8M2p88y1DVxAZRP+YcQ9G86PEltQNa+EJun2vsak1u
	 AEc2Ndr7VeGdtte6zmcNNsSAzYr3JaHnPK/uy+cboWGcDlWwZp/gUsQwaZVtYuKQ/GvYQ
	 GxT6xPZ4EtyoNcuKseafxp1g997i4X3U3v//y3Ed9yGfjmcJK5n60Ac/yCzXYvB7SAhAB
	 F94AsRHlhoknZCnKvzOgaQGRtQ+L/vsHzQo62vUj2v9EwpLZgU4P2w+/ZjPywyLr/s3uG
	 LY/qE6+ZIe92eOC4ynHiW9KHqbvkzF3a0tkY7oa9SFpI7vb0EDNDkXk8iiYlPAVWpwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0ZXPrpj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26DF606A32D
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 13:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26DF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0ZXPrpj
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso392051566b.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 05:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794664095; cv=none;
        d=google.com; s=arc-20260327;
        b=c0WErE2/AcdzkIx9CEYvzJJTGcRB/3b6gqxzNYa077tyTpdScaBLSiSi1bQNpMMoEu
         WsdvH7nnmtbxvjU3DGkVPlTTewp735R+kKDvMEPjD2U7Sdw1h/9GzETZY75FZzsv/iFN
         ooWenreFHDa+8nqt34CasH0lLPdkk8G+C0PxxZelnCuJjiuaHhKbUMl0k1jzfsykdVdd
         gNOba9Iu6Q+cmgFoOx8z+pdC7iDrCk0cYRl5vKt4pzZOXcSOjhRxRgobhQ+p9/4ch8yU
         nn/o4pOeOByNGpSdvdQlwQ0WHX4EgdvnPB+y6qsWAIABI09oEPA4METnv64i4yEq3aee
         3+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        fh=LQfdS+m/cPKdWQ/3kDuhJsIgVCfZY+tYZPFhscd6cXE=;
        b=YIIV9sU54JMbg5nQEfhEM2zINZe3SANMotjiCFSs8quTfeHLZLQ3i/4DGwGb7YgSCO
         T3f0AhnGasSWcs6TuVwxdIRcb9IjyhZ8Ru/fQrbZos/Rd7nLe2nn5jWb6bRW6MZKrQ5b
         pIXc4NDg7QjcPAbMP1cn+hTDKnq1/0nzRELgaCYqiYY1HXZq3vRWSntsK7Z1uO2rhAa1
         d7dGFjfEI+c17C+IVLeDSTgGQAbd6pEC0LclQoK104LiB3IxhuBDJUQKIBBXG4G3sb4G
         YrPvlQVDJOO3zY07+PjPJV/CappvmbovoSrzQzxy5xLOO5pCGp5ETDK83lSH+2A+98Jl
         hDPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794664095; x=1795268895; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        b=K0ZXPrpjH1EwnJYUdyC4N6ZLK2qgN4sg+FdiPSp+CHEzuTsjYzkZQmX2UuCm0Rw4dr
         pMOii8Lo/yR1gDN3JnhSJDB3W5WV0S9ZcXpwCbGX1DCR0VOt0d39tUM2n1EwowpY/3WY
         l+WZ/9FV3X1O4bQ0sWdQyAv9Ygv5OafpdPsmDSA2CNqRpD4kZ46VOXPh/oUjEfQ6k2wi
         91Etzz4fjWcA7NlkAZQW3skJ1AvHlhqL9eoch+KTJcTtHPHvFxaT1/UtrMuuRPg5saMk
         k6aPudh3HPTTKDXsUum16QKnbEKNXAyNE+7sCbME1P4JUX1Pm1ByZB1hOgC0ofIeDOXV
         GHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664095; x=1795268895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        b=Mtq/c+Go/LulZsIkDFalRY+3Qj9EPz7gR+ci37aZzTshhO/Ql9zD3bjgbt1LAqnhOW
         zo+n/HiW88oeM9lPMJqnmXJsL4Q+/5tzn2CRfcTvnNQXuL2jtxW+PoxwpoAR4hrE8t09
         PUHPBLbi7SETqkI5Z+nWBRFa7rj0cvW2sBupMUPZLkthKDnxUp9cDDMhERuHGCeDkkod
         UlNOOHtQ89rFwQtdLnaF1eSbR7DkSZloPzIonWVSqxBME8ndLCUkYeLfe3CWecYvhTcZ
         orzzOmGjBXwGmB5xCn7hh1GkxLvZRmma/9lkahfj0uroVIB75wfNQCVVEA5O9BQdzDbk
         deRQ==
X-Gm-Message-State: APuU4Z+bqWnmks8hUve+9wQzSDRRsjX5zLfsEopUh6hjBAsqfKBJalpC
	Ox76AeIS0hk/jzog3N0A8IB1AsJoe5FKYrZlwbcKZFCIIefwV/CY0GFMzh72mRaD/6HClbAjoo3
	W9rhWcQHzFZC2SFUd03H0qVLj4oEZdNv+VeYx
X-Gm-Gg: AYBFou1OqF1jzwktA5FsotqCzsgkIcCuIon37P0aQ3QXpAvm/HBzHZC86t36rDQocDI
	JtANNuvsfEjhC7McQYK+MAlxv1cTKnKzZtaLdT/zsMJiI08k3VVS4mBm+A0MQbQeW6oitDConFe
	7Nu8t+e2nZq1fZoKJXJOfUIxol89Cm2AI/QGNQoU/tBEbk5OLLkq20kBhqzeUtAGiiWFwgolrjG
	tFpBoqHwco6vzTRDHvk2B8e7djODf8FGss+C49h03eCO8B+MNsroVk+DJOC0sSnoKTvBFXK2N0p
	rAXWdPPTCmTQVve3SlxyAjW+gnqD7IqiFK3NFDnFq7iNBC+CN/GO0499lR0hIFWI8x6Ihw6LCRW
	3Dp7W4bWF8bEKsH0dHxfzVAZGIbbclW8rZakFeIA=
X-Received: by 2002:a17:907:2d1e:b0:c4d:28c7:eb21 with SMTP id
 a640c23a62f3a-c50963967fcmr464257666b.29.1794664094926; Sat, 14 Nov 2026
 05:48:14 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <sashiko-outbox-214383@kernel.org>
In-Reply-To: <sashiko-outbox-214383@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:48:03 +0300
X-Gm-Features: AclHuK9MsmyVhAUhfYgzoV6y_gIsPjRJJ1_oeWNNQdGoTcpp9jpoFerTmOwCi6c
Message-ID: <CAOPX745DWr_y5VfuCGoyJDKj=mXOpxWsA8TyzETwpVjeOjPEHg@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] net: phy: dap8211r: link trigger rejected in
>   dap8211r_led_hw_is_supported()
> - [Medium] net: phy: dap8211r: LED register not cleared in
>   dap8211r_led_hw_control_set()
> --
>
> commit 7e5f0824bef63e117be29a9ce8d9c67d5c813bfa
> Author: Artem Shimko <a.shimko.dev@gmail.com>
>
> net: phy: dap8211r: add led hardware control support
>
> This commit adds hardware LED control support to the DAP8211R PHY driver =
by
> implementing the led_hw_is_supported(), led_hw_control_set(), and
> led_hw_control_get() callbacks.
>
> > diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> > index 4eb50c26397fb..2e371c231d32c 100644
> > --- a/drivers/net/phy/dap8211r.c
> > +++ b/drivers/net/phy/dap8211r.c
> [ ... ]
> > @@ -57,6 +58,33 @@
> >   */
> >  #define DAP8211R_DEFAULT_DEL_SEL     0xD
> >
> > +#define DAP8211R_LED_ID_0            0
> > +#define DAP8211R_LED_ID_1            1
> > +#define DAP8211R_LED_ID_2            2
> > +#define DAP8211R_LED_0                       0xA00C
> > +#define DAP8211R_LED_1                       0xA00D
> > +#define DAP8211R_LED_2                       0xA00E
> > +#define DAP8211R_LED_ACT_BLINK               BIT(13)
> > +#define DAP8211R_LED_FULL_DUPLEX     BIT(12)
> > +#define DAP8211R_LED_HALF_DUPLEX     BIT(11)
> > +#define DAP8211R_LED_TX                      BIT(10)
> > +#define DAP8211R_LED_RX                      BIT(9)
> > +#define DAP8211R_LED_LINK_1000               BIT(6)
> > +#define DAP8211R_LED_LINK_100                BIT(5)
> > +#define DAP8211R_LED_LINK_10         BIT(4)
> > +
> > +#define DAP8211R_LED_LINK            (DAP8211R_LED_LINK_10   | \
> > +                                     DAP8211R_LED_LINK_100   | \
> > +                                     DAP8211R_LED_LINK_1000)
> > +
> > +#define DAP8211R_LED_SUPPORTED_TRG   (BIT(TRIGGER_NETDEV_LINK_10)    |=
 \
> > +                                     BIT(TRIGGER_NETDEV_LINK_100)    |=
 \
> > +                                     BIT(TRIGGER_NETDEV_LINK_1000)   |=
 \
> > +                                     BIT(TRIGGER_NETDEV_TX)          |=
 \
> > +                                     BIT(TRIGGER_NETDEV_RX)          |=
 \
> > +                                     BIT(TRIGGER_NETDEV_HALF_DUPLEX) |=
 \
> > +                                     BIT(TRIGGER_NETDEV_FULL_DUPLEX))
>
> [Severity: Medium]
> Should DAP8211R_LED_SUPPORTED_TRG include BIT(TRIGGER_NETDEV_LINK)?
>
> Without it, dap8211r_led_hw_is_supported() returns -EOPNOTSUPP whenever
> TRIGGER_NETDEV_LINK is requested, so enabling the netdev link trigger on =
a
> DAP8211R LED fails and the TRIGGER_NETDEV_LINK handling in
> dap8211r_led_hw_control_set() is never reached.

agreed

>
> > @@ -142,6 +170,156 @@ static int dap8211r_modify_ext(struct phy_device =
*phydev, u16 reg, u16 mask, u16
> [ ... ]
> > +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 i=
ndex, unsigned long rules)
> > +{
> > +     u16 led_mode =3D 0, led_reg;
> > +
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0:
> > +             led_reg =3D DAP8211R_LED_0;
> > +             break;
> > +     case DAP8211R_LED_ID_1:
> > +             led_reg =3D DAP8211R_LED_1;
> > +             break;
> > +     case DAP8211R_LED_ID_2:
> > +             led_reg =3D DAP8211R_LED_2;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_10;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_100;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_1000;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_RX, &rules))
> > +             led_mode |=3D DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_TX, &rules))
> > +             led_mode |=3D DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
> > +             led_mode |=3D DAP8211R_LED_HALF_DUPLEX;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
> > +             led_mode |=3D DAP8211R_LED_FULL_DUPLEX;
> > +
> > +     if (!led_mode)
> > +             return -EOPNOTSUPP;
> > +
> > +     return dap8211r_write_ext(phydev, led_reg, led_mode);
> > +}
>
> [Severity: Medium]
> Does returning -EOPNOTSUPP when led_mode is 0 leave the previous trigger =
bits
> enabled in the PHY register when all trigger rules are cleared?
>
> When the last active netdev trigger rule is disabled (rules =3D=3D 0),
> dap8211r_led_hw_is_supported() returns 0, so set_baseline_state() in
> drivers/leds/trigger/ledtrig-netdev.c calls hw_control_set() with mode =
=3D=3D 0
> to turn off the hardware triggers.  Returning -EOPNOTSUPP here skips
> dap8211r_write_ext(), leaving the old configuration active in led_reg.

yeah, this check is no need and causes issues with rules =3D=3D 0 case.

I'll fix in v2. Thanks.
