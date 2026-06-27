Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73934CDD
	for <sashiko-reviews@lists.linux.dev>; Sat, 27 Jun 2026 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542667; cv=pass; b=H75pe2ACxxdAC7iiNvLYLwSv0xxR0v/+jXPnE4lRQseyIGxgKczhpvJwC8JTSXMReJYng1Q3zHM1wJ0qVEm5ZdLdwOTvWSMUiz4EhnMr63VeBYlBOVe35RP3exOwNB16Ec/Fb3u2p9TuGZksAcqo5RRnNlyvxNfVF12e8IPamD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542667; c=relaxed/simple;
	bh=WouwHE1R8U8JJEuE6C2SQ/+2+qm602jhJmCk2kVq6KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F39BoDfUwQB0rHv/wB6OgZXyTWEpDdBJshmz7YGMKRdx3HaDCrfcsdmyqtof3sEIa12s+6NfhUSdwOmxqCTXNwwJllndK7TfbXI/48vdCwpJl8SGc3Dm1IpDwxvCd/AlIoEPhWov5ytEHvI5NbY0MCeCbWryvRHUXYDhjKC9h3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ftlWjlnw; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ftlWjlnw"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9b4e91adfso49194a34.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 23:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782542664; cv=none;
        d=google.com; s=arc-20260327;
        b=gWyz6Co9ezobdAODoa5O9aoqA6oLIC6hvksI2qkig/o8J2tLCJrmWkr0ZiIwtPRqRD
         0m3pM6vtDddOEkZMOOAnycJ+FILNtxVZ4GE840lhb30LzRrCDJaVvpGX0LnrU7v7mcby
         wHPUkawDA/22G3o5QU68DsOzXpk4hdCrHckKw0AMI9n2EgkvYLBHMKQO/dHME1URMMG5
         mBPiZBkKA8NarYjOySJKff49U1zyxEmRSsesZeTPNVh8OpQWTytVwDV7IBZAHpcirxMC
         SQvry6/joJrfiPpF+ZnbXBAB4GMRUyPEtBdits3bAYssyv2nK9ToWu4b8ppWwO1Ef32w
         Bspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PqJ9f6zF79jUlRWV2DsV7aIRWOIhIBa9bZOZESr1l8A=;
        fh=gUfsL9ppqjROwdjOOpA7gVU01au1qshFQ+BhECdF0Kg=;
        b=gjtBQ9I0XAEwFbVR2SPSKljJB/3HNJ99e0yCawIAToLuER7e6w4Cc4rtEFTn6yMdnm
         4ya7TK8jXBrVtti1XVW4ZGQ0Glgu+IYUSyE7yEfnBjAvmm7rIZDolHcBsiZgfEfEBlR+
         0rjjCRUTm2exUdGVRdIlNaEIX2aN9NRt+YYNOoxZNOLmfsvxg6hHK+q9KOf+HC9Tjzkc
         NqniyKKGMlSW55m7TH1iN6VC3sIIWCIypSzsStriiVXAKT4iOCKJMgmVbcZNSzju/jMK
         14jLPJJz4wEdu7EG2OLPqwwmbIytiwkdGI+h8TcdLiXb4Fm0Xh+SVnlDzW7VreXONA2q
         DpsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1782542664; x=1783147464; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqJ9f6zF79jUlRWV2DsV7aIRWOIhIBa9bZOZESr1l8A=;
        b=ftlWjlnw+O3kSsgLjyWjVByfiRIPrI7bFLqa9Hmk3Su6HYAkse2+st3F7yrk13nN+O
         is4CRiqBCl3ZUmTrZF/a5cl1uj6/3P33vqFf63rqOc4b94pvRKhNhcXW33R+Mq5MFGzn
         j8skx8qd+qCecvUHmBkKY/anYL5M7x/TRhHMEu46YUnUjE7BLOOLe/7tqh88vsNrhItU
         jrUVKVXb3880V0BFNt2tAc5R1zL2ccdwN7G4ziKe7DF3ef8YZHn14k8JthQzJvIxF8tS
         i+VKMG5kcB95CZ7t28ym5d0qJ7WLCFm2thvPoLOW1YUC1hH01xXP5oz18zl1JoZ3Efi7
         zhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542664; x=1783147464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqJ9f6zF79jUlRWV2DsV7aIRWOIhIBa9bZOZESr1l8A=;
        b=oj1X33t3xhDMXPbt1OhAtOElhGXnvSXBh/awDR63Yq3v5dcb0EFyQxQu/qX6HR3ZWa
         TIiKTUIPlAXPu3oH3b8LdLpNQKmY6jbbAiNwYdgQzTZULybOM+YksgBF9a3iVukR8BFP
         7TSTs0ZpIgYHD5mjxI0yGOj0FXWgwK0VXJ5sq6tQaScjpONYkHnjsDUmRuBpTD/M2arK
         lpZGWoag6c1iKO8DIlzvn/7TWUcg5w0/zzVCXZK9U/XjIHLtWV36GkY2E73R2pYGwKxH
         KH+qQVcjIlxDOwEO41Rr4y0SMVgPOfEXvjUwb+Fc6OzugMLOhhLDo43HPbP6Oq3HHkIJ
         UqQA==
X-Gm-Message-State: AOJu0YydCnWKtRV4aD+b3m3KBnqt7Z5fcAkSUVhEit529t8eVkSIbaqe
	oOWLLwJ3DuZ9oeCV/kbrApGoO+GaWT63O217lcQNqG/4b0kr3NRRGOL0gxL57xxxP6/htBX+BLk
	wpPrOnQUMf/CG5CU9MsfLwY2Di2c4mDV76zfSbWAp//ZCEG96KfcKHkjUeA==
X-Gm-Gg: AfdE7cnh3trWrCZUA5DvOzhu7OqjluV3Sz2JaUsUkPe5Hkg0A7iMqrmYL1LY2S4Nw/1
	GyNYtinRIFmvexhlI303f2C8d2La7NtRGvbdMCurwbqZwj4u1/TKLloeomysw+/0l+X0WNyZbqW
	1IDBNgLASv5Ox1e04UmKN9jG6d8xlRBqFMUWVYIxm3b6ar4JZDE0sqXmncyJ5lw7/grVr8xTeuq
	OsaWaYq2xdVjNhIAz516lQ05xkTV10H0vGlpopQxeaUi3YfBQtSdn0cg8Fl0eYnDb5uYvdbXw==
X-Received: by 2002:a05:6830:6016:b0:7dc:c92d:975f with SMTP id
 46e09a7af769-7e99c2c3954mr5237814a34.7.1782542663550; Fri, 26 Jun 2026
 23:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260627054220.2174166-1-csander@purestorage.com>
 <20260627054220.2174166-4-csander@purestorage.com> <20260627055516.D92931F000E9@smtp.kernel.org>
In-Reply-To: <20260627055516.D92931F000E9@smtp.kernel.org>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 26 Jun 2026 23:44:12 -0700
X-Gm-Features: AVVi8CdF4ey9DwUemi-8_MWi9xL91q88EPfQDj5c8BCHtq_hCdh93CmdLkhChlM
Message-ID: <CADUfDZog=MMxOxen56t9QgDb=D3cA+r5W-SSEw+qXHVRqmphFA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] bio-integrity-fs: use integrity interval instead
 of sector as seed
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 10:55=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Unconditional dereference of `bip` and `bi` in `fs_bio_integrity=
_verify` and `fs_bio_integrity_free` causing a kernel panic.
> --
>
> commit 1da3b7d905f7d5c0c600e7d3a5fbf3cb0dc853c7
> Author: Caleb Sander Mateos <csander@purestorage.com>
>
> bio-integrity-fs: use integrity interval instead of sector as seed
>
> bip_iter.bi_sector is meant to be in units of integrity intervals rather
> than 512-byte sectors. bio_integrity_verify() doesn't actually use it
> currently (it uses the passed in struct bvec_iter's bi_sector instead).
> But let's set it to the expected value for consistency.
>
> > diff --git a/block/bio-integrity-fs.c b/block/bio-integrity-fs.c
> > index 9c5fe5fa8f0da..770eacb2220ff 100644
> > --- a/block/bio-integrity-fs.c
> > +++ b/block/bio-integrity-fs.c
> > @@ -67,7 +67,7 @@ int fs_bio_integrity_verify(struct bio *bio, sector_t=
 sector, unsigned int size)
> >        * bio.  Requires the submitter to remember the sector and the si=
ze.
> >        */
> >       memset(&bip->bip_iter, 0, sizeof(bip->bip_iter));
> > -     bip->bip_iter.bi_sector =3D sector;
> > +     bip->bip_iter.bi_sector =3D bio_integrity_intervals(bi, sector);
>
> [Severity: High]
> This is a pre-existing issue, but can this unconditionally dereference bi=
p
> and bi?
>
> Looking at iomap_bio_read_folio_range_sync() in fs/iomap/bio.c, it calls
> fs_bio_integrity_verify() and fs_bio_integrity_free() without validating =
if
> the integrity payload was actually allocated:
>
> fs/iomap/bio.c:iomap_bio_read_folio_range_sync() {
>     ...
>     if (!error)
>         error =3D fs_bio_integrity_verify(&bio, sector, len);
>     fs_bio_integrity_free(&bio);
>     ...
> }

fs_bio_integrity_verify() is only called if IOMAP_F_INTEGRITY is set,
which means fs_bio_integrity_alloc() was called earlier:

if (srcmap->flags & IOMAP_F_INTEGRITY)
        fs_bio_integrity_alloc(&bio);
error =3D submit_bio_wait(&bio);
if (srcmap->flags & IOMAP_F_INTEGRITY) {
        if (!error)
                error =3D fs_bio_integrity_verify(&bio, sector, len);
        fs_bio_integrity_free(&bio);
}

Which will allocate a bip unless bio_integrity_action() returns 0:

unsigned int fs_bio_integrity_alloc(struct bio *bio)
{
        struct fs_bio_integrity_buf *iib;
        unsigned int action;

        action =3D bio_integrity_action(bio);
        if (!action)
                return 0;

        iib =3D mempool_alloc(&fs_bio_integrity_pool, GFP_NOFS);
        bio_integrity_init(bio, &iib->bip, &iib->bvec, 1);

        bio_integrity_alloc_buf(bio, GFP_NOFS, action & BI_ACT_ZERO);
        if (action & BI_ACT_CHECK)
                bio_integrity_setup_default(bio);
        return action;
}

But IOMAP_F_INTEGRITY is only set in the first place the block device
supports a protection information guard tag, so certainly it supports
integrity (which means bi is non-NULL):

if (bdev_has_integrity_csum(iomap->bdev))
        iomap->flags |=3D IOMAP_F_INTEGRITY;

And thus bio_integrity_action() will call __bio_integrity_action() (if
the bio doesn't already have a bip attached):

static inline unsigned int bio_integrity_action(struct bio *bio)
{
        if (!blk_get_integrity(bio->bi_bdev->bd_disk))
                return 0;
        if (bio_integrity(bio))
                return 0;
        return __bio_integrity_action(bio);
}

Which I guess could return 0 if integrity verification is disabled:

case REQ_OP_READ:
        if (bi->flags & BLK_INTEGRITY_NOVERIFY) {
                if (bi_offload_capable(bi))
                        return 0;
                return BI_ACT_BUFFER;
        }
        return BI_ACT_BUFFER | BI_ACT_CHECK;

So it seems possible that bip might be NULL.

>
> If fs_bio_integrity_alloc() returns 0 without actually allocating a
> bio_integrity_payload, bio_integrity(bio) will be NULL. This can happen i=
f
> the device's integrity profile is unregistered concurrently, or if the
> operation doesn't require integrity checks.
>
> When that happens, fs_bio_integrity_verify() would dereference a NULL bip
> during the memset(&bip->bip_iter, 0, ...) call, and a NULL bi at the call=
 to
> bio_integrity_intervals(bi, sector). Similarly, fs_bio_integrity_free() w=
ould
> subsequently dereference bip on the same path.
>
> Could we add a check for a valid bip and bi before these accesses?
>
> >       bip->bip_iter.bi_size =3D bio_integrity_bytes(bi, size >> SECTOR_=
SHIFT);
> >       return blk_status_to_errno(bio_integrity_verify(bio, &data_iter))=
;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627054220.21=
74166-1-csander@purestorage.com?part=3D3
