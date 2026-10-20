Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792521552;
	b=GlxVjTozbovEE0f5T1OY+gR2Tj+5gLCaAp9xGcuMSeAJAoTDSa2WZM/H9BIdrsIIQC2J
	 heZybbhsD2TMCtHNCb2bjkfzKlxkRHpBoDidgP214vGtR7ZCr8IhRoKZRAMnqBGFnaS8U
	 9xetF0uA1Nq2x/Q2AOnQs4hNa1oojvmz5tYj/V/YRX3pR3/HIS3Wq7GonvhK+Su344Mxm
	 gTPJVqsYPCwiiTqP63Xq6ssYntQN/ixJfxQ9XQAcvdY110NocsQsvqa0khyrqXPyrmLU8
	 H0xWwF6O4aMLuv0/K6K6L5IKMOAXHKB+SfIpeS/WakEP6Q6clc70OnJoMGmNq1UBKsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+5zFGqfBVV3xW6Aki/3XgyonXgn6J8+QNfmXALF715s=;
	b=AcgdaW7CsnrMJQNx0S/KmDn64HaI+QlJ/9dStjWpBQWxfpK+U6HhSjVpxzJo9qiMICXQ
	 4K83s4rPv2IaVpNCoEz7ug3tMgRGEw2WPr58S9SbGxNyEcuxuslC6mIXmEYtVL7rjL94C
	 drT1TUBzx5kIEZwFOH97aN15iMQZ554FA7+9Y0VL1FTUL0o6JaiZnEGfojmqta4isyvjO
	 VaUGiLWIcVWTuWFj/AAD4CMCsw+DIcppnQrhVlo2zqP7gz+zbWB3iK3A/6akBxwFoMBbJ
	 v0o0vsxwOxrcURXReQUAA5XjJLuu7MXTWDyyuzrmV7pvC6NLD/m5yhYFR+/LlS0Fv+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JcVPiuz+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B822606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 18:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B822606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JcVPiuz+
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc758830601so2312131a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 11:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792521550; cv=none;
        d=google.com; s=arc-20260327;
        b=dlPGDiB3/A99qy7H1G/dheEBFgH9P49VU1rfrvKXagmBrSabOXVnne+oo2/gSyz0ug
         KbM0a/EumnKk6PhoJVFsi06eFmfk1DavXHq9Ssu8Zp0LG45XQl+auDqS+wm0wIVMy67A
         3jgydcDmEMOH9xUzDK9lPaqEIsIqUed8ljDSH1QqhmpvFc6wbnAoON1cyvRhtuyiOQTM
         1hJyrcgFX6qrePgSVMix2iUNhYxmBVfy7lFoKwdwgr+dogVHDf1wfBvAyp3xqS/Bl43f
         d4mJ+BmbsBLvIHjm8Eg1cgZv4cU2anBmIBQqZYs8GkOO1lrQEps6Bzg00crzs6+mln5M
         gChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5zFGqfBVV3xW6Aki/3XgyonXgn6J8+QNfmXALF715s=;
        fh=MVv2QQykEYqIjwbR6bhZaIDL7jL9T5HRFH9GlMgNObQ=;
        b=mX1cjWQUCmUPxqROWfQ4qvxeSUY+RtoQReE+E6/1sPnJM2nF9vo4suPeCoRfWT/XTS
         KwMBXOgtkWaL76JaRXES+cVgjQmdgW5AWC/Sf+aiWqyVxrzHqGDOnmZqBoyNNMiwTdbV
         aPeE/0hpj2gr3a3gSIAGNxICtvSAlaAUa6SnN6Dva6xRQz1wxcCDwH83xyfG+kOCTMTv
         ZynXMYGh6bpmh1Q1NgQ0zLUMBAmFjvOo7Kx3E4D8gACx2A97nhd1K+GEkbPWFCLtEvLA
         ucNicgHO2vBHl7W3lEktFyDvnFGKU5hU/9mtAsZ5mkwUAZv27V6NzHvPV3CAHc2BLhE7
         wIsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792521550; x=1793126350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5zFGqfBVV3xW6Aki/3XgyonXgn6J8+QNfmXALF715s=;
        b=JcVPiuz+WsXD6+ouwunSoFLKhsxE2oUc9p5XFUWoAPN0QiV1WBP5Je0qvKvNlxKKzK
         X/0miY8u1chbXF2lheWGHBaLaWYwQyGLdYul1PusgdwPFIGRUU97Jrn4yx/Fkk2ZcZ0e
         lyMv+sm9S6f5f/v7PBCf8J38mXtP98M7I2+e5E0j49WxsQe/E3Rfm+g00wt9HE9N3cf/
         dEycq7ziEk2b8SJmnVVkcLYn/Ablqsgi+LeqHBpnb1CbXsTwtq9fpTgG2ukabo7ciL+a
         /PPlRRMiM6qZWlMWi6Ho8F2prJ+ANMlAKy1VEyAEmyWq9KEfQV1NV2j8kaMqPE6E1YMf
         ERpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792521550; x=1793126350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5zFGqfBVV3xW6Aki/3XgyonXgn6J8+QNfmXALF715s=;
        b=XqpDhQTFA6lM4nHQjavzxsgUCsxfqe7IkHoMd7Op0LSvUYGI9fP3Df2m7T5oClxyz7
         Y5dL+vX7mhxrDjLWfzcysSZZcLG2o/lnWEtXtC3s1wwzRff50So4sQNcbvkJWaIDcBsT
         7StMlgXYM/v3C0oQuqukQiGuDhZl+Tt71jQtRk+ZoUlW1T3sMyxVw5zLGYIRLH0KoaKq
         Ym5GdbVkP2/QowZQdvKUunueTTvki2okQjpDt50Jl2jivr2IKLvIukFeg/wuXM0lY+vm
         6OBCEbCv/ilQvAja4qgts9KkK7u9IFYT5bpPXgW7GXP3vUWpdq6K8CIOag2R2Eje0gpF
         usMg==
X-Gm-Message-State: AFq9FYL4FK2j7BnXZSQRiLrtejgqXZNVO1VXGCK9VqQB01Sl+bo5HBm8
	6pLqxGgQnXizdCSq1k324HyNBrxi91hp4w+C6D4zdBGtH6lj/4OfpePxoztcYNrSXHSsZsnxUHD
	drjAp6fKDK+hbf3JkV7h8KHSaMBm4HCU=
X-Gm-Gg: AYBFou29WzzzUnCXgs1sJ2ugmmBVeHsthzwjuAdnYOUrJ9xUl1g99Gv16Mv0Ov9vpU+
	U31ydimHeDRYk+RYx5fZVymTi3C0kOsRFtCKfSaHNsgK/fy7yrNxcObpde47C4opaZKpZaPUyST
	vQCMmkCrzJSnEIvO5kkoE1gMI4nCfrbLThO7wuVwbsZmtHpXijnd0/Ot1AcI5kUOvGkEq5sbpbc
	wAeAoEfc6uxc/hXhRrrWHZJtB7euX8lvnJBpEDhOGsRoGL5Q6HIWvCFuL0UKudpTTFWMtL6YeWZ
	njYDygc604Zlzcdnyfxt07+4j6Sw2ZHJIFbgrozcPVMNQ2NfSkJB8dhTn1QnwFhzSvQIXd8CkY6
	znGSUtv0hyH+/Njhp8KErtmLXBslxm+1QTmQZYjVnp7Tdp+v20Neb0PwPoahAI3pm
X-Received: by 2002:a17:90b:5487:b0:3ac:9c37:9426 with SMTP id
 98e67ed59e1d1-3acef0c8743mr11052165a91.31.1792521550227; Tue, 20 Oct 2026
 11:39:10 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261010143156.379864-1-andrey.grodzovsky@crowdstrike.com>
 <20261010143156.379864-8-andrey.grodzovsky@crowdstrike.com>
 <sashiko-outbox-166685@kernel.org> <CAOu3gNj7fYONFo2-UqcBVv5Uk2=d4Cw=0fvQvLPCwiDA6zc3Wg@mail.gmail.com>
In-Reply-To: <CAOu3gNj7fYONFo2-UqcBVv5Uk2=d4Cw=0fvQvLPCwiDA6zc3Wg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 20 Oct 2026 11:38:57 -0700
X-Gm-Features: AclHuK-AWau34ltWS04pDenENv5-tDO6-u2ioZdJ_Z5yaVRsHA3AkdRi4OAJDTQ
Message-ID: <CAEf4BzbxEBC7CGDTZF_3nvupgB4QGcV_k0e1mo5Zjm-g2nBWsQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 7/7] selftests/bpf: Convert veristat to BPF_PROG_LOAD_STRATEGY_MANUAL
To: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 7:53=E2=80=AFAM Andrey Grodzovsky
<andrey.grodzovsky@crowdstrike.com> wrote:
>
> On Sat, Oct 10, 2026 at 11:08=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Medium] bpf: veristat uninitialized memory read of log buffer on ear=
ly load failure
> > - [Low] bpf: veristat skips cleanup and info retrieval when BPF program=
 fd is 0
> > --
> >
> > commit 9ac34aec88e7eee9b39c53e8055bc5989345ce5b
> > Author: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
> > Subject: selftests/bpf: Convert veristat to BPF_PROG_LOAD_STRATEGY_MANU=
AL
> >
> > This commit updates the veristat utility to verify programs using
> > BPF_PROG_LOAD_STRATEGY_MANUAL alongside bpf_program__load() and
> > bpf_program__unload(). It replaces the previous use of bpf_program__clo=
ne(),
> > ensuring RODATA maps are properly bound during verification and subsequ=
ently
> > dropped upon unload.
> >
> > > diff --git a/tools/testing/selftests/bpf/veristat.c b/tools/testing/s=
elftests/bpf/veristat.c
> > > index 9cfc9b4b41c12..0cd19b59037f6 100644
> > > --- a/tools/testing/selftests/bpf/veristat.c
> > > +++ b/tools/testing/selftests/bpf/veristat.c
> > [ ... ]
> > > @@ -1726,18 +1725,15 @@ static int process_prog(const char *filename,=
 struct bpf_object *obj, struct bpf
> > >       if (env.force_reg_invariants)
> > >               bpf_program__add_flags(prog, BPF_F_TEST_REG_INVARIANTS)=
;
> > >
> > > -     opts.log_buf =3D buf;
> > > -     opts.log_size =3D buf_sz;
> > > -     opts.log_level =3D log_level;
> > > +     bpf_program__set_log_buf(prog, buf, buf_sz);
> > > +     bpf_program__set_log_level(prog, log_level);
> > >
> > >       cgroup_err =3D reset_stat_cgroup();
> > >       mem_peak_a =3D cgroup_memory_peak();
> > > -     fd =3D bpf_program__clone(prog, &opts);
> > > -     if (fd < 0) {
> > > -             err =3D fd;
> > > -             if (env.verbose)
> > > -                     fprintf(stderr, "Failed to load program %s %d\n=
", prog_name, err);
> > > -     }
> > > +     err =3D bpf_program__load(prog);
> >
> > [Severity: Medium]
> > If bpf_program__load() returns an early error (e.g. from libbpf without
> > calling the kernel), could the dynamically allocated buf remain
> > uninitialized?
> >
> > When env.verbose or env.top_src_lines > 0 is set, buf is allocated
> > via malloc() but the fallback initialization only null-terminates the
> > static array:
> >
> >         if (env.verbose || env.top_src_lines > 0) {
> >                 buf =3D malloc(buf_sz);
> >         ...
> >         verif_log_buf[0] =3D '\0';
> >
> > If bpf_program__load() returns early without modifying the buffer,
> > parse_verif_log(buf, ...) will read this uninitialized memory. Could
> > buf[0] =3D '\0' be set directly on buf before loading?
> >
>
> While this is a true observation, it seems to me this exact scenario
> would also happen in the `clone` case, so it looks like a pre-existing
> issue.
>
> > > +     fd =3D err =3D=3D 0 ? bpf_program__fd(prog) : -1;
> >
> > [Severity: Low]
> > If standard input is closed, can bpf_program__load() assign file descri=
ptor
> > 0 to the loaded program?
> >
> > If fd 0 is assigned, later checks will explicitly skip handling it:
> >
> >         if (fd > 0 && bpf_prog_get_info_by_fd(fd, &info, &info_len) =3D=
=3D 0)
> >
> > This causes the program's JIT statistics to be skipped. Should this che=
ck
> > test for fd >=3D 0 instead of fd > 0?
>
> Same as above , I thiink the issue was pre-existing.
>
> >
> > > +     if (err && env.verbose)
> > > +             fprintf(stderr, "Failed to load program %s %d\n", prog_=
name, err);
> > >       mem_peak_b =3D cgroup_memory_peak();
> > >       if (!cgroup_err && mem_peak_a >=3D 0 && mem_peak_b >=3D 0)
> > >               mem_peak =3D mem_peak_b - mem_peak_a;
> > [ ... ]
> > > @@ -1774,7 +1770,7 @@ static int process_prog(const char *filename, s=
truct bpf_object *obj, struct bpf
> > >       if (verif_log_buf !=3D buf)
> > >               free(buf);
> > >       if (fd > 0)
> > > -             close(fd);
> > > +             bpf_program__unload(prog);
> >
> > [Severity: Low]
> > Similar to the issue above, if fd is 0, will this prevent the program f=
rom
> > being immediately unloaded and leave it in the kernel until the entire
> > BPF object is closed?
> >
> > Should this check also use if (fd >=3D 0) to ensure cleanup occurs?
> >
> > >       return 0;
> > >  }
>
> To summarize, I agree all the 3 issues definitely need to be addressed
> and I am happy to fix it. I just don't know if it should be as a part
> of this patch-set or a standalone fix?
>

let's just land what you have, don't add fixes for preexisting issue
to your patch set


>
> Andrey
>
> >
> > --
> > Sashiko AI review =C2=B7 https://urldefense.com/v3/__https://sashiko.de=
v/*/patchset/20261010143156.379864-1-andrey.grodzovsky@crowdstrike.com?part=
=3D7__;Iw!!BmdzS3_lV9HdKG8!3il3wicS8Eiw2ogONUagDMIrsqcvvmLZ1xXNrquJMEVXEJr8=
5kqsNp4CNFasNUc417QJ6t73GShkLS7-x-efgKPJp1HzLOdaJg$
>
