Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A4133F8BE
	for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734792; cv=pass; b=Xd8P4AgY9xOnZbGafXCiigEX+coLylxctOJAvPDqinrc555zDDgGry6h08vrLwX6d1fo3Wel6bRZRgrpIRwIvt626zfgLI+QeHJ11UUa3GMg20NlkYac5Paualn0TgHOkZAjJ2if6IeXDtGjgktDkGltAdN05DQzGzVFK3kISvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734792; c=relaxed/simple;
	bh=kXWZqUutZPFmlyWXPfCCFUk+WefMgzgFDuEDVNTRmc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PB8kPfz7MunHyVlM9Gyt4tFvdUU2nVyXpsHzXdU4icytuWIk1j7tv2gPmCdjfuKkQaaR385T7R32KQ3H/i0AwYHZew4vBIEoyB0+o+xfU1feVA27/YV/xI7JO/pC7wEvMdkWtBuh3vKWLGMT8sj0R9ZZvatyKx8DbuXByOab+sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jSiEJ9gC; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jSiEJ9gC"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6af9cc73235so380193a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 09:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791734788; cv=none;
        d=google.com; s=arc-20260327;
        b=FUX2zH0gYRkP+dc/SgwMkDoXaF+SKmlZTLygesJYyzQZS+ESRYoocTVeN5v4QWt2jf
         OhFFIcAdnQMYZ1h36gJCTOlb2K+m60EwN39KxUGMI3RHnjGiFJoK+D/yla/IrxQZQo/W
         sXQoUssuy/G2ezY5YUcy392xrS6c5cyuFOQTVL7x4PIy6TExhLeau+eH8kLsxWl1w+nR
         NVSBRiYsB+0DzcStWYPwyjmW6s8rzk8AvuYIMamU+DVDqxlDOliPQHZWA7HgKjpjmRpq
         oERw22K1sz+nwHUWNjG5Ck/WkThaQJkEaFhM9uhi2TEbG13+AJGDtjyfTGXkC38AofCS
         8qmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCwS1dvCZg/JrnQTXuT0sf/Ob2X0hU5Es+KBduwk398=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=aTuIpc5Kc/Pm8+VPVzlH+lM0N8/9Q0yacpHZJt4zEmIDlg5PE8Mm6CjQmJsVJW/JNx
         0831JOUNML4jO6rdnqGsJkRCXR+zYqDOw9Pni85/4G5fpIysjldHVSF2YKwZE1rXr/W7
         ntQrNkq1Ev+bDokBBP3o0A6f/NNLxwEKdHf1yjjaZt0/ByKUlyVeDtvgTC1jmUD1p/oU
         Nk+XdN6xkNQjfART3wWB2Hs+KvwAcr3GupYTMUi7hftbNy7/nSOSVSkNpPEhdSpMiUR2
         6CIu9D51yFluScis/00GhaQ6NAKhR2Ez+B/Byj3pwyE025OOedJbl83l0fKj4bl1PWF3
         jXrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791734788; x=1792339588; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCwS1dvCZg/JrnQTXuT0sf/Ob2X0hU5Es+KBduwk398=;
        b=jSiEJ9gCY32WhklQ+QdAj3bzs7JbBE0wNEs2PH9JDXiUCta6VQmGM2/e130URSm2EU
         z1ssg9lD8n9zYAYuv2KFlfmDE4AnlImZa2IK9L4pn312Jr9YsJZ6neCrgcqPEIc/TYc0
         cXuVi9OVAynTJ0/s4L1S0sT7N4jC2zEiChXl6kpa4yrrLw4VL0f/UVddoFc9dbbbN0hP
         PeHNvlHXZ6SDwntWPidM6yY+PieothFdpFTjbrzJs8VrQmAKm/fqMWZlLIikhLyrs2ty
         rX5UUTcV2YMsCvgZKN6mx5gEJcjqEyAsOh1YwxUM7Q9rfYAKXFl2GndU8wTbPQBzpfWj
         ELdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791734788; x=1792339588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCwS1dvCZg/JrnQTXuT0sf/Ob2X0hU5Es+KBduwk398=;
        b=XB7yCY8Ye7YdXOLiNERueT7I7fja3wZ9QrGHLnl1pmiyssy7Ov7UH53l0//aagW7D4
         n6tG/+OcFlOXoreFEBZQHX6MKbiNLiEYcM7CTm45iB03ZC5kMPXHt9twjsvOCz79r27s
         wc05xCpnhfs4WVKRBJQuxfbswWIlyRRheStfBLPdwYRFAc9D9D5LHwP4Vb0T1zke0gXj
         U7uo4Q0updugHdYmYq0+7OqD/3U2Ia3D9FZoPp4v4a0veCK0wSIUTEQ5MiPpnCVrKG8q
         hUZn5MmR6qG3eg6rCoFFK+khErxvKgOf9SgG77bX7kUWuYfYBOI5cYo68cJ3FYgcR7Wd
         klDA==
X-Gm-Message-State: AFq9FYJGbZQp1cEG22PSNqYcehIkg9Cii6TM9ptrkRwG6bCdZTt49zG6
	WaOHEqMvFQsKvLPtvt4o/Jzo7YoxpTqS4SXKT4wqBOpZAFE2jmcWmV812SkODKOCIR6Eyyl1Yyn
	5KOyE1AmP5DdvsYS+Is5vbSePwPQX2leGGy5KVyrzZxk91FYyVRptWgrd3fJlnw==
X-Gm-Gg: AYBFou2Ew7QQTTjr/OXuwG8LDi+SthxWJZpkMnYeO8T2AUjY41av5dREmJKB09IG5hB
	jc86bGoEF/AH5Xtc2P6EMQNdzRqfEfCpS2t7hNR7O9Kz1Aw02Q9FRuOG2S9v5d5fSmibdCLOHYD
	wMw/5X+dM2j1Q6FdLgSD6R4msDrixrZKB9nwW9lhO4WjayyQ8oeUe6C9JbduMrtpeLJLunhtMDq
	IATXNSbLu9jyCXFs2/MGxhaF1fSKSPC1DxVu6IyarZT3qNWnGCpGp6APJ9nzzpX71adT7S2jjps
	LHQiJ0Km83u3yyZiNjKiqm7g1eRKklR+PLlvW+NsPpWgl4bQWe0egSg=
X-Received: by 2002:a17:907:3e9e:b0:c31:5918:86d1 with SMTP id
 a640c23a62f3a-c31a9d3cfbbmr812341666b.10.1791734787484; Sun, 11 Oct 2026
 09:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009130708.1370675-1-wusamuel@google.com> <sashiko-outbox-165614@kernel.org>
In-Reply-To: <sashiko-outbox-165614@kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Sun, 11 Oct 2026 18:06:15 +0200
X-Gm-Features: AclHuK8LTbb90UNk1o9A5yhk3IMkWEC-G6WX12WS1kwBs93286784npXqzjRUwI
Message-ID: <CAG2Kctr8A+TOiGzdRYdo5rHyxgXHifKXExDivvApvjUhGeZ0dA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Resolve typeless ksyms in the kernel
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] libbpf: weak LTO ksyms fail to resolve and silently default to=
 zero
> - [Medium] libbpf: fast path bypasses ksym ambiguity check
> --
>
> commit fc5b255aa262ee9f680fe13bd2bcb9fc56ff8a8d
> Author: Samuel Wu <wusamuel@google.com>
>
> libbpf: Resolve typeless ksyms in the kernel
>
> This commit optimizes the resolution of typeless kernel symbols by using =
a
> BPF_PROG_TYPE_SYSCALL program to call bpf_kallsyms_lookup_name() in the
> kernel. This reduces load time significantly by avoiding a linear scan of
> /proc/kallsyms in the fast path, while falling back to the legacy parser
> if the kernel resolution fails.
>
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -9590,6 +9590,58 @@ static int bpf_object__read_kallsyms_file(struct=
 bpf_object *obj)
> [ ... ]
> > +static int bpf_object__resolve_ksyms_in_kernel(struct bpf_object *obj)
> > +{
> [ ... ]
> > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > +             ext =3D &obj->externs[i];
> > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > +                     continue;
> > +             if (snprintf(ctx.name, sizeof(ctx.name), "%s", ext->name)=
 >=3D sizeof(ctx.name)) {
> > +                     err =3D -ENAMETOOLONG;
> > +                     break;
> > +             }
> > +             err =3D bpf_prog_test_run_opts(prog_fd, &topts) ?: (int)t=
opts.retval;
>
> [Severity: Medium]
> Does this fast path bypass the ambiguity checks normally enforced by the =
legacy
> kallsyms parser?
>
> In the legacy parser, kallsyms_cb() enforces a strict ambiguity check and
> returns -EINVAL if a symbol name maps to multiple addresses. However,
> bpf_kallsyms_lookup_name() simply returns the first matched address.
>
> If the fast path succeeds, ambiguous symbols might be silently accepted. =
If the
> fast path fails for any reason (such as older kernels without support, or=
 an
> unrelated missing strong symbol triggering a fallback), it drops into the=
 legacy
> parser which then unpredictably rejects those same ambiguous symbols. Cou=
ld this
> lead to non-deterministic behavior depending on which path is taken?

This matches the semantics of light skeletons, which also resolve
typeless ksyms directly via bpf_kallsyms_lookup_name(). However, this
is a semantic change, so I'm not 100% sure how to handle ambiguous
symbols and hope to get feedback.

> > +             if (err =3D=3D -ENOENT && ext->is_weak) {
> > +                     err =3D 0;
> > +                     continue;
> > +             }
>
> [Severity: Medium]
> When bpf_kallsyms_lookup_name() fails to find a weak LTO symbol (like tho=
se
> ending in .llvm.<hash>) because it expects an exact string match, this bl=
ock
> clears the -ENOENT error and continues.
>
> Because the error is cleared to 0, bpf_object__resolve_ksyms_in_kernel() =
will
> ultimately return success for this missing symbol.
>
> Will this cause the caller to unintentionally skip the necessary fallback=
 logic?

I believe this is fine, since the kernel intentionally removed
.llvm.<hash> matching from kallsyms_lookup_name() in commit
fb6a421fb615 ("kallsyms: Match symbols exactly with
CONFIG_LTO_CLANG"). Therefore, a weak LTO symbol will not resolve,
which is within the defined behavior of a weak symbol and matches the
precedent in the current code.

> In bpf_object__resolve_externs(), the fallback to
> bpf_object__read_kallsyms_file() is only triggered if
> bpf_object__resolve_ksyms_in_kernel() returns a non-zero error. By cleari=
ng
> the error here, the /proc/kallsyms fallback is bypassed, meaning weak LTO
> symbols that are actually present in the kernel might silently default to=
 zero
> instead of resolving properly.
>
> > +             if (err)
> > +                     break;
> > +             ext->is_set =3D true;
> > +             ext->ksym.addr =3D ctx.addr;
> > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%ll=
x\n",
> > +                      ext->name, ext->ksym.addr);
> > +     }
> > +     close(prog_fd);
> > +     return err;
> > +}
> [ ... ]
> > @@ -9863,7 +9915,12 @@ static int bpf_object__resolve_externs(struct bp=
f_object *obj,
> [ ... ]
> >       if (need_kallsyms) {
> > -             err =3D bpf_object__read_kallsyms_file(obj);
> > +             err =3D bpf_object__resolve_ksyms_in_kernel(obj);
> > +             if (err) {
> > +                     pr_debug("failed to resolve ksyms in kernel: %s, =
falling back to /proc/kallsyms\n",
> > +                              errstr(err));
> > +                     err =3D bpf_object__read_kallsyms_file(obj);
> > +             }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009130708.13=
70675-1-wusamuel@google.com?part=3D1
