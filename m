Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07D2CCC5
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 01:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781488659; cv=pass; b=uX9eiBgsypaHbquSXTHaZLqImAe7tINS/lTUiss3lz/lUv+IgwsvvyNOKzNoQ6XDC8Uu8AC1/mwuBfq8WRH1z1j2VWH8oYC+xmcfBiDPZn5i+MP10H1z6SRWas/YCsUlQsFmx4K8QGomQiH5QiLkrdY8vfqcB2iPzb3u3vtrgoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781488659; c=relaxed/simple;
	bh=CzC/V+4jcNmnTRmdctoRmvaTlWMLr+ZrICXIbxA7hSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JE0Gx9eKY8tVz2FVAlMKZx3SO1+l86i0hCz2M0Bol1ml4K/TA/HVZ6TZK4jGVwcqEbtocXKWqu5grv/UPsvmtGhfZbHVHGEPubnRs6cA6JLPoPIy1uaVrvSZ0uSA7X0xZy+sgXeBh+qH+wkb4y1C+hLrVPW8vLOwmap4EfDRQfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MF0ENPLb; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF0ENPLb"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1360021f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 18:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781488657; cv=none;
        d=google.com; s=arc-20240605;
        b=EvbZsy0rZX8PcHAJ5HkObRKCYHpbLYN2tScA6ZbsPuYl0EkAaSrt7v1P6shbr//DDr
         A7ntjTqc8V5JsYgotIiWktiY7nGanWUHzn5zD8qLgdHcbgiFqEbx7Fq/Qt9DcQ06vhHd
         NvTtfNZ8OLYAkdRhtez3wb9C7WFtck7uFg0AT2pWOH/64quNVhzF3RGcy8J008jjGZuF
         mdwkKq8pyoJRFs9PxfXeqFzbtBEGetpEe3g/qVJ+4vTsPEZz8QNNIWcwVEkuE5CYBq/4
         P1MPe7TUz7+QdL5KisJCp6AXqle1BySQVwut4j8GxV/mDe78WUjyEFQ04I/7WZzlgJ3Y
         uT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=maIPZfDX3YaHTnaR4G/V8bfdxyMA4s2VoxD9gaZrsNI=;
        fh=3h+Ryrkk/MpJ2Y9rQOwX1HtDQkNxyeXOOCRZExzc+J8=;
        b=fXzvlYYUhahHVPU5gC/MOlttyJ6vjedV5B+FAgDeftGRxwJ02q2sNLsa0EAy5ry+Ng
         lpDv2SKzc7SW8cbVAexg2c1tHV53zqdEhD2Zle72xYLEvHLAr96/lmsPw/QIq9N6dEwF
         WDJU21IjiwGpflAGPW6aTOj1j7xuNLV778KzgR/VuFvr1yGqhe15Bjlcqyo8H5NZhyRM
         fpMsYaZHCpH2tCUHf/l+UPpcFXCkcPJjINwQwfWcDyeONFkuEK2WK540pMk6zOBVaUYu
         0bcCVNWaORXjCEdZ/uIleukKX3xh4sOajGnOT5YWD5oMTmHCWhUZAh8uUgUNr1wTsoL8
         3E+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781488657; x=1782093457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maIPZfDX3YaHTnaR4G/V8bfdxyMA4s2VoxD9gaZrsNI=;
        b=MF0ENPLb8XqC3cOsj5okbCMiYFWJ1xzpnCsfOxgNLZh7GWtBVt3e4kDASZysABq8xl
         wYP/bP4MZvm/MuEMyE7GTnYeWhasexJaeAThJn+k3ZxhU/pU2713QWi1BaPXUh/bioAz
         lVv3ILjhvDcMwUCCAIi9Y2paxOLsRYmv+WKfW4hGIDN4L0Oj0Ru5QQ5sY9UMF+B0HoAo
         jaHIMo1ukhxP6AmtnW7LJwh3R8xy/QKFo8YEyoQbG/EKSPnt0Vb4FLcUj7PBMPetwueh
         BATHJ3gJJi2ZNBbTe/FeHkcUe7jLI5L3PjJgsbgX1vIf4EnYUYDn4nHoYw4I6PINcDIx
         6ZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781488657; x=1782093457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maIPZfDX3YaHTnaR4G/V8bfdxyMA4s2VoxD9gaZrsNI=;
        b=mW+D4WPBKoJWPr4hqHtSTz/SVwcpfXIHFHX3gbNydKkWQjVatiZOlZjjn3x7eZHMfo
         wQRxDBvortv4J/HD8MrVhU6kVueLWuQhEtfJXRzSFgnKdJgBIt3qP7iNScTxHPAkjUee
         5iYewHU9NK5tz53Ej52SZAdyMSo2sKAXFdOkeAJkgGhDcgkH1nlVYTKDejvhZXG8ebAD
         Y8Y5Gm6uJQ88om3Pkg2xo6Cnyy2nqfyXSBCdIQ2nvAqUmqhnua9FF1j7TiGSck3T7sF2
         8BcMRoNv+2WubFRFnl3hy5uAkH+lJXu8MwKGtngUEPvCjGY28drTBoZW8men9rOCTZx3
         vNNg==
X-Gm-Message-State: AOJu0YwCEzOtwkWLQIkZiDdZTNXi9W8s/9GQ1rY6+zJrowu9QNji4A8D
	piZGjH3/GdoSstyrOTw9VB2F8QqB3DNy50OAaiaL+BRDK/gOjYpjCSy8uljHrhAAAEWlVsUghig
	iEROLQcEhUBQKcTZ5foC75mo+4V+VQwcY3yUuS6E=
X-Gm-Gg: Acq92OEV31scu2s3nUiMDFpJI9eaG9EYXpq7wmpqrlYdC4ONYqwDDAg7FlMaBb+7fQw
	dSMiDVRbx+q8r5bGEbEkvVA0haYTIrxF0ypiN2AHp5OxdmbKAx+jNJVG00NiNOJ3YO7keBcSy2c
	uGOxCrwJABAJpMFhGCqFQtbEHOBk0aSWmRoBmD+4KmlDbs6f3fZRD8ZJnl/UwVYh95OVqTxZ6Vo
	bMYUSzqLDTRouX42oShb3BvrIoQ5qnsz8U4XVBxVaE/FvPZYbYQJ2xbzEsAmH0IeY0IKBIJZtyM
	8ZOdqz+8WvBG41ZaTA+GVzS/Rt1mgWmCh+uneR8FANLkJOw3
X-Received: by 2002:a05:6000:4305:b0:460:1301:dec8 with SMTP id
 ffacd0b85a97d-46074a802d0mr11817805f8f.3.1781488656353; Sun, 14 Jun 2026
 18:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612193738.2183968-4-nphamcs@gmail.com> <20260612195915.328121F000E9@smtp.kernel.org>
In-Reply-To: <20260612195915.328121F000E9@smtp.kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 14 Jun 2026 21:57:24 -0400
X-Gm-Features: AVVi8Cf_I41x8LcpDrlyq3cju8mkBgacldJnx8S93DJC7fXfNVtyOKatHa11T60
Message-ID: <CAKEwX=P8ePhOcg6ktrNLbaKuVYOXs+6Hp-85sN19a7vRbP2Fgg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] mm, swap: support physical swap as a vswap backend
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 3:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [Critical] Large folios with fragmented or heterogeneous vswap physical=
 backings cause out-of-bounds physical swap reads and writes.
> - [Critical] Missing PG_uptodate check in try_to_unuse() causes silent da=
ta corruption and memory leak to userspace on swap read errors.
> - [High] Physical swap slots are permanently leaked when a vswap entry is=
 successfully stored in zswap, or when zswap writeback decompression fails.
> - [High] Non-uptodate ghost folios left in swap cache on concurrent backi=
ng release cause SIGBUS.

Seems like all of these are false positives.

> --
>
> commit b0de967e96de0b0840388227b716d4c3f3e653de
> Author: Nhat Pham <nphamcs@gmail.com>
> Subject: mm, swap: support physical swap as a vswap backend
>
> This commit introduces physical swap as a backend for the virtual swap la=
yer.
> With physical swap backing, vswap can allocate a physical slot on demand =
when
> needed as a fallback for zswap_store failures or as the destination for z=
swap
> writeback. Each vswap entry's physical slot is tracked via a pointer-tagg=
ed
> swap_table entry on the physical cluster.
>
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> [ ... ]
> > @@ -3012,19 +3400,93 @@ static unsigned int find_next_to_unuse(struct s=
wap_info_struct *si,
> >
> >  static int try_to_unuse(unsigned int type)
> >  {
> [ ... ]
> > +             /*
> > +              * Re-validate under folio lock: rmap holds folio->swap +=
 j
> > +              * for some j in [0, nr_pages). Check folio->swap still m=
aps
> > +              * to the contiguous physical run that includes our slot =
i.
> > +              */
> > +             j =3D vswap_entry.val - folio->swap.val;
> > +             phys =3D vswap_to_phys(folio->swap);
> > +             if (!phys.val || swp_type(phys) !=3D type ||
> > +                 swp_offset(phys) + j !=3D i ||
> > +                 j >=3D folio_nr_pages(folio)) {
> > +                     folio_unlock(folio);
> > +                     folio_put(folio);
> > +                     continue;
> > +             }
>
> [Severity: High]
> Could this leave a poisoned, non-uptodate ghost folio in the swap cache?
>
> If swap_cache_alloc_folio() was called to add the folio, but the physical
> backing was concurrently released or migrated to ZSWAP, swap_read_folio()
> will see phys.val =3D=3D 0 and abort early without setting the folio PG_u=
ptodate.
>
> When the code reaches this check, if phys.val =3D=3D 0, it unlocks and pu=
ts the
> folio and continues. However, because it doesn't call swap_cache_del_foli=
o(),
> the uninitialized folio remains in the swap cache. Wouldn't a subsequent
> access to this folio trigger a VM_FAULT_SIGBUS even though the data safel=
y
> exists in ZSWAP?

This case basically happens when the data on the swapfile is
corrupted. Pagefault-er SIGBUS-ing on this folio is the expected
behavior. Besides, this caller is not the one added the folio to swap
cache or discover the data corruption.

FWIW, __try_to_reclaim_swap() has similar patterns here too.

>
> > +
> > +             folio_wait_writeback(folio);
> > +             folio_release_vswap_backing(folio);
> > +             folio_mark_dirty(folio);
> > +             folio_unlock(folio);
> > +             folio_put(folio);
> > +     }
>
> [Severity: Critical]
> Is it possible for the folio to be uninitialized here if the swap read fa=
iled?
>
> After calling swap_read_folio() and folio_wait_writeback(), there is no c=
heck
> to verify if the read was successful via folio_test_uptodate(folio).
>
> If the block device read fails due to an IO error, the folio remains
> uninitialized. By unconditionally calling folio_release_vswap_backing() a=
nd
> folio_mark_dirty(), doesn't this destroy the original physical backing an=
d
> certify the garbage memory as valid dirty data, potentially leaking
> uninitialized kernel memory to userspace?

If IO error happens, the original physical backing is a goner, no...?

I'm pretty sure unuse_pte_range() (the existing swapoff scheme) has
the same pattern here.

>
> > diff --git a/mm/vswap.h b/mm/vswap.h
> > --- a/mm/vswap.h
> > +++ b/mm/vswap.h
> [ ... ]
> > @@ -159,6 +203,25 @@ vswap_lock_cluster(swp_entry_t entry, unsigned int=
 *voff)
> >       return ci_dyn;
> >  }
> >
> > +static inline swp_entry_t vswap_to_phys(swp_entry_t entry)
> > +{
> > +     struct swap_cluster_info_dynamic *ci_dyn;
> > +     unsigned int voff;
> > +     unsigned long vt;
> > +
> > +     ci_dyn =3D vswap_lock_cluster(entry, &voff);
> > +     if (!ci_dyn)
> > +             return (swp_entry_t){};
> > +
> > +     vt =3D __vtable_get(ci_dyn, voff);
> > +     spin_unlock(&ci_dyn->ci.lock);
> > +
> > +     if (vtable_type(vt) !=3D VSWAP_SWAPFILE)
> > +             return (swp_entry_t){};
> > +
> > +     return vtable_to_phys(vt);
> > +}
>
> [Severity: Critical]
> Does this function handle large folios with heterogeneous backings safely=
?
>
> When swapping in or writing out a large folio, vswap_to_phys() only inspe=
cts
> the first subpage's vtable entry. If it sees VSWAP_SWAPFILE, it returns t=
he
> order-0 physical slot.
>
> The caller (like swap_read_folio_phys() or __swap_writepage_phys()) might=
 then
> build a sequential bio for the full folio_size(folio) starting from that =
single
> slot. If the large folio isn't fully contiguously backed by the swapfile
> (e.g., if part of it is in ZSWAP), won't reading or writing multiple page=
s
> from this slot overflow into adjacent physical swap slots belonging to ot=
her
> processes, causing data corruption or an information leak?
>

We explicitly check for this in __swap_cache_add_check(), and (while
under a single atomic context protected by swap cluster lock) adding
the folio into the cache, which makes swap backend stable.

False positive I think.

> > diff --git a/mm/zswap.c b/mm/zswap.c
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> [ ... ]
> > @@ -1028,40 +1019,78 @@ static int zswap_writeback_entry(struct zswap_e=
ntry *entry,
> [ ... ]
> >       if (!zswap_decompress(entry, folio)) {
> >               ret =3D -EIO;
> > +             /*
> > +              * For vswap: folio_realloc_swap already moved the entry
> > +              * out of the vtable. Restore it via vswap_zswap_store so
> > +              * the entry stays tracked (and the just-allocated PHYS
> > +              * slot is freed). For non-vswap: entry is still in the
> > +              * zswap tree.
> > +              */
> > +             if (swap_is_vswap(si) && phys.val)
> > +                     vswap_zswap_store(swpentry, entry);
> >               goto out;
> >       }
>
> [Severity: High]
> Does vswap_zswap_store() leak the newly allocated physical slot?
>
> If zswap_decompress() fails, this error path attempts to restore the old
> zswap entry into the vtable by calling vswap_zswap_store(swpentry, entry)=
.
> However, it appears vswap_zswap_store() blindly overwrites the vtable ent=
ry
> with VSWAP_ZSWAP without freeing the prior VSWAP_SWAPFILE physical slot
> that was just allocated by folio_realloc_swap().

vswap_zswap_store() calls __vswap_release_backing(). This seems like a
false positive...

>
> Since vswap_to_phys() will now return empty, the physical reclaim scanner
> will fail to reclaim it. Does this permanently leak the physical slot?
>
> [ ... ]
> > @@ -1558,7 +1599,7 @@ bool zswap_store(struct folio *folio)
> >        * writeback could overwrite the new data in the swapfile.
> >        */
> >       if (partial_store && is_vswap_entry(swp))
> > -             folio_release_vswap_backing(folio);
> > +             folio_release_non_phys_swap_backing(folio);
> >       else if (!ret && !is_vswap_entry(swp)) {
>
> [Severity: High]
> Does a successful zswap_store() leak the physical swap backing?
>
> When a folio with an existing VSWAP_SWAPFILE physical vswap backing is
> swapped out again, swap_writeout() preserves the physical backing to allo=
w
> fast reuse if zswap_store() fails.
>
> If zswap_store() succeeds, it will eventually call vswap_zswap_store() wh=
ich
> overwrites the vtable entry with VSWAP_ZSWAP without freeing the prior ph=
ysical
> slot. Should there be a cleanup for the preserved physical slot here or i=
nside
> vswap_zswap_store() to prevent leaking the physical slots?

Ditto.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612193738.21=
83968-1-nphamcs@gmail.com?part=3D3
