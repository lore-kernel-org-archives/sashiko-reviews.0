Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71583624DE
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785562919; cv=none; b=jglfHFkd2TaLS1zDwp2ATXdx1fMf+pfK2F252zNJSEywLaF9oGQt+lur3U9XZOZqNRiZMsSY3pc95zFbEpqwlWm9p8Znz+E7I/Zi0avPPy7OTUbSyaaGBMwdfrwKNPjfhW+TPdyvktSsc0+S9i+7XDlpHxA54wUScd9CAM0B/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785562919; c=relaxed/simple;
	bh=uFwVacpoBKqf/34/DHwdM2PKG4cpCrot070aByBuvGU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OAQP8xK7ZXjEZcTVWkj6zhUCQeXfsD0DmMUedIu/ZUHE41/ISA541yBAOYUmpPYposIhr5xxkodwT44rAO5bE8JgirVvlq79XuwMiYMLiU92fusoMRY+siPBfnxyMoyDExD5RPgfZV4t39B0A74XTFDp5vQfWQVHYmJq6QFyqz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwrWNT/C; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwrWNT/C"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d02b4c3601so19884585ad.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 22:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785562917; x=1786167717; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fbpEs4nLlgM9ipjn1m7Vl9bon7gR0+FPoNc51UueVOw=;
        b=dwrWNT/CVBN4w4Sx+sYEttXmuXY8SC4gSORS1JOgK1t/ThJNvURwr1KLVhN42/Po2o
         yrYUMP6d9jwYIFl3TFv7oymw0C4VJGKqFwt6QQZxmlRYAR34KBnGhXA49wkZtkhwcXfg
         coZdQomW365XhGJATfHkO2+o0MVo8AXb8e6v1f2INaVn9MC1VEMVDilZgBuq3J+vOtJG
         aJI7H/9PZoZSQXrhZUv4R9d1W80HcOsvDqEmCJXJVDEu1hE6lhQUKfFKP0RTXZD3ylPN
         BnVgelNofTV2DG9U9AIP9kAOkOaU6D/LNKjCyqzEB2j6wh/PH42M6MKEAwWoTELqtznm
         JihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785562917; x=1786167717;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbpEs4nLlgM9ipjn1m7Vl9bon7gR0+FPoNc51UueVOw=;
        b=EegZL5xqm6h/StdrQEZkVUP/z94lKRteriUl3JJX/Km/aIQa7NciAbQ3tR0OwffBWf
         tBop9FivKad80wdx6iqKgbR3D7NHQXLwj51grpM+kmGVU8qw4Z6BICbOK1UOP5WvLRrN
         Fw1wH7Gw85giCZxdfWj8hlydGU4h1GGS9CCLNAQoB4Lnz02U7mFaRxsYxKy4+I2HocAo
         SjRH1XGkbLwrVGxYUjTE5PBJ+eCE6bQ1LQccqPMH0ZUXdEQMNxuvUxDMKn4WMYn83C6C
         mwA+LH6S0adotNsX2T0hQNnVPBQ9ZmkYL/jvPVSoyO31e+gmKCu+mqbc+MSjLfIVragU
         k0YA==
X-Gm-Message-State: AOJu0YxNtEQFgOi50kR22Sr09KndJrTKcJHjSyxRqgm4meG6pisuZyVc
	vD75BVm5bHC1y6G0FUH+n/eBpG8kQzB++yZu6SSy/xFhazGnmK1DPt4Lj22DtXV4
X-Gm-Gg: AR+sD12CJFy4GZFzRwdsc4EsxTN94KvHlmOu3gFg1mz2P942NfxfgDlMnk8YreieI6P
	44zsDe8Ts8eFwtVbElKpB44RJn3UGACdPGEZ2TBeqMFoUHD0Jt9mMXAI9uEUiR8RN3E/2p1AA1k
	ct+t8ItxYikX3JCxT+dsv+91eKZttQkUObDoRjvDL4xek2FY2Dnrk1pG8HzCs8efrA0WijCspd1
	rSctTAtgPQ6ao9ZnCk6bLvSy8LiCUrmu7iZ6UpKgSreEFEm5Wdp1zEf7kuah9CYuwmR+5eCEhGi
	Ny+/T18WAei8DUFAoy6ggTgoW4dBv9pqkeud1zHyL2gA3jpsSvu9XsMhW4MpuR5NJSLHjmhesba
	awRbHR8D2ZwEElAdBxU2ln6FnV7X2uaMohURtX1A+F21hqjNLI3V8JA1Gr4maWq4HqT5S0rtbsu
	XaGrBRFXyxPqlMzeyp6DFRBfaMDXtYXC+6jkGjxlCukZUQ0cCCSrD0JUya9Xp1BgxhBsS1a1zQo
	sPJlDV7PASbKIsU
X-Received: by 2002:a17:902:f54e:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2d05224fa51mr24534955ad.16.1785562917096;
        Fri, 31 Jul 2026 22:41:57 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04aea0f8asm13919195ad.35.2026.07.31.22.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:41:56 -0700 (PDT)
Message-ID: <9a99c9f390d0caf48b3a523113ca8f71063f9c01.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 3/5] bpf: infer zext_dst based on static
 register liveness analysis
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Fri, 31 Jul 2026 22:41:53 -0700
In-Reply-To: <20260801014230.CF9891F00AC4@smtp.kernel.org>
References: <20260731-static-zext-v2-0-da4aa161e8c5@gmail.com>
	 <20260731-static-zext-v2-3-da4aa161e8c5@gmail.com>
	 <20260801014230.CF9891F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-08-01 at 01:42 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>=20
> New issues:
> - [High] Dynamically downgraded 64-bit arena operations and pointer casts=
 are missing explicit zero-extension on architectures requiring it.
>=20
> Pre-existing issues:
> - [High] Kfuncs bpf_mem_cgroup_memory_events and bpf_mem_cgroup_vm_events=
 do not properly validate negative enum values, leading to out-of-bounds ar=
ray reads.
> --
>=20
> --- Patch [3]: [PATCH bpf-next v2 3/5] bpf: infer zext_dst based on stati=
c register liveness analysis ---
> commit 625c020066cfbb5a384d20ff5e1ad79faa898949
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: infer zext_dst based on static register liveness analysis
>=20
> This commit replaces the verifier's subreg_def based logic with computing
> zext_dst statically as part of bpf_compute_live_registers(). It tracks th=
e
> liveness of the upper and lower halves of registers separately to emit ex=
plicit
> zero extensions on architectures that need them.
>=20
> Link: https://lore.kernel.org/bpf/CAGKGUv=3DsOuqQtA1Ub-5JXfA4FPosJFYKAQE4=
B79cK+P1erxqtg@mail.gmail.com/
>=20
> [ ... ]
>=20
> > diff --git a/kernel/bpf/liveness.c b/kernel/bpf/liveness.c
> > index d0bd94c60fee2..77b84b367be74 100644
> > --- a/kernel/bpf/liveness.c
> > +++ b/kernel/bpf/liveness.c
> > @@ -2316,9 +2317,18 @@ int bpf_compute_live_registers(struct bpf_verifi=
er_env *env)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < insn_cnt; ++i) {
> > +		int def32 =3D bpf_insn_def32(&insns[i]);
> > +		u32 out =3D state[i].out;
> > =C2=A0		u32 in =3D state[i].in;
> > =C2=A0
> > =C2=A0		insn_aux[i].live_regs_before =3D mask_lo(in) | mask_hi(in);
> > +		/*
> > +		 * On architectures where 32-bit operations do not reset upper halve=
s
> > +		 * of the registers, the verifier needs to zero extend a destination
> > +		 * register if an instruction defines a 32-bit subregister and the
> > +		 * upper half of that register is alive after the instruction.
> > +		 */
> > +		insn_aux[i].zext_dst =3D def32 >=3D 0 && (mask_hi(out) & BIT(def32))=
;
> > =C2=A0	}
>=20
> [Severity: High]
> Does this statically evaluate zext_dst before some instructions are dynam=
ically
> downgraded?
>=20
> If an ALU64 operation with a PTR_TO_ARENA operand is statically evaluated
> here, zext_dst evaluates to false because it is still a 64-bit instructio=
n.
>=20
> Later during verification, adjust_reg_min_max_vals() sets needs_zext =3D =
true.
> Then bpf_do_misc_fixups() downgrades the instruction in-place to a 32-bit=
 ALU
> operation:
>=20
> kernel/bpf/fixups.c:bpf_do_misc_fixups() {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 if (env->insn_aux_data[i + delta].needs_zext)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Convert BPF_CLASS(insn->cod=
e) =3D=3D BPF_ALU64 to 32-bit ALU */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 insn->code =3D BPF_ALU | BPF_O=
P(insn->code) | BPF_SRC(insn->code);
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Since this bypasses bpf_patch_insn_data(), zext_dst remains false. Could =
this
> cause bpf_opt_subreg_zext_lo32_rnd_hi32() to skip injecting the required =
zero
> extension, leaving garbage in the upper 32 bits on architectures like s39=
0x
> and potentially leading to out-of-bounds accesses?

Yeap, need to figure something out.

...
