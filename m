Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2A367B81
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942089; cv=pass; b=TOyDzeB4nps4PZTPA/APymgjZpRl3gX8RWQrAscpnKciipgEoi/5Nqrwjwz98b+2C2U4enLg6LAAK8RmMOoJQE7p69sWXUIOAp33kDs0m1IR3j2zeujYXeqAjbIE64iRFIytTbYqDwcmoV7XZfbyYrQX0RQGMs9Pi6aBVqAgLxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942089; c=relaxed/simple;
	bh=af15f6HxtpFPuSN9bctDtLH0URZFfK/vsHExebARsmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGeK0nL9+EYsACCcMmZFEDo1KtYTznTeK4RbVeSFJaApEESNhV8L5U5Fka/tE15HS784en5RSWu5S9HfBknEe4nlswUoY9klTzxLGBwe48bIYcQVs8FmjK0d4d+pbI4NJSoFf2+TeIsune6zBtXDKX+JHpxEC6rdtJAYOD5H0Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwJJHp2R; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwJJHp2R"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66049669d78so4019038d50.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 11:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780942087; cv=none;
        d=google.com; s=arc-20240605;
        b=G4e4ohfEDrdzBbgYXqXuIXBoYOFTP/ZEtiSkmRn3EuYQqFFehXVs9C1qhE610b4Pvj
         k0zP8Axl0IghJKsQ0Zjgt/ly+rFnFz3i/T+3TT3/UYeegZ9W5F40cjALPpBoBaeAjA6H
         idnGJRvi3KT8/s0d8Fr4ui33Kh2K76RHpHYDP9frcf7WvrUWqec1UwfyItVBavdczvbd
         WQg5QNsYUYwRCHuOEd431pxTL1oDVEqOrG2GrYRtq5naoWri5Wv8eApS1aa3688ZwN40
         0AwA1VK6/7a/6eKFYzapA5caKa3/Nr+CJE5tGuBpDFwVTMVE5gdZMSIXOFAm8qLal/Xv
         jv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6LAXhhHuwnflAJcQthLO161IRLRgGSYNeprsC2Irfo=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=Qp6niWjrx3leM/A1aIWKuDwZXgo6ZU7WhfuzBfiSN2+3iUZe+K1/PjaAgLSJ8qES4a
         hB8Fo/8mQqrK7hrp1X9AOGvFa1MCIGTMKTN6Vn2CS3Uz/UpN8lfOCUfoArLwOISGIreX
         JZdHOkEj8iQ0HL0kC6hn6STCikPOXUtqCvzj8WHmSspVIChgRjivi1iO/JFM+fjvtK61
         HKXf0OfmwgaRKOSb9fWRvwrdbdTL7pd1U8N+4M8bV3cFOe2xnjmButvdPnFGjnSGBKk6
         9VCADZVnD7USva/A+EthM9CXBye0KsqL2HFrKgawkVaRYGSrG1UB6PLZsmOO67KWIq1m
         gUZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780942087; x=1781546887; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6LAXhhHuwnflAJcQthLO161IRLRgGSYNeprsC2Irfo=;
        b=jwJJHp2R45wcMC8+dgfyocaqnPc2zuCu3wTzAdPqDdlpVSMmQTu12EBb80LJp2/JYx
         NW5+dvYIoiCnbh4vA8Hqy4Mm5QFFQ17RK1xPzlEmptBSbE0p06F+VkKgnrY097lUwB8r
         gVfORHvxcT2ALlGASqEmJ+Mgy1/zxBnaI5ozR2ae69KEXVY1q4AWUpubdqJXAIdnh2ox
         WL0UGwJ5qqbh6CgDGd0MKcXbWl3VEIO8crZUxwbUlXp/zyZ4pDzeteRjhGk0PY063oAn
         B85lqZ+8/LPHl+OQ12PsILYnc+09ZCtzRBVxdZ96ek6M/yRMnZIshOd8aWDW0/QJak88
         JXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942087; x=1781546887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6LAXhhHuwnflAJcQthLO161IRLRgGSYNeprsC2Irfo=;
        b=r+gTVrTXmuQnVLVr5OO8AtiAeeY1IBXJ/c8KnG5R3EnxmxSIECK5dmP3nHaTVvhngO
         EVrCuJgtT1mbnemqR6ux6d78RqptbtbJH0OHnBl98vsEPPT/tnI3IglzQ9FqMJbu1jaU
         hlNBB6gQvRm5Li9ZBtBH8XBQWtU4DahxmCqZoNqcpqzjwdnb4MjIG2B2j7AH5uYPk/rw
         CZOtpG4PuzSNMfnIqi6aFeUEoV0IQZ5+NV1KgSHAYHRdvx1+VU81cR4NdeDP5qsIVV+a
         cK90MEi7bTNvnlQd1mTr9lErK2pTgGkGS1u5o1iAnFdYtmgFDZfE0W00guSM8VU92VrW
         n+8A==
X-Gm-Message-State: AOJu0YxvJK/gQ3V0UldBWmLGhfvqdoFdc6IY+cbZRHYUyUijsUAKkpqJ
	jGcVu4WDdL65yiQQz6VUE5e/xi07mgXV804NigTWaUagQdrj6iT8DyaeiKSlT6CJiMytNvl3SHR
	sBHMGPdFtftP3/CxVKT7IwgsIpdftz2NWszrN
X-Gm-Gg: Acq92OGVn4MLtjGNG29iC7qWEMuupbn7ktSpbzrhaWNPFL1a/zswgpUNy6bsg3LdX2l
	RO7RQbPoLV1PkpdSsGaOv/tZ/wjefAfOiZ1hkGxCJ1C5on+IkbJ+5hwspgMXzzDsEHY0xEnRkTU
	8z+jUqZIzXdROB9stGilfNfKOFeR9Q0ATxYR11EMjvG4rxFCSyVONCZE+Ar9s4gq4NRlGOhSOED
	SlnY6DTlmkYEG7TIv6JKwiFYO02Cl2GDKZCZ5K59hDSrjPQla05EwC3jmiOWflVXjJthoeFKzka
	cLyA/pCYxnoWWYG2jQ8=
X-Received: by 2002:a05:690e:d51:b0:65c:2404:ac3d with SMTP id
 956f58d0204a3-66106e0368amr13808719d50.13.1780942087017; Mon, 08 Jun 2026
 11:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608175418.1936892-3-tmaimon77@gmail.com> <20260608180132.863CF1F00893@smtp.kernel.org>
In-Reply-To: <20260608180132.863CF1F00893@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 8 Jun 2026 21:07:55 +0300
X-Gm-Features: AVVi8CcuMMLCFtphMXjKmrQiODvMliWOxLXr8dtDj0MRlfjKwC6J-Leqe9kLek8
Message-ID: <CAP6Zq1ggj5+Gko5VY+GmGVrJWcCz8k-WigvtWiL1kwTYXcC9wQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

On Mon, 8 Jun 2026 at 21:01, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The alias mapping convention for NPCM8XX was corrupted during the=
 conversion to YAML.
> --
>
> commit 04ac00da42e73e1f171a2c2d3fdb84bc4768096a
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema
>
> This commit converts the Nuvoton NPCM FIU binding to the DT schema format=
.
>
> > diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yam=
l b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
> > new file mode 100644
> > index 0000000000000..0f95def019105
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
>
> [ ... ]
>
> > +description: |
> > +  NPCM FIU supports single, dual and quad communication interface.
> > +
> > +  The NPCM7XX supports three FIU modules:
> > +    FIU0 and FIUx support two chip selects
> > +    FIU3 supports four chip selects.
> > +
> > +  The NPCM8XX supports four FIU modules:
> > +    FIU0 and FIUx support two chip selects
> > +    FIU1 and FIU3 support four chip selects.
> > +
> > +  Alias convention:
> > +    The '/aliases' node should define:
> > +      For NPCM7xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux;
> > +      For NPCM8xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux; fiu3=3D&=
fiu1;
>
> [Severity: Low]
> Does this new alias mapping for NPCM8xx correctly match the original text
> binding?
>
> The original text binding in nuvoton,npcm-fiu.txt mapped the aliases as:
>
> In the NPCM8XX BMC:
>         fiu0 represent fiu 0 controller
>         fiu1 represent fiu 1 controller
>         fiu2 represent fiu 3 controller
>         fiu3 represent fiu x controller
>
> The converted documentation maps fiu1 to fiu3, fiu2 to fiux, and fiu3 to
> fiu1. Could you confirm if this change in the documentation was intention=
al?
Yes, it is intentional; the map in the text document file was wrong.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608175418.19=
36892-1-tmaimon77@gmail.com?part=3D2

Best regards,

Tomer
