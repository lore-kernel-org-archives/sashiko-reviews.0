Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE3D3A4F55
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073964; cv=pass; b=pwXMmVqVAWNYX8ZZnq1SCPeXlF9kZ/W/oVdRdjwWZ3IJlOXY47wZPUn1y0Ht6ae47TbWUqg9eOfBnu2MljGcmwmscVZFy6kp2mFS2PwqAEUW3W1dCGdb1U2dW/6xG7XoCnphwUrvMWFjoN0YruEm+P0wBE6j/JpXoV3zqi05H7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073964; c=relaxed/simple;
	bh=BttwHBod1U7v0MCbP0ZdYcBpvNSKipgwGk4dt8MTCoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6BZyYH8h/wDrZct40tjSDy9mbZ2ymJdS7Rd7irRtVewYLXcCFiigg/04io4pFipbOU5zXMIJqvkJu9yHwXsRSDOYY2gQeSoGmI9UxpvfgbxpKAQ3B1SzlUAvfzCEVmSySjQdd6kRXmABdfVlGdCbcOkbyrgVXdS00dhT+aaYx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GiWuWfqF; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GiWuWfqF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf2911f93cso4625ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 09:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780073963; cv=none;
        d=google.com; s=arc-20240605;
        b=QsF2YuLpe6uz2C0u0zyw4qDw5G3uMVycSeFQkuhcnve0yOIVaxZSwoCUZTOlJaNoaj
         3HhlkpteAFqts85p4BLc6WZTjRB31Dp3+iuGixHYDHW+mOuydQ+0MQqiSmoFIRSN1c+W
         ak/zh3kx8QSuyn4tPIEFjSliE22WHYc5Pa/eVC/4bmI7bpgHpItLjgMiDEJLe0bBfj8H
         /phlnNdQ6NaHmSDviKkiZNhdEPZQJ99oLM8jhdyNoQGVqXWcK3tsWCef78qyjirax9WW
         j3Fzx+yiNVQDiUrj6NkafKileYJPUrloIJN1Merq+y3UkRkSNLbYGpAlRRgr9lDIB/Ic
         db3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SqsMn7n+xAII9BeoKlqui4JQb7AF2XY+Hg917pHy898=;
        fh=6K1Zilol94e47/JGg4U6QaVXTQrpxPQTuLBo9pfKiHc=;
        b=Ac8ZxAuK+xGD31/CIR/tHZFFk7XB0YwojZH8tbJ/6hDDKRrC9XJYUMfa83gCeS1nqM
         4UoDusGX/S2VFKzaYqHmFJMc7jBawmv5SXFirSvbqkCezo7WcsBhnMsIHKV+cdPpMOj+
         +ScY4BUqJZEgUluexd0a1c9ePUDWKivgdtLBbGXf7bunPjm4qH3CfF9xAneXSkE1D1JY
         uqD4SInk6FVef6JkbwvCvjwJ7OmJ/nL2n24wIsVCkZwW+D1d+XBtSTY/ZA9o5lepRAli
         O/4IHcgm0GIPBJh+vflUmmEOT4SkoDbDvOThi7cQXZcg/0IBqI4Y1Czj5OUi239VJ/iB
         GS0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780073963; x=1780678763; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqsMn7n+xAII9BeoKlqui4JQb7AF2XY+Hg917pHy898=;
        b=GiWuWfqFZPqe2uJXJMUPxh/Gfg/l77uXwMwVZsmt58PpsvmS3nBUYzStOuvcVo+KOq
         j0N8+sDysoY7MdY4je+FbH8P5xnFNQOHgOw2Dv7/jLTbUCmpmRoVNRrVw5kUsDzNm1iH
         ax6sV9NEOkABzmzCdtrqOr464WbFgm0WRwJbnUYWPoNjbbnhJfRvdkpolW35cs7s+KtB
         bRjaxPoTCh83/rTlIR86fIkpVtR6e2o9+tgWQda2hgfWQFss5cRU0SBYceJFEZoNKrk7
         0SrHjuQSl3kOmRDRJ2Mue4JPVRsPCudDsAqAmBLF9xbXqtIrYR7bwPiXgERvGgRFhSZJ
         MqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073963; x=1780678763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SqsMn7n+xAII9BeoKlqui4JQb7AF2XY+Hg917pHy898=;
        b=BrNuZDCAQXNQ+5Sbq6hFsCJrhjjug9r0/IQ4ro016csMyzgFQfMRRDndDJYT6EXJxq
         RSOt/EwXtMC7uz2xDYCyQ0k2wX0Aic6bbwzU8RreyFqClmhPqeYPdQuiuUu0LzEhUuGS
         wIJfAayrviK0v1KsjNRY1P9jct7Efn1tNDPvqKE6Mqd0fCWmCIxDGyKy0EtK/jVeJ74D
         VgVi3gLv1slOBIpy7XOIp5jA1k3TV/wh5VY7jCo+jnzMODATknVXPqolpzB2L6BkAly/
         cX17Cv4lIdAy9xOqVYtwCYg7ZmSXaz+mvZgn+CLbkJf3FBWY4Pkkcrpyr0e4/s9mNrih
         G4rg==
X-Gm-Message-State: AOJu0Ywvp2w4Ke039LvO9XcvQBE/Jl+NuTedcTmFRp8hNRQvSB27RAII
	i/jNl0qo2gpnwzAr0HOvhWRJA2iX9DgcVcB8Ji6sgrFXfEJj8Uw/zKipew38u7VBWaTJAWl15uK
	nwm6K9GRFDE65eSTKx91APZXuoPsgFjV4leU2VLlnKSxX9E3EMa89AFhwg94gFA==
X-Gm-Gg: Acq92OH0B5bQYohssVOH67hRukVqqFyDzbUBzxYEGPvx/+hX7TbVLfNYKuvGv4sUkoq
	2ojGv0PN0r4pelyDk0aJChNkyJFfAMpOoE/KdPuw/VUU6S18BxCJqObmJDmkM1IUxmgRRr7cDOR
	hOQNcngARMAnDyU9Mkf99FEaJVqKyagrd/siEDqOBbXscO6M9Xt4yjCfeccuCAYxFAybGnbmT1Q
	dqwtgW5wuitAtyGH8FRaplOIhA3AIZ+fww0UxTHsoDyHxDjux8So/P+yJJBjH+XHimC8ZInQ1eh
	EDeR7Wnxh5PkxeNePd8mPgOKf9Liok7GFvVrHgUAs++uDbMA
X-Received: by 2002:a17:902:cf04:b0:2bd:6727:d689 with SMTP id
 d9443c01a7336-2bf9751ea32mr14315ad.12.1780073962073; Fri, 29 May 2026
 09:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529082451.591783-2-dapeng1.mi@linux.intel.com> <20260529092345.A3A8F1F00893@smtp.kernel.org>
In-Reply-To: <20260529092345.A3A8F1F00893@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 29 May 2026 09:59:09 -0700
X-Gm-Features: AVHnY4LItgym0hVuCS6qRGdb7CLvqESoJjtzR1pi-kCMUBHbvLWFd2_KGmbcE1g
Message-ID: <CAP-5=fWHFnmR+gX1+-iE5aT6GBCkRrRGahC92_nhbzy4tNA+dQ@mail.gmail.com>
Subject: Re: [Patch v8 1/5] perf headers: Sync perf_event.h/perf_regs.h with
 the kernel headers
To: sashiko-reviews@lists.linux.dev
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 2:26=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The newly introduced variable-length SIMD payload in `PERF_SAMPL=
E_REGS_USER` and `PERF_SAMPLE_REGS_INTR` breaks sample parsing, leading to =
severe data corruption for subsequent fields.
> - [High] The newly added SIMD configuration and reserved fields in `struc=
t perf_event_attr` are not byte-swapped in `perf_event__attr_swap()`.
>
> Pre-existing issues:
> - [Critical] An integer underflow in `read_attr` when processing the `siz=
e` field of a `perf_event_attr` structure leads to a massive stack-based bu=
ffer overflow.
> - [Critical] In `read_event_desc`, a lack of minimum size validation on t=
he `sz` variable leads to out-of-bounds heap memory corruption during byte-=
swapping.
> --
>
> commit 40d194b08491e7774620de12bd78192095f031fd
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf headers: Sync perf_event.h/perf_regs.h with the kernel headers
>
> This patch syncs the UAPI header changes to support SIMD, eGPRs, and SSP
> sampling into the corresponding perf tool UAPI headers. It also adds a
> sanity check for the newly introduced __reserved_4 field in
> perf_attr_check().
>
> > diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi=
/linux/perf_event.h
> > index fd10aa8d697f2..c49fc76292f79 100644
> > --- a/tools/include/uapi/linux/perf_event.h
> > +++ b/tools/include/uapi/linux/perf_event.h
> [ ... ]
> > @@ -547,6 +549,29 @@ struct perf_event_attr {
> >
> >       __u64   config3; /* extension of config2 */
> >       __u64   config4; /* extension of config3 */
> > +
> > +     /*
> > +      * Defines the sampling SIMD/PRED(predicate) registers bitmap and
> > +      * qwords (8 bytes) length.
> > +      *
> > +      * sample_simd_regs_enabled !=3D 0 indicates there are SIMD/PRED
> > +      * registers to be sampled, the SIMD/PRED registers bitmap and
> > +      * qwords length are represented in
> > +      * sample_simd_{vec|pred}_reg_{intr|user} and
> > +      * sample_simd_{vec|pred}_reg_qwords fields separately.
> > +      *
> > +      * sample_simd_regs_enabled =3D=3D 0 indicates no SIMD/PRED regis=
ters
> > +      * are sampled.
> > +      */
> > +     __u16   sample_simd_regs_enabled;
> > +     __u16   sample_simd_pred_reg_qwords;
> > +     __u16   sample_simd_vec_reg_qwords;
> > +     __u16   __reserved_4;
> > +
> > +     __u32   sample_simd_pred_reg_intr;
> > +     __u32   sample_simd_pred_reg_user;
> > +     __u64   sample_simd_vec_reg_intr;
> > +     __u64   sample_simd_vec_reg_user;
> >  };
>
> [Severity: High]
> Are these newly added fields missing byte-swapping logic in
> perf_event__attr_swap()?
>
> When perf reads a cross-endian perf.data file, if these fields are not ad=
ded
> to perf_event__attr_swap() in tools/perf/util/session.c, they will remain=
 in
> their original byte order.
>
> Later, when evsel__parse_sample() relies on fields like attr_nr_vectors a=
nd
> attr_vec_qwords to validate SIMD data bounds, could incorrect values bypa=
ss
> validation or cause out-of-bounds read faults?

This is a correct bug catch by Sashiko. We need to byte swap the
perf_event_attr fields when reading them from a perf.data file on,
say, an s390. Could you add this to perf_event_attr_swap?

> [ ... ]
> > @@ -1020,7 +1045,15 @@ enum perf_event_type {
> >        *      } && PERF_SAMPLE_BRANCH_STACK
> >        *
> >        *      { u64                   abi; # enum perf_sample_regs_abi
> > -      *        u64                   regs[weight(mask)]; } && PERF_SAM=
PLE_REGS_USER
> > +      *        u64                   regs[weight(mask)];
> > +      *        struct {
> > +      *              u64 nr_vectors;         # 0 ... weight(sample_sim=
d_vec_reg_user)
> > +      *              u64 vector_qwords;      # 0 ... sample_simd_vec_r=
eg_qwords
> > +      *              u64 nr_pred;            # 0 ... weight(sample_sim=
d_pred_reg_user)
> > +      *              u64 pred_qwords;        # 0 ... sample_simd_pred_=
reg_qwords
> > +      *              u64 data[nr_vectors * vector_qwords + nr_pred * p=
red_qwords];
> > +      *        } && (abi & PERF_SAMPLE_REGS_ABI_SIMD)
> > +      *      } && PERF_SAMPLE_REGS_USER
>
> [Severity: High]
> Does appending this dynamic-length SIMD structure to PERF_SAMPLE_REGS_USE=
R
> break sample parsing for older perf tools?
>
> Older parsers do not know about the PERF_SAMPLE_REGS_ABI_SIMD bit. When
> parsing the sample payload, they will only advance the array pointer by
> hweight64(attr.sample_regs_user) * sizeof(u64) bytes, failing to skip the=
 new
> SIMD header and data.
>
> Could this cause subsequent fields like PERF_SAMPLE_STACK_USER to read th=
e
> SIMD data as their own, resulting in parsing desynchronization and data
> corruption?
>
> Should a new bit be added to enum perf_event_sample_format instead?

No, PERF_SAMPLE_REGS_ABI_SIMD can only occur if
sample_simd_regs_enabled is present in the perf_event_attr and this is
essentially the same.

> [ ... ]
> > diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
> > index f30e48eb3fc32..e8e4e00d6b4d0 100644
> > --- a/tools/perf/util/header.c
> > +++ b/tools/perf/util/header.c
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but is there an integer underf=
low
> in read_attr() when processing the size field of the perf_event_attr stru=
cture?
>
> The function reads the first 64 bytes and extracts attr->size into sz. It
> checks if sz =3D=3D 0 or sz > our_sz, but fails to verify if sz < PERF_AT=
TR_SIZE_VER0.
> If a perf.data file supplies a size between 1 and 63, could the calculati=
on
> left =3D sz - PERF_ATTR_SIZE_VER0 underflow the unsigned size_t variable =
left,
> producing a huge positive value?
>
> The subsequent readn(fd, ptr, left) attempts to read this massive amount =
of
> data into f_attr, which is allocated on the stack in
> perf_session__read_header(), potentially resulting in a stack buffer over=
flow.

Thankfully, I believe Arnaldo is looking into these pre-existing
validation issues. See:
https://lore.kernel.org/linux-perf-users/20260526211806.1193848-1-acme@kern=
el.org/

Thanks,
Ian

> [Severity: Critical]
> This is a pre-existing issue, but does read_event_desc() lack minimum siz=
e
> validation on the sz variable before byte-swapping?
>
> The function reads a 32-bit sz from the file, allocates a heap buffer, an=
d
> calls perf_event__attr_swap(buf). Inside this function, the code
> unconditionally reads and byte-swaps the first 8 bytes.
>
> If sz is between 1 and 7, attr->size reads out-of-bounds heap memory. Bec=
ause
> bswap_safe() uses this uncontrolled attr->size to determine which subsequ=
ent
> fields to swap, could it proceed to byte-swap up to 176 bytes of heap mem=
ory
> past the small allocation, leading to heap memory corruption?
>
> > @@ -2091,7 +2091,8 @@ static void free_event_desc(struct evsel *events)
> >
> >  static bool perf_attr_check(struct perf_event_attr *attr)
> >  {
> > -     if (attr->__reserved_1 || attr->__reserved_2 || attr->__reserved_=
3) {
> > +     if (attr->__reserved_1 || attr->__reserved_2 ||
> > +         attr->__reserved_3 || attr->__reserved_4) {
> >               pr_warning("Reserved bits are set unexpectedly. "
> >                          "Please update perf tool.\n");
> >               return false;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529082451.59=
1783-1-dapeng1.mi@linux.intel.com?part=3D1
>
