Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BFD1ADC97
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 02:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490242; cv=pass; b=dunK658Vw+6BWTnzCl+o+gpOMomZvqqOPpLGKzpiSD4E+MZJVbTd0X5ouK2l1ualdRM95t6NecbLmkC12+d5nnhUM4llW1BxB2+a4qjcnBnt54SVXHXlHsbIVKHfZiIEpeVjUDUDzwV8BighJFDYNdOizs+lnmYZMbp6YchMapA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490242; c=relaxed/simple;
	bh=Bbt41AjR2SaKtrw76OrO7dTbVuACcFVGsNzKZgH3KBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huanVkYh/M6wywzUQshH2Fq1G3PwzcIQch516n11i+fw9sZjqqZX21t3/Q1Sw0JOzhRdooh3XAw+cbqleUYlwWVDkPymrRLInwI3FD0W+cB/9Li9hpnlUN7HwEOImXr5sJIaH7Z4QbmyEOpxB7emnaYDoMhCfHfDVUbzg7eKbn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OC7QI7ga; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OC7QI7ga"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4619990ca5fso245608f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 19:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781490239; cv=none;
        d=google.com; s=arc-20240605;
        b=g1fNztRvhta0BlVZQBflpmtYUbwone90utEb48nb9khj0L2bKEDRTBj8WMv4kg27Mh
         fr8mjGFzlA1Gv+pcaB6GFmnJcjb6RyAc+RgX+Jjuc41nL5AL6eKbrFeVMJRoahQShPKS
         ZiD3Eq45cou5wuFJwCnowQpeWAuEtPyHAmDDk4r8g1xy86/B9T7/th78igHBMezvAFLS
         VPXvlRAnp/qWx16644GMD4lh82ye5Ki8941rX+38k4JQ2ANi88la50E+iyqGtAhUgqgi
         qNS0SkTYAy9Oem7Ro+G3sIjI7N4o0bs/lZ9j0nI4eB0Pgcgu2t9ebenfHSJp1Wht/Ify
         Xdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G2untlhdf2ZJGQTP02vAZHs3DlrkWYQft4VAAVMFnm4=;
        fh=gj73vF7gfHpskuYo4ZPaNGDMo9r8lFxbvv5q5QAWYg8=;
        b=fWGgcB1DtnE9gZwZlN3qMyg30jYT732SbH+xXRfYPgpFIjwyVGpfrhYgaQ+u49/S9q
         dj+syhYi7N28N9/lhHgYxV6L4qIc/Si76vp4iPExyTE0YCcak79jH37scfb/DjoqLFLO
         IdzKq6m9Kvs/4Znw5NN5Asf7Ru9Y5/yHXwqzPwP9yOW4FCyZvp0WtM57SgV0b+ch0y3J
         keEE+gOKhFlAEdmZAtzBDnbHepmIxm0k3jygn95+183i3+F26e7je50d7S4QvbhH3O9b
         g0eugsM9bseR7RY9njtNnHVVVxTHdnNfURFFIWujzfCvAGUhHYrBA4GsGy+j+ZCjmrRh
         pTpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781490239; x=1782095039; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2untlhdf2ZJGQTP02vAZHs3DlrkWYQft4VAAVMFnm4=;
        b=OC7QI7gadJng4ocEDjddazfxjaKM6aj4YPjABW9qr/CwkaF8r0Dy8zUcqA0QR3eC47
         +UvgtIy+WAK0+ISw3RhJhjuHhUyUMvqVlP6y+MQawxTRgIqHS3GMWfEHHaTUHuXeLl/M
         +bH3CG7n/jj5fdqjUCD4/ipq/dQxVQGP6tLWMDh5oD4o9kRQ1Xtz8Pd8QAbCTqzVb78Y
         onlhhIAr6WW0KQMJpMf9WHHPBnBcTpejak+88lROpTpuC/qZ9i8kphwaw3DoeFFWxwoO
         pSL0aMbqWqpujIZAq6qeJnTKDad8Kx+utgozWZvHM9aPvqaLf8uqw/KbmkVvTmB/beEB
         AVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781490239; x=1782095039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G2untlhdf2ZJGQTP02vAZHs3DlrkWYQft4VAAVMFnm4=;
        b=EDm75luKugsxDKvOqXSaj/GRda1EhpF9irIHe6KFBx0XJOcyMAFz3YrjRu5kE1C02M
         HTdofULnhWP17PNaSwmjP8ChILZlSysKlgTwGj5V7XVF9ialM7o6Oilemowc/9mA9FN9
         91DXGWDORr8Y/i3pk7Sez2+asaoSRFBxMtMpC3NMj9beTMckHGFVoZcykHMJvqBh1K4v
         46jcU5pM6JEkSkIwCW5gdU5fugJgSP3c0OHhOWS/LA6kHUTefSNk2Ax6GbsVBeWbNrsg
         ICc1KOgms2hkVhFZS0zau2HFSciIVeDgxhjsnghsuBhDbBIeDRDSYIb1XAx9MAagqIaC
         CFBw==
X-Gm-Message-State: AOJu0YwLqXIfDaLrP4eqwQmnUzo33H1w8UAJFXp0JHR7zCNtv+8y/hsS
	vCITFDh5VhxkpTJ7zvO+/oqpNI7sJpAZQJo3+p7PtEBglGSKPsQSvakE6zylS8Yy4yHQbtS4YM2
	pWAJIS+Sx7j9K0N+h+uIPtA8dllfn8saT1KUM/7E=
X-Gm-Gg: Acq92OHvCUEkIRam6BsTYBf4aXOc3SbRRU3tT7wUEYwWEnkbjcmUwX3ItIqZ+Dwetv3
	7z3ViBufs9n4IyrGgXQDI9z5XQRl57znRZnmPm8PMDHozIjPouC0sWdtm+l8aCG2XOgwj7ZGoT3
	t2k7A/rDtz1qSCA2I2B9iUFeU871DWbHJk4tl4yzoPmyDBse0wkVhyehUClNEaczXqiQmljoOHc
	Cu9uTkSxbGuxdtnPoY5wKbUYziN/abcGQuVUtFj4/90Npp4M5KuKf0EObQIROWubbYNCaaaqw1Q
	2mi2dkb2S92WPLsGwg0mE13kr7hXcj73aUNowpM3J68ZvUdU
X-Received: by 2002:a5d:5f86:0:b0:45e:e1a4:c4c3 with SMTP id
 ffacd0b85a97d-46074a625damr10914158f8f.15.1781490239292; Sun, 14 Jun 2026
 19:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612193738.2183968-8-nphamcs@gmail.com> <20260612201920.222CE1F00A3A@smtp.kernel.org>
In-Reply-To: <20260612201920.222CE1F00A3A@smtp.kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 14 Jun 2026 22:23:47 -0400
X-Gm-Features: AVVi8CeTdk-GSL7VIyKGwrXLAMsZcMho8yDU9lqHj0piF6dQYCLqy-gwngT-wZQ
Message-ID: <CAKEwX=MqrydK84EUMuF-ZTPpW1Y7Jhb2Jwefr4v-WJ5N9Ebazw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 7/7] mm, swap: widen swap_info_struct max/pages to
 unsigned long
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 4:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Iterating over `swap_active_head` in `sys_swapoff` dereferen=
ces a NULL `swap_file` for `vswap` devices.
> - [High] SWAP_USAGE_OFFLIST_BIT overlaps with the active page count, perm=
anently corrupting statistics for swap devices exceeding 4 TB.
> - [High] `try_to_unuse` blindly marks folios dirty without verifying the =
success of asynchronous I/O.
> --
>
>
> [Severity: High]
> This isn't a bug introduced by this patch, but can try_to_unuse() blindly=
 mark
> folios dirty without verifying the success of asynchronous I/O?
>
> When a vswap entry is read asynchronously via swap_read_folio(), the code=
 waits
> for completion by calling folio_lock(), but fails to check
> folio_test_uptodate(folio) afterward:
>
> mm/swapfile.c:try_to_unuse() {
>     ...
>                         swap_read_folio(folio, NULL);
>                         folio_lock(folio);
>                 } else {
>                         folio_lock(folio);
>                 }
>
>                 if (!folio_matches_swap_entry(folio, vswap_entry)) {
>                         folio_unlock(folio);
>                         folio_put(folio);
>                         continue;
>                 }
>
>                 /* Re-validate under folio lock: ... */
>                 // ...
>
>                 folio_wait_writeback(folio);
>                 folio_release_vswap_backing(folio);
>                 folio_mark_dirty(folio);
>     ...
> }
>
> If the underlying I/O fails, could the folio contain garbage that is then
> marked dirty and committed, causing silent data corruption?

Hmm I mean, if the IO fails, likely the data is a gonner, no? Doesn't
feel like it's worth failing swapoff here. If the process owning the
page never access the data again, no problem. If it does, then it's
going to SIGBUS trying to read from the swap device the same way it's
reading from swapoff's produced folio :)

>
> [ ... ]
>
> > @@ -3970,7 +3971,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, spe=
cialfile)
> >       struct file *swap_file, *victim;
> >       struct address_space *mapping;
> >       struct inode *inode;
> > -     unsigned int maxpages;
> > +     unsigned long maxpages;
> >       int err, found =3D 0;
> >
> >       if (!capable(CAP_SYS_ADMIN))
>
> [Severity: Critical]
> This is a pre-existing issue, but is it possible for sys_swapoff() to
> dereference a NULL swap_file for vswap devices?
>
> vswap_init() creates a swap device with si->swap_file =3D=3D NULL and add=
s it to
> swap_active_head with SWP_WRITEOK set.

I excluded vswap device from swap_active_head list in
_enable_swap_info(). False positive.

>
> [ ... ]
>
> > @@ -4900,8 +4897,13 @@ static int __init vswap_init(void)
> >               return 0;
> >       }
> >
> > +     /*
> > +      * Cap at the cluster_info_pool xarray's allocator limit
> > +      * (XA_FLAGS_ALLOC stores IDs in u32, tops out at UINT_MAX).
> > +      */
> >       maxpages =3D min(swapfile_maximum_size,
> > -                    ALIGN_DOWN((unsigned long)UINT_MAX, SWAPFILE_CLUST=
ER));
> > +                    ALIGN_DOWN((unsigned long)UINT_MAX * SWAPFILE_CLUS=
TER,
> > +                               SWAPFILE_CLUSTER));
> >       si->flags |=3D SWP_VSWAP | SWP_SOLIDSTATE | SWP_WRITEOK;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but since vswap devices can no=
w
> exceed 16 TB, will SWAP_USAGE_OFFLIST_BIT corrupt the statistics?
>
> SWAP_USAGE_OFFLIST_BIT is hardcoded to use bit 30:
>
> mm/swapfile.c:
> #define SWAP_USAGE_OFFLIST_BIT (1UL << (BITS_PER_TYPE(atomic_t) - 2))

Technically it's already a bit weird in existing code lol. The type of
inuse_page is atomic_long_t already, but we use the 30th bit, which
contradicts comment "Use the second highest bit of inuse_pages
counter". It's only incidentally correct because the range of the swap
device never reaches this high.

> #define SWAP_USAGE_COUNTER_MASK (~SWAP_USAGE_OFFLIST_BIT)
>
> mm/swapfile.c:swap_usage_in_pages() {
>     static long swap_usage_in_pages(struct swap_info_struct *si)
>     {
>         return atomic_long_read(&si->inuse_pages) & SWAP_USAGE_COUNTER_MA=
SK;
>     }
> }
>
> When a swap device's inuse_pages counter reaches exactly 2^30 pages (4 TB=
),
> the 30th bit flips.
>
> Because swap_usage_in_pages() masks out this bit, would the usage count
> artificially wrap to 0?
>
> Could this cause try_to_unuse() to abort prematurely thinking the device =
is
> empty, causing sys_swapoff() to forcefully tear down the swap device whil=
e it
> still contains active swapped-out pages?

Yes, this is a bug, but it's already a bug for existing physical swap
devices IIUC.

In fact vswap device is the only device safe here :) We don't use
swap_usage_in_pages's output, since vswap is not swapoff-able, not
used for suspend, does not display to userspace. We don't do reclaim
swap_reclaim_full_clusters() for vswap device either.
