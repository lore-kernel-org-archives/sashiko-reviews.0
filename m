Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07260463B87
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663449; cv=pass; b=Rcjv02e+ZmNwwcQwcFB1rFl/FxoBKTpckIXzHD8gKaRQ8VAKpgl4wGZKmMVB4I8YFAjk8jidaVAZAxIvHhEH871EY2cLSrwavKd1Qr+GmOZTjrg+j29d/074NoEcfrtSaztG8p2c96LX0++8dUILNG2KracCVFocJ6WsiGK2rfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663449; c=relaxed/simple;
	bh=02FhfIBqMMvQXAFc8ywza3WsDbF2gi0rUDQddC21ZyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLGKZ4v/Eu/l+95GvJsE/4Gb4gp3qHOShncPXKLLGK8yHg6/hfWo66gytKEpfiGvC/rdUsnIx5HDi9TMZDEjaltZ/E9HlI9Ervye/A3rzj9dIJQfbIHRp87zrzofxN1IXpRILWTOXtcja6re37QwwDYWk37F38liaDtEr2cqjoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPqZKLiq; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPqZKLiq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c197e7e4e94so827328266b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 06:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663437; cv=none;
        d=google.com; s=arc-20260327;
        b=DtEqzPEmjyUyzDHY0aQPTKwo3xvwUAoKsZQz388LO5QQeNCqqbjE/dqZeKe4Rq9CKT
         kWxjCVLLXNai0Sdb5/SKfKotKEXfUbtWAsayguMZpD7yTDUFQ1yaK2/JXtZUZMLkGA8N
         eBsQLh42pAtHCI8K35YDBANYxOqK1RCyXs1spTZOJ7t9vQOHdIjORCWB1fU5tq0SBg09
         5IVxpaVPSJ6zD2NxGmL7PzJkvTMDnUvAiK5FKf0lYZrWO+BIq5/AtQjTWXUu589Fp/PQ
         QoiTSVB/Z3xr3SAI7ygXUMHIlN9f1xBvoQQCCmTrhKdROVaa+AP4hGtYUojYKLXlFrCh
         w18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        fh=RVy3TjFC8fYjZ1IjA+8bDQkISlxCmaZnsdSV5zLAIsg=;
        b=febMGoSmZCWkdzQ0fOHUbeQXaBpUQX8+pdgKErPkznGYfmqwwcXRfQsnfpFNnN6YRA
         0S2cwSEqOaC4Jg09nhojxvVfMcp+Z6OaOl9ydvWpJwt3Aob0/pPFZJtiz9w4xrsOzsDd
         njddPYnUARUF9Q5LVv1yY6QB7ZpyPLHwuSJL1fTJHBn+oWddr3gjJet2NWLKndauzwXt
         R9cZiQmEES6tP4YvapGJpVRg8DN02iuxzP/J/uPgvY0zmaXiwX8sGbICXXTn8YdJPvkG
         Yf50iq/dKd52HkYR0DRPtl4bv4krAOQcLrRkIxiA0nRTGS5S0rRoR8/pJKedy9hz1pzk
         5/Mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787663437; x=1788268237; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        b=XPqZKLiqMjlnfM0JM0e3SiKcvG+bPAhoDPm2s02HsqHWk8455IKlawSHYO/uaqq049
         c4Zb7DXpalq1QnAMsXqzaOUeCIed9TCqzGklZ2nxu5WlqnqYLsx/h4z3h9beFxb+Tw3n
         ZCVGsuprtqcuqZR1Va1t/LFMAeaS/+1kMRiBML0Wl9Dh6ztz4q+FYeyyFO01FrGOOP99
         HvjuSTGd0iivL6CK1HovHxmWb/224GECVATrYEzUAg26n31E5TCR20Y+t8qNASigVYue
         x6em44rTrQzi2QrTcbzoUIHDqa/3cEAYjxJ9SvdPQccOuYqqIktBk/L8uBVfjbC7ELRT
         s25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663437; x=1788268237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        b=Tlj7yjRBDjl/Q/BnN8fK/ngnZr9P3tfouj2mX9FsKXwhZysvdbEasZ9XM1w0h1xZqq
         C0jYMwB7ZRpQ+zKWF1RViA84op9XDTKFzGbV9923Zbmf3DpYQp+qenYxZE5eHWrL0AmS
         q1+z4Ma9wzt+xExBl2p4HP/Lq50Rgqu1luvANZqIDibI7YXpbcUETRfUT7b+FYFmyAkP
         UlYXzP47dHWwAEa9GLqP6xdxYrwp8yhheKO3Vm1fkJbW1OX3FshHMAPKbtUZtKikz6UU
         6iDKlAxVlKSvLbdEl45bxVHbx3utm8OCaIu+/s/yEm32AfbCqEeW26RssbPSKRcJ4BN6
         HXbQ==
X-Gm-Message-State: AFuF++mlveJxVknEEJnTiRHSpwV9vdWwnNXLwoSlL7KqlsxyyX3tczu8
	4qesCv/bEnCXRLled8HRrtjeVZp5C2SVHclhg8URtsTPw6UvAIlglFSQv4Olfvv+wUOaT+JjUsU
	cPoxBZye3WcpRmjhtsyTyXlfmAAb7jVeluke+
X-Gm-Gg: AR+sD11eWvPk90C6+8cV3Fty8+BPgFwvldSdCNzlmHLKafsLfJ1AzC7Uky238ZbdzU7
	De4EN6xCnt4MvK6p8gJUf6mq//YjVkbpHVHGmFUahsED56tQt7ykI+z1n4Kjo7uq3PHE/AJKoi4
	0xEjgWH1CRJ+jL+sZNBxvTpqymCMQJRCCjP/MMhITmDQckXtqGPoWzV2QQMgz5Cn4M4Rmq6xURh
	fo2LAvMpGLEeLJSUNf+qkEJ4YV0rdXlbt+jHE0q1IaPb/ZDrqtF/MxQJpKqu10xJPKvEK9WLq5u
	D1Ceedazh2yvs6BU3/uSEThEQHd5eF6nlOvDtXkrcY5Dg9c=
X-Received: by 2002:a17:907:60ca:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c24924b79ebmr3067182966b.7.1787663436768; Tue, 25 Aug 2026
 06:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
 <20260824125523.131762-7-biju.das.jz@bp.renesas.com> <20260824130453.D03C01F000E9@smtp.kernel.org>
In-Reply-To: <20260824130453.D03C01F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 25 Aug 2026 14:10:25 +0100
X-Gm-Features: AcwNN1Uq7B_OPhhUOfAGvmbEHdK5dtPV8yVIVtP8a8LSe8nf83A3g2sBuIV4qcY
Message-ID: <CADT+UeBsPrADZdx34qS4YLyDwmO9Lq9qJMYWzhw0HW7+f_yZCQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] dt-bindings: pwm: Document RZ/G3E GPT support
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-pwm@vger.kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sashiko,

pwm.yaml  already defines this property[1] as required.

[1]https://elixir.bootlin.com/linux/v6.0-rc4/source/Documentation/devicetre=
e/bindings/pwm/pwm.yaml#L23

On Mon, Aug 24, 2026 at 2:04=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Add `#pwm-cells` to the `required` list. The binding omits thi=
s mandatory property for PWM providers.
> --
>
> --- Patch [6]: [PATCH v7 6/9] dt-bindings: pwm: Document RZ/G3E GPT suppo=
rt ---
> commit 9a7d174b7aaab1e8640a8415696ce9830442c765
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: pwm: Document RZ/G3E GPT support
>
> This commit documents the device tree bindings for the General PWM Timer
> (GPT) on the Renesas RZ/G3E SoC. It details properties for the 16-channel
> 32-bit timer, including interrupts, clocks, resets, and power domains.
>
> > diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.ya=
ml b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
> > new file mode 100644
> > index 0000000000000..cb4ffab5f47fe
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
>
> [ ... ]
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - reset-names
>
> [Severity: Medium]
> Since this hardware is a PWM provider and defines #pwm-cells in its
> properties, should #pwm-cells be added to this required list?
>
> Leaving it out allows incomplete device tree nodes to pass schema validat=
ion.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824125523.13=
1762-1-biju.das.jz@bp.renesas.com?part=3D6
