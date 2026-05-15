Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715213E6DCA
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830789; cv=pass; b=hxsJ5p1AIV2jXWlGJkpgLQ+cdNmDUQwRZCFKo9cXs139P6C9g1rdoVvq9v0GjF/zrkMDtIEy2md4al5PWi8hVCc9MlAmYfii7nIMf36AqkpCl36iQeE70rFhBc5U1ne86vWOhpNAGCExiZOGpBh8xRPTBarAMOb0qqKsTaU74XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830789; c=relaxed/simple;
	bh=DvITViv1UdcN77dGzCmSWIw/wgiaxHKidIibKZfFpOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqeUV0C1TDSr2asWJCO2Ff19aCsKplxr25xs/AUeN9WJImNGUyfsEGeqUVDxFMOHGPrPPpHyl84EgVG5ZVpOiK2F+BChk0q8sSXOsqUouc0rhjYqwpWagpJM14c5msRcWUC3q87r8pdpArT3TrXb1T92q6rMXSbC//OHwIxklV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktwczmpN; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktwczmpN"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-83ef1656fb7so169106b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 00:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778830784; cv=none;
        d=google.com; s=arc-20240605;
        b=gX//2rRZYWVDcSfeQladJLZdvQM1Jyz3krmEPrKHZ6y5arjIyn1vi26RmwI6W4FzHl
         YxgM/NBclWg/yV8HMtiuIbALqCSmCOGfLPslBhB08tpBIX8m1W3TX2xEPTa4i1pXLFWK
         DdgA/S91Y7Zci21kul44P0mXhRVCxfNxKMiiy+MxXjBObLG909eGtP7B/AEMkxRrh70R
         4K+8AmtQaBWCthxqaHeksw+Uz8xf1dQgc97fkAgqZhKdrz8uKmMrXf7eBpp+cbhaphwY
         o8gBYkyobq8zWX/Sstf1f5B06XAA7Gdip7RM6zTjSjxM+TqLnI5kGHMdNFCVjW2SMIOC
         MS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AxCLltORc5KKdU6k9QBsTr54hF7033gaoDGXRcDln6Y=;
        fh=8ghXwkT7wv2cRUXOQop5BcgiwfgQ8Ms6im8eNAVnax4=;
        b=cY9v5yBPBeCu0q8h36w8sCgHDoAVQDrjEkEYAJfESUJM8Js+u2Y9TKK7EZ6XsNWXIZ
         ItPYulxnxU5F1NzsKG5R64Vv0FWtQxbIjc1rt4FFcgDXFFe4oD547P1TIxL8HlC633Tt
         2UKKtEQw1qWHgYG3KnD51Pib6Q3+wIfv4JR4EKZ/SV5IuwGuSLuOXl/qbK56y9KjSqy7
         BC98dQEQz0j9Z/cHZvxNL7meDhtXQqHiAYxDJ2n86ooGhmx+FCSn73RiWPcUTyqP4SJM
         0Mos3ChUYpwfy6jdFltnUNU9eTGVbAdfmStBKFOh8DoK3v1M+TpLZGMvZqbgBFMcYR57
         iM6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778830784; x=1779435584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxCLltORc5KKdU6k9QBsTr54hF7033gaoDGXRcDln6Y=;
        b=ktwczmpNMa8zOMHBSd+vNbFULrPIK610PZ98fnHspBz4SW51f4En+DV+olWZe1k1ED
         PZZ2OsfUj6e0S9IPoKag5VXQsMb/9HzUHr4XcWU38qKnxWdcCg7p/unXE63FXMw+PS9R
         U6jaKphyUtDAv+9lXTpOpYmigfh254fIveQ0NmDemVWdP2I5fwv6mDcVYFSoorxfQZYE
         Au4SFDaeRfnzBW3Pv2j9fEPH9AWASNbr41eBD49+NjsjWYpOTpfXTgBh2SFvK03TW6Pd
         WP2/9mSmiy67mzhaNq2m/5zXw5OIlSBc+m7r6UVxSgrqvvZs8mCRfsadnnHaZy5h7A7O
         kvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830784; x=1779435584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AxCLltORc5KKdU6k9QBsTr54hF7033gaoDGXRcDln6Y=;
        b=aJpgGTEbFkzfoMpteWHytkakaEjE6fB0e0GZLOvTq7a/zPruHUgeIOXSm7eePjjeex
         Gas9eoosXmPpHAj+3xal1OLNKVaFA+kOM3kkwwU+tG2I9jebvjSeCl7M4wGkWeJDY7bl
         JwVn2CdwS1G2h++yPnIbM675Zn1w2jXQrOhbjvYjBmx8WS6nc3LJEhWRJXIzzVGs4eol
         0WUt538IBU5sCtHzdZdsEyyqFZ/drhkrhwZW262jFadkUJD9G3Z0ENcBb5zTblS84AoH
         Myi5p/EHzuV8iDMscHEMfQ603qPtPnEL0euKyGttCi/lCIZPO7hrmqjv0P7kGjxlsOtw
         W8xw==
X-Gm-Message-State: AOJu0YwlHxvHp0N0YRKGu407tK3s318F7r3HZF7ajJi25xskZKDdLI9A
	jo/cFajDlQQ/xt5raVM0+hWRv3GP9btlN/qYIipvJS6dCBefnKOlEYnjM+/J/BE8b2N1DvRBXK/
	UOwqpkGjZj0mqnKsn5LTiDcwnJdcvOvjxZfe4
X-Gm-Gg: Acq92OFxfT8n4hKB16JfHcFjyEFG93KAoW+EbBaX7sAlTZhVQahFQHdQSCjkqRpWbaO
	+I9W6hjC2xPyvDLYatHAkJR66bsEBYRMJPY9NE24odbhq0GXpjsRKG1fUIU1fjKKryjcE0B1CvQ
	DFiyA58xhNJQA89JFTyG4mIu7yA6PH2pzWQ0lfuFPIywlKFmKFsgZMYSoZJJsrfZZ52Nn7FNtQX
	Nvoq40WZyd+0JPkJupdvmIFapWPVPJSA1oJW7FVwjIyZVSKzaxgHpVUe3uaTIiG19HZzX3hUo29
	A4XXaMfyzDIkHooe0ECR/ss/sDCUPBh6w/G2uaM=
X-Received: by 2002:a05:6a00:4c94:b0:834:e09b:de73 with SMTP id
 d2e1a72fcca58-83f33dda422mr1604434b3a.7.1778830784359; Fri, 15 May 2026
 00:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com> <20260514190513.B63B0C2BCB3@smtp.kernel.org>
In-Reply-To: <20260514190513.B63B0C2BCB3@smtp.kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 15 May 2026 09:39:32 +0200
X-Gm-Features: AVHnY4J-2kUxNSnCaxn1q1NJi14Qby2UbiNzsr_nf6encMzHQBB6QijVzBgdRDA
Message-ID: <CAFqH_52d3o4U_K64yBXWTHhys73nUqL1u6sM7GfUTP_6TycQ4g@mail.gmail.com>
Subject: Re: [PATCH v3] clocksource: move NXP timer selection to drivers/clocksource
To: sashiko-reviews@lists.linux.dev
Cc: Enric Balletbo i Serra <eballetbo@kernel.org>, imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

For some reason this doesn't appear as a thread in my original email.
Answering your question below.

Missatge de l'adre=C3=A7a <sashiko-bot@kernel.org> del dia dj., 14 de maig
2026 a les 21:05:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Shoehorning ARCH_S32 (ARM64) into the Vybrid scheduler clock cho=
ice block risks replacing the native ARM Architected Timer with a slower 32=
-bit MMIO timer.
> --
>
> commit 37ddcc4eb82e3bfe1a0ebf5e407f22b4f2b1bef7
> Author: Enric Balletbo i Serra <eballetb@redhat.com>
>
> clocksource: move NXP timer selection to drivers/clocksource
>
> This commit relocates the NXP clocksource Kconfig logic from
> arch/arm/mach-imx/Kconfig to drivers/clocksource/Kconfig. It updates
> the selection to include support for the 64-bit ARCH_S32 platform,
> adding a "None" option to fallback to the standard ARM Architected Timer.
>
> [ ... ]
>
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index d1a33a231a44c..d9c76dd443f8a 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -793,4 +793,35 @@ config RTK_SYSTIMER
> >         this option only when building for a Realtek platform or for co=
mpilation
> >         testing.
> >
> > +choice
> > +     prompt "NXP clocksource for scheduler clock"
> > +     depends on SOC_VF610 || ARCH_S32
> > +     # Default to Global Timer for Vybrid (32-bit)
> > +     default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
> > +     # Default to None for S32 (64-bit)
> > +     default VF_TIMER_NONE if ARCH_S32
> > +
> > +     config VF_USE_ARM_GLOBAL_TIMER
> > +             bool "Use NXP Vybrid Global Timer"
> > +             depends on ARCH_MULTI_V7 && SOC_VF610
> > +             select ARM_GLOBAL_TIMER
> > +             select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> > +             help
> > +               Use the NXP Vybrid Global Timer as clocksource.
> > +
> > +     config VF_USE_PIT_TIMER
> > +             bool "Use NXP PIT timer"
> > +             select NXP_PIT_TIMER
> > +             help
> > +               Use NXP Periodic Interrupt Timer (PIT) as clocksource.
>
> Could this replace the native ARM Architected Timer with a slower 32-bit =
MMIO
> timer on S32 systems?
>
> Since NXP_PIT_TIMER has no prompt of its own, an S32 user needing the PIT
> timer for other valid purposes (like clock events) is forced to select
> VF_USE_PIT_TIMER from this choice block.
>
> If selected, the timer-nxp-pit.c driver unconditionally calls
> sched_clock_register() during initialization. This automatically override=
s the
> existing scheduler clock if the new clock's rate is higher than or equal =
to
> the current one.
>
> Because the PIT timer is typically driven by a high-speed system bus, its
> frequency will likely exceed the ARM Architected Timer's standard 25-50 M=
Hz
> rate. Overriding the heavily optimized 64-bit system-register Architected
> Timer with a 32-bit memory-mapped PIT timer introduces massive read laten=
cy
> for every sched_clock() call.
>
> Would it be better to expose NXP_PIT_TIMER as a standalone option for S32=
,
> and modify the driver to avoid registering as sched_clock on ARM64
> architectures?
>

This is pre-existing driver behavior that applies equally on Vybrid
today. The choice block defaults to VF_TIMER_NONE on S32, so the PIT
is only selected if the user explicitly requests it. The choice prompt
("NXP clocksource for scheduler clock") makes the intent clear.

Decoupling NXP_PIT_TIMER from sched_clock registration on arm64 would
be a worthwhile improvement to the driver itself, but I think that's a
separate change from this Kconfig reorganization.

Does it make sense?

Cheers,
  Enric

> > +
> > +     config VF_TIMER_NONE
> > +             bool "None (Use standard Arch Timer)"
> > +             depends on ARCH_S32
> > +             help
> > +               Do not use any specific NXP timer driver. Use the stand=
ard
> > +               ARM Architected Timer instead.
> > +
> > +endchoice
> > +
> >  endmenu
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-fix-nxp-=
timer-v3-1-a3e68fdb505e@redhat.com?part=3D1
