Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6811C489893
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669694; cv=none; b=oQP5subAuxSyDh/S9CK3spno6v8oAxbWGnNwaYofznhqINqhq34OpXooABVDCuG5YaMeMVExGdeDeheSZjwEefJ16RFG6YmeIjyzR6qpu7Ka/yosm6DizeS6sN2D1m/UJteP7rmsia8rbb10ATPwXG8cvbszFZEX2ydqrg0UsH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669694; c=relaxed/simple;
	bh=SAx48VPpjV1C3AuUQ2meuLcGqLHTYa9IkFEkWSYx9ak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nmJx3+2LvXdZMwQCcY2wYdq5lszImVmx/bKUTgeJ7iDR+2SSLO/3uH4ge/fkOv1dgTF/X2BawF8lbb1XY/dR+kv2zRLh2Ezg8Yz+NcXofZgkv+AZ2n1wxiV4iL958DiKwYx9gN50lYPJgreZC8sxf1tkKf/iSAm7zbcFfFry/04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpnmyGa7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpnmyGa7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3811f512167so2489704a91.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785669693; x=1786274493; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bek7NZHZI39nYrjpJV/gsIRm/qNeyP8rpucs5jMbA8c=;
        b=CpnmyGa7/VZCiv/6rpdiEI3WSb1s7EcH+y/faHPzPfUUZSsq5dimhalb1t3PoOMwN+
         RuVJXMrl5/nrc95jKxbERDP1X15kpDuMnC7poWcKjiCWKZtcDod2V+sM3Fuu9rmPlyMX
         FHJfwIT8XgrvnnkhhnqUU59j8TNNHiqdcWLnmAa1+r1LI6ESTwoTsVCn+PK9uJZrnbx4
         kT1IJyaIFKCauK9zAtHdhq0bf9HyTcfzFa0sWyBjLnt8+y/xxyLidGbHL2C/51B1I8Z3
         gHYCv7N/HLNTEcxnvqpqEnj7SuDp/ZLJU+A8kKzJBqnkKg2U6L+u3gnUiY4l6HAJbxXF
         uF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785669693; x=1786274493;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bek7NZHZI39nYrjpJV/gsIRm/qNeyP8rpucs5jMbA8c=;
        b=s+tDkFB0m8WH6AosxJvv/5YiaNUnZKlc+wOwAsDgFTt4ADIgmiZBFydWAcoK5r8C8s
         Y857Mo+qS2HmU675nkYMvcZ5AwgCullTEEgn8K5sTxq4Zj2oPGkD8+BmO87YgAoDtBaO
         0MjFyctRK+g/wYulb2xwdp5EqzuxEIwL0MIAD5M9mAG7VoQzViSq10jze1WGY1gz4+N7
         YYWS73sv3hmrKtzNlcZSEImojrFsmxTIb7yqek9sUiZldLa8WBHKEYBXwYWPqNtjFeUZ
         6Wmb4POlSVGXMYxfpf/4H1ieQBLp3P1+qTAGemcpKw9dmrvl8DhER83FrE8r76HD4adj
         zrkA==
X-Gm-Message-State: AOJu0YygvZNiVqNWFcjG7imkvHhn/MQhjv44oqsnR1GxiVSKdgW3J6Ia
	KiTtKbBL/3yq2EU+GpabXrS9NYCb2vQZhrdSsptho0UTQizEAVmGtmMwXvWhsw==
X-Gm-Gg: AR+sD12aYrxS6juJPaxESZvnm/nDvPfYjZV+A47v+cXsv0ALkNMEeAnAC5agKC483bw
	Y2Zr487AIHDm13ZvrkXBEl7nf7+w6Av9XUTJ1drzx2iF+jLft52mGktKHkrhf9hIcmGPN6R80CS
	/2Tlc9NO+8jhcUB0Zo1B9l2VQ/f3/lfAlki0W3dbFAJCBzgV/B0xBPTS9yrpBnjIxZ4iZ80vrVJ
	mOQiK9SxWY6Cl6zIoJD9lbsciyySXWE8ypPaWi637Vx4zIdDE9vvurWJZBKJwdkt2dyRoMCEI3f
	Q1gevnKoTwTGDLWTEp32Y3rOg3MaN1J3em4UoySYBHFMByLr8wN7G3FzbFDI2Ov3bmD/Xq4LT1R
	kxXQRh6m7zGqa8Ifx9kZj8V4L/YnsZVlrVGXOn9gaEhwiHuO5shNt886QUIIOxJ6XiKbcCSna3R
	Eo+S0HF/plUzjqCIhq2mfb5UPnymxHTPUYwWrx7gcfMoJkTYG+ck+Q9PwdM/RaoCM07VcaKkyu5
	+vgmvFvc2kCYgG9
X-Received: by 2002:a17:90a:dfc4:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-38fbc409a15mr5983638a91.5.1785669692687;
        Sun, 02 Aug 2026 04:21:32 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30a3c75sm2723278a91.9.2026.08.02.04.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 04:21:32 -0700 (PDT)
Message-ID: <c4f702276cffa8d133bea614a9eac94164357870.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 4/5] bpf: simplify the bpf_is_reg64()
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Sun, 02 Aug 2026 04:21:28 -0700
In-Reply-To: <20260801013453.2B6081F00AC4@smtp.kernel.org>
References: <20260731-static-zext-v2-0-da4aa161e8c5@gmail.com>
	 <20260731-static-zext-v2-4-da4aa161e8c5@gmail.com>
	 <20260801013453.2B6081F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-08-01 at 01:34 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] `bpf_is_reg64()` incorrectly identifies 32-bit `BPF_PROBE_MEM` a=
nd `BPF_PROBE_MEM32` loads as 64-bit defining instructions, bypassing expli=
cit zero-extensions.
> - [Low] Stale comment referencing a deleted parameter of `bpf_is_reg64`.
> --
>=20
> --- Patch [4]: [PATCH bpf-next v2 4/5] bpf: simplify the bpf_is_reg64() -=
--
> commit ee97fd37754941b6dd81dccf5f68e7f82c74ea6d
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: simplify the bpf_is_reg64()
>=20
> This patch simplifies the bpf_is_reg64() function by removing unused
> parameters and code paths related to BPF_JMP instructions. It also
> streamlines the condition expressions for identifying 64-bit registers.
>=20
> > diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> > index 6125598d16a84..ac0a388b40218 100644
> > --- a/kernel/bpf/fixups.c
> > +++ b/kernel/bpf/fixups.c
> [ ... ]
> > @@ -44,6 +44,42 @@ static int insn_def_regno(const struct bpf_insn *ins=
n)
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * For use only in combination with insn_def_regno() >=3D 0.
> > + * Returns TRUE if the destination register operates on 64-bit,
> > + * otherwise return FALSE.
> > + */
> > +static bool bpf_is_reg64(struct bpf_insn *insn)
> > +{
> > +	u8 class =3D BPF_CLASS(insn->code);
> > +	u8 mode =3D BPF_MODE(insn->code);
> > +	u8 size =3D BPF_SIZE(insn->code);
> > +	u8 op =3D BPF_OP(insn->code);
> [ ... ]
> > +	/* non 64-bit loads */
> > +	if (class =3D=3D BPF_LDX && mode =3D=3D BPF_MEM && size !=3D BPF_DW)
> > +		return false;
>=20
> [Severity: High]
> Does this condition miss BPF_PROBE_MEM and BPF_PROBE_MEM32 loads?
>=20
> Because this check strictly matches the BPF_MEM mode, it seems these othe=
r
> 32-bit load modes would bypass this check and fall through to returning t=
rue.
>=20
> Could this cause bpf_insn_def32() to inappropriately return -1, skipping
> necessary zero-extension for architectures that rely on explicit BPF_ZEXT=
_REG
> patching? If so, the upper 32 bits might contain garbage data, potentiall=
y
> leading to out-of-bounds memory accesses if the register is later used in=
 an
> address calculation.

I don't think this is exploitable. Both BPF_PROBE_MEM and BPF_PROBE_MEM32 a=
re
inserted by bpf_convert_ctx_accesses, that directly modify insn->code,
w/o call to bpf_patch_*(). Hence bpf_is_reg64 is not invoked for these
converted instructions second time. Hence the aux->zext_dst flag for such
instructions retains it's original inference.

Nevertheless, I modified condition to include BPF_PROBE_MEM{,32}
to make it future proof.

> > +
> > +	/* atomics, see insn_def_regno() */
> > +	if (class =3D=3D BPF_STX && size !=3D BPF_DW)
> > +		return false;
> [ ... ]
> > @@ -623,7 +659,7 @@ int bpf_opt_subreg_zext_lo32_rnd_hi32(struct bpf_ve=
rifier_env *env,
> > =C2=A0			 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BPF_STX + SRC_OP, so it=
 is safe to pass NULL
> > =C2=A0			 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 here.
> > =C2=A0			 */
> > -			if (bpf_is_reg64(&insn, load_reg, NULL, DST_OP)) {
> > +			if (bpf_is_reg64(&insn)) {
>=20
> [Severity: Low]
> This isn't a bug, but should the comment directly above this call be remo=
ved
> as well?=20
>=20
> It references a fourth parameter that has been deleted by this patch, whi=
ch
> could be confusing for future readers.
>=20
> > =C2=A0				if (class =3D=3D BPF_LD &&
> > =C2=A0				=C2=A0=C2=A0=C2=A0 BPF_MODE(code) =3D=3D BPF_IMM)
> > =C2=A0					i++;
