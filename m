Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E5D29A32D
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 22:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779834216; cv=pass; b=qEMcdgVIpcTSNgb+uzuDGcnJGMfmPJmR5wGMhWjOCHX9qkEmNC+QazoIYozaNUmWLL3jqk9sXch9Zgg8Jbh9EZ4TLjJA0aPaOPXPtE6eChcKjPkx4u2qpBPnjcaW5InXgZyfK64MiT/+je1mEimW5oWojW4/Sra9rhGTt8pUBNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779834216; c=relaxed/simple;
	bh=eGSKid8T3HB5+pr++L1S/29WM8A1nyo0/2pcRio9MlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbFNonkkIEYnSTcvQbVw4RIYBLPCuFp6MI5lejf3MhwEPapVcEYeMyXNaWcRoXv1cbubTX+OwijGznQl2xzl0XUKbbLp8Vo8Hbo/d/GibRfmAAgKLmVpfMap7t1Qn7hQGj9YwXR4t1qJDZQNomPa2esvlEB0+g/bzFRAcGSXfOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxIyrHUA; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxIyrHUA"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bf1eaba464so103363077b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 15:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779834214; cv=none;
        d=google.com; s=arc-20240605;
        b=BLT1cncsWCEr4AEp0cMrKtfrOcHJa/q22mW7bO9ZJG+vqj0Qwr4fE/Gqu/HCVmh2Ly
         i5Jo7n3xkA33m7Hg/p3KgHYGlqZmW1qgL3vwAx6CrTN0wEpGFdMYYNCoWoA0ayxnqiMS
         W1gCeLWhuM0f2+9H9rOMf3dG1iN32oN4W2Z13csh3/PuKmFHSKaC4Ay5ps7eiGGHRLFA
         t0hRwbOYLwa4eDArpBnifmXULlzlkgplwg5/CpmfJADP1OvByivHn300sSe7iu9vIZ/R
         6p5AOiLXGTd2SMadfTdklZXVBwvd1j4jwAG1wr7tEoy/Cehpj8kD04bpoLlfhUSfjxl7
         vwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DHzwjJ65oAB4Zi5oS+R74ouicsyriJXbMPsqN056yk=;
        fh=IHoi2ePnp3QxbSquT4jfrj4BvruY2jAvEeD9KGDE+lE=;
        b=QLgSJ7WL3eiiYFwNr9VHJwMEw86CkiJIN8s4qS9RNy5Efj4SpfdwyRgTOQhbsJcFR7
         K4sbWHJx9OOXvzTewljl/g8McYRdEA0EMAVC613UPgDRuwpkNfh5mHJG9mHm9eie+qIY
         gHUYd0u5RAW/lcsCufEe/Rdajqb/2QF4sMf8Sq9x7WFQihHB2CPw7uftX/EUFCiPvg7O
         WUkDr90Z8EAfycUc/IJBMtIlDw2v2GEiGQ8NNwd9V1/L0nys23+IP4g4IxmyAcUMdDh8
         cTDDWy1e0MbrtCm5aXPY4uL1boUEpYd9jSc4qdtLzwB7RRln53NHIOK0bgpwFHVnwtd2
         4EWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779834214; x=1780439014; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DHzwjJ65oAB4Zi5oS+R74ouicsyriJXbMPsqN056yk=;
        b=KxIyrHUA0ILPqGafpDWSbg6e2U/VbY3D8W96St05r8ixuQFBGQ/P1FW51fsovImAje
         VXW59SVLjzIjKAxHDEhFG4nLS5Y93W7UURVLMKn72oClg1ICcPSZlZ7f1/r56KrX3T4d
         6S9PZ3OifKQD9xblKDtiwDogaDVji8uSS0GhTlDpG/P2SLdDfP9f4nJJovvJ57LObF1y
         QlM1ip70z65kgPJ2hrrvzaSGDCcTmCtW+YFIGF74lKFxiTYC6/PJMCiXaj0+5tv8/RSi
         b0bZGu3N4OCQ0FeSgssM4Y9PjJFweWHDuM3fEO35dDOBNZ/DsR/vtbdYBhBAPzpHzN1y
         WjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779834214; x=1780439014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DHzwjJ65oAB4Zi5oS+R74ouicsyriJXbMPsqN056yk=;
        b=LCO9kBSf9ec/gqFmLGA2+C0WZmrHaenOZBukePH4llQ0BH2sgW6mDPbUr1+Xxk7tDG
         I4ILPQszNZtQiNvHLR3Bmp4dkhIdbVR9HrD9hWYF7WrxfgNGJANQDjTd9iRuZRThcaXh
         qUTg7EYrKbgRWfCCRkZzIFEdA/PRgbBzS8z3gtORTifLdAj6P3N4DrMRd7+SeYl560QR
         YqKQKCGtQMLZJVYMHeFbWBci02iBDRAL6Zx/S8AhJHnRUEpODtZZ/LZFWeHaNg4nme4h
         4Sid/hBmc+DQ7wdgFRAj0giMZds22mgmyemgs4RE5Ct1bEl5zL5Uh/PiVSJSsQ942CIs
         OWvw==
X-Gm-Message-State: AOJu0YxQzZbvm20QSTA9pLVBAtLx8tlqlyoohd0bDivjD/ramQuANNRb
	SPeHHQNzPKgnW7EhIZFmMrdzNFaKlegrzUrASF3Kuz5rTcrDL8nXJcwJJG6rY2Db1yxrfm7wc/+
	gB5neDp0sN/9nqUhLTLvkBAQM9eic1s0=
X-Gm-Gg: Acq92OFW8EkvGj2nA31vA/5R+H2wAScPEpy2wmpC+II33+XOOnHrGQzDY9urIy33u0m
	fOHBCmofYTjSU/B7NGDfeGZPQk+/yQpIkEBO8806M6PPyDy8aa56cBXAjovmxgZOoCar15YKZbK
	zMc3237EhTcgn6wIdVCOjZny0AaC//EXK7xQAuJfiqwq5CDTZW1Z31QURQUPmucAfc626nmYFTD
	No34kR1+SjGqMDlUJbPCpiy/joA4LtsqeHTdsm5U6OxjUGybeGuKPy06/ewQeb3AhvXrUfbfbew
	C020PuG6ns6GVpeMr2OAjos=
X-Received: by 2002:a05:690c:888:b0:7b4:1ffe:f9f9 with SMTP id
 00721157ae682-7d3342da180mr223593247b3.16.1779834214393; Tue, 26 May 2026
 15:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519215841.2984970-10-martin.lau@linux.dev>
 <20260519225002.986EB1F00893@smtp.kernel.org> <2026519225454.By6y.martin.lau@linux.dev>
 <CAMB2axPDDom8sD7u+2Fgo9dZO1ereX-unai8EW1SmsiDrnzzwQ@mail.gmail.com> <2026526211020.HhEJ.martin.lau@linux.dev>
In-Reply-To: <2026526211020.HhEJ.martin.lau@linux.dev>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 26 May 2026 15:23:20 -0700
X-Gm-Features: AVHnY4JUSZ3t2v6IJQLuXpnvOcVkIqY0BVIvHYrgkCXkRpmnjC2Shb9O1cuvfxw
Message-ID: <CAMB2axPqfHPmxx3uCHnts+uDKiBMBWVaDXR+X_ZJW_xn=07VPw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 09/12] bpf: Add infrastructure to support
 attaching struct_ops to cgroups
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 2:37=E2=80=AFPM Martin KaFai Lau <martin.lau@linux.=
dev> wrote:
>
> On Tue, May 26, 2026 at 10:54:00AM -0700, Amery Hung wrote:
> > > > > +static enum cgroup_bpf_attach_type find_atype_by_struct_ops_id(u=
32 type_id)
> > > >
> > > > [ ... ]
> > > >
> > > > >  static void *bpf_cgroup_array_dummy(enum cgroup_bpf_attach_type =
atype)
> > > > >  {
> > > > > +   if (cgroup_bpf_is_struct_ops_atype(atype))
> > > > > +           return struct_ops_cfi_stubs[atype];
> > > > >     return bpf_prog_dummy();
> > > > >  }
> > > >
> > > > [Severity: High]
> > > > Can using a loadable module's cfi_stubs as a dummy sentinel cause a
> > > > use-after-free when the module is unloaded and reloaded?
> > > >
> > > > If all maps are detached, the module providing the struct_ops can b=
e unloaded,
> > > > and its cfi_stubs memory freed. However, the cgroup's effective arr=
ay might
> > > > still retain the dangling pointer to the freed cfi_stubs if BPF_F_A=
LLOW_MULTI
> > > > was set.
> > > >
> > > > If the module is reloaded, cgroup_bpf_struct_ops_register() updates
> > > > struct_ops_cfi_stubs[atype] with a new pointer. If a user then quer=
ies the
> > > > cgroup via BPF_PROG_QUERY, the loop checks
> > > > item->prog =3D=3D bpf_cgroup_array_dummy(atype) to skip the dummy. =
Since the
> > > > array contains the old freed pointer, it won't match the new cfi_st=
ubs
> > > > pointer, and the query loop might mistakenly treat the old dummy as=
 a valid
> > > > map, causing a use-after-free when calling bpf_struct_ops_kdata_map=
_id().
> > >
> > > Agree. This will be an issue on BPF_PROG_QUERY when the module reload=
.
> > > I did think about the module reload case but I have only considered t=
he
> > > rcu-reader in bpf_cgroup_struct_ops_foreach.
> > > BPF_PROG_QUERY does not use rcu_read_lock and depends on cgroup_lock.
> > > This will need to be addressed.
> > >
> >
> > Also thinking of the potential problems of leaving dangling cfi_stubs,
> > but I don't see any other cases.
> >
> > In this instance, it seems adding a cgroup_bpf_enabled() guard in
> > __cgroup_bpf_query should be enough. The dangling cfi_stubs will not
> > be cleared until update_effective_progs(), which happens during the
> > first struct_ops map attachment. cgroup_bpf_enabled() will be false
> > until a struct_ops map is attached.
>
> In __cgroup_struct_ops_link_detach, the static_branch_dec is done without
> the cgroup_lock() for now. May be moving it before the cgroup_unlock()
> is enough?
>
> __cgroup_bpf_query() has already held cgroup_lock(). I was thinking to
> use cgroup_lock() in cgroup_bpf_struct_ops_register() also but it will
> need a cgroup_bpf_struct_ops_"un"register() when the module is in
> MODULE_STATE_GOING.
>

It makes sense. Clearing the cfi_stubs when MODULE_STATE_GOING makes
effective_progs valid all the time. I think it will be less trivial to
reason when it is okay to dereference effective_progs with the
cgroup_bpf_enabled() approach.

> Either way, this should fail early in __cgroup_bpf_query() once detected.
