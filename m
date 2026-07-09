Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D271A681B
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 02:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783562516; cv=pass; b=tVZ1/v/AKLOJguWz2qllBM0wyQdqxa5kGKqcr2PnWO/BR3xZmQJzXPkT8AIogUjipsrOAzpzs1TRgeS14GAaPTongH7YAbuxjR5yAFPGrAF2ENomGQtnOhunHtqvuJARiQAE57Yxe+xDW9c1LzuiXlVe6d7lTT4hD9zcWtpEcTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783562516; c=relaxed/simple;
	bh=XfpCYXjGQIQ4ZKfpYTby/RzckVAT88UE+bsRt9jwIbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fS3Oxrd0gHIyX5DZ0RUovwQUHNeFZzBCW5tEWouMsFWlx5O1dLAHLGW8F/pwJQlfbj4fT9jS4c34WtDQlxP2gmpbRJNBE4ey4Co/T8JiLzPUC6eUOBbWvY0bPJZiZHMUMUKtazH53XC1CdTMVnhhmc5mpcEF+a72m3WV9Mo7cGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykj+AAfX; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykj+AAfX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15e592da74so30259966b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 19:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783562513; cv=none;
        d=google.com; s=arc-20260327;
        b=H5DvH7ETwC7LxhcPGgHAtDOkzFbmBqMKJMggRN3ScjsLCKb1PhmZJfd+QGXm7U0Tx9
         UJ+bMSL0LwrpJgksJwitMnBjI48GydInOdsYrnRnBxgaMW+GO8+eoWpj1D32JTlwIFxZ
         A+JhHtkMO6teB/ESyyBUB2ezHRNcospdJG0O48MFDSdayPRselPKQjZo+EKze4DfMG4M
         otDRAV/KyDEQfYVQLz1lrRPsLQl8sCvRJ88IjAFBaa4Lky5OUWgRY40wPTFT0R6R8M56
         1F6DH3Vehk6ztGnIJWmXsF0MOwKpClz8PkTKwiHDek2+YBzaGbQX1BTZ8WCKjczsaz7G
         dhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QdNlXu6B+SEAjg6icZJUM11FE2x5PgJHKlcl7V3FAgs=;
        fh=/1sd9AX3Biv7XPB71B/deD7vM0dkd28YTbnrJADz2Cg=;
        b=aacgC8lRMb4xzn670fHyEFr04IxrqLiAx9S40VRmzJe0ObMMQgvgaZOIHuRCBMDvc5
         6u6fojTnXdH8pLTpxMrMYR8pk8LapXw7ctUbpLYk6u+Bdb9pHb52rhD/FzqgkTe+10s0
         34lMFHt7UToQf0r+vNyowJ5Fu/K0OJnO7jr3ma1xWEsJOM9DKadXlJ7f9V+vCqGpDZYq
         mTZJfvRMw/fqhq4zCs5RhX8ktEEpBMVZ4KqzKSuDvTlW0jtD9ueQLzOh7Ekyi9C5Mku4
         zCHqXnDs6QDrIs2eXaO8qinEOutYnfoqU4toUCeaNHx1sosv/ul5DCJXSISmYVJxFsly
         OurQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783562513; x=1784167313; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QdNlXu6B+SEAjg6icZJUM11FE2x5PgJHKlcl7V3FAgs=;
        b=Ykj+AAfXRwrOvbyKdMWUC0Tz+IRGOpIdaHspcYA7RkCZXXRkzoh8uu5TuSU+J2fPPC
         CGfJGLfzjh2ZzKWKC5AmesPA6VrYw9j9BQ3tQrfovpelE2jnBZxlt58B/xN5jhL5lKYf
         y/jfl+wPlntaoCdp7h7KwSlojECgqxAeWNsLpMCloVowmdB7bEQZKTdxO7I9Phicptut
         TMLy4HAwXNpnqAm1RqMj01Y1Fo/ufm/8Ao2zbSXIKlPqSO4hhsyFlc2EcY7GGUb2WD9k
         FCJPBmyjo36cOFrTgSSDIaya30I1pWBDeBfwcDCUtwvUJwrEmAEXA1Pwejzv+89oNGSf
         NEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783562513; x=1784167313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdNlXu6B+SEAjg6icZJUM11FE2x5PgJHKlcl7V3FAgs=;
        b=DPuttA6mO6GFPd5e8hcScZ9ClYeUvtPsR10j8GsO8G5/O/sSI9ixPbq6JmvSFMyjCA
         zL0bKV0wG6yv9/kxoY6nqBUpJRFZx43w0ICjVzf7oZm6+y8I3sqvz0wxPLJoi2VMcYr4
         NoXVDiJRCp831FD9/CZNckk8Aa7gSYiWMS6g0edLcy6pQ4UsZ8O7I6B/MqFEHioMpzF6
         azTeQbQZYoT+83giTaKPkrSNvxvrullmv0rHFg8xcCiYaUdZffOPjnmasOJlkjFtb33U
         oCXBl90s++bZEsqH6m7BI5zZcjStm3YWdI+/al0hYsj3ZhAtP/pgIxvxIJ+IutxOTQEL
         zMyA==
X-Gm-Message-State: AOJu0YxxRHZV+n4uFUWrE3LM3Ab0kzBOI4mhf86xpolWKOb8KuW8ax0D
	ZH/Li9nvr+FHtSI7EnvnjJ6KzXnM1g42HI+NHDB1zLZseIyIb9xhkw/ZbAVDF3Vg79gkS9/rTHL
	jMTTe25UC4Ye6sIElYlcph1PzT8X8emY=
X-Gm-Gg: AfdE7cld0mXuP3AAp7tFm5B8Yy9RuxHM5KU2thO12bEwIAegcdkwOAb4ykuSex6+7yV
	MgBSsp8WL/3fXbzaWCMvJEELeSOVhuFjSBm5BKnQAA7dPIzaAfTviKvFQI6Ro+2gRcnzuKeDyEk
	NIPDOspBSAfwIWhFFvZ9EeVWZuL2xtvBBIt5nO9OYEzZ1tX85i8ipSHSe2S95DXfolzDVZZNGvZ
	pBFvWY+ME3Y+hNc+x47Nl1EqUsnRi7ubkh7UmtkBYZbp9/ZQVwwuTBV7w+LxW5ltf8vw62hkyV6
	GyEWqQUC5tJVTTaS1tkh7O4ffuaVDzLj71gdVErmxzlLez14guvFdagaugX5l01UDPdHwJ2HMSO
	jZi3Pk+iqZkSsk0TZtJ/wuKinvSM+cd+Ip/E/GUI7pQaGfict3DjMfH9THPriYuZUus9uhcTbsD
	amckg9cu8=
X-Received: by 2002:a17:907:9282:b0:c12:9a13:47c with SMTP id
 a640c23a62f3a-c15cde722a5mr197212266b.2.1783562512782; Wed, 08 Jul 2026
 19:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709014230.1905756-1-rosenp@gmail.com> <20260709015021.BC6D91F000E9@smtp.kernel.org>
 <CAKxU2N9B6xndc8GT+KrRAPjtafGzrEBjJXFWguw61KmAjUzsKQ@mail.gmail.com> <13da36c1-f123-4490-ac3c-d72b278c289c@kernel.org>
In-Reply-To: <13da36c1-f123-4490-ac3c-d72b278c289c@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 8 Jul 2026 19:01:41 -0700
X-Gm-Features: AVVi8CfzZqGuRZGyElrhLn4y4jz9EIQGR5EkDRvzmytTW46cI8dkR8O-WkR2H8Q
Message-ID: <CAKxU2N9OYCSiX6CcP8BWgog5ap7J5H-EJSLmB0PZ2HdwZ-5qXA@mail.gmail.com>
Subject: Re: [PATCH] ata: libahci_platform: use of_platform_device_create()
 return value
To: Damien Le Moal <dlemoal@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, cassel@kernel.org, 
	linux-ide@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 7:00=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org> =
wrote:
>
> On 7/9/26 10:59, Rosen Penev wrote:
> > On Wed, Jul 8, 2026 at 6:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
> >> - [High] Using the return value of `of_platform_device_create()` break=
s target regulator fetching during driver rebind or probe deferral, leading=
 to unpowered SATA ports.
> >> --
> >>
> >> --- Patch [1]: [PATCH] ata: libahci_platform: use of_platform_device_c=
reate() return value ---
> >> commit b10e7693c196a90e6a36f9889202414e7cb20fc9
> >> Author: Rosen Penev <rosenp@gmail.com>
> >>
> >> ata: libahci_platform: use of_platform_device_create() return value
> >>
> >> This commit updates ahci_platform_get_resources() to use the return va=
lue
> >> of of_platform_device_create() directly, removing the subsequent call =
to
> >> of_find_device_by_node() to avoid needing to free the reference.
> >>
> >>> --- a/drivers/ata/libahci_platform.c
> >>> +++ b/drivers/ata/libahci_platform.c
> >>> @@ -617,10 +617,7 @@ struct ahci_host_priv *ahci_platform_get_resourc=
es(struct platform_device *pdev,
> >>>                       mask_port_map |=3D BIT(port);
> >>>
> >>>  #ifdef CONFIG_OF_ADDRESS
> >>> -                     of_platform_device_create(child, NULL, NULL);
> >>> -
> >>> -                     port_dev =3D of_find_device_by_node(child);
> >>> -
> >>> +                     port_dev =3D of_platform_device_create(child, N=
ULL, NULL);
> >>>                       if (port_dev) {
> >>>                               rc =3D ahci_platform_get_regulator(hpri=
v, port,
> >>>                                                               &port_d=
ev->dev);
> >>
> >> [Severity: High]
> >> Does this change break regulator fetching during a probe deferral?
> >>
> >> When of_platform_device_create() successfully creates the device on th=
e first
> >> probe attempt, it sets the OF_POPULATED flag on the child device node.
> >>
> >> If a subsequent initialization step triggers a probe deferral (for ins=
tance,
> >> returning -EPROBE_DEFER), the probe is aborted. However, the driver's =
cleanup
> >> path does not depopulate the platform device, so the OF_POPULATED flag=
 remains
> >> set on the child node.
> >>
> >> During the second probe attempt, of_platform_device_create() sees the
> >> OF_POPULATED flag and returns NULL.
> >>
> >> Because port_dev is now NULL, the block above is bypassed, and
> >> ahci_platform_get_regulator() is silently skipped. This leaves the SAT=
A port
> >> without its required target power regulator.
> > Welp. So much for that.
>
> Indeed. Not a great API... So we would need a pattern like:
>
>                 if (of_node_check_flag(child, OF_POPULATED))
>                         port_dev =3D of_find_device_by_node(child);
>                 else
>                         port_dev =3D of_platform_device_create(child, NUL=
L, NULL);
>
> Which kind of makes the patch not needed. Let's drop it ?
Yes.
>
> --
> Damien Le Moal
> Western Digital Research
