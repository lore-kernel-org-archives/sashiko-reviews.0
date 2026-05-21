Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A261E30E0ED
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779399044; cv=pass; b=ooYRJd9Glek6aGSBjWLXhSP29D2aMydhIRLlQaQXbPFYkOsdHxAqqqdgQtfW3KPsWaa4BKPuxzHIyVL8WyWw66FqmWryeVzqT12FygY8jYHe9XZh8ZJU7nk/djEJYDuGeb1U0o8nnEv8PKBOqn1xXkEYB/V+Uc/Z9NRb7umNO0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779399044; c=relaxed/simple;
	bh=cgt9ZO5EdZt6bchHY3X4Z55fqeWQ/ykaDbI5wc96+II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffwN3RId5/9BSZJ93OJh1ZaubMuimh7xyoOb6zLLiVsNoSXs/tPis1RxLu4NLrkaH3/7ZmfrCRiX3HUUfMp/AJ/nSZEHGBrcPcbqFGVS/dnF3lWlrke9er3Ji2LZVH7LIHCyaNRW1c6AteVY3OrKNsDyWjZeRW8vWHqS29ROZ0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSEQkfKl; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSEQkfKl"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso5584715f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 14:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779399041; cv=none;
        d=google.com; s=arc-20240605;
        b=HNucUng9bY4mlva3gO7txx9lvwdVxF79Ed8A+9K+r/0ltd/edeYvT6ZQk2MMIvVriq
         TPh0TbbiKLtWOfTt2aWgTp7rvm7Ew/Mz0HA57d3VRFYg2hdFl7UW+pWkic2FNFqgxBWg
         TMS8H28G4wW51iKwEtZ6HRnvNwr9uQnifmi/jZcOp1B8yjsHtdgP4z/y/8CDjjki0pbg
         aJ/n3We6bYxhsRDwPbwfxCgnhUmwH1Vc0uJ4AgvAXBcWnzXA0cSM4ksSNYpZWuyd9k7j
         6Rqt9oigTwGyU3ORJwyDmM8aF2DCeLoLzcNcJXZZYiYkRWFEgDRJA40Uv4hz1iZl7M7b
         K+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p1ywolQ/F0eG/GKMZFrxaeUCjK8IyklmVVzomFKMSaM=;
        fh=uUUfGyFLaXO+DxTU7mwQJaZR9Z/tuN9NKOSDyGrVClw=;
        b=Fj7SbmaNpnZULxBioYSSeBjlcHQVEvL0hH9I8EalCOz1J8nXmIfX2k3694ldlPjU+k
         C9Q8Aa8NTgfGqNWz/gI14ss0X3584Iq+5hnwtLGOFHHCNU5aet1QwGGgmC4cQCnR3oFK
         V0kFjSdxIAqDg7m9su4L8V2OPzPLuLo4wgmn7ytwMlFbq1a6tSxRqsQMGjtnLRUJyeXS
         V3I02DZr+I784hyiapjecH7Ko76xwDqJOh1LZshMN+leJEEx7pPJ1PUsQ0FOJfvlpRdl
         2uO7XdtlqejO3Zl9zKPLVWvETbMEXxL+3e8sFXJeD7xkLYkASJdNhaRSBLhRICHVGIZK
         3YCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779399041; x=1780003841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1ywolQ/F0eG/GKMZFrxaeUCjK8IyklmVVzomFKMSaM=;
        b=lSEQkfKlG+J5msuSraY2C6Fz9uYZ+uBweMBWYMySMKhCDJqXHXOZVaV1ZQSyEyPK0j
         W+lGQ1DK6l19KYItRfzMM/M8XYx0GzbLy2nw429RGpdyoLcwpePyMmvsW2HmcwySXhQd
         CgpamhlFlDosydafrbKRQFxQEVe9Is2LhcO/Ssc7pDTUoZxczVDYMNgDQG/NQdTDvIU0
         HuFxsPZgDyOq8/lvk52Lq8YgZE2E+lYJDOOr7fH+qrTRfZnxyYbYjQ+SyNoqPlkPFNAr
         YkXC+vg5InpENLZNUANBocc2jELbr7IgJwk41zk32zDylj0AvKYTZKj56ZpP3PNIddlk
         KJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779399041; x=1780003841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1ywolQ/F0eG/GKMZFrxaeUCjK8IyklmVVzomFKMSaM=;
        b=c+RLqM+y2Izo8Zsoxx6Jgfa4duxebLLUCFdKRvDu9sJhRUjLTQDbMOCEvnwwF7AdLe
         +QT0pIQDBjGVxvVdK395PkLrVo3W+slHk5QPhpEV4nxFuSbBO/j+iZelYl5ULnMDvcsP
         5kLBhHuyeFMU5WX8k3p4Hc4av5x9qMyzT08ygeu9WmcJ+1h2AEHYbe4CXno/aWp9Fx34
         Gu9VfYgcSMtmrFvNZE6uKzYJSltf5EBDwMyIXgHDEjgHTkExuSFaw/owIQuAEn9T91mR
         8Ux54OaFUyYh0ifg1par3di6GHhK8sJxJdQWalCvSkUuSKIUFoR4g7MRqvbIUf5V1gsX
         Tr7A==
X-Gm-Message-State: AOJu0YzGLmiF78Z80aUJ72U63QYxsBiAdnZ0YbphpdeV9ToHMFKJWYx2
	9CdylBtlfOwVgtZUegKd2Q6gKqFaXHFhApsWDDa5Y5D7TEpabzyWJ2CBDD6ikKrlvsHbSUJ47hY
	60TfYYanQzAfgVCNsfoyvfScn7wZuGylmSTQE
X-Gm-Gg: Acq92OENz5D8TiWEuR0mHNcEjpHjrpK7YmXR50f8LA99olBQf7N28Z/5GNKrRt2ZtVB
	MKaomSLDnMEFT8/J8oVV0kExHvKgyjVaDgd5Xh/Oc7hja+OlV3/+U9D1yqKev07HnCotYw8I+aN
	4cZw6LVYDC4VxLQ6Wx8iGeoQ8TB6cAB1mtc9fS1LjFfwNg5vCiM/I3MrLo/a8JsW6qjBO00JqeY
	m+xsbS359AiOV50J3WZZtCYpR3SSALdEwhrHboeZcd2ms6znyQ5zlb9vWfND9htwn+d9I0mLNlL
	QHhdV7OZbeU/7OeY31J2GPGHcMtRPGy+bK5hx5pZ/ZvgqpdN1U+4ESU8KvK95vAupPZ2
X-Received: by 2002:a05:6000:1ac7:b0:44e:7284:5f21 with SMTP id
 ffacd0b85a97d-45eb389d49emr705269f8f.18.1779399040604; Thu, 21 May 2026
 14:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521152217.2345235-3-kpsingh@kernel.org> <20260521165240.D95EA1F000E9@smtp.kernel.org>
 <CACYkzJ47rASFZLZPz2VU9FE7J2-hGdw2f-5LQYmXoB9urVwRqQ@mail.gmail.com>
In-Reply-To: <CACYkzJ47rASFZLZPz2VU9FE7J2-hGdw2f-5LQYmXoB9urVwRqQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 21 May 2026 23:30:29 +0200
X-Gm-Features: AVHnY4JqkdIRdLJVntIglhOI-10xwJCt9XHHakTQUyyYHW3PAWkYAyswPlgGLFs
Message-ID: <CAADnVQLJw=Dk=VjWmot4O1WLm2TxLH+-mX3G8AuPd9f_5rAJCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] bpf, libbpf: reject non-exclusive metadata maps in
 the signed loader
To: KP Singh <kpsingh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 9:09=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrote=
:
>
> On Thu, May 21, 2026 at 6:52=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [High] The BPF verifier will reject the `gen_loader` program on 32-bi=
t architectures because it accesses a 4-byte pointer using an 8-byte read.
> > - [Low] Multi-line comments do not follow the mandatory BPF subsystem s=
tandard.
> > --
> >
> > commit 878a81f0d9571d5734eccfbe01c3dfe58050f954
> > Author: KP Singh <kpsingh@kernel.org>
> >
> > bpf, libbpf: reject non-exclusive metadata maps in the signed loader
>
> [...]
>
> > > +     /* Reject if the metadata map is not exclusive. Without exclusi=
vity
> > > +      * the cached map->sha[] verified above can be stale: another B=
PF
> > > +      * program with map access could have mutated the contents betw=
een
> > > +      * BPF_OBJ_GET_INFO_BY_FD and loader execution.
> > > +      */
> >
> > [Severity: Low]
> > This isn't a bug, but does this multi-line comment follow the BPF
> > subsystem style guidelines? It looks like the opening /* should be on i=
ts
> > own line.
>
> Sashiko, this is how we comment in BPF.

No. Sashiko is correct. bpf doesn't use the old networking style anymore.

> >
> > > +     emit2(gen, BPF_LD_IMM64_RAW_FULL(BPF_REG_1, BPF_PSEUDO_MAP_IDX,
> > > +                                      0, 0, 0, 0));
> > > +     emit(gen, BPF_LDX_MEM(BPF_DW, BPF_REG_2, BPF_REG_1, SHA256_DWOR=
D_SIZE * sizeof(__u64)));
> >
> > [Severity: High]
> > Will this 8-byte read pass the verifier on 32-bit architectures?
> >
> > While __bpf_md_ptr pads the C struct field to 8 bytes, unnamed bitfield=
s
> > are not emitted in BTF. The kernel's BTF will represent the pointer mem=
ber
> > with a size of 4 bytes on 32-bit systems.
> >
> > Since btf_struct_walk() enforces that the memory access size exactly ma=
tches
> > the BTF pointer size, it seems the verifier will reject this BPF_DW acc=
ess
> > with a cannot access ptr member error on 32-bit architectures.
> >
>
> Good find Sashiko!
>
> __bpf_md_ptr doesn't help =E2=80=94 unnamed bitfields are stripped
>   from BTF:
>
>     $ bpftool btf dump file vmlinux | grep -A1 '^\[1462\]'
>     [1462] UNION '(anon)' size=3D8 vlen=3D1
>             'excl_prog_sha' type_id=3D17 bits_offset=3D0
>
> vlen=3D1, no padding. On 32-bit the pointer is 4 bytes, BPF_DW is 8,
> btf_struct_walk rejects (msize !=3D size). BPF_W doesn't work on
> 64-bit either (4 !=3D 8).
>
> gen_loader needs target pointer size tracking (like swapped_endian)
> to emit the right sized read. Will revert __bpf_md_ptr and do that
> As a follow-up, I need to re-spin anyway since I messed up PATCH "bpf"
> and probably confused the CI.

hmm. I think AI is wrong here. size=3D8 is all we need.
I think BPF_DW should work. Pls double check. Don't rely on AI guesses.
