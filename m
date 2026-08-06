Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA848C3F2
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040807; cv=pass; b=jRR/GFTMO3jctVFU4XeFXeZlce7r7xKB/LBN5ah+OmeKtac9wSW4ZmdjHNmcjj76vvEySu0Ri5Pc0pwTDiiderkNS7VqeO0r7X+HGIJLre2XB0laXEujBxUuj/COnQfw5uEKftK4bnFXk0rDbtMj3OtDRIux1fB8nIzsKHgNgrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040807; c=relaxed/simple;
	bh=RwtIdOuUBaCLbQp9+V0OEsUOReBDB80z+NUHBK0LwFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQ9XowATmDvlNETxgXeXoZ9Gxo26++Q6wsB9ACWFunoiif6t6ADJpevOBV6wVD+uPCm0Ns2ToYWwE28gJnTCrbBo4s7s0MipcsAw1QXD0die8PyK3pA5NB6WgtZk3xF2xfn/OnXYud3B+8Tgb6EBKzQb+0aCJujhJmV94wyQO/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLITaNDl; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLITaNDl"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b021916bd3so2632255e87.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 11:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786040804; cv=none;
        d=google.com; s=arc-20260327;
        b=YFQRwWgWsyVXPfL1bEBse0YfpauFPCHAhNNUeS2CZiaevQOqAsc1/WnT8l50mlUJbb
         GV1LHw0PT40Q1tL6JScrq0O5pq3Q8ikYDLKebzHcneii2Yk2wXlYEHyrPvDfI1zqom+N
         5/zarYBGtFt1YqsMhAu+bqyBg3zTZG2VW+qpFUCTVQH4Cr3HUtu27isy48Q/52M/LSri
         uuDq2Tg8NuDS0BpU+w5r33uKuI8TzPyYsjIDCb+Lx+qsWbQzH1fmhyK4TZo8EODdt3uH
         vwdjoSdPoWJrDun0u8gQjdMh51bd2TJ+nRPWvTfjDcRaq3izKhMkj/vFonXylQyMz/M4
         1M1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwtIdOuUBaCLbQp9+V0OEsUOReBDB80z+NUHBK0LwFQ=;
        fh=r5URhQl6whOcnDbP2Lcwh2ZUr6KpnezK+hz/MEOF1jk=;
        b=Vb5lelf8gFRGgxctCs3A38EOk4jP72HEZuvYO/5h2xkjd16KsCyoPE8ui2UcJJR7aT
         08XgryLbiWGb+IZaXGiFFL5gXIkiZTOVm3Epwo3009SfS4iGS4uQYlOTnJaTHFo0FfRU
         eDeY5Vn/GiiBZZAO0DRtB8JgQtUqlGYCOKtYx9qCiu1iP/PxdMvLewku67rQ32hDQGkd
         chqmA6niLL7gdeltDglG+guQY4JiiBo1P2cfQokRYJlo38vvhtAQJsrl/PhuMFPCsWVv
         Z7j+Nx8bMVtOBiq7OHnajeOhKNNHb63LQ3YVQDmVh5/w5BiQ593u1E3QwSFKynEMI3L1
         qoQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040804; x=1786645604; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RwtIdOuUBaCLbQp9+V0OEsUOReBDB80z+NUHBK0LwFQ=;
        b=cLITaNDltLsyFkoZWOMbp3QNGUQR3x3PJulhkySDiGWzoVzdUm7J0ZiFnRLSP1+y5R
         PDGcApPBTMQ66Oj9ti4R8CSM0tiTo5bzpiQYj2RObECYpaPkbR79fQQYlUXGb946gAro
         6FK0a2O7GFHANPLPChaD0eaMxy6uyWKnlQpAyMm/7BenkuBbftLXouz83T6xycwZlL/d
         7F6L1jLSWC6Yusw1QbRCaSw//deiS6mkVpyAu2N2m/QzKQELT2GpwvZ0n+4lDARc4+hf
         vj1+ePqEaatvlrfBhX7NqkGteEDIVBn9I4VkSjsldZwPy67eLGqU/9MQCBX79AcMsn4t
         YzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040804; x=1786645604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwtIdOuUBaCLbQp9+V0OEsUOReBDB80z+NUHBK0LwFQ=;
        b=qb8IThdhUKA4iAcXJa2RlXtoEwTzv31frUR7CHyN3nnhX5WXpkW8mIfr0rnz+gkZFI
         IB/lnDXDu6RGXdt7FxGZ4jwYzS7OkY+GdD3dPCi6MoOga8A9E6IZTZKTVJShgbNcR2Iw
         Fi+ut0XHRSMqn3nxgsnMfocn4gokKynQ0iwab3yoUBmsuAvd1Xvr27ofNstcIQb9pftI
         7WnShZTdx7gc/r6UkhUE1FhfV9Mzo+btdnsOdcsnY8OG1hPDxwyuK3c+JzemdinVsGz0
         MyH8+ZibKHe56va8NFj7fK/0kUS3Le2xbMyAnNORRKHSCdqgtUrpqSgDY2WWkxDrn0gj
         /rfA==
X-Gm-Message-State: AOJu0YzgXEq/+N2GgJpMe68s+EHq3yBz+lE74uQibPEC+1babKBfS5Xi
	vZ7Ile4wJw7JKJ2PL8veG5Uvx7ws/1qn1spjM3AC96TZbAezfZ2c0w8gTGILnuXQVj7x0ZaUUt3
	kskXhRKSoZIYMp458gtRY9UGYRst6iDk=
X-Gm-Gg: AR+sD114KccTzPHi6N9neY1o9MEYkfxk2BSwZPNrbgAoCMwW65pH3ZGBqsdBtbaIBNi
	b2SPxFG69FOIrDWCkj4kWBpV/5AjtMHuDNDbO7yYcSbZ0nMCyjzqhwW0bVH1jqJOo8pQLB/pTpj
	e+dIq3QhvPiXKLUJgsBqxS/FZrRyy2+5BN5NzO5ORpoJVVQQ54LTs1M+3kv9dlYql3vBSTNWVhq
	CdPQ3odheYxUV4u3yzsJyKXiIydeO3UsdlTBTTOsP5p6NkJp4tsWix4Gm8pTSWTm+nXlyIC6jOk
	GkqOKx5WZ8jA3I5uOP9UDozKZ4OyRU+KgnQAwb6YlCk=
X-Received: by 2002:ac2:4c54:0:b0:5b0:1c19:2cf4 with SMTP id
 2adb3069b0e04-5b2f4cbc49bmr2719269e87.35.1786040803637; Thu, 06 Aug 2026
 11:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806131103.19104-1-sergiomelas@gmail.com> <20260806132452.80AD21F000E9@smtp.kernel.org>
 <f96884d5-7bb2-4646-9175-1b385789690b@roeck-us.net>
In-Reply-To: <f96884d5-7bb2-4646-9175-1b385789690b@roeck-us.net>
From: Sergio Melas <sergiomelas@gmail.com>
Date: Thu, 6 Aug 2026 20:26:31 +0200
X-Gm-Features: AUfX_mx-u_wo333Zy7slPKJ7tpKhzwjBKajkQbrD2yunv4MLMrsk0dweIG6YptA
Message-ID: <CAP8e=sJbD21FyeU+9w_CVGLOXhxdWmsCwcrS5uNB0Z+9qQ4gLQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Confirming that at my knowledge this is a non-issue.
However, using the 4-letter machine type code DMI_PRODUCT_NAME could
theoretically
offer even tighter precision, but up to now, the current matching
method has never failed in our
testing and field deployment users of my github:
https://github.com/sergiomelas/lenovo-linux-drivers/tree/main

Anyway, I am compiling a full database for complete data of Lenovo
machines from PSREF:
https://psref.lenovo.com/
For reference, the complete mapping matrix and DSDT traces can be
found in the Yogafan Master Quirk Database.
My database on based on this source and others is here:
https://github.com/sergiomelas/lenovo-linux-drivers/blob/main/Lenovo_Driver=
s/Prototype/PSREF/yogafan_v3_quirks_database.ods
and
https://github.com/sergiomelas/lenovo-linux-drivers/tree/main/Lenovo_Driver=
s/Prototype/DSDT

I propose to switch to this identification method when we have more
machine references.
What do yo think?

Thanks, Sergio



On Thu, Aug 6, 2026 at 5:44=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> Sergio,
>
> On 8/6/26 06:24, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Specific Lenovo model DMI quirks incorrectly use `DMI_PRODUCT_=
FAMILY` for exact model string matching, causing all specific quirks to fai=
l and fall back to incorrect generic profiles.
> > --
>
> Please confirm that this is a non-issue.
>
> Thanks,
> Guenter
>
