Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93DD3254B8
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319115; cv=pass; b=M94ZH2BQL0wWr9h/6KWW2/41e/inBoj/to+jWRMXqhpoqYF7sgh5LDbRvZqu5jL+IhiFjoQr5fnAXgMZrxb5UtHqH1Obqs4tWWqkRKxmUKVURGLqv4wq9/fJ/g60VLYKX1iUUzZ9PtvlnA3KAJVaxW7PrC44UiNeKSStqG+og2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319115; c=relaxed/simple;
	bh=H9W1dEJDPyRKl2sfdT8dO28enMeQoXfFCCRppVuhqnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsBxOJhy10uXoQvRoK3M3y6BIBuVtOzL9en6Jw8rjLRFCVCY1dBWeDXlMUf4mBukZUerSRJTRoP6P7qnI8aoQId6dqoweEPijW3Q0HMOzjeEjxdBnopROSFN42e5pE63VV0zTV/zCSJ2kJdzansl7qpD8UByNY9x7DrNpZ8d9lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GK8z5f/U; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GK8z5f/U"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-662dc3879acso1181489d50.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 09:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782319113; cv=none;
        d=google.com; s=arc-20240605;
        b=AvTUI/8mwwjqUbHvc864uCckYCcRC8arbOWoYTf3GQN8ZOJZzk+XWNNIDvfMUDyj5J
         ldo6DpfWzkzs9wtWWIzaeihbageFjZiT0A13516YC6zUDQkq9kVRFCgV2vb8vnxw4oQB
         JPLW6ESX66NQ93wTqGc4AVt8jlF+wJ/i97F7w/X9KssNvudWXasb0GP/Zt8PfLK+wJTs
         AFh/pccsQUvHWOEwovgq6J15sB5i/DC59sGntWyqzSU0XG+HGEc6SaohgghR92a0ycP1
         mMu9YtR3aAknl+HsQ6o+7w2GkTYYELR1quisZjezcGfz2F7/szbswQ5k2xtEz5sHwSQ2
         +JLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GSu9YbZfMzCAQKitxFaYWjlM2XOAqBeVNR6Gv9gvDe8=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=A9gHxyYIjEYiTXNTp4l1Mm3uwcB3GZEHBlKK46ar7m0nDkY4rN9iqjqjCJKXUW32Jq
         tSNc/l04uk+x7UCyrgF5HKvzyGMZFYj4qcUdLTfbfaVqXgbnlVHOLdQGGNEtCHTG9VFq
         QyyTNwSfXuniY1HDuVhSWBi4fPpbQn28bE/r/4BDFypROapVBzS4vfrs/3BRIIVAo7Ua
         MjW2MjBEf3i5vtSsV2ggwW3vBI46vonMc4s/poJo0Jyq23/UN0Uvcx2p/nfm7QT+mBbM
         5jJYgkcak5ilguYnjoePloqM8XZSFokh02QxueABRsmzdsuWvcfCSZkn3D6eTRInJL2Q
         6JwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782319113; x=1782923913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSu9YbZfMzCAQKitxFaYWjlM2XOAqBeVNR6Gv9gvDe8=;
        b=GK8z5f/UPm0p3eYLF4O9DC5R4W97kwOq8y98CLUbmKoS67CtaFCVbqPUF8pxSbYN/N
         urJ4YdJPSYkP4w6gxlY5tnZEu8bL9Ox9OTmTjW+1laB768oygD3Kt69h82BWGcPHf2VK
         d4jBYoVdP7yonuv/WOMQVC+yCMp7bOzfPBdksRzBmI4JR0V/4OxsXyyc7ZsL/hXtkNoS
         BPlj0Kiqtcp0h5Sh06PiRwUPzX4j/dcS4rcyL94gTfw+0vYmewhkN84VqQMKHRZrLOFX
         Vtd+sHd+usanYUH99s4OJ82MjA3Fr7vRIrecjDn1rfXG6y2Y8DFk2GbgYf+6Z4JgtVVV
         jaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782319113; x=1782923913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GSu9YbZfMzCAQKitxFaYWjlM2XOAqBeVNR6Gv9gvDe8=;
        b=gejNnz35P3gIuv4g1n/cWSgR1I9fGNs6Cbwz3wfL+b/4LGFXbv8gvf+k8W5KOQeqP2
         iKPRVbCFFef99HWaBWzZZu2XM0JCEq5aZ6WRnUbblLr6J/RnefvFsjEqOosaqEpRw8eT
         aPTzYWzCu5QpVyBkX+CDP9tsLCPNiHx1UOd1gPR66aojOOXM+FZDCbki+jKbyWejKarW
         hc8J1X2aBPOhyOnbW/1Tj0z0VEpmGY0h68dfrEGBOwSwvR8p/CZwpU2BGQTtaQsTaFdc
         fWSl8sjYcQ8Nbtb7ORvniEC2znnscg1QfNNFSPh6lqB9kfIErL6FzXCXzBy2z9mRHKal
         isbQ==
X-Gm-Message-State: AOJu0YzEszW5RC2Ni9g/FDwh5i1x/PMJu+Vn66Q8XdeWTHrqogyiLY10
	wSlJEWWDoUaIZJoQIF2uiXADIvVueuHYYjwLPZgYHXXtv8CbmGUJAcCVr9tkBxu40d94sh7BI7m
	ftMVdy1HSD5Ll/gIDP9mhpfw3wHsRZNpxUrGy
X-Gm-Gg: AfdE7cl5tohpvv2wyEkmGWPmImkwtQdtltWKU+S+jJawanoOgH+laprBxQUiDeB2yif
	mreyr3MaXw9W1gSNVwZBAoEwfnF84Re3dV9txgvBiPkYvwcd04sUd5r1KJOarFZ7lexYTpf+uYU
	Hih5bQzcaXWx8N5YfdeSQ2GUVV/Fc5xHFeaxaizO/yfHjG8X5Jk/78sg/cpP63DVb4X4TfEA437
	h6/D5fFV8G4rYfeJM8TXB/C+w9AvSMdX6YgbHqOmLm5e7TmYgmQ9gw3w/XuZK0Qva/Otl5ozi1N
	ksM0JFw=
X-Received: by 2002:a53:ac8d:0:b0:660:460e:2559 with SMTP id
 956f58d0204a3-6636e423652mr3698458d50.39.1782319112490; Wed, 24 Jun 2026
 09:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623175006.3136053-1-ameryhung@gmail.com> <20260623175006.3136053-4-ameryhung@gmail.com>
 <20260623214054.909821F000E9@smtp.kernel.org>
In-Reply-To: <20260623214054.909821F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 24 Jun 2026 09:38:21 -0700
X-Gm-Features: AVVi8CcrW35Pmper7ivcINQsaPKGZjDfSdaMkwiJLsQ4RNi_3YmC0K5FQFU7oAI
Message-ID: <CAMB2axNYMbRZcBJaa=hZEM_NU-P3SxrfMopE6zAc9DrTKW=Aww@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 03/15] bpf: Add bpf_struct_ops accessor helpers
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 2:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The newly added bpf_struct_ops_kdata_map_id function is an exact =
duplicate of the pre-existing bpf_struct_ops_id function.
> --
>
> commit d1f80ae7e459b35d14e3b364a031f8d29bf9da8e
> Author: Martin KaFai Lau <martin.lau@kernel.org>
>
> bpf: Add bpf_struct_ops accessor helpers
>
> This commit adds several helper functions in bpf_struct_ops.c to be used
> for creating a struct_ops to cgroup attachment link. It also refactors
> link update validation into a reusable function.
>
> > diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
> > index c422ce41873ee..1ca44584ed17c 100644
> > --- a/kernel/bpf/bpf_struct_ops.c
> > +++ b/kernel/bpf/bpf_struct_ops.c
>
> [ ... ]
>
> > @@ -1236,7 +1236,33 @@ int bpf_struct_ops_for_each_prog(const void *kda=
ta,
> >  }
> >  EXPORT_SYMBOL_GPL(bpf_struct_ops_for_each_prog);
> >
> > -static bool bpf_struct_ops_valid_to_reg(struct bpf_map *map)
> > +void *bpf_struct_ops_map_kdata(struct bpf_map *map)
> > +{
> > +     struct bpf_struct_ops_map *st_map;
> > +
> > +     st_map =3D container_of(map, struct bpf_struct_ops_map, map);
> > +     return st_map->kvalue.data;
> > +}
> > +
> > +u32 bpf_struct_ops_kdata_map_id(void *kdata)
> > +{
> > +     struct bpf_struct_ops_value *kvalue =3D
> > +             container_of(kdata, struct bpf_struct_ops_value, data);
> > +     struct bpf_struct_ops_map *st_map =3D
> > +             container_of(kvalue, struct bpf_struct_ops_map, kvalue);
> > +
> > +     return st_map->map.id;
> > +}
>
> [Severity: Low]
> This isn't a bug, but does bpf_struct_ops_kdata_map_id() duplicate the
> pre-existing bpf_struct_ops_id() function?
>
> Looking at bpf_struct_ops_id() which is already exported in the same file=
:
>
> u32 bpf_struct_ops_id(const void *kdata)
> {
>         struct bpf_struct_ops_value *kvalue;
>         struct bpf_struct_ops_map *st_map;
>
>         kvalue =3D container_of(kdata, struct bpf_struct_ops_value, data)=
;
>         st_map =3D container_of(kvalue, struct bpf_struct_ops_map, kvalue=
);
>
>         return st_map->map.id;
> }
>
> Both functions perform the exact same series of container_of macros to re=
trieve
> the id from the map field of a bpf_struct_ops_map. The only difference is=
 the
> parameter type (void * vs const void *). Could the external caller direct=
ly
> invoke the already exported bpf_struct_ops_id() instead of adding this ne=
w
> helper?

Yes. I missed the same comment in v1 also raised by sashiko. I will
remove bpf_struct_ops_kdata_map_id().

>
> > +
> > +void *bpf_struct_ops_map_cfi_stubs(struct bpf_map *map)
> > +{
> > +     struct bpf_struct_ops_map *st_map;
> > +
> > +     st_map =3D container_of(map, struct bpf_struct_ops_map, map);
> > +     return st_map->st_ops_desc->st_ops->cfi_stubs;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623175006.31=
36053-1-ameryhung@gmail.com?part=3D3
