Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0633B27DB
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180444; cv=pass; b=iY6ZeyfUleMErAw13/ena57L176fhbwKFUy5S6Vzkc7ROfMJIzGRuP/0ae+CLQN2elFjF+lFFArZ2C1A2XN7F05G9BUaZlIf5R3j9Hq/4cDPDFVJrJIzFsoGMZfL5WohzW4YoQLGkoF49sFP+FbALc/OQEsPygYZ9GWmNoEh0xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180444; c=relaxed/simple;
	bh=SW0OzW5Q6cloa9Rxxh7Kt9JcaYqdq1ZnXoJCraKu5D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOOWZ2BoZGhKBWZyJia7JrsIU5XTtB2GSJZrQ/ff0+gXBZbE5L1XJDxT/GvFjBnAoP2gU25ILwLTXzerJgJV5QPwu8OMOA/EUbAqh0Mx9KSGtpcUfue3HE269EDTjbJ6j+33PEGjfhveGCn1uEGkj7h13yFR5Nj36wcQ+TRYOsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYl5Fvk1; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYl5Fvk1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so4143725ad.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 02:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786180442; cv=none;
        d=google.com; s=arc-20260327;
        b=Gyedha4INtXjLpLUdslL0BEP/sgDoMZHyAHXCN5qvIqByluiNeSFqY3OC4Fd2VAav2
         ao/QKdesVLYgembSQYzgcD8tzdgipaMRh/OaufyclzkFq1pg7X/frU8K7JvteMKziY/h
         oEmNl580gKCsNXcfBny0O/NVkJ6tgQvj1wwv9cP7Tp7NrQNfzL1QSYt//Z9QqxwXPN1D
         l+84bZoBTCvONlbhe8yBXQd7bf176mUtCCPFr0EWhJXAx4r2buXkm7M32/e0hyusFJSe
         WUVKeBWsf+7jVBbQIOwzQ8mlNFvWkcJvsPvAT5ayuQQ+9EsRYk41/41unTIXhZUjk7M9
         UEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jYz7Hr0nWMfjm5X6TMKm8e+654rRQUBbNqDnjzx0Iws=;
        fh=1kOzd3TbpML5CfM80lk0trf8L41zZ6vDv4sapVZzZoI=;
        b=R7o4oTHmH+5TrZPghkJb0Qb1VD0O9jZecN3lZHHFcXhl85DaLZQ4nLd2EOrEBqqcFS
         Aj4RAu/Lx0KRnAXaUffrJ3krmT/a6/MaJTMQerJs277PSp0vXRVmZeE1jvNVA5GjzBrK
         GN7Jzg57zpw9n+vBIxDhGq7j7PX4CtqpnWRRgIEVefWz1X3oPtyhg/8rDXa2sYC9EVPL
         zaTMdC9h9NqSgQgSG/IO8CP1fCb9S1JrzjvqLACcwCubTq9uazNX0jagDgXb8iVYt6My
         nJeFxDG74o6ohYs9t396UXjwKVdV69lcVyQszzirC2altqw8+8ft6aeRbdm1R82K+NHk
         ClRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180442; x=1786785242; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYz7Hr0nWMfjm5X6TMKm8e+654rRQUBbNqDnjzx0Iws=;
        b=CYl5Fvk1sqK5SG8mgjF51AdAOaqet8dbFCg7QWx6t6h1zBzfI6ZI9/0EYUl/Kv4f4N
         fXdvyqjRhcbM8W5H9VY7NGYW0nkHjcxvCBl6+Uco41SbGKT8jxpG6w+yvpjSeDFJPztL
         uAgbKq2RPNH/FWi3nNyDM9zYzh5SIMLMNRTw/ytnaZg1D/qO8drPxOBeI6Lji9+YlvYe
         3iA/vhNiKow/8LPqVMOTo8/kk1m/y/2+p/LI1D3fgfyicA+L7f66AqTSDEDQZGsnoghr
         HPN6Ui15+JCYOdH5nJ5l7kZCKnTAahRV2kaCd9//HlPlEklptm0s3T1xRowYyKQYgssh
         XdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180442; x=1786785242;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jYz7Hr0nWMfjm5X6TMKm8e+654rRQUBbNqDnjzx0Iws=;
        b=a99mc4JIbKMDK1tX43b1kZcnPn0zA8IWL0M1pjVoguxhm8KNRdgqmiWpdSCG3wHJym
         pjLssy6UAjJTt+TtssVdp11R/qHugI6KVZupF04hdE0XhJFNu49dn8MVmoBcmPUBK/HC
         42bkZN2hA15YLnm4qv8C+LkBYWayZvUjwweg6w/QhhOy8PfrtuhNgsUXi/MC5nmTZYjW
         iLKsJQyDSJwH6bWon2aUj9trhSkvHpLYoDLWJ2vMcRXolvGVvvGQ2IBYcA4/7NliuYRG
         q6REgkVrlNr4Yuz5jyWG3J0TlA5u/f4KXE6Fmvyf2DElUnNNvM7Tl7jE9OC2lVpRv+Nw
         /tUg==
X-Gm-Message-State: AOJu0Yyr1ZivOPAyA8Yq9jLIkjgh7mRngBGXGXpwaD+rICaAoQAcHxLG
	lvWMa3kP8O04votn5y5wQRGcTbtsiw2CVdAcN/c5fHzSJZsUZ7BjlxHTVTwkFcwoT7zNK3m0jtP
	qmDEJliifUWox9kfu2CUNdnVy6twQ0BY=
X-Gm-Gg: AR+sD10QSmDXq3zmrCyHhNlDhhhwaZKAqCvLo+AfXztiOcR2Kv8KUuNFW69sQ9kfwMw
	ZLvoTnQcbeHiYYAueXBZaGQh/zbJYPbnU5rMgszJxIuD5iernhK2swpSoH48Ds+Lpcm0Oz3Q3na
	E+Cb7UDUV0kADSAQjgLcdxfh8oTpVnBhuC9ZpQMYsWRJhyVTnQRebVOl3GI1sJJbdEpkOqDW1Tq
	qpF4M5nJ/rXE1rqVFoDhOAVeGaDqq9lcBr/8bZBaIbAACQqgg+2SEGyPJo1srJ4CgkZEULPIHDV
	jey0/qdKB44E6CgD8gmcZsJQ+yqnhaNxpoWYbgrOY6bFpwH+MsuPZYcYOjnsHMLvyMHTrCc7jZx
	g80iW/mMEVG5RqHbzPEIse1uqBVz95IlOi8qRwddUnWDZ1KEt8l9PIbMavGFNB3hB12zTKb5p/C
	bizWCEnCDae73WFPk=
X-Received: by 2002:a17:903:3b84:b0:2c0:a555:80d6 with SMTP id
 d9443c01a7336-2d0ca712d68mr366857345ad.2.1786180442464; Sat, 08 Aug 2026
 02:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807065619.30604-1-phucduc.bui@gmail.com> <20260807070353.CC8C41F00A3A@smtp.kernel.org>
 <anYv8994aXbO4KU7@SMW015318>
In-Reply-To: <anYv8994aXbO4KU7@SMW015318>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 16:13:49 +0700
X-Gm-Features: AUfX_mwPSY660RKIOBLjbosaPstxVJRv0ueVC9qBdDXzIRO961xpgmRgy1fkHjM
Message-ID: <CAABR9nEnA7Ur_A2KycNV_26V5HmujuFG9PZeTQBPSLesLQRcsg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from
 optional IRQ lookup
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

Thanks for pointing this out.

> > [Severity: High]
> > Does this jump skip the necessary cleanup for the USB PHY?
> >
> > If usb_phy_init() succeeded earlier in ci_hdrc_imx_probe() and
> > platform_get_irq_optional() returns an error like -EPROBE_DEFER,
> > jumping directly to err_clk bypasses the phy_shutdown label:
> >
> > ci_hdrc_imx_probe()
> > ...
> > phy_shutdown:
> >       if (data->override_phy_control)
> >               usb_phy_shutdown(data->phy);
> > err_clk:
> >
> > Can this leak the initialized PHY state, regulators, or clocks, especially
> > since -EPROBE_DEFER can be hit multiple times? Should this be goto
> > phy_shutdown instead?
>
>
> Please check this, make sense.
>

I agree that this makes sense. I'll make the change and send v3.

Best regards,
Phuc
