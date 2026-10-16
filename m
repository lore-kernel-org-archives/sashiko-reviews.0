Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6764DAFB2
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166659; cv=pass; b=NAMl2gOxo4SQwJb9AiXrJJjRYS9nxFHoZ3d5fYjudZyxF+HCuoYpSpJntabukuB7OGPsmJwbpSlbxv41KhGHRCkr7siAJBBG6J3XdlXn+LyZw/JdUkNoHTED0rxcmvG6ypsW5DX92FgF3WyBLRn/7hnhqK2ZC5R+4m+BoHb/a8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166659; c=relaxed/simple;
	bh=9lv8y/8boJJYeoN6PZYJjxSqtNYDKsLSBds0Xi+bxrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMmRRsWdqzOPFM9iyjs8qJWopoDWgqWIQJ6S6H6UUsrh/GkBUX+AQR5nD1N6Fd4O3Nomcqk54y8458yH0mUhFpXyKgq8yCFmhw35ZjHunmwZccHuGsizSaIXcKn9QwT8QlhQlmjbBi0E/Sc9WYoNYvhM1BaFDH2+aH51c4NSL7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTk0g8EL; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTk0g8EL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so24551a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 09:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166652; cv=none;
        d=google.com; s=arc-20260327;
        b=JenKAb+Z93C93DerQzjq2JVD+nZzI2+PboYBrOZWADDHL+0N7Rbmy6Db4wc2C0eatL
         C3sif4ieB4Duo8gD/beZXny/1kDCsq/Q+tDZJE0kMhnNuODuWkRF5IF5QC56omPke9XY
         rOYnZ0PXUuw8kD5bNyiL6tze3o0Dsr6pEursSyh5enYZsyjnXJdoJ1nhP4qJJgF5FaRp
         Zejt10DfQz0GEMT8Ww53vyN1slPstVuRKyafJ2Zduyub804baU31GVyZtZQ7ADYVMiRQ
         TxSmOgo32T4F/+BUCcp5Dx6u9y6RzqZytNjCY0fJAK0HAt5M68PDUgqKGVM7Gp1kVLMA
         pz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0XT9gf6Lc+1fX8Xrkj2lJ0FO4HQTQ65QLq9M5IgaTRo=;
        fh=kBRVgl++c7ydo21IdlI42xZsOFLd832CjavNOsBYnOg=;
        b=kxni8yotkamYZzaaTjh+Chepwnto1V6feybTajlErDXyupuDTYHcfrdICogl176qMF
         XqM0OnazgpZXncUPUBjyTzgvnMaPC8vLUNvb0LsluXVYUdM/S9oQd80/83qXdA4eB9i1
         KW+uC4MrsMQWE00pdzmHukQ7OgN5JsMBSF9wnOD9M2oIS1X47n88fgbs72fwAt6EzkrK
         bTb0Bme0NGBmuBBq6YaDFq48v6aacpOzi5cW2Foxja3W2e6JEL6+QeHZrkRrc5sWTp54
         3vLpOOHTNyNLTe3kSqVBlLies8d+PY+VnocKZWF73i9k8XnNynxOqe+SrwNA++gYFbGp
         m8Zg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166652; x=1792771452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0XT9gf6Lc+1fX8Xrkj2lJ0FO4HQTQ65QLq9M5IgaTRo=;
        b=pTk0g8ELftlQCkPZNhI+EIq+kzIHNB8LxG0WUhlatxLimO4E1G9yGAFi6IeC4hAFUV
         Xu5C2JslqKr5900s1SjPrpJxOLRDt1gztPI9Lria8UyIZxiHwb01KjhRuKdaIZPGJscY
         xOhqgL6kCVM54ZNTnByO+dmoK/UJ0S3IaUb65843bOySeodP8B4KODbo+doYplZ9zgpd
         2Oh6xJZ/BcKHylhNTI/qgYBucgMLAjSqZQyaSsHEy10hDJIEG6fpBRJeGr+NZAOU2i2a
         5t9xzz/FGDIysuULJedeN81tg6paZBN+z1SHNQcUTVn9ljhuwA8m1uhkQXOJ45SDKxtg
         nghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166652; x=1792771452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XT9gf6Lc+1fX8Xrkj2lJ0FO4HQTQ65QLq9M5IgaTRo=;
        b=2Sp7BdXGemAxhrwUtqez49jfxbSA1NqG2v0IXRYnmtXr0hqpkcm8CSQQZJj33mRo7C
         buU8Sg6IIdt0VCgYOBU8W2EYc0BnQVKoXhgFOizVpgzgk8BcqVkDQfF6wOg2MO2u6FYN
         XRERRqA7RwBa0YqoIKOH6RkO7rv1nUO8mdkTnw7hboMpCaNZBk9eU46HQnIVC/83mlCO
         C4BSWgdsjPq2b6g2STINP4sj8HLZDlgyzMVmgtHn+BKwrt29/lOo7amyYmfsT4trskzZ
         rSJD9JHOj7Fe5Bh6FdlTLC6NBOI5UwdoVOkdkIhSIKyKkpXf0HAQ5em7i16KxEJorRiq
         lo0A==
X-Forwarded-Encrypted: i=1; AKwUvBzY1Ziih1z6v/fzh/+hLaWxHyc9FE7EMqo25EkiWIEi34lUGIyPUiuDOVBPSonrZjkoaaUoKGWpXVb8j3zBkIo=@lists.linux.dev
X-Gm-Message-State: AFq9FYL63MLsmlsJXdBN3vAun5o1FAmaAZyeJIN7CIWMjCxHg/GTOnx5
	NiSROHk19pimRFagY0hiwUIZKH4vZ5YIMVXg/rDEblA9N4mqQfxyztILtPWBnCIKfKBF4KtkoN3
	Vg9F85iIf3g9oBIfHbXR09ZjDcE+sJ7U=
X-Gm-Gg: AYBFou1hVBGLX9wKX19ZGTNM3iul5SWFMtkD7bNnq2cclg63uZrHva7u8hXV/awaH5o
	/v5LMbBGaOnbu+4K2r5/p6rPXJbhaj7j1USeSWDutcMA6hXGZGfVCMR2HyqH0zIyPAHkhGC+rw4
	U0LUvft3WGoOz9UZR1rOGs5/kd9r2Pd+iBM5hYIKl7EhFPNLz161sdvD8C+vmyON8MKetmOPNRS
	+LJgldmO1C7u59Cqwc9CeRA6exQXiY5+Sw5FY5Wo6mFWBPV79rcWyizJhLMXAR0rtsf4Jl+kopK
	aXQPQDSoX1727Y5Xffr7fzH9s1XYYAEkueCcF3gX5OkXJyqg6PxzNcrd
X-Received: by 2002:a05:6402:4402:b0:6b1:c299:b3f8 with SMTP id
 4fb4d7f45d1cf-6b1c299b53dmr13158335a12.33.1792166651834; Fri, 16 Oct 2026
 09:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008112004.1899560-1-mszeredi@redhat.com> <20261008112004.1899560-9-mszeredi@redhat.com>
 <sashiko-outbox-164097@kernel.org> <CAOssrKeEOMUHz_Esfi6L0tu0rbd+aMbb9+fi9fzFYu5NWczOZA@mail.gmail.com>
In-Reply-To: <CAOssrKeEOMUHz_Esfi6L0tu0rbd+aMbb9+fi9fzFYu5NWczOZA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 16 Oct 2026 18:03:59 +0200
X-Gm-Features: AclHuK-Evug5KGDMq7YW7UlXb9Ln9FrCYT22ooxxec4w9tRZ6QLvbe-ThSbMDYI
Message-ID: <CAOQ4uxhgFM=SN_WKGp8PXGpHJhk=vr9ADS0OU-UeEv8Mrba-XQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] fuse: add extent map I/O support
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	sashiko-reviews@lists.linux.dev, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, linux-cxl@vger.kernel.org, 
	nvdimm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:26=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.co=
m> wrote:
>
> [Restored Cc list]
>
> On Thu, Oct 8, 2026 at 1:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> > > diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> > > index e9ab1aea34e27..040817ad76e94 100644
> > > --- a/fs/fuse/passthrough.c
> > > +++ b/fs/fuse/passthrough.c
> > [ ... ]
> > > @@ -74,10 +73,13 @@ ssize_t fuse_passthrough_write_iter(struct kiocb =
*iocb,
> > >       if (!count)
> > >               return 0;
> > >
> > > -     inode_lock(inode);
> > > +     guard(rwsem_write)(&inode->i_rwsem);
> > > +
> > > +     if (!backing_file)
> > > +             return fuse_ext_map_write_iter(iocb, iter);
> >
> > [Severity: High]
> > Does this introduce an ABBA deadlock between pipe_lock and the inode lo=
ck?
> >
> > For normal passthrough, fuse_passthrough_splice_write() acquires the in=
ode
> > lock first, and then calls backing_file_splice_write(), which ultimatel=
y
> > acquires pipe_lock() via the backing file's splice_write callback.
> >
> > However, the EXTMAP DAX path added below for splice_write() directly ca=
lls
> > iter_file_splice_write(), which acquires pipe_lock() first. That functi=
on then
> > invokes fuse_passthrough_write_iter() where the inode lock is acquired =
here
> > via guard(rwsem_write).
>
> Brute force fix would be to prevent mixing plain and ext-map
> passthrough.   Might be a good idea anyway.

You mean not mix on the same fs?
Make sense. So another init flag?

>
> However I'm thinking about why fuse_passthrough_splice_write() needs
> to lock the fuse inode.
>
> Tracing back through git history that inode lock really originates
> from commit 2a92e07edc5e ("ovl: add ovl_write_iter()"), which added
> stacked writes.  That was copied into ovl_splice_write() by commit
> 9b91b6b019fd ("ovl: fix deadlock in splice write").   Which was then
> added to fuse_passthrough_splice_write() by commit 5ca73468612d
> ("fuse: implement splice read/write passthrough").
>
> Even for the original ovl code, I don't see an explanation for the
> inode lock, but I'm probably missing something.
>
> Amir, any thoughts about why that inode_lock() could be necessary?
>

It is my understanding that the inode lock is used to synchronize the
copy of size/mtime from the backing inode to the ovl inode by
ovl_file_end_write().

We don't have this model in fuse passthrough (yet).
I think that fuse_passthrough_end_write() do not need to be synchronized
so could probably lose the inode lock in fuse passthrough.
If we even implement the inode passthrough mode where the
backing inode attributes are the source of truth, it will surely be
a mode that does not mix ext-map.

Thanks,
Amir.
