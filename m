Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5536B900
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532617; cv=none; b=B263F/YPSPqGr7TJDD19gqyzIo/AnCfwup7U+MZ5N5TADniZnIDEoxSxHMdjYFg8cQq+U3SkLGSnQ3u+murN9W7xcwRmg6mMgamsNKt/l6FAgdnS9iDmFQtiMJDxScOHuu0dQuQH4DyYlZfEnT/JYF2FREaOPADcSM/TJY9c2S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532617; c=relaxed/simple;
	bh=dybP+Hv4Nu5PEAN4vUSB0UeMsaW1a99AmaKSnCc5bE8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HmIuj8AEDtwVOSe4GB6q0lq6O6NduILsFykBVF/Vq7LJLGfetHy1LRy4ktxQ3f7l0LwGcevN5mS6X3KpVNyVSA9XTum/hiBodewdm6Ha464l2p0hr5ZvkDYU/Lx7l3bIYHTmUvMEjGBmvSmQ+rP1vvznHPb1VJtyUPrdr7amTzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGdNXULR; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGdNXULR"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e27035206so1788428b3a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 14:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785532616; x=1786137416; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cfb7EDW++yGGnxVxMHEhslFM3wDz36SQVscZpbW7b90=;
        b=gGdNXULRNkpYJnw+uNwjU0bM2wAruDAuChNPZf8j41WVJcMkvuESwOnErbePWQMRXP
         pJWlWa2kAc4S8U5bJuSKTD9osfcoYo+BZk6D5kcEagARQi7Um5Kpl5Pp8dD5MmO4bpMo
         oFm3cEO87hwr/JegKD7pO5vgWObG0yr3p7a8UW4dAzJEub+3yGaJ+QrnbsZg10TDhi6X
         3hPRVWagU4i7NpCkH1PzQ8lg+Rk1+fm0RspQjCSSKBh8GNIQCEJ/tDZg5/cNEfAqSPpZ
         RHE5YbyNlNyoUcxhdeloa7Af0DmTal2nGfCuUR3GiF9ZuEbX8INBXlCCrEWECQLmcS7a
         zfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785532616; x=1786137416;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cfb7EDW++yGGnxVxMHEhslFM3wDz36SQVscZpbW7b90=;
        b=G2+gU4dbZYp6kS44TwSd0H3ncN23JPfaE3W88i5STANbV6iFwmAqMXFEsYPjgDBodA
         eAMcuX6v6GWoMUz8eV/hXeW9SxM5pH73pzpc7YwOh0a57FWT5We3Pa7p2/nmE3rnyp4l
         iUnTSz3C982iDFdSNTKq2HAD2lCyML51AMEisA77ypRndFxj5TR95Mf4attRfih9bOao
         lIW8A0HWY8foPfmqPsouRt62cbC1+MJ/GcFAcIu+By+iVLJ4xhtuVCB/VrlyEw0amN8S
         VdWDdHanULyexUwQReB2Yj/NzRMNGWwh4ohIdUZa/W8p6vt3+dOuWZjQH2fKPIJnQpa+
         /tUw==
X-Gm-Message-State: AOJu0YyxqNslh/Cao5z0d1JfLL6aC+w8Stz3kLhC1ZXOpoMFSV8xVDHh
	V40hitJUa6PwnNaw7Wfpd5YuNJVuGSrVnYe2XYgy2hjnfzjId1GLmM+3Ul1+Ied3
X-Gm-Gg: AR+sD10iWHqmmLemoV+d1PgbWNHA2IHnNEq0wO34PymtK2UKp++fbC1+HTlZsDGJA5p
	7yxiIwDyzCuQ9MhB44v3dIxBSYdI/WBUsfL4+Zc/iNx+PXDM+vSjldj3UxBsuBoLgOzTcBbvfFq
	DjVJuO1Y3v9pCknDjVfPa3VJoqLv2ytqwD9HupeXVXwyD8splkk4NPXhbP031ban9kHd1BJcugF
	G+KK9bL/ZkOFdOf7t9wRzD1ckZmwvH70gi/CnN2huAyCNN+EwjU7/tMAreRn4p/WIDi82cMc6Nn
	pOEnncG0a47n6/ofZDXXbq1EIMAxbYbPyDz7X1m7LKoPyHNV3awFTae5rcC/yWvV/AD+YRHRbRa
	m98xWIW/eb3ff6lcLZzN8EhPw99L97zH2PVEB08mhWaNVVZECcr/xe0Y/iKYjOfQYdI04UiEAf3
	r2iuwWH81I37WUGPwyNHLwStrQ6z+Zg3tnZMBdxvUO1hk7abPk9AoHqOM3x4wuqDG7RX7KFxFTi
	sxcGra8wWobxoXq0jUg/Hw62D683ZIYrnxRNXdi8aQwjw==
X-Received: by 2002:a05:6a21:9f10:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c92a7bb452mr1155914637.44.1785532615923;
        Fri, 31 Jul 2026 14:16:55 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:f5a6:d314:fc37:ae46? ([2620:10d:c090:500::5:7346])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c1casm9404538eec.10.2026.07.31.14.16.54
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:16:55 -0700 (PDT)
Message-ID: <b76fb3fdb01dc530efca32da98e965e33898fc9e.camel@gmail.com>
Subject: Re: [PATCH bpf-next 2/5] bpf: track upper 32-bit register halves'
 liveness in compute_live_registers()
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Date: Fri, 31 Jul 2026 14:16:54 -0700
In-Reply-To: <20260731191839.AB5E01F00AC4@smtp.kernel.org>
References: <20260731-static-zext-v1-0-98a4dc73e94b@gmail.com>
	 <20260731-static-zext-v1-2-98a4dc73e94b@gmail.com>
	 <20260731191839.AB5E01F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-07-31 at 19:18 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] Critical verifier bug in conditional jump liveness tracking =
causing missing zero-extensions.
> - [Low] Suboptimal liveness tracking for 32-bit conditional jumps causes =
unnecessary zero-extensions.
> --
>=20
> --- Patch [2]: [PATCH bpf-next 2/5] bpf: track upper 32-bit register halv=
es' liveness in compute_live_registers() ---
> commit 977deff7b46d8e36a957595add75da7e58a91c59
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: track upper 32-bit register halves' liveness in compute_live_registe=
rs()
>=20
> This commit extends compute_live_registers() to track upper and lower
> register halves' liveness separately. It uses 2 bits per register and
> updates compute_insn_live_regs() and kfunc call processing to infer usage
> based on BTF type sizes.
>=20
> > diff --git a/kernel/bpf/liveness.c b/kernel/bpf/liveness.c
> > index ff1e68cc4bd1c..c996b8a03e792 100644
> > --- a/kernel/bpf/liveness.c
> > +++ b/kernel/bpf/liveness.c
> [ ... ]
> > @@ -2174,17 +2228,15 @@ static void compute_insn_live_regs(struct bpf_v=
erifier_env *env,
> [ ... ]
> >  		default:
> >  			def =3D 0;
> >  			if (BPF_SRC(insn->code) =3D=3D BPF_K)
> >  				use =3D dst;
>=20
> [Severity: Low]
> Does this unconditionally apply the 64-bit mask for 32-bit jumps?
>=20
> Because dst is defined as the 64-bit mask, using it for BPF_JMP32
> conditional jumps incorrectly assumes the upper 32 bits are alive.
>=20
> Could this trigger unnecessary zero-extension instructions in the JIT?
>=20
> >  			else
> > -				use =3D dst | src;
> > +				use =3D dst | (code =3D=3D BPF_JMP32 ? src : src32);
>=20
> [Severity: Critical]
> Are the conditions and logic for tracking 64-bit jumps correct here?
>=20
> The variable code is derived using BPF_OP(), which masks out the class bi=
ts.
> Because of this, it will never equal the instruction class BPF_JMP32,
> making the condition always false.
>=20
> Additionally, if this were checking the class instead of code, it appears
> the branches of the ternary operator are reversed. As written, 64-bit jum=
ps
> always evaluate to src32, marking only the lower 32 bits of the source
> register as live.
>=20
> Could this cause the verifier to incorrectly omit the zero-extension flag
> for the preceding instruction that produced the source register, potentia=
lly
> leaving garbage data in the upper 32 bits during 64-bit comparisons?

These two issues are the same. So much for testing, need to fix this.

...
