Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF4513DDAA
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 02:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780972856; cv=pass; b=COJg3hljhRhKAEmJEgblhUfuonUFKEQQyxMs12O1GCY7L4mer+7/j0XDVc5HSaF/J0hBy3ZvgzPjd6TDhNrK95Hicy4x5qjpjpt45HbHsL1Hc/P7jNnDvmGP8lswrhJgIlGIWsFIQsH3EtRVddX6Mc4Czk9TldI8SCZw1Zuzo98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780972856; c=relaxed/simple;
	bh=2weHZAnGCbTPNWjVCfS3UApuC/XuOthruG84cisjIbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/gzPeGcJ7MBw7DNMu8WevBPyPc2ynQiNrIEskfVj8fuhT1p/29Ih1c6FoGA45xa++5RbldikWyELzBXVD/MWTRD14l4PlwZluMQ9YxCl/PJuu8itWHjSdwLak5rq8E75ooD9zV21VKhOoT1CuUNh+7mffR7aFxKah3IZycFPgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=ePtY4ye1; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="ePtY4ye1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84275887a3fso3729831b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 19:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780972855; cv=none;
        d=google.com; s=arc-20240605;
        b=BVnt6OtdzZK4G/SbmUewvRWYxOdDjiFtShqVHt6AI+7sbtW21TKFzOHTG29+X6A0fY
         IUmFLdMBQbR9Cp9wIjnjhiuJ52iPL3GVct1GOl9+hgEOIU5/HgboFfDO7i+YTCM2iW6c
         lg8/9GZ9+kbJK9Ygu4HJJab9XD0oPInGWrCcicdLSVYa9Vd/9UnZGJwkpgq7md7XRdBM
         68+USMQiGXD9FIWtqeZBNJZ/rtwLddWJ2GOQwqJIAQ0Zguz8+UO+S5gxDhVskvjSWNSL
         tmnkWqxkf/+JtLhNx2iUssbUUfsEYbxu+hfSlW3wYb5F7bM/dwJLBXe+IXaZIX7Arf2Q
         KZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5RbwsbWJC4zXqOoZmHv5QEQLnuSfI9W0bTXmBqmsj6c=;
        fh=MBdc8uAmfYorFqIEnNnJKSglj+KmAuIr4aM1xEiRZpY=;
        b=bpdNM0adl3+htoO2Ir94O/gKF3RwPxqD9VGWlrJBNnpsBBGU/h3DhJrp21DR/OQwpL
         1d0GNuWpC5z9jLteqTf/xun0VNvgZnbYmEV+y8K2hmJWsI2M7u5vRJ8DfJJCfF69eahO
         AWzr4Zp3vVRYU+VlMGUCwLGGINO55rVwsuDgbGZSA0ULqptZ+KGGbgwepwPl8l5kV5U7
         k8yNS1TCe7kcfUq7B6c+g1em6VYUvAFz+Fdv9Wcvq8jide+V2hPtzIQnsOHWIHhADFUE
         0r3jFZ7J9V5S0W2x2rc1/xxbTyBEQzi+wOt96/DNcTxVv2k2A7EA3h4bksSplrKUhnUf
         9ucg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1780972854; x=1781577654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RbwsbWJC4zXqOoZmHv5QEQLnuSfI9W0bTXmBqmsj6c=;
        b=ePtY4ye1vkXk6/Khl8yBHoYnDnx9W25KJn+rX2tfbUhVwcZ9IjqmVGE00zZy7SW5E3
         IK2CvOp7WzOeLShOWkGO4g6dZ5l/sgv4FpFGGoUFaP/hSB80dap9z6UqAkoUq18M4zgx
         G+tMs42JAUo3lz+2FzsARbGCyZuGZ7r526n6cgmix3N2GwAwiFyQ9waotqPRxML4qR0R
         QMUQFMoZAZy78IWhfqCn1sa9rxR4osypYsUZw8wzngq9mkabAeSHh+mpk1VRa5l/gxrz
         PFute10XIirLjvKyZsS/UqbdP6ahYjEO6tToo0t7Qxj6NCMf5ZohjI+/AzB45muWfETG
         46Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780972855; x=1781577655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RbwsbWJC4zXqOoZmHv5QEQLnuSfI9W0bTXmBqmsj6c=;
        b=eQjewIJjvz8/OdfoY/e42f0jbrhEic1t6fDkDotNx974kjKLf+tkqPYWyVYqnay3EK
         MfbJy+JRLhLIyMW6Me7+jzKIiP6Z9DkWLV5As/tUI3o451qSFSHBKr9O1CJz6CXEDCL9
         ff0NT9o7UZs4oCF/nPZDoiQuF0jWx4hz+7+GqlW/qDWUU2I7mPwu5AmGhE+7FvElAgt6
         kfR1R/FNvqbWORSj50fX/b30B8lNAgPB4E/e1Ze/8rp15pPi8UzCyIfn6pBw8HqQM99V
         tGFRDjdm8AjQPMm7Fxr441OP0Ho0otSa1F9oi+eLoWvI2F/OdN3yz6XJR2pM86jo2ELI
         +DSw==
X-Gm-Message-State: AOJu0YyRwYYwf48/L84HgyBYwXODTKJE0eY3dFjjQGiKfU7aWJi1neD6
	QMP1lkkholJtbSrzxMjI4lywBWcmkhbQFzzgNzO0+WqRRRd6jfdRvzlZQbCtHYVSXYMVBgXleyT
	tW4/K2hPaj6rkADPCaFxffPnvAUcaXT9N7qPHKcVCz2dcHits4qZAMEur
X-Gm-Gg: Acq92OG93dqiLTf7eKgnbTRlhJiabnf6A5VJQc9zubNpuMJ0FJgGRC8Ap2BmBQRJJgS
	os2aOXz2meW6HuCIkbj+2VcpbvJT9M2UnoXCSncYwVwI2DtvkIJiU+Hh7+wFGRh6OTIlqmxrt1l
	XwwkCn61csnd+VtNqNp0OqlkUFrhoBgxNsJnQmRIkH1PQAIngU7d0jbwe5kfGyXPiUg2BgPJDTe
	3estj0BKw064kIYs2l9D5q7OT8Hx1u9CGYlHN525FQmP6townSEWhfwfA0ddp1dxQhUuiBnrekf
	T05mVNoH3CqOFVZ2cg==
X-Received: by 2002:a05:6a00:10c9:b0:842:3d30:6251 with SMTP id
 d2e1a72fcca58-842b66a945emr13128748b3a.8.1780972854562; Mon, 08 Jun 2026
 19:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609010739.2278172-1-xmei5@asu.edu> <20260609011818.3574A1F00893@smtp.kernel.org>
In-Reply-To: <20260609011818.3574A1F00893@smtp.kernel.org>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 8 Jun 2026 19:40:43 -0700
X-Gm-Features: AVVi8Ceeq_PI1R7P8-ZfGruwmWpJL2r4yzPbvmKBj1UsppPxRPCJ8BaPJ3heV0Q
Message-ID: <CAPpSM+SpHAZgD8SGkU4H3GTwBeQHYa7XyJ09y=byf9-x6gkj3Q@mail.gmail.com>
Subject: Re: [PATCH net v2] ext4: fix out-of-bounds read in ext4_read_inline_dir()
To: sashiko-reviews@lists.linux.dev
Cc: tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, it exists. The AI review is wrong.
```

/*
 * The rec_len is dependent on the type of directory. Directories that are
 * casefolded and encrypted need to store the hash as well, so we add room =
for
 * ext4_extended_dir_entry_2. For all entries related to '.' or '..' you sh=
ould
 * pass NULL for dir, as those entries do not use the extra fields.
 */
static inline unsigned int ext4_dir_rec_len(__u8 name_len,
const struct inode *dir)
{
int rec_len =3D (name_len + 8 + EXT4_DIR_ROUND);

if (dir && ext4_hash_in_dirent(dir))
rec_len +=3D sizeof(struct ext4_dir_entry_hash);
return (rec_len & ~EXT4_DIR_ROUND);
}
```

Xiang

On Mon, Jun 8, 2026 at 6:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch introduces calls to a non-existent, hallucinated functi=
on `ext4_dir_rec_len(1, NULL)`, which will cause a build failure.
> --
>
> commit 795b69dc0ee159c73623b9c944fb1c9960abeee1
> Author: Xiang Mei <xmei5@asu.edu>
>
> ext4: fix out-of-bounds read in ext4_read_inline_dir()
>
> This commit attempts to fix a slab-out-of-bounds read in
> ext4_read_inline_dir() by validating the dirent length against inline_siz=
e
> instead of extra_size. It also adds bounds checks for ctx->pos to avoid
> underflow when accessing the directory buffer.
>
> > diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
> > index caa51473207d7..5b780fd72757e 100644
> > --- a/fs/ext4/inline.c
> > +++ b/fs/ext4/inline.c
> [ ... ]
> > @@ -1515,6 +1515,9 @@ int ext4_read_inline_dir(struct file *file,
> >                       /* for other entry, the real offset in
> >                        * the buf has to be tuned accordingly.
> >                        */
> > +                     if (i - extra_offset + ext4_dir_rec_len(1, NULL) =
>
> > +                         inline_size)
>
> [Severity: Low]
> Does this code call an undeclared function? It seems ext4_dir_rec_len() i=
s
> not defined anywhere in the kernel. Did you intend to use the macro
> EXT4_DIR_REC_LEN(1) here instead?
>
> > +                             break;
> >                       de =3D (struct ext4_dir_entry_2 *)
> >                               (dir_buf + i - extra_offset);
> [ ... ]
> > @@ -1549,10 +1552,20 @@ int ext4_read_inline_dir(struct file *file,
> >                       continue;
> >               }
> >
> > +             /*
> > +              * de lives at dir_buf + ctx->pos - extra_offset, so the =
dirent
> > +              * header must fit within inline_size.  ctx->pos is a sig=
ned,
> > +              * lseek()-controlled loff_t: check the lower bound first=
, or
> > +              * ctx->pos < extra_offset underflows and points de befor=
e dir_buf.
> > +              */
> > +             if (ctx->pos < extra_offset ||
> > +                 ctx->pos - extra_offset + ext4_dir_rec_len(1, NULL) >
> > +                 inline_size)
>
> [Severity: Low]
> This looks like it uses the same undeclared ext4_dir_rec_len() function
> mentioned above. Could this cause a build failure?
>
> > +                     goto out;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609010739.22=
78172-1-xmei5@asu.edu?part=3D1
