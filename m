Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283832ED27
	for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 20:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781470721; cv=none; b=tEnmYNf4SC6btNBSeIU8bAiJbAlb+GUi5e26RbfylbF75ZlMx1wl+Vq6Frxhz4d5Lz88ZdoxTjQSACtoicqSHZemgVHU6qklDNAkk2uRddXGIDaNqiX9xGRSImKOLvtVTziqCA7Ht9lJdJKayPEsf1cGQl1O60WBKqLCrc1PADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781470721; c=relaxed/simple;
	bh=lBTPnN9uHjEIpqMJLv78Zrf4kbGuYs2/tRFB+GgGmJA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QzssgjzsMFokrDzzAcTTzUn3GucbbHDKn3jQaYJQQDiGi5wY90ahwBW3sM20nntiz7wTk7WvUrjc15L1h22sjE2byEu3/Obpq0CGeIUV+zL1nzI87JROZhESP6KvMlXkW0SCWkQ92z15xzPDMmYYHLc7ibq0QPhflLoEmwJt81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGmULgnY; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGmULgnY"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9639474a0c1so2122663241.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781470719; x=1782075519; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBTPnN9uHjEIpqMJLv78Zrf4kbGuYs2/tRFB+GgGmJA=;
        b=HGmULgnYlhdtqL/0I/dF1IPNEE9XhGqzHXbM0ocD2amH5t7dm+tG7yXz9xwjEFkM7f
         uSkrHzoV8kgFYLDsisCECZ2rHiY5Owfyb8CB0GIbFK5jbE93bDJqE+juqMJX8rLcu+jb
         XX72AyZ5w7lNwQfqdaRvd2lB64arkK5mesw5BdtjIBXR0Nx8V5lohXVCnojEw/kOwCc/
         8XBRFXwBA/YZCHZQvLLIcwMelmR50Qy8BtfD15SC4LFMBLFOXGwdEPIWCDYnm1K7Jo7h
         VBR+A6jZeolph3tvA+li4BXuQHE4t5lGC1LhiT9KgVMu0sjp+pcTIk+fV38ayUn6KBYd
         nICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781470719; x=1782075519;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBTPnN9uHjEIpqMJLv78Zrf4kbGuYs2/tRFB+GgGmJA=;
        b=Z2DzbTeXzweSK8U7j+Chotw1TaIlQRh1le1iUnF+ItaR4DE7J7/TPjXPhoSVbgG9Ei
         DbsQllKcT6EaUQVf4BJIx9KprjPs2rmKT7886yRZabVw+Kae20r9TfSms3JWpQUSly9w
         eYdJNvmjidHufeRrleRKG4rhkp+PpCuZ6+rdGvkrJUDAB9R71N1koS0La8a8tPVadwze
         U9GbM7hnAuRV4FTBarYte9QvuL4Wys7xG2GATFTWFkFeFaO023DhPSiNSMJczKPeypRk
         tyf2xfh0QivwOOS+B6E5S6FlV/8c5nHisD32BaDO3y0V/mno4X0rs/3hT97dDplqHwah
         FBHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lHQVTKEOb1RpPK5/qLsbFyfS1VGfSvSq/fEjN/78CBZKfvKafD9riRYJDEw4GcGdXqiX6h4tBrqzTSGC/xTc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxfKJgczs/hDrPl+IdWKICHU4HjjTLWX0aVVNg6gyQZfR8yLBy
	g0nYMPZZ0Ane/scq1spGJXpNLYlF3z/KG1ZajSpZa3ULb1EJWc8XPD8y
X-Gm-Gg: Acq92OHeBAyrXRD0qL5tjAxNEkmodpat8UjERJq9ei74vwJ50fKp04CpZhDkf6AUIbe
	8dZVzbuewtUoRG2VSLbFBAaaungw57LhNGzkHo4lH2DJNrE/RQKTO4yrMDibrxUodmZuLjywygb
	h0VkuVNQWndrt4UGlejZumHn+rva/XdquqztLKF0tQwvvwKO8Gd072JkFTqtF0U1+MIeXt65SFY
	KgZByUNVhTdiCjpxjBS2W/jVKZ0TbE4vgmAgxC3uV3lKXrpNYaMeAuZ+4NVF1rc80WCJfTltacW
	/t1DryJ7lMi3xVbM/r5bYWyoAlvTFi0mONnDFqWoaBqe4Xc6r1aaQUilKK01rQUd75S+Csg4ZLP
	hcnFFi7UFGP7Ee4BrImEE/NUZbWWTclq/cjWVUwfKEwgjxVO5v+sOwSKTqd+jah2YhHAMu7nzwd
	xC93lz5F0pi9fZbw==
X-Received: by 2002:a05:6102:5693:b0:631:26f6:7022 with SMTP id ada2fe7eead31-71e88dcef1emr6025602137.23.1781470719221;
        Sun, 14 Jun 2026 13:58:39 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a03767eesm1754284241.3.2026.06.14.13.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 13:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 15:58:32 -0500
Message-Id: <DJ92NVDRAKQY.1RQQVGA7FSK03@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, <robh@kernel.org>,
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
 <20260612230132.E04DB1F000E9@smtp.kernel.org>
 <20260613-graceful-berserk-rook-cc5ecb@quoll>
In-Reply-To: <20260613-graceful-berserk-rook-cc5ecb@quoll>

On Sat Jun 13, 2026 at 2:00 PM -05, Krzysztof Kozlowski wrote:
> On Fri, Jun 12, 2026 at 11:01:32PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 15 potential is=
sue(s) to consider:
>> - [High] Architecture Compatibility / Undefined Behavior due to direct b=
itfield mapping.
>> - [High] Out-of-Bounds Memory Access / Hardware Misconfiguration during =
active channel iteration.
>> - [High] Infinite Loop / Denial of Service in IDAC microamp parsing.
>> - [High] Logic Error: Inverted bounds check rejects valid pin numbers.
>> - [High] Race Condition / Lost Wakeup due to reinitializing completion a=
fter hardware trigger.
>> - [High] Missing Error Handling / Type Mismatch: Unsigned check of negat=
ive error code.
>> - [High] DMA Memory Corruption: Unaligned DMA buffer in union.
>> - [High] Uninitialized Memory Read (KMSAN) on stack variable.
>> - [High] Illegal DMA from Stack in regmap bus implementation.
>> - [High] Logic Error: GPIO get_multiple returns pin states incorrectly.
>> - [High] Hardware State / Timing violation during device reset.
>> - [High] Logic Error / Performance: Unconditional stall without IRQ.
>> - [Medium] Memory Leak of fwnode_handle reference on the error path.
>> - [Medium] Resource Leak of runtime PM usage counter on the error path.
>> - [Medium] API Contract Violation: Buffer mode lock released with direct=
 mode API.
>
> Amount of findings is horrifying. You should probably involve some
> internal review before posting next version.

I'll set a local Sashiko instance before submitting the next version.

Also my local testing is a bit loose. I definitely need to take care of
it.

>
> Best regards,
> Krzysztof

Thanks for your feedback!

--=20
Thanks,
 ~ Kurt
