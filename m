Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD6C3B9D98
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592401; cv=pass; b=omcoHvf48R+X9MBTOxn6lGqnrIgm9wDP+Er3aWkCMr0QupYsXqeTDPVnNOLdwUvSfTAFuayM3L6FG32usgfRQQzNJd7jdeO21Re8TbFKxE7mjDthOjGB1RrEfO4YlQDBARknTMuo3OWx0Wr3eNUTcgfLefTHTs3cvW9ilsZP/XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592401; c=relaxed/simple;
	bh=aYLfMzw9PHJwFY6JBY5oV2zpZ2+xt+0iwSXoHkKmj3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fU8oOMgRE9LRrMYsZstIf4KoQ8B+VSZ3i4Ftw9uIbakKc43lOjaRKPwNIxeW8McQYFgTmHVjOlBHc6y6bsWRJxxY7waDsYQyK+wHMQ0GTHS5eUKijyDtRQ63SoNgDwi1w81izXM0eDWKmKt7kMLpD9hZf21SeIiXFM8GUaC3c2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5A3uvnK; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5A3uvnK"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-660ea43107fso1151701d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 09:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780592399; cv=none;
        d=google.com; s=arc-20240605;
        b=jpvwhUjntxED5XyAaKA04zxBKOQFOIktV1+7gRPQUgqR1H5C4fIII1FMFfbcfkW6Lm
         aYjIV1Uace3Q60aVggeUbOw7Jm0/YlQJZDpnNuYT2PsScvlH+fbkqnVBTsjQov0JVzZu
         7NYnUjJL79xUQrW0BwMmvZUYkGVqZi3cETkdeXJIZnwyo4PAqoefqTLc+lwdVakbWtrS
         sYMef4R2OaG1QJvQ6KajupEksJF1Rw+l6e912itBii00Y5Geq55ij1Ssgy4icA0Quwpd
         278yS+TyH3xOcl7CLDhaXSiChu7XE17JwoMVUKAxckQej2AgzZvBGpdPbRFuM7x6YH4V
         4q0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jCmuIqZca1BHFbKewzVbW4c8gx6ri67M5ywiPVj0zA=;
        fh=D0e8sSTaVPmAgUSFERRWgkzhkCafsr+sW9jV93yuieQ=;
        b=LlGP3P10iICgLtaCeI09+rhCUYMdYT5BBMf2jf3/n5dQDGngVyXXdPuRkPhmY6f2X3
         gCy/Wp/rNlr5M7GNvvGXLF4miVj+pfJKdzcC2bUM9a7CRc5Pgxt+GosTVzJzBkdY5tkY
         fgHKcY/Z20hR/eMI99+ViugLgsQeH7wk+/hFNauWbTyGkGssnOBuQpmgnLHy9lJbgxMq
         bVZIbG8YubSPbSVma6kvmhkBUuRxL70L3FsTgPmiFzz2SLhPNrwPQUfX4PN/zb/0QPIZ
         FmSiydEGYBsLl++UqAmpjIxRxN2xqd6a4wGQM0twcEcDXCNET6rNWkws7OQeX8kYYna/
         CO6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780592399; x=1781197199; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jCmuIqZca1BHFbKewzVbW4c8gx6ri67M5ywiPVj0zA=;
        b=X5A3uvnKk0BxgmZYNGSFrS/zk5DeL4Unv0izC07NM1epc2uElu8l0EHZMPpzoVlfWD
         EfIjD8VtojqNxT9ZytTAN3JbtTd2bQNlbZNNJ8vG2vrneOedkXrBac6BYom+vsD6+fTn
         1wkHh7mqrlu+kGNTfYDFVGLJBmfA7GVFaQPg0Vj+jxVL39lcHiumbHjNNP627wgzHMOV
         vVLZ+S55ca1mp9hMSVYkfasMbBjZAUrJlCK4javyEHRAgimGqJujJciudc+GkgPyTJhs
         K9KHUcxEnYB4bqHrKDMmeJl0Bs7wR3kj/6Muaxp0k54NAd17gBNFL47NRbWf+f5tShtC
         Dr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780592399; x=1781197199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jCmuIqZca1BHFbKewzVbW4c8gx6ri67M5ywiPVj0zA=;
        b=fmlakm4EwYcfILOlpjVJn0OfSJw2mJkccsOb8x0QmEYHpVimFHi6Txbt/qGfkGxKgl
         3F+SW8+f0CJ2lbue8KRiJyCm4PzzxS2bja2FbOYV4PPMp5EVV2BP6QPG7vrsy1O6786D
         lnlRs6+lNAMYJbnI6FgwgYMHv2A2CXYCRbOEqSnXXtPxlRwQHXdetGiz+qSWUyYITCp6
         pdYmxpD+Zs7vx+Ij3y/xnkXM5WdJO9alld/RAyP3ViqY1SjOxu2w+d/LyDYzgYgktnwV
         1+oc3ZtTrneUj23/1dxsbttU3w2iOiazq1Q47S0377veGO1woTroSHQ66jWOP1dLP1yA
         4dbw==
X-Gm-Message-State: AOJu0YwEUjj0vHy2mg2zyAhWLR3mtfmJdRVY+XRxREyAD8LM1AVqmRLC
	hkEo3qTUjAK5VT2/0kd7mSGkDAe1Cxs1lI/IU0OarTxq6reKSky5IA1Hcan2maM662Pp8M5WVos
	+wGNzjxJ5VP2CLOMwzcRWmPIYadyDf8FqmhqAadk1sYyf
X-Gm-Gg: Acq92OFOEbAztEak0GsVwI8FtMgO+OYQ33NEKc7D2U33TLMrgfwxZjhcMJt6GLPJfW3
	zGJduZW6oHFsckBjj1GKHnOVtdP14LPCdFzBGUvFrtZrn85sTTxpFyQCqtpeKy+60LpjsdGPTI6
	xtKtkO/sm0cmkEUO/Jxw+QAUUNNU8TVolyINnyV6FBttPsPhoY0RLQ0MpEsNJadIAXsRkuB2D3v
	ukiG6GUDKvhfodrME5VrMftxnlX0BmFYqCdqPvaItJS3RnP1xGwM/OBKz9I5oA2DeCPYrMm4kSY
	+WJE+rvjrOketDQ7QBCu
X-Received: by 2002:a05:690e:4191:b0:660:8253:b836 with SMTP id
 956f58d0204a3-660dbe97d54mr7489173d50.5.1780592398732; Thu, 04 Jun 2026
 09:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603163851.18058-1-leontyevantony@gmail.com> <20260604163900.A09211F00893@smtp.kernel.org>
In-Reply-To: <20260604163900.A09211F00893@smtp.kernel.org>
From: Anton Leontev <leontyevantony@gmail.com>
Date: Thu, 4 Jun 2026 19:59:56 +0300
X-Gm-Features: AVHnY4Kx6izZI2s_HEh1p5bSx_cod3KVKOkHhawTK4DW9XbpO2P58tWIhRLHIXk
Message-ID: <CAAN-wAnJWMttpbsdAHAfOJ6PyPGqLvp38oU+DqEk2FU67FWc6Q@mail.gmail.com>
Subject: Re: [PATCH net v2] hv_netvsc: use kmap_local_page in netvsc_copy_to_send_buf
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are right, thanks. Since 41a6328b2c55 ("hv_netvsc: Preserve
contiguous PFN grouping in the page buffer array") a pb entry
describes a full physically contiguous fragment and pb[i].len can
exceed PAGE_SIZE, while kmap_local_page() maps a single page. v3
copies page by page, splitting at native page boundaries, and was
posted as a new thread per netdev process.

=D1=87=D1=82, 4 =D0=B8=D1=8E=D0=BD. 2026=E2=80=AF=D0=B3. =D0=B2 19:39, <sas=
hiko-bot@kernel.org>:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The patch replaces `phys_to_virt()` with `kmap_local_page()`=
 in `netvsc_copy_to_send_buf()` to support HIGHMEM SKB fragments. However, =
`kmap_local_page()` maps exactly one page (e.g., 4096 bytes). SKB fragments=
 (such as those from TCP sends using `sk_page_frag()` or NFS) can be backed=
 by compound pages where the fragment size (`len`) exceeds a single page, o=
r where `offset + len` crosses a page boundary. The `pb` array populated by=
 `init_page_array()` contains exactly one entry per fragment, meaning `pb[i=
].len` can exceed `PAGE_SIZE`. When `memcpy(dest, src + offset, len)` is ca=
lled, it will read past the 4KB window mapped by `kmap_local_page()`. On 32=
-bit HIGHMEM systems, this accesses adjacent unmapped or unrelated fixmap s=
lots, causing a fatal page fault or memory leakage.
> --
>
> commit dfe36312b193784583b28a894f895984d7d0ebba
> Author: Anton Leontev <leontyevantony@gmail.com>
>
> hv_netvsc: use kmap_local_page in netvsc_copy_to_send_buf
>
> This patch replaces phys_to_virt() with kmap_local_page() to support HIGH=
MEM
> SKB fragments that are beyond the LOWMEM boundary on 32-bit systems.
>
> > diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
> > index 59e95341f9b1e..2038d9f5c9f9a 100644
> > --- a/drivers/net/hyperv/netvsc.c
> > +++ b/drivers/net/hyperv/netvsc.c
> [ ... ]
> > @@ -965,11 +966,14 @@ static void netvsc_copy_to_send_buf(struct netvsc=
_device *net_device,
> >       }
> >
> >       for (i =3D 0; i < page_count; i++) {
> > -             char *src =3D phys_to_virt(pb[i].pfn << HV_HYP_PAGE_SHIFT=
);
> > -             u32 offset =3D pb[i].offset;
> > +             phys_addr_t paddr =3D pb[i].pfn << HV_HYP_PAGE_SHIFT;
> > +             struct page *page =3D phys_to_page(paddr);
> > +             u32 offset =3D offset_in_page(paddr) + pb[i].offset;
> >               u32 len =3D pb[i].len;
> > +             char *src =3D kmap_local_page(page);
> >
> >               memcpy(dest, (src + offset), len);
>
> [Severity: Critical]
> Will this memcpy() read beyond the 1-page mapping established by
> kmap_local_page()?
>
> If the fragment size (len) plus offset exceeds PAGE_SIZE, it seems memcpy=
()
> will read past the locally mapped window. SKB fragments can be backed by
> compound pages where the fragment size exceeds a single page, and
> init_page_array() assigns the full fragment size to pb[i].len:
>
> drivers/net/hyperv/netvsc_drv.c:init_page_array() {
>         ...
>         cur_pb->offset =3D offset_in_hvpage(offset);
>         cur_pb->len =3D skb_frag_size(frag);
>         cur_pb->pfn =3D pfn + (offset >> HV_HYP_PAGE_SHIFT);
>         ...
> }
>
> Other parts of the subsystem also document that a pb entry can cross page
> boundaries:
>
> drivers/net/hyperv/netvsc.c:netvsc_build_mpb_array() {
>         ...
>         /* Each entry in the input "pb" array must describe a contiguous =
range
>          * of guest physical memory so that the pfns are sequential if th=
e range
>          * crosses a page boundary. */
>         ...
>         for (j =3D 0; j < HVPFN_UP(offset + len); j++)
>                 mpb_entry->pfnArray[j] =3D pb[i].pfn + j;
>         ...
> }
>
> Could this regression cause a fatal page fault on 32-bit HIGHMEM guests w=
hen
> an SKB fragment crosses a page boundary, or leak unrelated fixmap memory =
if
> the adjacent slot happens to be mapped?
>
> > +             kunmap_local(src);
> >               dest +=3D len;
> >       }
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603163851.18=
058-1-leontyevantony@gmail.com?part=3D1
