Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B223CD8AC
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555356; cv=pass; b=qZgF6+WV8p8hF4SAqAGHG44wcVQsEXdudtNo0x6XtW9kDYfdiNRUvTc39Sex0Inxig6hu5+jLsB16ZdTTtBKV6DDMmCkdC4mcJmVnbgvTG/uKXTIy3WYKuKM1LBWnaBRlTD7rv7O3eZEw3VC0CHHoeQlLCREEXLGAq5OhQFdaV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555356; c=relaxed/simple;
	bh=H3rnulMfl3DeILYXkuBtcVo0HBpok14PmwBuns7JPa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NswTG6RlZCxK7B/FKIWE7+ZGy06z72Nd4VzYDZWuCPWnE2VUX0m2q2+ZhdXqpUvT3iTyJXT6O5Z9qLqFT1n/LzJernGfQjw1Bv5R4QHsYwiGv5mtYjizB0H4SXiq22p1i13WKol01Oi3gY/e15555QCBVtHvTDZ0GfLh/DsE+R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obXKqQyy; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obXKqQyy"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69e49452f35so98519eaf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 23:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780555354; cv=none;
        d=google.com; s=arc-20240605;
        b=UvYhNieIl8+nFVhXtFmqh9SxcbPeKJ9GWTQ04Rwn9L+5jf23fYfXzfiZBoFTo1pY6P
         A4TSJ+losfE6yH30gFsT+4QKcmVvmERLmrxEAFBkS6l3t+9MsMNAuJWEtnocqCoGriLi
         2Gq6puDsSyD2e0cg94vHJpY/6AgbbXpQa2N92TwVtrOu1wLcaGel+TlYnM4HZR9ez8Ep
         nPpPQeJDIpyQUymqyQcjokf8Xi3kIHXURq6IHctv/B6sXGzz981xb0VF5VDVmlE3mOef
         XDH2d9mopNT0pD51QV7QU77NE2SphTTUf8Bx0ro2OCPSIw3ocC/wTPEyB/0oR/AKnKtC
         ZOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6yfZQB52noCs/9R98yvRH4ThEmgKOXXjOByci/XdGgY=;
        fh=QfcTh0wJfLHP1QZBMZRnZ/OybELer8XYHKfbofkyCNs=;
        b=PNPfJ1WNAPnEy9wxLYRQkvLvApwNuce8K/NlF/jKQ9w+/+S9j+ld3bShQf255XImWc
         lBXW4z4ZZx5di2BG9hYxt5uMb3zqV4Svus5fDFbrAT+08o8ZMOb+71EhRjmwGC785JcW
         0JDy/dZCpg2DrODSWf6bf9zX4zaaltayoc9S8Tm4O8G70+2JbcFpV0VyVbBoKrCjJ82+
         yMv75zVy1fLq3OEQIM7ZfbwWcbx/lIXRmYdbhSZRnM2ROfFKHfnMncoL8JV3vD+ksS+4
         A1HGSWHMCBi6QSyjt1xb6SWnvCWXJRFBI5kh4boEpgBkvBNYb96qa3khcgE4S3XFyMIv
         etNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780555354; x=1781160154; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yfZQB52noCs/9R98yvRH4ThEmgKOXXjOByci/XdGgY=;
        b=obXKqQyyTmnTMzfzGJF/MLF82yivmJGSRfTHeOsFCwYnUHqtoG5DPMCwIp5dmEGAoO
         /ruLpSaHHyWwY6GES1r1FZYYn/8kMjZt3C8f0cKcPBTeIn3WAlLBCwqVnDTl+ijkpKg3
         +MPbTTodQpS2FOGdl2F2Vc4bXZ2uvErFvGVGDWzZdBPh3Litb1eqaNCkig+ImMEhzft6
         iEJimN0nE9BmjT7GWws9We6U3CDghprlk7iyj3xCLIkj3RPvywxGCNm32Mtwk/VpK+vj
         mjTsG29/uCl3dFqrXvcACnFr2bsMWG0IfnE5MfTUhvFC84pDIK8XzAVPUJTO8pVcZqE8
         yIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555354; x=1781160154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6yfZQB52noCs/9R98yvRH4ThEmgKOXXjOByci/XdGgY=;
        b=M+gVT0+l5TF7aZ4wU4PXB0uerTjZ0hNwqpXCLey6lAkeiIoGA3cztzH77t3GZqSsF5
         rFISuSnSPbIj7JAtcmxnzW00kfO0Rn9OlcX73aRd6yu+LBDx0KlSIfJ4KJPMb1aU7WL3
         gcKgRqAPuawsq0xpJKL3EnxQwNYYAdfEK2OMX70/w5Oeot89Oo8Mqbxvc0ShNiNN8S/u
         fj+Prq95xvSvMfW3JNf7iNVv/mf6bYth2JnyiiJFcBXblltG6qnHiItPW7QcbZGWRmb5
         SAbTNZ0wrJPwAwWg8p6xh59K1IZVPNp+xFpRHCHaDEjj4XRzJh+ws6sGynVvatwtSMBU
         SweA==
X-Gm-Message-State: AOJu0Yyj3SELoTwvsfnyXa3MlK1H8eWhTYBeGStaVtK/flip0wC97IYY
	Awf958KnWPhgnWpSXRXGltcG8ArXZfsTXlNRj5lXuhnhyXyli6OQuz2VvaIHa38c3wTMMSp5q3J
	UQolq4J3PV27g/0gaLoEdOpSLlSTy2Eoy6pK23yMQZg==
X-Gm-Gg: Acq92OFIu5y7TjtvaCFoGrCqUa8F2tyTtgrZw6zPvDVA6xiV4VgTaKjWc4/p2SCKGkM
	qZF+lhZb/jDaos/VOylNDuzfYjJ3DDsAniSzbd6HhoWFWqWrzrKN2a2334lka0PcQmOzQkCjD7z
	eQ14IRgu4SLnkC2kDMk9eie5f2PpqFJGPOwd0I1zMd36LPWHylx+beI+vSFg5PkL+FeAiWymWhE
	7L5Js6frULH89iZD7b4Sdm9A3JmghhVhYKPo3OsiZZeoksHICWZ2R7Xo1azNai4A4MKO9PprDUS
	wxOdTvrFznKI6f/WT/UJ+ro=
X-Received: by 2002:a05:6820:c3cb:20b0:69e:b8:ffe8 with SMTP id
 006d021491bc7-69e480cea9amr3162580eaf.52.1780555354372; Wed, 03 Jun 2026
 23:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com> <20260602232800.768311F00893@smtp.kernel.org>
In-Reply-To: <20260602232800.768311F00893@smtp.kernel.org>
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 4 Jun 2026 14:42:22 +0800
X-Gm-Features: AVHnY4I8rB9-WPj3dLhf7Mcp5Ee0Ym_vIrvBsuBkaWpxQWp0kj0HO6TjI-qUSM0
Message-ID: <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> > @@ -154,6 +154,23 @@ static int riscv_ext_zicbop_validate(const struct =
riscv_isa_ext_data *data,
> >       return 0;
> >  }
> >
> > +static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *=
data,
> > +                                  const unsigned long *isa_bitmap)
> > +{
> > +     /*
> > +      * Zic64b mandates 64-byte naturally aligned cache blocks; cross-=
check the
> > +      * cbom/cbop/cboz block-size device-tree properties to avoid inco=
nsistency.
> > +      */
> > +     if (riscv_cbom_block_size !=3D 64 ||
> > +         riscv_cbop_block_size !=3D 64 ||
> > +         riscv_cboz_block_size !=3D 64) {
>
> [Severity: Medium]
> Will this check erroneously disable Zic64b if a platform does not impleme=
nt
> all three CBO extensions?

Zic64b is mandatory in RVA22/RVA23, which also mandate Zicbom,
Zicbop and Zicboz, so all three block sizes must be present on any Zic64b
platform.

And architecturally, all the block sizes are one quantity: under Zic64b
that value is 64, so the three must all read 64.

Anything else is a misconfigured DT, and the kernel should not trust
the zic64b it claims.

BR,
Guodong

>
> If a hardware platform implements Zic64b but omits an optional extension
> like Zicbop, the riscv,cbop-block-size property might be absent from the
> device tree, leaving riscv_cbop_block_size initialized at 0.
>
> This unconditional check evaluates 0 !=3D 64 as true, which would spuriou=
sly
> trigger this error path and disable the valid Zic64b extension.
>
> Should this validation only enforce the 64-byte size if the corresponding
> block size variable is non-zero, indicating the extension is actually pre=
sent?
>
> > +             pr_err("Zic64b detected in ISA string, disabling as the c=
ache block size is not 64 bytes\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-rva23u64=
-hwprobe-v2-v3-0-5529a7b28384@gmail.com?part=3D8
