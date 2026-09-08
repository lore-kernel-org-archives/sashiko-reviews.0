Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD4C5964E0;
	Tue,  8 Sep 2026 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890797; cv=none; b=Y4ysjaa3DwBFMgszDPKNlM5vNLGendWGR90IdSD7Wcq/X0L5d3mp866zmNGdv82KcgGpQC7bYMJxLbPxz1AGePuwhS0qBPyEyBnWcXW4okxaBzrrULo/CCx4Lr10D+lPAOA5MrkutjTzQu9sONMzHwWmdQnP3vuo1Lx8g3Vqm9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890797; c=relaxed/simple;
	bh=yVyRgQwrCG4BlgyLUxb07EUXJkvl9QtgLR3SdcXC9Aw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=h8XKEfg+S9hvyGrjP/Me6ri2sI9FADfTYnl4K8dPAFCM1kiXMoeOA9mPETNjok+i9q2e5v1yva5Bxl58u+83YZElpMZRWkcvR7+z6CB2e7wMVSfkPQvO7L+8nuqnFpMD+0HASsCrDimZIF8TVuab1fJHyZWLy21SGdJZfhZdlpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiVeWI4B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiVeWI4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5161F00A3E;
	Tue,  8 Sep 2026 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890795;
	bh=osZlX1KYWVAh1388Bi50g+L9Txatt7Z6LB29jbrNjSQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=jiVeWI4BMVeS7+F2AhaAwBfZNdyOD5m7ch7U+q5naWkPSS6JjI8BC1H6pZjJtnp+1
	 LGhp4i8i0C5xCrQjM9ej1Idqz6C52hHgUY+RRl+z+RkcLMkFsgv45VlVlMRfrUZ4Ar
	 cVLSi4yhSHuZQDhwMMhlwS4hJw15HY+j/yhFZcJO+/4NcjOWgDt62IkQUU2OcVo8eG
	 4zPXUCw6VutY1h018yjPCGgxsNC/h2gJUxl0LPujXmTuMrO4eqz6vMohifJUUmdNoa
	 hRofVKC+kRH3mdZ1TBi4zeZH8Sb8aFRnSZsR9OKsrQ686e/VUrlSe2wIv+5sr0/0d8
	 CK3oEuAqC5OtA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 01568198003A;
	Tue,  8 Sep 2026 14:06:32 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 14:06:33 -0400
X-ME-Sender: <xms:p06garNSPT52BOx7zaoaqxZwWhU6UPcJI_LTohoJYVi34qPz5wI3xg>
    <xme:p06gagzc--q_x6Hubd-bB1avyba1clVbtuLFl0uonfA8mHTDpZt7y-Iq1u3uZQvj3
    4aI0Q2xdDL_48ZXgVwVjxuDc1SQjG30SXV2wMq6irGoXwwQtlPh78U>
X-ME-Proxy-Cause: dmFkZTFh48njHVC1+q1C9YYajiFW9bvd0vOJhvxnId51KA0klQ/8YdovJpocxLG9EMAvOT
    7i97qgacsyoTbbveWrSVOGaeWd57AlZjCsQ4ItkueQm2S3pu+ziA8UyPildLEvTHuYF7yW
    BpYYJkbo1Hmc6rQsNj6DAqAlv7gnt0B02ooPZtD43A5EiVumawUeZ6R9wiJFWW+q4D3rTb
    MszLGbDgp8PTJLbilRJ+y4UFTmmyukLpceIBU2vfMLywAztD7jGm66WHSV/NZJuxYDfjnH
    T/UJWrtS7jGe4Bs2S9c15ae5KVed2wd+KQoGccSsNHFxizEpPfsV4eKZkuAR4+SzP0i0n1
    a3F6i3s5W+0j1P2ciY4wEv4ZK2T3KdM7rzITWtMnkhUtBc7Y0uyQJq8XF65zCpezbE2/uE
    qzScwmrR6EpfCK7mD+BjQLjKmMUDdSxgLv+9xaECH12cWPHrCNSspaF9Kr8M/qB3wlBQOP
    HtvlZTclGwmOr32pIQ8wr4MxPke6smisx2fevkR+4xMO9fIbx8tmxVSYf5bf7moysFvc1X
    EP2uozM7UHJuQHRccKzpHNVtUF+xbB3OFNe57Dg7cgf+fgRpYMNoNqKiW/nTw9PjpSgHLB
    GcXMLUYOQ+b03/U9dqQgBmPE2ErwH3Udxgd2GM3FMTeJhKUmbcAdH0SsULqQ
X-ME-Proxy: <xmx:qE6gakxy12FwAN2PKpdSN21T3wYtMuyRkVuj0365_UEkURUC749fzA>
    <xmx:qE6gaqj2SX4XvR4-yeSI2e_ifekwCHI9kvcpQ6kOVS7aWI27WbsR_w>
    <xmx:qE6gaonRPDfEutMzPGb1JSIYtI-KK8qpYvObk7lV9B6knSppT2HZHw>
    <xmx:qE6gaoi7IbDZCoLAW3yoMqTRZ_z8MTbn0mCxTFJePeaugfl87Ug2Og>
    <xmx:qE6gak3d7WV0KgdCzzSfgOHZbryp6BMLejk-CSuIqi0Vgi0xo4aD0N66>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A9D2832A0078; Tue,  8 Sep 2026 14:06:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ASnAkbSYNi0J
Date: Tue, 08 Sep 2026 20:06:11 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@kernel.org>,
 imx@lists.linux.dev, "Rob Herring" <robh@kernel.org>,
 devicetree@vger.kernel.org
Message-Id: <a699181a-4c13-4a27-a52c-9b0abb98bc41@app.fastmail.com>
In-Reply-To: <20260908160134.A3BD81F00A3A@smtp.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-5-arnd@kernel.org>
 <20260908160134.A3BD81F00A3A@smtp.kernel.org>
Subject: Re: [PATCH 04/13] ARM: remove legacy pxa board files
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 8, 2026, at 18:01, sashiko-bot@kernel.org wrote:
>> diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
>> index 2fb29b9ef7446..354e3dc177763 100644
>> --- a/arch/arm/mach-pxa/Kconfig
>> +++ b/arch/arm/mach-pxa/Kconfig
> [ ... ]
>> -config GUMSTIX_AM200EPD
>> -	bool "Enable AM200EPD board support"
>> -
>> -config GUMSTIX_AM300EPD
>> -	bool "Enable AM300EPD board support"
>> -
>> -endchoice
>> -
>> -config PXA_SHARPSL
>> -	bool "SHARP Zaurus SL-5600, SL-C7xx and SL-Cxx00 Models (DEPRECATED)"
>
> [Severity: Medium]
> Since PXA_SHARPSL and related configs are removed here, does this leave
> unmet dependencies in other subsystems?
>
> For example, in drivers/pcmcia/Kconfig, PCMCIA_PXA2XX has:
>     depends on ARM && ARCH_PXA && PCMCIA && PXA_SHARPSL

These are addressed in a later patch.

> For instance, drivers/pcmcia/pxa2xx_sharpsl.c,
> drivers/video/backlight/corgi_lcd.c, and sound/soc/pxa/spitz.c appear
> to be specific to the removed Sharp SL and Spitz boards. The sharpsl-nand
> device probed in drivers/mtd/nand/raw/sharpsl.c is also no longer
> registered.
>
> Additionally, there are leftover ifdef blocks, such as
> #ifdef CONFIG_GUMSTIX_AM200EPD in drivers/video/fbdev/core/fbmem.c
> (inside register_framebuffer) and include/linux/fb.h, as well as
> #ifdef CONFIG_SHARPSL_PM in drivers/hwmon/max1111.c (in max1111_read_channel).
>
> Could these drivers and dead ifdef blocks be cleaned up in a follow-up?

I have patches for all these, yes.

> [Severity: Low]
> With the implementations of these platform data setters removed, should
> their corresponding external declarations be cleaned up from the
> subsystem headers to prevent dangling prototypes?
>
> For example:
> - pxa_set_fb_info() in include/linux/platform_data/video-pxafb.h
> - pxa_set_ohci_info() in include/linux/platform_data/usb-ohci-pxa27x.h
> - pxa_set_mci_info() in include/linux/platform_data/mmc-pxamci.h

I have separate patches to remove those three files, either as part of
removing the drivers, or changing them to DT-only.

         Arnd
