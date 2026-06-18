Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B317A2FC
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781763377; cv=pass; b=o3N88l4TYJC3BBJ5oRwi/lVp7m/Lqvw2HF4kzNukYdcEIw4M6xovWJE3oPedUmqN8G5Q1XG2KRpGWTm8jzFvn479Ch2mc+KKqlZSQgnIurD7tTdCdAf/exSpObuH5FVzDElZOpVMWd+1/p7EDHlVGWdPv8f+FUDMDbEM+jX24Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781763377; c=relaxed/simple;
	bh=6Du4FMFP7UPcAJzlB4al9sH/b35QZkMHKVDjgrhrnV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jpl33QRAKKQcpBFkGuWSPuHCX+MGKp/OqTY5R4Fira5fHPkboSjlBcHLKWzeTejdV2CzJFzpU8e1/uPPn+ZTJVc7UYLYKMcVwnmvM1URInu2ZJSlyditeS8mZmQFUBZtrqyf5Vm8qFh0qeh2ko/R9RHJnFCfWi47D/EvuJC88/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hinKA8ia; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hinKA8ia"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69d8f70cb0cso482629eaf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 23:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781763375; cv=none;
        d=google.com; s=arc-20240605;
        b=MK2LMaAmUpYLWcL1d9SsKLRw3Bbt8lI5JBAuoSY1nArSDXeXc5knK+P5g8gyF+P8JD
         0+l1U3bDaNA1+YMAtKajH6Teqg0cbLiDNw5a3DHMXJdoHdF+JT0mdL2Hgsenu4dCRIyK
         GmEgKJrq6LxpAKToW/7tAeCDzO5CIQghETEud+avnAUm7ha0vDVwgn3nAVW6IZoT2hyg
         dBdpKos7CQ/G5rE91xPs9K5RNDotXraXKQ6hZmguVHPMmhpRKC+wSBMBWE2P1W3PF+Ql
         koqBPzAxdwB9kt6DBP33bE5S0b5Q6akxDfZutVm+mtRwrYSMTN6ltEQ2tnESZ44WS77f
         8OEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XvwDdUwqNB/mJRpzgcLfrzEdZHAgOs9CmXdopX1fav0=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=PNDdUOa3Ne9VYVMRUIVJrxyVEL0mOF2IPDFYjtj7+aQmirKc8eUHz41KmJ2CtwS4OF
         XCW2RH2b/HdFM/sL3V2gEVcOBxFn0CkdVhhV0ridJLa4DDM7rDzOQgEW/H3jwRk6lX2l
         PkkKIcy1pMj1djP7VTw5tElJ3UEe0LqE0R0lIGC3R7mSgXwu77WnQhx4UoL/WAMnLIWx
         KKjjAFPKVgGXCMDbCoV5TJ2zQZAWGAKOnBOa6QgCb2ym8zNxQtqOxE989PsTbs+LWac0
         0IIz24OrDNlOY7W9LOOIVWCaRlGQBqisgFXrnx/5FH2TCpUg1a3d3MndS+xtpyjxKRvv
         olyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781763375; x=1782368175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvwDdUwqNB/mJRpzgcLfrzEdZHAgOs9CmXdopX1fav0=;
        b=hinKA8iahIm5G94a9t8wGMhDhOpwMqXwtDGzx6mNNz2AeSW7PTTBZJEv5gaxsgOYXr
         ovStjuXOUEa7/j6dQl2/z0M3dsMFyjEdp3cz59PFrUxZEQIXYnBK/sJn93TQfA0r3oz+
         1RWm5b7F/LmlZP9KjtgD8uGH/dweCh+xxFQYgTsKh5yhSH0uhrFCY6mTtR0nN+Oam1JU
         qOmvgpGPlxap7QnBuC1hcpWJ5YKoMv3fqhYXaP2F5gVeGooaxWSReYWcPS7UdCL/5LdA
         SElIu6VrDI0uplPTvBoaNUYHURkK/+hnvSCFuWUaddzkeEB2h6+rfnxp5E6Lp8L2aAC3
         lCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781763375; x=1782368175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XvwDdUwqNB/mJRpzgcLfrzEdZHAgOs9CmXdopX1fav0=;
        b=WYg0ZhvdrTe/apUMSk7To8eMg0Xi+dtDZm+yPl0lVB11/9JCkc3GA0YEFFi1jqTo1g
         qLhFrkvgTbtRBIK48TQt1O2qipLGZIJCbto7qNnvb9J91/jmubr9qsobj0GYfNMdmxT6
         umlBMrKR1ZWA06YKMHmwEBvmjIOLlV1dm7B0prbYcBNb2Ti4GUb2k/6vjMFmVLjPUB02
         da49sjOJVfvdq1qFtLTRh0bSxInB6EYivcdfB4pxCwRNoszD0ja7hbQ5RAlAKtJhMRXV
         Us0O03eyzWa5X0RshwnZDzxcCmk2HqeEOJF44dN2tOwQXQUoS+YHe2s86ojWrzUv/UJz
         X+Cg==
X-Gm-Message-State: AOJu0Yz1UcRcm3SfC2IP61fksCn7WDHyVKOGmYSYTLznB4PN5P6azOLL
	GVfwAcVdNjaWb4GfuKsyrW9U8+OL1WAFd6jj54MDUTWXjDVST9eN0yka5RRg67ZXBt6qU7P4jXd
	+lPkBDhRpMHX/BWP/A0UwSJnrZ3AhqAMwOzVE5rRDW8CYbMfcQHNvEcXqgw==
X-Gm-Gg: Acq92OFIQrMnR6OZQT7izR1B0zG8U9hj330Bk34JmIGXjkXN58l3oonCamXwjGPG4p4
	WVv+icg/N3Rjj4zfGLjrYoC6hWYrUh0TrP7SM+GLPF7SefgJSQY5w6fpmTXiLu6sJ3nDLXEXXiW
	AWBS1V1UV20lndGMupduahQ3xCSdzx5+NgakrMMv3wAbwGz9Ny6kgsVgH3rW7tEbvnGxvs4HmOg
	hr8mZysH4UMNwenoqUFgG5uuZ9Xicy4MlMy3/WxNgDWy3IrJ3uG4rO6ZNa0kk+KJPeoGoyJd2IW
	XJM=
X-Received: by 2002:a05:6820:80c8:b0:69e:39c9:c6d6 with SMTP id
 006d021491bc7-6a0b5e3cc18mr5260511eaf.10.1781763374599; Wed, 17 Jun 2026
 23:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609130021.99899-3-cuiyunhui@bytedance.com> <20260609131621.3541C1F00898@smtp.kernel.org>
In-Reply-To: <20260609131621.3541C1F00898@smtp.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 18 Jun 2026 14:16:03 +0800
X-Gm-Features: AVVi8CfbhIfrfyOhP91UzVJ7Wt3CfSeCLsAl44UT7jOTGHzHjqut50HYYR5OKX8
Message-ID: <CAEEQ3wnt9wrVvSvdcuyA3wME7oCyRmNrKOKi=LjwKWKzYxWhNg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/3] riscv: track effective hardware PTE
 A/D updating
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,


On Tue, Jun 9, 2026 at 9:16=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Incorrect global ISA extension check prevents FWFT enablement on=
 asymmetric SVADE/SVADU systems.
> --
>
> commit f3d7c0060d5bf449bef26605d30b6a4b56780451
> Author: Yunhui Cui <cuiyunhui@bytedance.com>
> Subject: riscv: track effective hardware PTE A/D updating
>
> This commit separates the tracking of hardware PTE A/D updating from SVAD=
U
> discovery. It enables Firmware Features (FWFT) on all online harts before
> globally advertising the feature, and requires secondary harts to enable =
it
> before they are marked online.
>
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> [ ... ]
> > @@ -287,15 +291,88 @@ static int riscv_ext_zvfbfwma_validate(const stru=
ct riscv_isa_ext_data *data,
> >  static int __init riscv_hw_pte_ad_updating_init(void)
> >  {
> >       bool has_svade, has_svadu;
> >       int ret;
> >
> >       has_svade =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
> >       has_svadu =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> >
> >       if (!has_svadu)
> >               return 0;
> >
> >       if (has_svade) {
> >               riscv_hw_pte_ad_updating_requires_fwft =3D true;
> >               ret =3D riscv_set_online_hw_pte_ad_updating(true);
>
> [Severity: High]
> Since riscv_has_extension_unlikely checks the global intersection of
> extensions, will has_svade evaluate to false on an asymmetric system wher=
e
> some CPUs support both SVADE and SVADU, but others only support SVADU?

 Thanks, I'll address this in v4.


>
> If has_svade evaluates to false, FWFT enablement is skipped here, but
> riscv_set_hw_pte_ad_updating is unconditionally called at the end of this
> function. Could this cause the kernel to assume hardware A/D tracking is
> active globally, even though CPUs with both extensions would remain in th=
eir
> default software-managed SVADE mode?
>
> If the kernel incorrectly assumes hardware A/D tracking is active, would =
this
> cause arch_has_hw_pte_young to return true and erroneously expose the SVA=
DU
> extension to KVM guests? It seems like this could lead to unexpected VS-s=
tage
> page faults and guest crashes if the underlying host CPU traps on missing=
 A/D
> bits while the guest OS expects hardware updates.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609130021.99=
899-1-cuiyunhui@bytedance.com?part=3D2

Thanks,
Yunhui
