Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621C3839A1
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454011; cv=pass; b=SxyjeLBtwTpqDLEF+BAUiHEu19wALBkOZybNSFEwmHNtAh1OKtZBAWoAy7f65Wt3w0XaeaRk4zThbkUVmh5runrGeDAsU/718zA32h5YV+mCKDfTOyRrpuMVF98PMEP9oQvhJn41+UYp6fSEAK0GrwjQxXNzmpD1CSbakMHVEzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454011; c=relaxed/simple;
	bh=BZEOoUQ0Lo8ipUdfeprRBNlw3oHG9gKfH8cF4qSYIoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piIvDK77wWcmvAVQzTUqwkRna8vlEKw/SAYKtPl9hES/EbtswbfZWMu/F+T1T+9bEwdlWjWYzeCsRkO2VIgvrOEUd/Ct0K8lQMb5nzOrjEKsGl0HApyB51l9oMrl9xypPI6tJ6h7QcszbtfVlW2GTHstbDlmvqcogcyUlc24vZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Alo0wid+; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Alo0wid+"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a2015bbfceso3896631fa.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 23:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789454007; cv=none;
        d=google.com; s=arc-20260327;
        b=oVWj67JkXN0drYHqxSmzYbSWANSjmKtK3CyNdcwH2BMIjwNZ8BJl1TU98GOxfTN4oQ
         Okb899TV+N+2Lif2zypveNKjHMfmd9EjgnV0JAqHW+KlUgb6QFvyn/ckqt1LqaiCawQa
         K6PR3L2QQLLoKrb8EweCqlchEDFONMYA6VFGXD2IQgB4EpP5fXwhtXWBs/OZR1Efi/Zc
         RCTvI5icGpRjPoBE4flzvjZSapnT5JPScdCZN+FHMWVmRHDfDTG+JngPIazobfAUa3Dm
         1Sfx+g4mKPZo0CIi2GtpPs4y3PadB2Y31bAz6B1JDcxOGK8CSeiSTBcwZmkdV9q8zX/q
         Z0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        fh=Epu0QFB8EafLM+drbMuj/cl69qaD46nq4BTHWWrHi3U=;
        b=njTCZ+j0ZmklNZN1lzc7gA+YLsCkwzbOHTtVd1weKaPJaaTryORlCyBaIrvC93JXVf
         rpU3aAfgWcWEBoOwZAbQQudlNBn5kzSN17bgXPjliSDtH/wasxxgEjER5ouGe7wZXvPv
         5kYdHZ7F000obZkfnU13GvYmwghDD4XwrzWl+4moHdco1fsCiJr47wpXtib8ybcfK3XF
         3YaKLmQAltd+3pYqF+WyLvrToyxTm6zxgVWfnb7dxF4u4sFUoGFie5r9OD5cCOkIrDEA
         ANf+VFO3NdxbJzfh1Fs68BdQJzrX0AnhSv7v5WGRiPCQ7RQObQHuMSVbGNIV4HCwIcfZ
         Bk9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789454007; x=1790058807; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        b=Alo0wid+lmNe9uuwF+UAgqI/ZHsS1lNQANiKzexG1Lyl/j3VV86Qn5tMe3wTx7RuLU
         uaHcxTz3OSkwi7X3K3PCDj0lSvch6pJxYFA1wCCjxQZw5efoQ6lHmUBWiq/Jxc4slJIh
         XxFaMi1cs1Mb4eDC8nTti4X0KenFvgkkbHB5AizDa55+S+rSLluExEy9sB4p9Q2eXMHp
         UXzwWL6jmkr4jWGIIeeRB1SHYvH6p/jS1HOGXO6uEbaObR9rRukaxG30QxMP2d4cGpSP
         bFqhTkOTT3FiAdWlD6pMyFk3paFCG7nu3gbNzTc1M2Es4OYeCaZXHpAU5nFm5Mzo6jdZ
         5dbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454007; x=1790058807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        b=CDv1zTZozv8WBZ4o1iRhRlVBSLHRO2THoAT8JiUcEIRmTX+Yr2soEMYwWlUZowh5hL
         k1d1T+TW3L5j3UVo1OCN4khH/ebrU1gBpG5GYTBNKVSQOc2QIkBMnndyiySYjwUQY0Ea
         maLDksRUqmGWF1FlpvrPOl91VlFEs4o0OIn9E8BY8xifuqWhwnEhkQRgJ7gtCSP4vVoW
         2rBSKMEzIqFdQsS0Yg1Y5YzYcsNVvXZTgt9DvuQZfD6McqeOxIdGI335g4gQJSOTRGaf
         P9j6NKzVrj4TB/MRnZyTj4QgDKbUiMy5+zc/D5AnMss7CGwW6CdfZc1dLnfnncjdsJRy
         M2Ug==
X-Gm-Message-State: AFuF++m9Puy4V7/QGSaYZZysW+uV1HA1UDb0juNqFdynGQgum0R4/x1B
	TsfJuDPBVnl9nRsZUFIaFYAdoChk3Yds0h4Mz8td4aDzehMjb+As+y3TEwh3oPf9k2BMWF0eWKu
	6VHuOQzHwBy2oRy4v4LFyR3613MWcn4JaycQ8648=
X-Gm-Gg: AYBFou1m60WFJWZ+tSbyam/3DqNPRvTPOiTfpWnyrdEiKEdGlk9abWS5mXMJlgP70h9
	qc5VEeIvGCr695rN44RLTHvWrFz6PTaJqW4zPah77cn5rU+84n7Ge9cCrjG0JVrVlDm3WQ4y4Jj
	Zr4inE0tDarQhV6jtnMNQMwQlmHSU3C/iMt/f7CUxG+XTOlwk6cngvYVbQPIL3ttlTs0VAwMl2q
	8k4UIKQ8nXkW71gM5ommfkXbloNs93FaEQbupv2r4/tkA/Gotyvxt1IU1aKMdQoWIcBF2JPG0yp
	yEOjrrcszC0FS8iDfUF8fjARmRVxsNVtCBxHyEXQ/S+o76F5BxbuH7J0X/PqR5Dw3OcmHu4T5pO
	61/1+Q/AQhcT5
X-Received: by 2002:a2e:bc8b:0:b0:3a3:29d8:8b00 with SMTP id
 38308e7fff4ca-3a5d19a7c11mr2780671fa.10.1789454007172; Mon, 14 Sep 2026
 23:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915052021.6959-1-syhuang3@nuvoton.com> <20260915052843.397FF1F000FF@smtp.kernel.org>
In-Reply-To: <20260915052843.397FF1F000FF@smtp.kernel.org>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Tue, 15 Sep 2026 14:33:15 +0800
X-Gm-Features: AcwNN1WwzpMg6DbhyfieH-d57sUuGMCMER0oo83Syvu7n2pAq0NeQmN3AZLllEU
Message-ID: <CACW=pY5n1ku3m4QPgBkx4+r_nHr7s8GqYWUZ77DH+rgOvNq9dw@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8815=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:28=E5=AF=AB=E9=81=93=EF=BC=9A

> > +     [nct7715] =3D {
> > +             .config_reg_16bits =3D true,
> > +             .set_mask =3D 0x8060,     /* 12-bit mode, 4 samples / sec=
ond */
> > +             .clr_mask =3D 1 << 7,     /* no one-shot mode */
>
> [Severity: Medium]
> Will this leave bit 14 unchanged if it was previously set by a bootloader=
 or
> left over from a warm reboot?
>
> During driver probe, lm75_generic_probe() calls lm75_write_config() to
> initialize LM75_REG_CONF. The regmap update mask used is:
> clr_mask | set_mask | LM75_SHUTDOWN
>
> For nct7715, set_mask is 0x8060 and clr_mask is 0x0080. Bit 14 (0x4000) i=
s
> missing from both masks. Because of this, regmap_update_bits() will
> silently ignore the 0 in bit 14 of set_mask and preserve its prior value
> from the hardware configuration register.
>
> If bit 14 remains set, can the sensor operate at 8 Hz instead of the
> intended 4 Hz, leading to a mismatch between the hardware state and the
> driver state which expects and reports a 250ms interval?
>
> Should 0x4000 be included in clr_mask to ensure the hardware is properly
> initialized to 4 samples / second?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915052021.69=
59-1-syhuang3@nuvoton.com?part=3D1

I will update the patch in v4 to include bit 14 in the NCT7715 clear
mask, ensuring that the default conversion rate is initialized to 4 Hz.
