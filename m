Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93025A645
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532664; cv=none; b=uKhIAPWMNXmNJzOz7HxKqu4gW8otd4J1vf/KuHvOcpcAMZ/WBmiq10m9SSP3G5wyJET5IMclY/qUuWKu3q3m1ipxYTqQzVFMbrtqDVlGdFrJvja6Dw3D74kc70euT/T2wYAkFMYx0Emc3ABcUEixQaHMx82E8eEHJ/kuWsCG8s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532664; c=relaxed/simple;
	bh=6zwdZqsLAxLbpUXAqgCODH4XW7KYd2Pe0HqW4jEuDeU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kFeen2jbJL1aXMrJmAkACttx9IJeib0WcvEQ0Er3jVrizaBB5FazpbNL3dhlKx8gK8eMae13eGesyh/11ryADh1V15vvLaUYLt6odII1wwDCTZPwv4vEG6KwSAUZ1pB2aR6BoM30GJ/JgyihUxLPhb2rQp7vdub7cD9Xf3MgTa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4kfpjiH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4kfpjiH"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1104340a12.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 14:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785532662; x=1786137462; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F1fj8dyyMAmWETpHXezC8DdOLZLfz/lEB4bEENSW9/Y=;
        b=A4kfpjiHLxLo5boxDta5Nf31FlVlJVf4TVqM2DDuXolMFx2qZuHCDxsrBlGW34Aw3N
         6YsCBRexdGDBVH1LoK25wiaz1q7d53VFW0CNMh4slikJHHHW7Plg+QXSnO6/qufrunq9
         L/xBnUsfzxwfT3EI20J0anSZKOrx/jf2iSLSDFwZ295kS/NZIoOdD667F5r0R4mXdo+w
         ngik+rfN9QEdrTGGEL8GeEsOxpI/jPQ6qVjtOMOSg5U3Dks7H8JjzLleV5fX0FnPsWjz
         /zA5450CR4oVQLnzFnLH8fBuPKGltlpZ1KBEVqz+Zc+7qWcSyTgCUJ5jMINsmFjsw994
         h3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785532662; x=1786137462;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1fj8dyyMAmWETpHXezC8DdOLZLfz/lEB4bEENSW9/Y=;
        b=cOkgp5WvY/L01VbmDs8QQ0crb9Vljyq97jsaEJGmxiZVrROAG/4Q5bzSR/DdB+qrWm
         GpKywdiqDlNT57b6prGDj0JJN4BS1d+xdWQ+SHrzj26zGLf5e7ZMq0B6x96aXYXlGdmz
         dQH0GLE1IDlMt+sLhVoWTdcrefT4bdlXN62KxRFtP54y1mqEVEHuMGhd7Tj4Vwjr6kJA
         j//Lq+rr6frHvSPIV/cJwm3W4OkCEkhHIX6J5GO2xqHkx39tWU3RpnX/5j3c9p8KQE/J
         wi5QuDxrEVHRD2jtcn1dMWIabuAFuZFy0f7+Q+wsLkmHT8lE6+BThtzlJm3J9sX+3GZJ
         LQVA==
X-Gm-Message-State: AOJu0YzXrPe55/usJyM19RDrWaFoYCGTk9dorN+wzHv+zEUbXmcWhi54
	9vN3E1NwT1AEGiW9WjDEAFj4AwGOOCwv+gcufmFvUf54u70SKxI7tnRqq+EfbrKB
X-Gm-Gg: AR+sD11qUsNjSYz7bssdJOjmFMCPAlY5l+7qqy09a7QK7xL/05RZs1nBnK9oSaEhBpx
	GFived24fwFo1RT6Oi/tmkYfGr+xdcZ6BdczVOSxqA3IrC6lWSUcAYp1NYz88SmKf9B+Jfgk8Fr
	ABtYunw20SMwYMujEj9JHLoHJnrzyXbaNkYUZ36qXtYbMzaK69hEzbSuKAlfLFDXBsyqSEeBZD+
	PMRpwSE7WNcB6Sv/37hB7aiX9+q6wJ7/X5EvkaQuqxCmcNzv01uCQYEEsr2gmc9SBUKjdzWHg7V
	dOZ17dklV4ktdFFAOhGNRsrTYwkIhFM6oehd6YMj0BmJ+ZSUMXZ3Tl8XXjJjYQ8qxzNKpZSAdbn
	Sn80XfUaNLXCqtqBkIL7L5xI3jpowUUR9vMRcvKjWwopdis8yL67nCYHGMiEddrjhBlLr7jlThr
	CLUu+7n96ycRySw24Bg1TeEoOehjfNyWEmk9AWh2Cw3m+uZ5xyx/RplH2NNXyHnsJjQg+QdJbgf
	6MqQHwWfErhf/ZfXRvFyX5eRSQ8Hep24xDI/ndw4EI93w==
X-Received: by 2002:a05:6a21:7a97:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c92a814022mr1172493637.36.1785532662419;
        Fri, 31 Jul 2026 14:17:42 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:f5a6:d314:fc37:ae46? ([2620:10d:c090:500::5:7346])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm9524973eec.30.2026.07.31.14.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:17:41 -0700 (PDT)
Message-ID: <bfa89ff4ec80943ffa5567f90779221ff82fa16c.camel@gmail.com>
Subject: Re: [PATCH bpf-next 3/5] bpf: infer zext_dst based on static
 register liveness analysis
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Fri, 31 Jul 2026 14:17:40 -0700
In-Reply-To: <20260731192635.8B8111F00AC4@smtp.kernel.org>
References: <20260731-static-zext-v1-0-98a4dc73e94b@gmail.com>
	 <20260731-static-zext-v1-3-98a4dc73e94b@gmail.com>
	 <20260731192635.8B8111F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-07-31 at 19:26 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Incorrect static liveness tracking for 64-bit conditional ju=
mps leads to missing zero-extensions (`zext_dst`), resulting in verifier/ru=
ntime state divergence and potential privilege escalation.
> --
>=20
> --- Patch [3]: [PATCH bpf-next 3/5] bpf: infer zext_dst based on static r=
egister liveness analysis ---
> commit ab8592d6a434dbfed0cbb0bd067d9032b308db8d
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: infer zext_dst based on static register liveness analysis
>=20
> This commit replaces the dynamic subreg_def based zero-extension
> tracking with static liveness analysis to correctly infer zext_dst
> and prevent missing zero-extensions on architectures like s390x.
>=20
> Link: https://lore.kernel.org/bpf/CAGKGUv=3DsOuqQtA1Ub-5JXfA4FPosJFYKAQE4=
B79cK+P1erxqtg@mail.gmail.com/
>=20
> > diff --git a/kernel/bpf/liveness.c b/kernel/bpf/liveness.c
> > index c996b8a03e792..ea002550671a8 100644
> > --- a/kernel/bpf/liveness.c
> > +++ b/kernel/bpf/liveness.c
> > @@ -2317,9 +2318,18 @@ int bpf_compute_live_registers(struct bpf_verifi=
er_env *env)
> >  	}
> > =20
> >  	for (i =3D 0; i < insn_cnt; ++i) {
> > +		int def32 =3D bpf_insn_def32(&insns[i]);
> > +		u32 out =3D state[i].out;
> >  		u32 in =3D state[i].in;
> > =20
> >  		insn_aux[i].live_regs_before =3D mask_lo(in) | mask_hi(in);
> > +		/*
> > +		 * On architectures where 32-bit operations do not reset upper halve=
s
> > +		 * of the registers, the verifier needs to zero extend a destination
> > +		 * register if an instruction defines a 32-bit subregister and the
> > +		 * upper half of that register is alive after the instruction.
> > +		 */
> > +		insn_aux[i].zext_dst =3D def32 >=3D 0 && (mask_hi(out) & BIT(def32))=
;
>=20
> [Severity: Critical]
> Does this code correctly evaluate liveness for 64-bit conditional jumps?
>=20
> The new zext_dst logic relies on mask_hi(out) accurately reflecting if th=
e
> upper half of a register is alive.
>=20
> However, looking at compute_insn_live_regs() in kernel/bpf/liveness.c for
> conditional jumps:
>=20
>     const u8 class =3D BPF_CLASS(insn->code);
>     const u8 code =3D BPF_OP(insn->code);
>     ...
>     case BPF_JMP:
>     case BPF_JMP32:
>         switch (code) {
>         ...
>         default:
>             def =3D 0;
>             if (BPF_SRC(insn->code) =3D=3D BPF_K)
>                 use =3D dst;
>             else
>                 use =3D dst | (code =3D=3D BPF_JMP32 ? src : src32);
>         }
>=20
> Can the code variable ever equal BPF_JMP32?
>=20
> BPF_OP() extracts the operation code (which is a multiple of 16), while
> BPF_JMP32 is a class (0x06). This means the check code =3D=3D BPF_JMP32 e=
valuates
> to false, and the source register usage always falls back to src32, even =
for
> 64-bit jumps (BPF_JMP).
>=20
> If a 32-bit operation defines a register, and it is followed by a 64-bit
> conditional jump using that register as a source with no other uses of th=
e
> upper 32 bits, the upper half won't be marked as alive.
>=20
> As a result, zext_dst wouldn't be set, which could lead to the JIT skippi=
ng
> the mandatory zero extension. This would cause the 64-bit jump to compare
> against uninitialized garbage in the upper bits, potentially allowing
> out-of-bounds access.
>=20
> Should this check use class =3D=3D BPF_JMP32 instead?
>=20
> >  	}

This is the same (real) issue as reported for the previous patch.
