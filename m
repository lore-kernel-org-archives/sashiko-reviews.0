Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF633CFF4A
	for <sashiko-reviews@lists.linux.dev>; Sun,  4 Oct 2026 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791143793; cv=pass; b=NzZzC+r76t3PW8yIcmWBOW52XjAvJGDWS0MdtoD7Ec3sdh+RQqCJ8q5ZYSEMvfZtfgeIfP/GRLPY9aZXpNiYlRmgeJuI20bOKS3gIAmRWvVS62aTTr/5zMaFnhNT+9CnOBqLVt3JmQ3zxQ72XmvzN7dvXzhX0YEwekoUw3smaU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791143793; c=relaxed/simple;
	bh=OnsVEjVr9nZISo1f+HA1XAFuoQXPTMkVBewjQpZFVEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szQeNOxbD0DlxdZD9ZO/DIwLgAs6xOqBytyRb7ykEfSpcCMKRAJxzJaE6MZkFGHN/kZmtliL7NM19xrXsAAXrNX3cUZbTfH7dD9zkhNvIRcYGza/HSPjcUSKX04BgZZbG+PaOmRm9Mrp2bm6h2O8/woebcs/LFLFqL0c7OF+FiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu; spf=pass smtp.mailfrom=ncsu.edu; dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b=ZJHtHfkT; arc=pass smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b="ZJHtHfkT"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cadbe09dso350214a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 04 Oct 2026 12:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791143791; cv=none;
        d=google.com; s=arc-20260327;
        b=OxymqdF0LUn3ZMZOCESbGBkHJjUeAJ8FLGItJYjA2WYWQcpLWRXzKj8BySDOhOujIM
         imeVnbM1Qxa5L/8EGrrQovdI8ahOkTS+V3MSfs6PUrveGTRwu3YqAa50nGsX60/CmeXi
         tAS4WQ+WH2KiL1yG89+uxL0Csf+zs+YRFEdmJQLsGagHntoNoBk6MNbMqt4wNTt8EwPJ
         AJlZhbg+IhOKbUGPJLpsPmvRgUAEysqo8J3wrmW7WupbkEw79ESF4Pu2MINNhGJWLyzt
         sb2v50xxMMHKRDv9r3hTOgAh9mvKzW8gOG8dLjrdtuL7JP1K0LCGjQT2yHYDpyvDL9Nz
         dfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rfGcP5S/SMntYoP2Pr+7iM7tILrMvCrH9eSgNIL7aCo=;
        fh=5WRQmWey/eNyRfI5g/sWfeAyOoN5rwo1UMEZgJHZ3hQ=;
        b=ITyOY0Bb9KFxMOxsrRdJrNKAqfEjSwzYfHlzDnUtlm3Hzb7jwMJYTqDGh1p6HWnftg
         Z6Xp97YnbmgRcnYp2/ShmMIMncLL1rSg5fiipeP7Fh+N/2TJCN9fP2j0cc+iUAxpcAED
         Jpoi021vHyZOGQUdbHL72t1O5fBp8pTtwu6UUn12oreeCfNmrOaMww6CF/Zz3KaCRLeR
         xRy5+P1W5JYVf8gAwPqGgpFTIFoVaXVzzNHFijJ04ElGfi7VHMTFNI7Cz5cekArA7QIE
         +JtQ5CpGog0lGPeymEMaOrU2j8ZL2d/0zA5W5WYYRNI6C+i0sVVkB+Qma/j63uwz+NpH
         vLjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1791143791; x=1791748591; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfGcP5S/SMntYoP2Pr+7iM7tILrMvCrH9eSgNIL7aCo=;
        b=ZJHtHfkTlQpOcmDkHD62wHjV6ruRVLJF8wqyu+aFJhjf5y/FzqWEvnRZdBAGv8Y/Wz
         a9k+qBgb3JxFsd+jdeFfiwMtalaebkb49jiSr7EWzOy9eDz6RJQrIyGbCswoqi9PiwQ8
         l9G0jQwHdOHkdCOeNQjEu2/Ey3xK060D8uwmxCXJvX1UW0+jt5jMZQQq6Qz9SsLrCogX
         c0aRMwYscM7U4mfH8LddwCFfEenIauz8d5rVGZhiMDt/W3P3G5ftPGDLPzgERKsbrUTW
         FkhPeXcIoHJWHxQhYA3bsUANp46LmrAxcahYVLxO+IRfalThPDCEC76q6SMYKPW/ZU3q
         751A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791143791; x=1791748591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfGcP5S/SMntYoP2Pr+7iM7tILrMvCrH9eSgNIL7aCo=;
        b=h9DDkDDdNGyjqEOi79C7/OO3pFheYkIk1GT+YVRvbFWIIsgIBoZ3FKICzlxRT+Yj+X
         mfE8g5Xv6dBEZSE39x0qUkomSWqoyQMjzRDsN26YP1r3ITtAJzzdVp1x1opt7kpnEZJD
         sMGqasuOQ7V7GJOY8uPflDw5FLxRaPC8KtEQhu5qTTvapj2qlTaFnWtAOmQsVUDQdqCv
         /0FQNhyivqFBnuLPBP195g+OtPIwGT4QY/VWVMELT71ijRb/L09PB+OskfOH260AStiw
         6BBVLLy8HDUEcKWsWhXgARsT7KeTexCLQytZEo654u3b/p6c6r4zQK5PIDAJQyXeGHif
         ytdg==
X-Gm-Message-State: AFq9FYKFltDGcuriPZUY1mqKRrTeqsYIfFe91lx5Vx/lbQt8J4UUbrNo
	P+u+gk9/bJd/VaBeM98k0kqaEwk2fe92R5JXfiCUwp2ROtK0R7Zoo0fohTjbpRsiwFL9magzSQd
	MzvmMDf/f/6hdASJmriOoK6EMUlTZiyL4GyD+Gv6KFY5YYNJq+N6DAll2
X-Gm-Gg: AYBFou0tlkARGsxO66+mX7nTZ83a2/yC8Wc4XHZeWiZzSC1mZRMY/BqCckQs/uLSz+K
	lJy6qyut2FbiHlGBEaqaIu9jW5AmFs5d157+qNmewDy1aUdgEOF58+mKQ8/I1f1WshsHC3Votcj
	J/7s23NRtp0ja31YEZGl5LP5b9PgwqGOwYC4LJ4FVp8EifCFLxf7RGYHGoil5suhK0p9wesy/Zq
	K8XJq6WZcrMtlyChoLwBvaa6D4EMZbXA6EifKp2I9nMwsDJLqLvMQgE5tRcK3tNRFydm7Nf8lJC
	xN9MQfbApzuBBtjFf6kNdYAZ67WB6vtAQM7FrHoZvs3ppczg41uHaf8UkM37/5l/rOn+34sBWiH
	qR2nTJDnlOrM=
X-Received: by 2002:a17:902:e88f:b0:2dd:c100:7cc1 with SMTP id
 d9443c01a7336-2e49b6e3399mr77155665ad.61.1791143790665; Sun, 04 Oct 2026
 12:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930210038.196928-1-yzhao62@ncsu.edu> <20260930210038.196928-3-yzhao62@ncsu.edu>
 <20260930211057.2E1641F000FF@smtp.kernel.org> <asA1u7LBRp2gqbWI@google.com>
In-Reply-To: <asA1u7LBRp2gqbWI@google.com>
From: Yanbo Zhao <yzhao62@ncsu.edu>
Date: Sun, 4 Oct 2026 15:56:18 -0400
X-Gm-Features: AclHuK8azCsvMF2wtXn3kb6m8zEbWMVz8t3HFQY0Wks_POrbAr3mS2ZkyYlGXgQ
Message-ID: <CA+J8via_aVdUYdfJRut-9Yar5iEJExBnW9s8fyOHxW1705TrDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] perf dwarf-aux: Add C++ vtable helpers
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Namhyung,

On Fri, Oct 02, 2026 at 03:52:43PM -0700, Namhyung Kim wrote:
> On Wed, Sep 30, 2026 at 09:10:56PM +0000, sashiko-bot@kernel.org wrote:
> > [Severity: Medium]
> > Does this code incorrectly skip valid primary base classes when parsing=
 DWARF 5?
> >
> > DWARF 5 allows DW_AT_virtuality to be present with the default value
> > DW_VIRTUALITY_none (0x00).
>
> Right, it'd be better to check the value of the attribute as well.

Will do.  I'll skip the base class only if the value is not
DW_VIRTUALITY_none.

> > [Severity: Medium]
> > Can this loop hang indefinitely when processing malformed DWARF?
>
> It seems sashiko is picky about possible recursions on invalid dwarf.
> As we recently added recursion depth limits, can you follow the
> convention and bail out if it detects one?

Sure.  I'll use MAX_TYPE_CHASE to bound the loops in
die_find_virtual_func() and die_get_vptr_class(), and bail out with a
debug message like the other places in v3.

Thanks,
Yanbo

On Fri, Oct 2, 2026 at 6:52=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Wed, Sep 30, 2026 at 09:10:56PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Medium] perf dwarf-aux: DW_AT_virtuality presence check incorrectly =
skips non-virtual bases
> > - [Medium] perf dwarf-aux: infinite loop in C++ inheritance traversal o=
n malformed DWARF
> > --
> >
> > commit e1f1b87424c8d58d923a8c3fbc1408fa0ae0c3b9
> > Author: Yanbo Zhao <yzhao62@ncsu.edu>
> >
> > perf dwarf-aux: Add C++ vtable helpers
> >
> > Add DWARF helper functions needed to resolve C++ virtual function calls
> > statically in the data type profiling.
> >
> > > diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.=
c
> > > index eb4b8f3475df1..b1f3dca057abb 100644
> > > --- a/tools/perf/util/dwarf-aux.c
> > > +++ b/tools/perf/util/dwarf-aux.c
> > > @@ -2293,6 +2293,222 @@ Dwarf_Die *die_get_member_type(Dwarf_Die *typ=
e_die, int offset,
> > > [ ... ]
> > > +static int __die_find_primary_base_cb(Dwarf_Die *die_mem, void *arg =
__maybe_unused)
> > > +{
> > > +   Dwarf_Attribute attr;
> > > +   Dwarf_Die base_die, vptr_die;
> > > +   Dwarf_Word loc;
> > > +
> > > +   if (dwarf_tag(die_mem) !=3D DW_TAG_inheritance)
> > > +           return DIE_FIND_CB_SIBLING;
> > > +
> > > +   if (dwarf_attr_integrate(die_mem, DW_AT_virtuality, &attr))
> > > +           return DIE_FIND_CB_SIBLING;
> >
> > [Severity: Medium]
> > Does this code incorrectly skip valid primary base classes when parsing=
 DWARF 5?
> >
> > DWARF 5 allows DW_AT_virtuality to be present with the default value
> > DW_VIRTUALITY_none (0x00).
> >
> > If a compiler explicitly emits this default value, will the presence ch=
eck
> > evaluate to true and falsely identify the non-virtual base as virtual,
> > skipping it?
>
> Right, it'd be better to check the value of the attribute as well.
>
> >
> > > +
> > > +   if (die_get_data_member_location(die_mem, &loc) < 0 || loc !=3D 0=
)
> > > [ ... ]
> > > +Dwarf_Die *die_find_virtual_func(Dwarf_Die *class_die, int index,
> > > +                            Dwarf_Die *die_mem)
> > > +{
> > > +   Dwarf_Die cur_die =3D *class_die;
> > > +   Dwarf_Die base_die;
> > > +
> > > +   while (die_is_compound_type(&cur_die)) {
> >
> > [Severity: Medium]
> > Can this loop hang indefinitely when processing malformed DWARF?
> >
> > If a maliciously crafted or malformed DWARF file contains cyclic inheri=
tance,
> > die_get_real_type() resolves the type back to the current class.
> >
> > Since the loop does not maintain a depth counter or cycle detection, do=
es it
> > spin infinitely as it re-evaluates the same class type?
>
> It seems sashiko is picky about possible recursions on invalid dwarf.
> As we recently added recursion depth limits, can you follow the
> convention and bail out if it detects one?
>
> >
> > > +           if (die_find_child(&cur_die, __die_find_virtual_func_cb,
> > > +                              (void *)(long)index, die_mem))
> > > +                   return die_mem;
> > > [ ... ]
> > > +Dwarf_Die *die_get_vptr_class(Dwarf_Die *type_die, int offset,
> > > +                         Dwarf_Die *die_mem)
> > > +{
> > > +   Dwarf_Die class_die =3D *type_die;
> > > +   Dwarf_Die vptr_class =3D *type_die;
> > > +   Dwarf_Die member_die, mb_type;
> > > +   Dwarf_Word loc;
> > > +
> > > +   while (die_is_compound_type(&class_die)) {
> >
> > [Severity: Medium]
> > Similarly, does this loop also lack a depth limit or cycle detection wh=
en
> > traversing base class subobjects dynamically, risking infinite cycles o=
n
> > malformed DWARF?
>
> Ditto.
>
> Thanks,
> Namhyung
>
> >
> > > +           if (die_find_child(&class_die, __die_find_member_offset_c=
b,
> > > +                              (void *)(long)offset, &member_die) =3D=
=3D NULL)
> > > +                   return NULL;
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930210038.=
196928-1-yzhao62@ncsu.edu?part=3D2
