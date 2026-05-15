Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE2D3C3428
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 04:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778818948; cv=pass; b=olemt6A122ZMz9cSmni/74JGO4VMyC9xwGQxVdK9svlhytuzkrFnuJ1cycOig/7xNwfOZ0Qgz6PGMflRaLsaOI6f14ZJ76Wfdv/CmRSXcY5vvwODk1+nE6cJV5JbljRr4aM5Jf7MOlxn94yHJ1D5U14wcZ4yk0pnbQ0SRbmyPLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778818948; c=relaxed/simple;
	bh=QCAkoND4ENm8fAKTSZpNTY4aLP2Hmp3gLwgJAGWD/Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgZrNnyZRGB6/0bm79l27VtVzkKtx3WcNHTA7G+SzlqsOFay7vccy/Gi6s+3KAym2xD7zDmK+9gEk1n8Ud+e3CB0H84elVdMne/U4nWxT4hzE0pdYJ/nWzLkmNQYRtF8guEiPl2Dl8svrO/MxcJ8a8nADAUq+AxUgMwMMsOOleU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dw6TaJey; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dw6TaJey"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a884ebba7dso8653257e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 21:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778818945; cv=none;
        d=google.com; s=arc-20240605;
        b=EVE5qJ9uWzEkWA7kk5vsu9qRd/ewP4JrRHRb6JRVuJf6zgOel6fgeLe/ZvBkfmmds0
         mp9VYHe4jLbpf7y8ZtICDUA4qRwSBwnfoW9ByJ5jK3DoW95CdCKVNqhmSxdXGTa+e8XC
         a+R0EThrzLmEIvi6fjkqytZa0GdPgNyTPRo/t6/nZKGGcHb/OxW7H0Knv2c+Z9spL3gz
         XFTa9EJJJkcUb5zdewquldpDQSVsUqgYERFUyayyOTAOWCzTL62B1ke+nyHrINremqOZ
         HYSe/5WL/fnanuG23cMNtIsrKvzC/Q/B16EhJaMTo8cRGMlL7RVU/Yn5sLLJFpDFYUFA
         oncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I0cZ21uB8dtPdz735Z7AvPhcMUm74vkL87VB125DpqM=;
        fh=CZJpOHS8IgVZkhnOWL3gSTCHP6nz+f8PM7n9DNq4ruY=;
        b=ZjusXuacMCJTOdKJAiBPJOtlwRFqOEbVVJskhz6AZrW78XTI8G0sIiOkT5XddXFNPg
         /IsiHqIJ5/kCD2SUZzpN9dJIItV6ofV8GVudNTBnNyFVwkZ7UA4Z0oHX34r+AuFY2uxF
         DsjtZmxyFS9Fka/CgKz7sYv6VB972opBSIVacxBDqHj5iNaaqdai5dn0GWkcajTSoQiV
         kKXavgP5ncPNC5RKi80F4k5+Sm1ML0L2BgKyVAUuflsMFAgP6Lv3tgrpn4Wic9dcKreZ
         5qFebR4IFw0UOzyMP7joBJC0zFBFoIHux7E3BigaFzAw+PCwboFsWaaVOnghVrHtpA8a
         xZkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778818945; x=1779423745; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0cZ21uB8dtPdz735Z7AvPhcMUm74vkL87VB125DpqM=;
        b=Dw6TaJeyd3SQ7clU2zjUbKm0NIbx9A8BbmT6e5TTpKetOgBrOZs/L9ur8KWcIjk7Rh
         OAOyaBfialTJa5GHIGr+ydQ0LLtKa4MkGvG60W4UaLmsq1RT7LboaLyEg9eAFvUYDhup
         wB4IZy1st4R0z+zGdy9xmdZXN+3INsjHRIYX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778818945; x=1779423745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I0cZ21uB8dtPdz735Z7AvPhcMUm74vkL87VB125DpqM=;
        b=luP2TtP3OjWWCXQ9/Y9tGtEQsD7RkJc8SO0TnQuY1avCQZfAwPOQ9kt9QYuo9xGnwG
         OBASB+lvzRHxhZEfoyfBMiX6WOFnk20JHHzpbjJVA+evcRMYw2DAL486jmA/l6TOiYyj
         hERERYeK45TV5U1lowqzF4hcS5PzYxwVCw9jhgPAfTVKGR2/tSbf9vkEBu9c1Yue7SCo
         4jMEoqvGypOnfoqPw0bHsZUy8NC0Eot+wGM4SOdwv8Fk7FDRsYRzdb5LsljD7Lugoiun
         DaEHEERBe1Fnv46VKkTAr0q3Ku5bKVgz5RTQ3mUrS8CfvT2QJy1ViZ0uXHGDD98bpkjN
         5bNg==
X-Gm-Message-State: AOJu0YyeMr7u4LyWcSWjefI8HYlorPqsl4sjmbpJyoAzISd1wkVJhSG5
	kX+MN8W8+dJbFzVKgAzj9aL+JJ3gzeejnPzgPRDLKmIn9a7QAKvgDLhzuhe+ZxzWLXXYU5ulPlA
	kLtnD9KvXunfDZT1aW8RiKBuvic8RbkUVknCSO9T+26ArN350sC4=
X-Gm-Gg: Acq92OH1snfSibF+DZ0gf2pH7yaZxlNPd/zsTeo4vqwMzMOe6WKFZXlTl+fdWPCzcwY
	lafzSvDeza9RRfoMdNULrdYSGENZn2jT2d619Vo9M9A5gxxnAXTBkdEMAOAMXVnJyN86cTnJRiI
	fTFWZ+JFze86Pdkok7l2gxw6ww4yPH2lQ5iI8mevawm6bmVpyMT4WSBWRsdKRyO4g/4mJcvWLTm
	cLs7eAPd+OWM3kg9J1cBdjnw69hNImdR3SfQPUPiEKI1z45EUFK4Z9WD5fEmtEwUkxuvnf9Sxlh
	1wgiQvc9afFlHmXCWcTWbGED6wkJSBRGr2grVA==
X-Received: by 2002:a05:6512:15a2:b0:5aa:b6a:9257 with SMTP id
 2adb3069b0e04-5aa0e7408bemr545551e87.44.1778818945188; Thu, 14 May 2026
 21:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514091520.2718987-6-wenst@chromium.org> <20260514183429.5F56DC2BCB3@smtp.kernel.org>
In-Reply-To: <20260514183429.5F56DC2BCB3@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 May 2026 12:22:13 +0800
X-Gm-Features: AVHnY4K5aDAGTsz3NDQUWoQBl-6lRkS_VKST26gc1SWQeCwxQAXo_TleLCjgO5I
Message-ID: <CAGXv+5G1MDRZp-9mPZMcSebn=_1UjLNne0sop-Zpk0XfinCZ8A@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] regulator: mt6359: Add regulator supply names
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:34=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The supply name for 'vbbck' in 'mt6359p_regulators' was incorrect=
ly set to 'LDO_VIO18' instead of 'VIO18'.
> --
>
> commit c863063b2f41de345a843312e3b866262b280224
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> regulator: mt6359: Add regulator supply names
>
> The MT6359 regulator DT binding defines the supply names for the PMIC.
> This commit adds support for them by introducing .supply_name field
> settings for each regulator. The LDOs share supplies, while buck
> regulators have their own supplies related to their names.
>
> > diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/m=
t6359-regulator.c
> > index bcf9a476a34e1..46cafe93b24e4 100644
> > --- a/drivers/regulator/mt6359-regulator.c
> > +++ b/drivers/regulator/mt6359-regulator.c
> [ ... ]
> > @@ -871,11 +879,11 @@ static const struct mt6359_regulator_info mt6359p=
_regulators[] =3D {
> >                  MT6359P_RG_LDO_VM18_EN_ADDR, MT6359P_RG_LDO_VM18_EN_SH=
IFT,
> >                  MT6359P_DA_VM18_B_EN_ADDR, MT6359P_RG_VM18_VOSEL_ADDR,
> >                  MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIF=
T,
> >                  1920),
> > -     MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
> > +     MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
>
> In mt6359p_regulators, the supply name for vbbck was introduced as "LDO_V=
IO18",
> whereas in mt6359_regulators it is set to "VIO18".
>
> Because the descriptor name for vio18 is "VIO18", the condition
> strcmp(desc->supply_name, vio18_name) !=3D 0 in mt6359_regulator_probe() =
will
> evaluate to true for the MT6359P variant on every boot.
>
> This discrepancy triggers the fallback execution path inside the probe lo=
op,
> performing an unnecessary devm_kzalloc() to allocate a new regulator_desc=
 and
> correct the supply name dynamically.
>
> Should this also be "VIO18" to prevent the permanent, unintended memory
> allocation on MT6359P platforms?

Sigh. I keep forgeting this driver supports two variants. I'll respin
a new version later today or next week. Still have to address the other
review comment regarding no ops leading to failures.


Sorry for the noise

ChenYu

> >                  MT6359P_RG_LDO_VBBCK_EN_ADDR, MT6359P_RG_LDO_VBBCK_EN_=
SHIFT,
> >                  MT6359P_DA_VBBCK_B_EN_ADDR, MT6359P_RG_VBBCK_VOSEL_ADD=
R,
> >                  MT6359P_RG_VBBCK_VOSEL_MASK << MT6359P_RG_VBBCK_VOSEL_=
SHIFT,
> >                  480),
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514091520.27=
18987-1-wenst@chromium.org?part=3D5
