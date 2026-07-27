Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94A3EF650
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145598; cv=pass; b=RtoUqhohwzqZ4Y7hKSWnQ9O8nrVSLanCOCMpAYYHkWO5x5rfgi1ZVXVSr41NWVJqcTpEGcgn6L3uvCkR46TIAF//bKxt6WgshtydDr6ZBYZOcEVarAbZcOU000LPWNO9iqTCCV7ULXi4Bz86K4je6oVIPipXwx+JExNjtsiHYfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145598; c=relaxed/simple;
	bh=JIsVCCi8V6pXUaxHFE2htTqwKO/SzOg08RdktddYlhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCSu1Cv6XOnBAYCSLECiHnLnvjl3ReTO0Tcsy7+0sE7RJE+TRmv6ip2diC4iB5iQP499AnmBsYDHPEg0PNOl+vZzVgU8VL0+KY70S9vkm5SPpUgAYj2zwJoEtip84TUPFYxyKJlk9tpQWrnLRfVolOEO+xjjjstbkRZJXho+Mjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HkNmfU/t; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HkNmfU/t"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8114a4542b2so33541327b3.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 02:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145595; cv=none;
        d=google.com; s=arc-20260327;
        b=Y/D30Rnt9VxH11TrP8UD7+guC2eCAZbIX28k1goMyjfYYaWXMRDohWsd4Z4BFYcEk2
         3VTNT3Y3RNq4VKUD0noEwrT/ZMHCo1qhhWqN3LSjpCFnaKiKL8bU3EuI2NGkAPSach6y
         37g1B59n9igToj94vwoDVH9ulZBrsXymuOREYFaiRVfcu5MSAh37JACXIQCeJPH0hOMn
         4qNhWCqjqIKLS15odsrhCCqDuQQb85XKq89eJNxId7XcvzligE78ig49OsQuZwef7Gdc
         DG4JrGBOyRf2a2wa8M+KCd/IBYrqRPpfdVantncPr7LCYuBO2b5jLgXK5DJDv0bnwn26
         PNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5xG1nDaySHmAHB2DEV/3BuD9VMX1Zk/iy2QTvLRNOc0=;
        fh=yNLOa350lHl8yGZx3ANMkyZhsmmxw10/C9f4wM6ZUPc=;
        b=gtgN1xgDwRTBaKpZ0JjpiJF1b61TiZG2vM0p+iG4+BqT+JrVOBUugxGja3Fx0F2vqi
         phczn39cpRbsspRRfubKKtMqiA2P30G+ty00IwCq1940HLb7ILXyu70xt1WDGPhBWcNQ
         zDMV5eXmjot7RDs3TOIRe8q5GQL6jzyEKQPblcmQKwQVVKQZcZeP8Xocdf+lxxvfIG6d
         hY9/AUr8GtDM2TW3vwvVuscGdc6nGMkhi4DJlmF453vV8nTpRMusUNUCLhhCKJ6Mfl9M
         MrLuH/LzA6s8pSJPBvmQjte8j96yEbFTg+KLGL4uTegCSNPl69TKUpQi/iezbmrWPjrA
         Z8Xw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785145595; x=1785750395; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xG1nDaySHmAHB2DEV/3BuD9VMX1Zk/iy2QTvLRNOc0=;
        b=HkNmfU/tkiL+k+noNduWIqbRaQ2dRDfNpYddU2OfxOgG/D8t6kPheHmXGTvkGAJJQB
         RK07jyBzaud+JNod+Hrki52mV9kgsBNAF4TRAceROW8eHDE1ehZcVT+C9Q/St3s7bxBL
         beOdwlEqr+tPVNAqfQFR2hGPVt7PCFk2Xf6a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145595; x=1785750395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xG1nDaySHmAHB2DEV/3BuD9VMX1Zk/iy2QTvLRNOc0=;
        b=TFcXtdKNfV1R6Liz2/RO+RRTYmT5H8ij3GWw+ymUB9r+zwBJOe1h5uQKfdIahNvFys
         wqqq1bhAQdkASWt/2/v//G8+CHSbfgHuDyz+pgdHisTPNmjPUHLeqPjlO7LGj46W8E09
         NnblICEApVVSlPKoXhiYwnyghrnbkSTlZJyVjBrgrA8zYCvuqLwl5SGTqimJs84wCf77
         J2dDeCy6Alz4a+awpqD5HXvWK2DZdwzm0WVnlu587FFbnElhPn0Qkqg9hEbQ6xy2dm3G
         pcFOqHtHUnaHWmIAT1bnItawKz2avpJWzyAhE1+T15DjKr0UviyIxZr7loMkY8LYNR37
         7Lsw==
X-Gm-Message-State: AOJu0Yw2A+T/nlyJn/OaVn5I79DczsWP8Ix3x5IVMwUBqxcKJzixGg0j
	+5zt5+YKFiNTGvMyq+BSx656J9X9WyoB4qaFiN1EqtN0d+7RD+AHz1+Vfj+ncCfHxbM4Kx50Eeu
	vi9BjpVY+yc/iMN2TKZUAHKk65d4hoVQmM9nK+OuMl/F+vMeOPbdw/w==
X-Gm-Gg: AR+sD12HdM5PR6cYmFwjJDDSMC4I92SseGwi80fZMJaZYlKZlB2L1fyPzczDEFIT4ab
	JXJnb+tkOAMsFL0t1gU0YH3WVZX3nwiWkBXwr/AF+viG8gEgwz6ES2f34J2PGDOA8TQLq/89z9o
	OCY6R2BEBlmSQCBNVlCJv1eQzkIh2b2JTzs+W5ZK78SGV0EA6TIUb/RuVdFsdL68Kse35ogzrI0
	3nc6Rh0hzdS+6GsbtKXntFdKyihzIM1AtMhf0OEXsyuaIUkLtPYlUeCWtfUEwMsWHJT0pz1oSo9
	GM9kWOeP92DQCMi9cL6DA2RkyQ==
X-Received: by 2002:a05:690c:6181:b0:80c:85e5:875f with SMTP id
 00721157ae682-81f69eba0edmr24598547b3.72.1785145595033; Mon, 27 Jul 2026
 02:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727091555.1023910-1-wenst@chromium.org> <20260727091555.1023910-4-wenst@chromium.org>
 <20260727092643.DC90B1F000E9@smtp.kernel.org>
In-Reply-To: <20260727092643.DC90B1F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Jul 2026 17:46:22 +0800
X-Gm-Features: AUfX_mzT23G-wjGIUddVGsL0RVNkRttwnekF_vtMZP2gVoUR7kldAOLqEdVKh0k
Message-ID: <CAGXv+5H6U0ojv5c4P4CgOjJNCNNYvn1Xdrmjb_TyZ1-nKagYrA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek
 MT8173 GPU
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 5:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Schema validation failure for MT8173 GPU due to inherited powe=
r-domain constraints
> --
>
> --- Patch [3]: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaT=
ek MT8173 GPU ---
> commit 560e4cee0c5fbc6b0c5d09c24c260e205ca79e47
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
>
> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> of the Series6XT GPUs, another sub-family of the Rogue family.
>
> [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c=
79c2a.camel@imgtec.com/
>
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index a1f54dbae3f31..53131cd4cc2a3 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -15,6 +15,7 @@ properties:
> >      oneOf:
> >        - items:
> >            - enum:
> > +              - mediatek,mt8173-gpu
>
> [Severity: Medium]
> Will this cause schema validation failures for the MT8173 GPU node?
>
> By using img,img-gx6250 as the fallback compatible string here, it seems =
this
> will trigger the allOf conditional block lower in the file:
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - img,img-bxs-4-64
>               - img,img-ge7800
>               - img,img-gx6250
>     then:
>       properties:
>         power-domains:
>           minItems: 2
>         power-domain-names:
>           minItems: 2
>
> Since mediatek,mt8173-mfgtop only provides a single power domain, wouldn'=
t
> forcing minItems: 2 cause valid device trees to fail dt_binding_check? Sh=
ould
> the conditional block be updated to exclude mediatek,mt8173-gpu?

Yeah, and we just assign the same power domain to both. The bot clearly
didn't look at the dts patch.


ChenYu

> >                - renesas,r8a7796-gpu
> >                - renesas,r8a77961-gpu
> >            - const: img,img-gx6250
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727091555.10=
23910-1-wenst@chromium.org?part=3D3
