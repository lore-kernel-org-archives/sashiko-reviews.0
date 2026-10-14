Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A2D4D5991
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972211; cv=pass; b=c/dPA3bZZOLGycvozhBKZXRGlChfoLzndzQI2RrC9bKj1OVpqxajJgi9fTHIP5agu6mesyRcfyB/JPZQsFhfldR3RXTaZ8wzNSbEq07UUA8e5BIKM0aaTUXpw83+lZuIAVSKDZVZ41CJZZseV6GQ6gdXf/a2cWH7tDsrtsrYKv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972211; c=relaxed/simple;
	bh=X4IPUWRzqd3vNvyDbKw42IC1Li/8214eRkoZv4hcu5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lf/q/5ulDBeSmQ+Kr7yNMm0hbQrNskAbbAdf6lInmcT6/V/aGxeIDvUfjqZFTNsZPwXXn1lGEx6XzqfSeBANJEepKYSvQPVqfjheNXMgB4Tuqmf+3eK8jjZ5Iv53/wf+WIn9lNHc1kq2ezPKpGVJloUt+tojC4DnaSjUJcqnQVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1/q7/wd; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1/q7/wd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e618db81c0so6595255ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 03:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791972210; cv=none;
        d=google.com; s=arc-20260327;
        b=S4r+PGtm49bVDxYLfBoVHnJFW8Md23W6xPrX53+iT6Lf+djSmBBr+s8Wxosn2wl/rK
         FJcgQNfh4/mCZzJl9JFE9+e7yFimD8dbR6OBeo2mhyNYcNxeq95uJiT13mBIQeyrT7/a
         Uex0d/NasoSUEjKtjyFsSYIJ58+V5m42LymJUStk5XxSFxBJRnhjlwYXz7e2U0uBf2UB
         u5uF4UOUxEu06BULed/M10aabccJkAgASE51hc6NYG4vYItuwZz5PnZHkponMZMRfnYK
         JiTYpI6aIbsvyzwGLZOsr99BsKHqcYY5Fzn4GYJlGDlfHV6oOUY/Kt0nAedESnOZ4Q6j
         alMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TkBY0USOLdA22gx/2rOX5OcC9aCnCnZClTEGNm0xQJA=;
        fh=jpLoCPlPpcaXDBEYJ26DkUkbE4zHtEWLFiVM/tW36oo=;
        b=sUFuxVLkF87MR0tVAhfUUXnWH+26QMRcBzm7FvYE9djG4EpH/B5SK7lkgWC61cMH/L
         Lzfk4ia6eWC/WeiF4tB/m8OtIN4S7shBGsNtzNdVmk27OFkPHVk88mzRa/0UHf5KqnPm
         zsny+HT0/TxAdKnN/dxMX3KYi3YPZXTGHnNz6huzET4Ym2uCogluKYSw78EHgfndd2wH
         URfedbWZlrJJ5B84O4oIwTEUWAVHxkyAeqGn3ZGT1Yz5kZEQSExIy8zJbmBnC2G7oKhm
         tYgl0eTWloCaCXHHnzpoPAIGqt2dQt6gVUCvGdRaudVW6sbWh6rKTBLdoBltkD94unyi
         VZYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791972210; x=1792577010; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TkBY0USOLdA22gx/2rOX5OcC9aCnCnZClTEGNm0xQJA=;
        b=P1/q7/wd/NUp+vJfNIi3hV2xWa+wVEmj88F5guTPn4drblmTQzduz/9bpJEQ7zxTfE
         DpMGpXjcw3qnjJGlIG3OkYkI69+4aheUgSt9T1/5G8lAuOYwTiKqy1LGsrQb7ffy3oqT
         zZXp39Nd5us9lxA8l2BKHH13XCfg7tEjwRQM+n26tS0KtZdBF2UEaJNnWKG9Vk4jdCdW
         CpCbf/A3UB+ZBieLjUOpDAzp0VVNdZKco4NPHG0K/Li85C30YajmiP56MJWh+DxAHRYm
         sMWvDdIX4V/79Sh9QC7rM1vUFWO+UhqD3Pq2DtxnI6We0oBG3oY1G1Ne708l8TwlFjuX
         I2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972210; x=1792577010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkBY0USOLdA22gx/2rOX5OcC9aCnCnZClTEGNm0xQJA=;
        b=Ha3IRRYmo4lVvH3KRlGptTLoS5q+sFfbgMJ5DNYTLSawTmc5uww6VFs1wEwfJMfSho
         YHmaFZELRIHkja0EourZzyl1Ege8rMh0IC4R94QdTDFQZpdB2VBA7L+WEsJU/N2d5Ia/
         iW77ChStfz/E8WepF+bgdtzp2kEcfJpraGojkd7I1t6TnqpnXMxu8UJ2GTnMfGuT4VBY
         a7HltpPiNwlB1DKWSJgaJCPa3Vsz5IGA7i+SiWBnWv2D8e/QIA6Mc54yIB6rvoXZFEtm
         46FzXrvj0+SiYUd8zLy4NTnHUwd3WqDuugsCZ3dGBoaPESkKKB0u684tPjbfhGAYhxB0
         MZKA==
X-Gm-Message-State: AFq9FYKyD9vejs0GwAywtH7KB53ymYoc+cMQ/EDqGwef0FMUT1O/DqJX
	Xs9zjCLMzvZ8T3wVuBBUBY/nYgbj3wBCZ9rIs6sv3Tby32g/Q86r9OKsuN7psR4V/YtxACgDrjv
	ZiXD3HDwnKS9lXvtCRElrEWorjLFzyZMsFauocTOcyg==
X-Gm-Gg: AYBFou37FURhWdmhzJlU9dARG9Tnfol27a6QFh7PzhYpU1nSh6Tx4NscYc/vwF7GCC9
	3hphA8pwwlf9EMLEWxBh+tWnpVgbiuPiZf58DGeguKoUQYXf4SCvcnqmTXBAJSVjJ7s4STRaxDd
	pEjWdISS6G2mY0+ra5mDSEgzf8JuzK6w2Occ3q0uoeZiVWgxdkTGcy4wxZkmW+Dv9HBoIiB5eV8
	vJVmiNKINTkyi3508BSTMui+TnDIkNLPEi6lF61SJeRK5lM57QKUdUBnD64guO7H1lLG3PN+bsH
	d3L5TfVOu1gdTKb91k28eOXDfq2xfAE9EnutQK0E1QXLV6UDd6+oCVVZGpoM5aBAwM4ufw==
X-Received: by 2002:a17:902:c40d:b0:2e2:dc50:16a8 with SMTP id
 d9443c01a7336-2e842cfd967mr144835445ad.27.1791972209741; Wed, 14 Oct 2026
 03:03:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012100816.331033-1-pmazzini@gmail.com> <20261012100816.331033-7-pmazzini@gmail.com>
 <sashiko-outbox-167946@kernel.org>
In-Reply-To: <sashiko-outbox-167946@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 14 Oct 2026 11:03:01 +0100
X-Gm-Features: AclHuK_IjvhnMV0ZgXT4S6uhoftE_NPkdNnWLTaSlgrxF5SaMhOEDanyjwfKrQs
Message-ID: <CAAxh=juJViKpvj3hBdWE0E2Z5jLLGqc6EWRqD0aZnr40sPHQWA@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] rtc: sun6i: add Allwinner B288 compatible
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-sunxi@lists.linux.dev, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These are in sun6i_rtc_clk_init(), which this patch reuses unchanged for
the B288, so they apply to all the SoCs using it. I can look into it
separately.

On Mon, Oct 12, 2026 at 11:19=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] rtc: sun6i: missing ERR_PTR check causes crash in probe on clk_r=
egister failure
> - [Medium] rtc: sun6i: resource leak of losc clock on initialization erro=
r path
> - [Low] rtc: sun6i: memory leak of rtc structure in sun6i_rtc_clk_init er=
ror path
> --
>
> commit 903d00f6b5cb6afede9ad6ad5fca01853d776ce4
> Author: Pablo Mazzini <pmazzini@gmail.com>
> Subject: rtc: sun6i: add Allwinner B288 compatible
>
> This commit adds support for the Allwinner B288 RTC by reusing the A23
> clock configuration. It maps the new compatible string
> allwinner,sun8i-b288-rtc to the existing initialization functions.
>
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index 7fc60880e4094..05004e80ac089 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -350,6 +350,10 @@ static void __init sun8i_a23_rtc_clk_init(struct d=
evice_node *node)
> >  CLK_OF_DECLARE_DRIVER(sun8i_a23_rtc_clk, "allwinner,sun8i-a23-rtc",
> >                     sun8i_a23_rtc_clk_init);
> >
> > +/* The B288 RTC clocks are the same as the A23's */
> > +CLK_OF_DECLARE_DRIVER(sun8i_b288_rtc_clk, "allwinner,sun8i-b288-rtc",
> > +                   sun8i_a23_rtc_clk_init);
> > +
>
> [Severity: High]
> Does adding this compatible string expose an issue in the error handling
> of sun6i_rtc_clk_init on registration failure?
>
> If clk_register fails for rtc->losc, the function returns an error
> pointer and jumps to the err_register label. Since the global sun6i_rtc
> pointer is already assigned to the allocated rtc struct earlier:
>
> sun6i_rtc_clk_init()
>     /* Yes, I know, this is ugly. */
>     sun6i_rtc =3D rtc;
>     ...
>     rtc->losc =3D clk_register(NULL, &rtc->hw);
>     if (IS_ERR(rtc->losc)) {
>         pr_crit("Couldn't register the LOSC clock\n");
>         goto err_register;
>     }
>
> The probe function sun6i_rtc_probe later fetches this dangling pointer:
>
> sun6i_rtc_probe()
>     struct sun6i_rtc_dev *chip =3D sun6i_rtc;
>     ...
>     clk_prepare_enable(chip->losc);
>
> Can this lead to a kernel panic when clk_prepare_enable attempts to
> dereference the error pointer stored in chip->losc?
>
> [Severity: Medium]
> Additionally, if clk_register succeeds for rtc->losc but a later clock
> registration fails, triggering the jump to err_register, does this
> cleanup path leak the rtc->losc clock?
>
> sun6i_rtc_clk_init()
> err_register:
>     clk_hw_unregister_fixed_rate(rtc->int_osc);
> err:
>     kfree(clk_data);
>
> The err_register path unregisters rtc->int_osc but appears to omit
> calling clk_unregister(rtc->losc).
>
> [Severity: Low]
> Does the err cleanup path also leak the dynamically allocated rtc
> structure?
>
> sun6i_rtc_clk_init()
>     rtc =3D kzalloc_obj(*rtc);
>     ...
> err:
>     kfree(clk_data);
>
> The error path frees clk_data but seems to omit freeing the allocated
> rtc structure.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012100816.33=
1033-1-pmazzini@gmail.com?part=3D6
