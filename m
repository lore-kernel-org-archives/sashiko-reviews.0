Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170639;
	b=XthvfXLawbnqWlTT/AfQnofjT6V/4JfMcoE7H5Jlm9qMJtc1/GCCwIYUEwaXir4KodBr
	 Xqmwzs9RADn6MdgFW7mmuy4ih9KwEv2Zxrwm/RKSehJyG1YeOwmWRKvQP7ZmDLo4PBkdi
	 8cCRQUVbkugT4scoC5ZsXaP0sZNJLeStodXYWQPLAEyRAertVSAK44oe9oVGG5gKlWTen
	 mkUrui80X/Kxv5d3IxFvhDkGF3FqeeVldz5Nk6e5OFX6b6YsD61OFCDnoRaVq6XqaIeFu
	 v2W0eLTwtmoKEudApjnAYM6BjNxFZTHl6WXhIe+t5rKGUTeB1e+BuWAgvkjVOPCLZiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=YMQokU2DBvA0v6z8GTSCOdj/4/qg1wXCrYgs4K0fmlc=;
	b=Rjhz6X3rU67xs+/ww0mzYuJNE0xXUKlKZ/ji1QC/wm2GUfbW0oXVb8QQlPR7mNKUTeJn
	 mAWNqRxSVhjbUxOYLSWbuJ5jbbrbz7DUgDf4ns3H/IZytNWnEmhfXeSG/a55DnjXm70CB
	 DCi0meqG07S1YgSdOOSmX44UBgG+yWV/pSii+0E6TzGIoDV26s8xZ6NlU9c4ZqBZqfqVi
	 ebMNQniyeo1V/qbnVohCR1jq+bqdsq25JAZZVZBI2xXqwjcnywaeCBNq/M7UauMxFqXxI
	 x1oEADQwux5Luc1Rc87F7xAl5lMpEenSVDIvKyFzioy5kPmjleP6kJislx87NKHfSow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoZV7uGv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AC9606A333
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1AC9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoZV7uGv
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso421888a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 02:30:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170638; cv=none;
        d=google.com; s=arc-20260327;
        b=kYoctkK9uTIPrYuUUB4jhIMTBUMbud1FQK0ijhVzqUXpqReocKeVlll316PIZJIef7
         3v9wYOJugV7BAPqLmJo0UFhL3dNK7Y6ImT9QVVHhLXS/JKx50SwmUnB/HUPXE7pIr7oB
         szpXi9op06vq6Qsiwhvlo33ee+RMfN/CHXX82t4PuKjuq6SNWNm6vVjXRT1BAtAsq2wf
         Ri2M6W4OMtMiItatqsWpUfn1GF/41pMQ+0DICzfCk4plBnh2paKnK81jp80PFEDPFUKk
         Rlj1gkRwf/XBeu78+Pt4L4wlgwyq/SkUf7jBdqcrZS4kSog/Z6RarPQI65RFlRQ9GFgv
         uUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YMQokU2DBvA0v6z8GTSCOdj/4/qg1wXCrYgs4K0fmlc=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=W5YQ7cpR7PTFrG8wMPNc2qHo/pgAT8PRCdKCh/re2Lp7+Or6Zn9G1Tg33Cav/iiNPo
         0vJ46KzRNT6PZZVD0wglFa2y0kOxYXG0TPP4zwBP+y0PmEMmHdury78bUhoIhRWzIYtG
         KOr8NlQxRG2aZcYo+fNYODaFW0idlivbvnqwSi++sDXhz9sSTg72TDQj4CQVi8zMytbT
         ZulQyk0S48Q1BbGGhmIrSWWnsa/QU+DHK6YrvCWBDSGQMGXt+DyqNgTE041IBwiqMehj
         eKMXu16j9e5uW2sQi9nHUHwyrQST2f2W025x8blaL0lAs/vPQt877Zcred1IRGoo8A2Q
         qV5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170638; x=1795775438; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMQokU2DBvA0v6z8GTSCOdj/4/qg1wXCrYgs4K0fmlc=;
        b=FoZV7uGvp22LI1cMYiny/LCJKHwi+GpN6ZgmGX3pm08+VFcdgDJIzkzdlE9polm145
         3jX59Psns2fKo4KLnInalMtp6G2wnj6GQbSFfK9nlzPMXmQQ/Ft7hVXWh1aeHjZtZaCu
         03uqvzhqJuYzC/jqYS/KrKwTl0p2vDJlCSDEwifG57iqycwauwM/2aFygA/5wRutaMo/
         tsM8N+ih+kUANsfD7nRVXJfWPl6jm7UsgV/F2a1xGsBCAL2Fti/AI+72t41FPmojddLf
         80Fsv41okirnMhd+GKhlWwfO+rm1JVqeTWA3CFSMskfDc++drFmcNnKKX4bAG69wBnd2
         fOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170638; x=1795775438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YMQokU2DBvA0v6z8GTSCOdj/4/qg1wXCrYgs4K0fmlc=;
        b=rfcFSEpVTb17WN69U9luzf4O8ayj7BCm3OUhXJLQq8wYCjYF0hE5DnWNxpupHSStz4
         aBmxV7dOyZigmptuNAz/I8QOPFue/WgUGwHvf64ErwlUHWJ0EDviqnj3H+4vb/eKs7wk
         AyPG4R7Ig6xraM1asJXz40S72W6oBVxaXecc30/S6SPh8Sx4+06kF58wJZ2EuhGGbbT2
         AEEib+2RSkKH0+tgqYmEGCz4hUob4q7QkWNQaz2WtS9G2Kdhn9V0Qrc/9gyyrzrFdRGU
         kIoHr8IgrCIg79M+RG54OTOmmqiWO86JvHYj0/221JXoe5UZAm6iyabVSXEmsF2P3jCc
         3TYg==
X-Gm-Message-State: APuU4Z+YQ8m4QGJtUFoj7xbpZZfbG8wRAd7jliK/sdZqJK7cQiLUDrMr
	v9Op58kr2AW6Jy8BIJKmruuGOdHZtn6LhFG0n8Q2aSOuzRocrWmFmTjm+N5vxnIRgGrfVQKB0c2
	uxdC/iI0l9x39q9MJ0fGs2YF5hDJTzxL5IF7R
X-Gm-Gg: AZFdTZcbZirQ94SHvVu3WlFM3geGFZo1x9NTCmtBKEN7touzXed+WSRQ4Tud8abeWCO
	dsflfPpu88dUIPOj+NUJdp4hXSgGWYOeP0UVsohU6hbjBkXzUKd7mbznkXu//4HS7UnhvRQSuQB
	ih9yWkOBA+E96i3Xh7e0Va6nIPu84+oT/IMoZ3sBvWc6lzT6/Q0wBCDoPaiyG888gqN0ITxMOBm
	Yfxk/EtitN+L/WOq98dRZSojYqpT4Re7NHK3KoBsFJAACOQZcXxbs7I8HaFlOynSpXLSoGhrLUs
	B/+M3b+xqQC/RCR3xC0W7GZsoyKWmaPQg6fRWp7brOx+dt0/wNVDzW3Kou7SG31BnbE/S59yCZH
	kC87LcNIz/3Vc42gAVs5amIkp1aFOF3SaJbpXCOvTzmTim8PgmoNpZcUXhVWanvZwTNwUn+oMoj
	HTvycEluXoIg3KSJagVAcrtoit5q5ZduErlkNk6SOWLYWTw5Jd
X-Received: by 2002:a17:90a:d2cf:b0:3a0:e568:ed63 with SMTP id
 98e67ed59e1d1-3b41c8e0507mr1470253a91.8.1795170638122; Fri, 20 Nov 2026
 02:30:38 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120035939.12774-1-phucduc.bui@gmail.com> <20261120035939.12774-2-phucduc.bui@gmail.com>
 <sashiko-outbox-224436@kernel.org>
In-Reply-To: <sashiko-outbox-224436@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 20 Nov 2026 17:30:26 +0700
X-Gm-Features: AclHuK-x0GBjw-ppja0gJA74xwgyfzSdytJdreI-vMgFr8FeeqLMhnSvi_-YRk0
Message-ID: <CAABR9nFZg_RfJMPevPb92BRsQpakuE-3P9d_aciidipShCNB-g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian
 format check
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Medium]
> Should MCHP_SPDIF_FORMATS be changed from SNDRV_PCM_FMTBIT_U16_BE to
> SNDRV_PCM_FMTBIT_S16_BE instead?
>
> IEC-60958 linear PCM samples are signed two's-complement values, and
> SPDIFRX_MR_ENDIAN_BIG only switches the byte order in SPDIFRX_MR without
> converting signed samples to unsigned.  All other format pairs in
> MCHP_SPDIF_FORMATS are signed, and the companion linux,spdif-dir codec
> (sound/soc/codecs/spdif_receiver.c) used with this controller only
> supports S16_LE and S16_BE, so advertising U16_BE prevents 16-bit
> big-endian capture from being negotiated (or delivers signed samples into
> an unsigned stream if paired with a codec that permits U16_BE).
>


The SAMA7G5 datasheet does not explicitly document support for 16-bit
big-endian samples in the SPDIFRX block.
I think hardware testing is needed to confirm this before changing
MCHP_SPDIF_FORMATS.
