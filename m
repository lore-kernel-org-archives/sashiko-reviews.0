Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0183F0A8C
	for <sashiko-reviews@lists.linux.dev>; Sun,  4 Oct 2026 19:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791143712; cv=pass; b=WT3vGUKMLWjkJAPqeyaB63pXOlrRlniGccwKLRKBhLN6kWI8p7AzlYETzj7vUeG80L7RsWMDgytoxGgX/t70+ebFhyFtawRahXJN3k2IZ2bAzwKL7OUzGtVBm1Tz9PHZBgWvjA5NMQpfCNB87Bgp95xGO+ZWzOkf+ZctAInBX8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791143712; c=relaxed/simple;
	bh=Jh7QrlOttp/hJOGnDhr5dP/akcAxUwVLAJfz5fQRGrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDgBV5rPRJGdJtpCNe95oBuWpHZ18003t8D5WoCVFm1ZfawMHsYs4dTl53aFYCFgH7r8P6nlZvCFgZs7qLq0GOz6eG6P1Dm+/9tMu7xZ/XXCHA7GHhdXIFAAYJUpRFRz5WorB/VgH++DlUzxQ2z1JkpRnEnCODIZp9reiXaphV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu; spf=pass smtp.mailfrom=ncsu.edu; dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b=XFhyzQfV; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b="XFhyzQfV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e4a341d177so6345665ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 04 Oct 2026 12:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791143708; cv=none;
        d=google.com; s=arc-20260327;
        b=Lfa0tr9xKQo7FIk9jN39odp7v7Tp32pFYcBDzGZP2aoz2QAMePweJ3pFd91FAz1hcw
         w3Tu+vX5XkarIP1Kvv609o1AzYkpnuE+PxwE3DZyxd72WTtW7FQhcnkw/E2wyGjBA6gX
         2Axa8gx8NPi6YFC0wjD5gnL/qAXZ3W9bTUitl0CSmD61eHz7+ceQFE5vvrLYrSNzKEKh
         dvtcraXj+U9wbesj/DNjLq74OdRlgfEFSaRRu034gbYZCjuzZYzxvtDqsBxzwC0WxMDT
         JCaFekwxQQz8SL791zVmkcUTS7wZboAMuy2uqu0vUlFqVqq3jl1guEf/EvScZBNIRHCx
         3qkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P6RFZCyUChiX/tp/C+y/RH4dV99Sf5c60j1c6Xm2mKQ=;
        fh=FpDnnKMtCfa3zD8ZYWuaefZ7R7QmpR25TtCxz0lZhkc=;
        b=YOGZtDcTH87yUbdZs27lZNGEoM4+ABXinAAuc4OHbVD71VOxMA9G3+EPqjbISzYB9S
         uq1SwHym1QCamNzudeXiWIxqRyM/B4h+zxBuSjxJJ7tAVjWYV4uGtbnRvETntWues3ov
         8QviSuxM1eXeesLY5AGsLYXLclZJwUl7lgCuikHLBqONkLQhT8T9xFcdV4eaueYc7d8Y
         0xhWSwEX5nJjqT3s1boE6tuMqz72Xd9XWJnDRCiqSx10wwKB3NKUOqL4kn61yITAeFAi
         fCe4R8drmkXfG/+DA60RVREWN1RxY8J+uvUFNAmjQecXdxmU6+J/FpsLE3h+68jk5q8c
         mm/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1791143708; x=1791748508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P6RFZCyUChiX/tp/C+y/RH4dV99Sf5c60j1c6Xm2mKQ=;
        b=XFhyzQfVdsXcVO5GPyS3Q3/+LnDhZjkGOdaB9V4k42UYudOrFFRjHc8PpgcfzuL3Ld
         CJL9o32dx130rKgiTOhHHUNUT8s4UkqkYuyc3c2+FzKfe+Nq6YNqyjT5kb1fL1eFBW1H
         1iuSw0qKusEIiMON1PAAbC+5bmhphbvbv1pFcAdbalOoVmHYydzWs6Afw5s/etycb0Ss
         +vos9eWaPmiAmfWKRF97Qg1ZhM5/qPinJ2IvtzwQyiEQPCiqyA9fiCGg/naueXaI1Q9i
         Lmg8ZivUzwXlYHcrShvzactdV14UAggj550X9MAgaq0F4TSLnIqCoSxbdwAKTDV7bMOq
         qVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791143708; x=1791748508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6RFZCyUChiX/tp/C+y/RH4dV99Sf5c60j1c6Xm2mKQ=;
        b=uDj+le3SWxU7r1LucIB14gr5MbDdbJPmxwoEsDGWiHOXZcvPC34do8t2pkr9k/5ZH9
         qo0lz1IpiXlK1+OCwVPAkdaqNNlNtBZXDLSxIx9u53CfT7tuxNzYo1UEnjGC9IHcwL/9
         iLdh+ccbGlNZQbC1mNMzqRWM8ZYS4R6pL9RJj38at6CDswrYIShgHTvKCVxlnO0frVtp
         PeDrfqKkB4YmlkS+ucybdu4XjDgtIAV77d3cY6xz/oapS4Ov20TKRvIB2Dw9lFtCoX8p
         belB2crUXGzDSYFtYYLwjAfL/YM23AxHxB2RXMkGC746X/bu1A8vdrte09hD/wRSIwH4
         1O6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQQk140o1gh/EPKaA0k57M9xoKyW1vmrneB6auKNeekxdwYp/DqNcLml3v1dvFbGbkxRMNqugua/U2eqKb0pg=@lists.linux.dev
X-Gm-Message-State: AFq9FYIRJbzgF9pqeigmYb+BztaN5oZcuPyXBJcATZtkibuf6qw2E2fE
	MpixMcyNCUIeh9ijR+Uka3k0WgXwXA6SFjaKEAd10mB8Lc1DcV8I53Y1HjH6suwwkyfVFzt6nhJ
	0uHl/4H4ClK/vFwNy4eDLEXv91SeWOWct577Gia7n
X-Gm-Gg: AYBFou3rH5MeKtej83FZUExHl6B381vhgMxtpyxTPCucLGgc8KXUb6oI5FlGkfD+E/K
	y4s9I+Ngsw5KhTiJRKlW9jlEIhI1J1GuSd2mtP1K+wYJEIhidIUDpd8jkYrb34feDf3MmVLyoEc
	LRc/LpX/28x1dtcFqHjHjZxubqnT7hyqcXmUz/BThUrN0Ro98xlq3s2JQ5oKPiT3tGPSGTwCKK9
	KLfw1Q5SIO7gJymc7f6aUyj5eGh1T4EnExDp9cihW32Vb+diDohi1wtkAunahmtxjHT3iv8Smsl
	epMHsOz144zS7Xj0dxseIdg6AWRksvVQOiD3hPFyuiLL0yv8uGmFKJ32vkuVBerKNChUsdpKXHV
	Xdj7SyJVQ4nk=
X-Received: by 2002:a17:903:3df4:b0:2df:a4d8:579e with SMTP id
 d9443c01a7336-2e5106355d6mr37437385ad.45.1791143707699; Sun, 04 Oct 2026
 12:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930210038.196928-1-yzhao62@ncsu.edu> <20260930210038.196928-2-yzhao62@ncsu.edu>
 <20260930211051.8EFDA1F000FF@smtp.kernel.org> <ar6i_ZKXNVZmze2r@google.com> <ar_dGYiNoo04-OEK@x2>
In-Reply-To: <ar_dGYiNoo04-OEK@x2>
From: Yanbo Zhao <yzhao62@ncsu.edu>
Date: Sun, 4 Oct 2026 15:54:55 -0400
X-Gm-Features: AclHuK_fTdiCh8dZTLaIHxhK9TmQN-VSQrMo_UjkUH2Z6NvvPB4Ss4Mw7_KN0uo
Message-ID: <CA+J8vibQxdKXpqstnv0+BGpwn7dd_E_kQS5GE9dCyR47--da5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] perf dwarf-aux: Add die_is_compound_type() to
 handle C++ class types
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, sashiko-reviews@lists.linux.dev, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Arnaldo and Namhyung,

On Fri, Oct 02, 2026 at 06:34:33PM +0200, Arnaldo Carvalho de Melo wrote:
> On Thu, Oct 01, 2026 at 11:14:21AM -0700, Namhyung Kim wrote:
> > IIUC C++ officially doesn't support flexible arrays and there are
> > better alternatives so I guess it's rare to see them in C++ classes.
> > Maybe it's ok to ignore them until we find it's really needed.
>
> ok on both counts, there is another patch with a Sashiko report, can you
> guys reply to that one as well?

Thanks for the review.  I agree with both, so I'll leave this patch as
is.

For the recursion in __die_find_member_offset_cb(), the callback needs
to carry the depth in its argument.  I'll send it as a separate patch
on top of this series.

I will reply to the reports for the patch 2 and 3 as well and send v3
with the changes in those two patches, and there will be no change in
this one.

Thanks,
Yanbo

On Fri, Oct 2, 2026 at 12:34=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Thu, Oct 01, 2026 at 11:14:21AM -0700, Namhyung Kim wrote:
> > On Wed, Sep 30, 2026 at 09:10:51PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > > - [High] perf/dwarf-aux: stack overflow in __die_find_member_offset_c=
b via cyclic inheritance
> > > - [Medium] perf/dwarf-aux: flex array detection fails for C++ classes
> > > --
> > >
> > > commit 3f3b9b56b2e28f1713af3b40ab8946d5bbc8d245
> > > Author: Yanbo Zhao <yzhao62@ncsu.edu>
> > >
> > > perf dwarf-aux: Add die_is_compound_type() to handle C++ class types
> > >
> > > This commit introduces die_is_compound_type() to support C++ classes =
alongside
> > > structs and unions. It also updates offset lookups to descend into ba=
se class
> > > subobjects using DW_TAG_inheritance entries.
> > >
> > > > diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-au=
x.c
> > > > index 54f8b5ec74a2f..eb4b8f3475df1 100644
> > > > --- a/tools/perf/util/dwarf-aux.c
> > > > +++ b/tools/perf/util/dwarf-aux.c
> > > > @@ -61,6 +61,14 @@ const char *cu_get_comp_dir(Dwarf_Die *cu_die)
> > > >   return dwarf_formstring(&attr);
> > > >  }
> > > >
> > > > +bool die_is_compound_type(Dwarf_Die *type_die)
> > > > +{
> > > > + int tag =3D dwarf_tag(type_die);
> > > > +
> > > > + return tag =3D=3D DW_TAG_structure_type || tag =3D=3D DW_TAG_unio=
n_type ||
> > > > +        tag =3D=3D DW_TAG_class_type;
> > > > +}
> > >
> > > [Severity: Medium]
> > > Does die_has_flex_array_recurse() also need to be updated to use this=
 new
> > > helper?
> > >
> > > If we look at die_has_flex_array_recurse() in tools/perf/util/dwarf-a=
ux.c,
> > > it currently forces flex array detection to return false for C++ clas=
ses
> > > because it explicitly ignores DW_TAG_class_type:
> > >
> > >     if (tag !=3D DW_TAG_structure_type && tag !=3D DW_TAG_union_type)
> > >         return false;
> > >     ...
> > >     if (tag =3D=3D DW_TAG_structure_type && found) {
> > >         if (is_flex_array_member(&last_mb))
> > >             return true;
> > >
> > > Could this cause accesses to flex array members inside C++ classes to=
 be
> > > wrongly rejected as out-of-bounds?
>
> > IIUC C++ officially doesn't support flexible arrays and there are
> > better alternatives so I guess it's rare to see them in C++ classes.
> > Maybe it's ok to ignore them until we find it's really needed.
>
> ok on both counts, there is another patch with a Sashiko report, can you
> guys reply to that one as well?
>
> Thanks,
>
> - Arnaldo
