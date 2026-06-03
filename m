Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022B3E317F
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504151; cv=pass; b=cIYKJkaC0c0LcLK1wgS8dn69skzMtHLVEDgK2z+D2IHzCLJMCgASTEG8ZF1GA5i66ayf4dH+BGC53Qbx53yDwi85VoCy4Nd20gv8xWvXovlUbdAcHShMs8U21+p1JyHuEdDPr7tcAiKOr24zd/v5YiPK4e/OeH03qjQIq0Jcnu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504151; c=relaxed/simple;
	bh=xyNkSPsQXlCChbk0bato3dv0WPNUOqGeLAR4C4A+Iv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXYEIiZnfd54iaEZdyjvow5JsSxBAl68qTnr2DNsPz4x8/1uWorwgH54tZLh8rZjRGjHJI0cfXvP3NYtLJSZDAiFhxV7P+vmwFtf5iC2JvIwK2FonGlYeSNTGyxMjzcvtVOaLgQY9n9C1Cea6oX4Uby9O57p9vo2wx0exWDxLkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7GW4mY+; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7GW4mY+"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-660e9ea26b9so817835d50.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 09:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780504149; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5wjKyOC89vju8xwpPu22m72eiQJzKSbQYVg1aceZvPu+3xya6h/qElRqvPoelINis
         tWb2I/dSAG1OJ0aUUDQzA9l0Ky1tBBo/3O+uXGkvfG8iL0bLSqDkUhr5IqaoFOwPtnrJ
         XTWRUwaq4eDAXg7/h65FhfzDgtxIYMS6+eqMwdnCtCpEzdO29C5cSwq3a53V2NQqZSSU
         rrJtoz0mHh/wwXFh9v5ty4XIW4v7b+D2tfQGbYsdEanLW27qhoFsSi0uFshR7Inava0X
         RWS5A0r1kQuUbHxGs1jyefLURDuXAH5gHGQHgz50yiGLJOeNQjgxiTrPGzw/loUDZFY7
         VDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YWtdi4wwUR2U1Nle2qsjEO9rC1OFuVOfLjScwZBeEhc=;
        fh=D0e8sSTaVPmAgUSFERRWgkzhkCafsr+sW9jV93yuieQ=;
        b=fJjSrsgGIKtwXwWdgWZEufqSpQ73JTqGRv6Kje7HmXfV9iBSRlNENAhtCFy7xqasj/
         kANkrTprI5huzNo9VfVN3Lk9aUrtHTSsijHRj6UwT+SBDIdhVUWkh4vhEgKWvReYfl4n
         UXojBo/4BOWUlELoNRuA8zkvj1CnJOQ3BurKDFfmMl0LQTKHhAfMUpWNce3ND2y7iWnQ
         BEIYJ2u9Lyl2oy1iE+Wp1fApQ34ITNL4L0aLSxoOzSrn3ECNR12wc0fz3wIcPx4QobZQ
         K0YKgl8BvDVjqxK6bh1iw8W5vFb1Zj/O9RWxfwMBPGdkGVxRGnVIrqXYbgw0gwqM5HEX
         zzfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780504149; x=1781108949; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWtdi4wwUR2U1Nle2qsjEO9rC1OFuVOfLjScwZBeEhc=;
        b=L7GW4mY+c/l9dnjEIT+E07XQOMZipxWwTkzaP5PF2iR8lnvh4F6A2OLqDFqnFkjCG4
         DZdf1HmeCbAATuDt0j3PPbSz1KfkDyTeG1XLR6s2Jdi1+lzP5KT4Q18Q4cTPXdNhWuOz
         tKT4NceMyRTicUia/Ip9DKq+sSPJqit2veWXWEwzUZJOcEnL47JPCIfNNFuniQpEoW2t
         rjbVm5qv00wsz+jI/ZgkTUJL4cmvn5mKSTqodVfTUnuta66gOyEHJzp1KrV55KHVmk/6
         GrLGLdDrAAajQrcuYEVsCNU40jCPQYkzHXwjEBAIB9D87H7L2U+L6liIPgQgBXnTIVA3
         1zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780504149; x=1781108949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YWtdi4wwUR2U1Nle2qsjEO9rC1OFuVOfLjScwZBeEhc=;
        b=nTbP9nDyK3Ps00k0WsXt/UYNmj2s76rGH46YJCRhq7bCq17DWOrXpa3G2P+n3gt32I
         otq4byXbVeRlhdsDdt2bSX9vBqCeF9lEHE4RjY8RD+eXRO5DJbKhqavsInRpfkfgopBn
         UutuVXedJc/71dWNgZpJ5twwWsUOXq0LQTQle8AXmbVwLdSWdbr+ezcqiYeRrS2eyBK8
         Ct2RvEcqMOmXbnY322UUZBbQthADgEb1RQ4lhoezFQYrk7ESCfVyo8c2EQJvyUdKOWMD
         YMTI0yflqtFFKrkDUwVQK/X5JAuvab88lVpvkr6lUXAxZvTk20b/vI05x9Wu+DvySTOa
         LoMw==
X-Gm-Message-State: AOJu0Yz9Zci/gserzKQH5Op2F/QftC7WxMY9xGZmf3YubsCClhebSlZ6
	XMJfqixNLjRpe2+vn22Dspdw8/XWKaRPY6DS0j6v+ElhUWSuGhnzih6e1aMQ6gCR6HCiiEqxkDz
	I/NJlZhjfu23I2l2YkpEpd5a5mm0D4dBZzLI4JyQVzsnq
X-Gm-Gg: Acq92OHW8xpsgFhkRvE+XcsQIoYdck1K8emRM9N0jwDRAvrwXFQnSt19NEkxUb0+084
	hffQDBnOcE3DZU5u0enUa0aD9kuncu0HeKcrVKrR5FldZhYqY4fA2Cf1SZ3JuEZe/7zLYJiyBk1
	1Rvn8cxLutaw+BnUyP894bi1rHMT8jZBL3TcoLkyj6+nP/uYKb5fYLqzitsn36mdlUNwwk7S2/3
	xj8AhWCV0JuIy+otsfmYjVblYEI0CsYWWiUWUeaAg1OnluZ/tJD8jD1Abi9LSAV3/qMlafgh29b
	tbiQA/8lh4jMITfRPmxr
X-Received: by 2002:a05:690e:408c:b0:660:ec14:ef82 with SMTP id
 956f58d0204a3-660ec14f7d6mr1656108d50.41.1780504148595; Wed, 03 Jun 2026
 09:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602155210.90987-1-leontyevanton1995@gmail.com> <20260603155344.7CE871F00893@smtp.kernel.org>
In-Reply-To: <20260603155344.7CE871F00893@smtp.kernel.org>
From: Anton Leontev <leontyevantony@gmail.com>
Date: Wed, 3 Jun 2026 19:29:05 +0300
X-Gm-Features: AVHnY4Ke1MZXYgw-YYbKoNRJAeBGxFNFOYNb53zskNp9hhlw99jeifLEkfo-iro
Message-ID: <CAAN-wAmgH9QEoj-cFjOxhytP4qC5sCgAsd9cn6cgZk1bfqznZQ@mail.gmail.com>
Subject: Re: [PATCH net] hv_netvsc: use kmap_local_page in netvsc_copy_to_send_buf
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are right, thanks for catching this. pb[i].pfn is a Hyper-V PFN at
4K granularity, so passing it directly to pfn_to_page() is wrong where
PAGE_SIZE > 4K, and it also drops the intra-page offset. Fixed in v2 by
reconstructing the physical address and using phys_to_page() +
offset_in_page(). Built for i386 (HIGHMEM) and arm64 (64K pages).

Thanks,
Anton

=D1=81=D1=80, 3 =D0=B8=D1=8E=D0=BD. 2026=E2=80=AF=D0=B3. =D0=B2 18:53, <sas=
hiko-bot@kernel.org>:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Passing a Hyper-V PFN directly to `pfn_to_page()` causes out=
-of-bounds memory accesses on architectures where `PAGE_SIZE > 4KB` (e.g., =
ARM64 with 64KB pages), and loses the intra-page chunk offset.
> --
>
> commit a844fbf018cd37eedc9a1f0aea79d6235c00bec3
> Author: Anton Leontev <leontyevantony@gmail.com>
>
> hv_netvsc: use kmap_local_page in netvsc_copy_to_send_buf
>
> This commit replaces phys_to_virt() with kmap_local_page() in
> netvsc_copy_to_send_buf() to map skb fragment pages. This is intended to
> fix a fatal transmit softirq fault on 32-bit x86 configurations with
> HIGHMEM, where phys_to_virt() is only valid for LOWMEM addresses.
>
> > diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
> > index 59e95341f9b1e..6984f6c97257d 100644
> > --- a/drivers/net/hyperv/netvsc.c
> > +++ b/drivers/net/hyperv/netvsc.c
>
> [ ... ]
>
> > @@ -965,11 +966,13 @@ static void netvsc_copy_to_send_buf(struct netvsc=
_device *net_device,
> >       }
> >
> >       for (i =3D 0; i < page_count; i++) {
> > -             char *src =3D phys_to_virt(pb[i].pfn << HV_HYP_PAGE_SHIFT=
);
> > +             struct page *page =3D pfn_to_page(pb[i].pfn);
> > +             char *src =3D kmap_local_page(page);
>
> [Severity: Critical]
> Does this cause out-of-bounds memory accesses on architectures with a nat=
ive
> page size greater than 4KB?
>
> The pb[i].pfn field contains a Hyper-V PFN, which always operates at 4KB
> granularity. Passing this directly to pfn_to_page() assumes it is a nativ=
e
> Linux PFN.
>
> On architectures where the native page size is larger than 4KB (such as
> ARM64 with 64KB pages), the Hyper-V PFN is significantly larger than the
> corresponding native Linux PFN. Using it with pfn_to_page() would return =
an
> invalid struct page pointer.
>
> Calling kmap_local_page() on this invalid pointer in
> netvsc_copy_to_send_buf() and subsequently reading from it could lead to
> memory corruption, out-of-bounds accesses, or kernel panics.
>
> Could this also lose the native page offset of the original 4KB chunk wit=
hin
> the larger Linux page, resulting in an incorrect read offset during the
> subsequent memcpy?
>
> >               u32 offset =3D pb[i].offset;
> >               u32 len =3D pb[i].len;
> >
> >               memcpy(dest, (src + offset), len);
> > +             kunmap_local(src);
> >               dest +=3D len;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602155210.90=
987-1-leontyevanton1995@gmail.com?part=3D1
