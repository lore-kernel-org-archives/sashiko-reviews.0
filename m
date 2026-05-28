Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751930FC1A
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984564; cv=pass; b=pRmatbis2zOA4XIl0culL2zLA95FS+GjXjWda/i2Rf0YhwYirah9SQP8TL/k+LGG6+sT9t0pCk493Dq2FLu9yFgYiGGDlI5WTZ3iDJmrhaPtMpc1dNYb5hu2O85C8r9TMZ9Z42dZFRetAsXNPBPiBv+IjbwhldISjjet2P+oTHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984564; c=relaxed/simple;
	bh=5BdoWMHoq6ZcjAyEOH9O40vuJE5+Ors4WzL5tlIPrO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3+JrYRH6BbtL6jO2fs2VNlD5amcDJQTtKxMAyIYdxXs6z1A8YP+hi8yBiEKEOlSaaYYdmAp5Shjqhf3bCUI+wtJdLvYuZSMx4NxjoqiC9rSsIE0JS2E1uOZbmY2s/GJWy9MYw5woc8wdzbcc0vAPb+d1DdvYJxA3pxgg5soYgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ss+1lIe1; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ss+1lIe1"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6602d636ff1so505387d50.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 09:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779984562; cv=none;
        d=google.com; s=arc-20240605;
        b=jgreBZaOYlJ6kPiixJRQIrpNWmRXonyGpIiUOfh5MYZiR8kEiokT38FhkjQ5YZxP4D
         g9aUCB/AX0SonW7k6YRweMaY5xif2QRjosB7x4CI6NPHLv8ZjwKIy1W5kNE1F8vymulS
         1+4hn4qZwQDjIi6EPVoS5kuaVVRLBH8yejO3G3DkxW6cfWEHzzb/R9AmqCMTIG8vMLyT
         ENfjzd3rZ3H344ixdvMnbJcxiggBGcebJ/ZRc6hEKkuDW8w8kbvJRutmxhmByf4mXyRE
         gYwWsmZ3wl+I1hK5wK9PZhVDTN84Tql9tQOeVNgMvCQtQg3lt+A/q4u/SgUB4hYFcLkt
         KP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oaEgvbTDI3syVDkp4HY5Is2see/BIZz5dqija5SxfCE=;
        fh=b7u95sKMUyWfWHcT4tQxlBTaVdKRPvrDp3u0QNjyKcU=;
        b=GHdeKixF1U2BqQ30WOPLVEKYq6NFU2RGjUuktvqnULVeEuKKA4RHB8him3ViuFhSye
         5TG/msfnJyTSSRFLye3AhPBW2LzEWyV4OFEA9GUJJTP9mHo1rEv9HLgU38A8bALA2QTz
         PpABeVLMehO7XkziySh7laXhinANBd6jbmq3qiWe5lX7MlatnVWdD/Ln4eJTrJjSf8z1
         rN9ZC5RCrgB+DslD1xafPF2gjN5UZOY7kAguCthtzsQSYq4I11QVGhpMw5W7DXWBImWz
         EM61kRYeUpZSIvZF3LDjZaaQFrfC4lWsFBqoiU1dZTyGOX5aabzFuJURSiN7I/+MJNBJ
         SWxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779984562; x=1780589362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaEgvbTDI3syVDkp4HY5Is2see/BIZz5dqija5SxfCE=;
        b=ss+1lIe1vqclqU8krsdhUF3Qfq1IAGNdi9GF5GkD4XrjJnIgjtkNI2gLYc5AnDtat+
         H+4LMxZu/LL2WM+o+nlYkIYYOJeKc0ZCHUCddlXg3HRyHDrB8AbJrw+ym6TRj/Mc69fK
         ofhJKhzHyaAfqDp4pcoxZe+yW5tzwovms6R7fZ/WoSud5zf5FK5DYaIKbHH8po5r9Fpb
         LF4JzB+p1dof8IEUQQiP9BNPi98j2Ias7BlF5+MR0NXcVCOSFO/45GzVzkDKYAd3XYlB
         iRgDpRqSw1t/oippEdvsWhyEZ8xU4qtQjE+EJvp4RA2WL3hkRamKK1zzooA3VYM98ZfQ
         J8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984562; x=1780589362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oaEgvbTDI3syVDkp4HY5Is2see/BIZz5dqija5SxfCE=;
        b=OhJt0pM/S1kE7NR0RPzsHXuaGoszhz6l0Kb2L6WOfZdvnSK6y+vJz6l6OjDuJWg7ya
         muuYb/baWzLYOAifWb2z7tcYn0fLYzvV0wnLzd0ym1b/s3eG7CKsjD27A12qtch101BG
         Jq78U2hxx6pXAANhybQZVHXTHie8L0tRYZl2NNfOqp0Aksv2FcZOnO8vPUdAocK+FM/b
         h6dPoQw3Mg4p/buPi0BMoE5+d0XTjV/djfZFCDOs0G+C4Yn7VoPnM2hmU+1n9oncNGdB
         eSqa0ohJXzIcuDvwNycMmUq+iIH8rKRjyZm9Em2eLea7SiYJYNjKnDRcL7+a7Z0qVVf6
         9NeQ==
X-Gm-Message-State: AOJu0YwPE+JM9BLCgo6IfM4bu+Uva9e/Ei2T6tl3bqEE1l5dWej6lPQK
	lP6U7H9RxR0RujU4+pnSw6vvfmzwMrkVmr/Cdw1lI46OFvyMEBFGZxZWGmoe83EJELC5xYK3lNy
	EY1sgP5TrVzqtw6SfVcoUqBFjFUddPZ9kTvQKMXU=
X-Gm-Gg: Acq92OFPNOTS8FglovVl3HxpuOixlkuRKZMZW3sFyfj3CM4Axk6gz4wQaCNPol32jM/
	SvalHgYaQPNaM3WWyokX/6rN8SzCtdlaaH9RHbAo7vyUV74C0mkGXWFjN5kI123o2+0X8ymHBIe
	aCM8U/gCXfB9s/CFfxakLc+gaLpmm2BrkUKaOKnUzxhmmLqxhpFksRqZo8sQ3qGZJX46Vjq/7Dh
	jGBnvUn4/fKJ5T6z6ft56OTqrK3EOrBimQ2CKOfcXPH7jOtfD9O0X+Zb20dh0Te+zgdUp18qFPT
	qqYeJvg9pCujwqkpTYYNEkvMM2wq+p0Ahd925130BWRQ+r7WBvgf
X-Received: by 2002:a05:690e:400e:b0:660:460e:254b with SMTP id
 956f58d0204a3-660460e4f9bmr1614700d50.38.1779984561639; Thu, 28 May 2026
 09:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526233608.7600-1-ablagodarenko@thelustrecollective.com> <20260526235328.527921F000E9@smtp.kernel.org>
In-Reply-To: <20260526235328.527921F000E9@smtp.kernel.org>
From: Artem Blagodarenko <artem.blagodarenko@gmail.com>
Date: Thu, 28 May 2026 17:09:10 +0100
X-Gm-Features: AVHnY4LhYDS3Sh_Y0GCnXyDt0tTyFBYl7fORvPsWzcKCFRHhlLGT9w8hLUrroMQ
Message-ID: <CA+rD4x9rsnoWLWaPZWQr2Qsm01fSdKrNk7O68orQHg0YDec3Aw@mail.gmail.com>
Subject: Re: [PATCH] ext4: replace ext4_dir_entry with ext4_dir_entry_2
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "tytso@mit.edu" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the report.

The issue addressed in a separate patch
"ext4: validate dx count against limit in dx_csum"

Best regards,
Artem Blagodarenko


On Wed, 27 May 2026 at 00:53, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Missing bounds check on `count` against `limit` allows an out-of=
-bounds read during DX block checksum verification and setting.
> --
>
> commit dc89c328f6f68bf47e9d35d96851d21a7b9697a6
> Author: Artem Blagodarenko <artem.blagodarenko@gmail.com>
>
> ext4: replace ext4_dir_entry with ext4_dir_entry_2
>
> This commit replaces the remaining uses of struct ext4_dir_entry
> with struct ext4_dir_entry_2 in namei.c, as the affected code paths
> already depend on the filetype feature.
>
> > diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> > index 4a47fbd8dd30c..a316fc2ac41b0 100644
> > --- a/fs/ext4/namei.c
> > +++ b/fs/ext4/namei.c
>
> [ ... ]
>
> > @@ -456,7 +456,7 @@ static __le32 ext4_dx_csum(struct inode *inode, str=
uct ext4_dir_entry *dirent,
> >  }
> >
> >  static int ext4_dx_csum_verify(struct inode *inode,
> > -                            struct ext4_dir_entry *dirent)
> > +                            struct ext4_dir_entry_2 *dirent)
> >  {
> >       struct dx_countlimit *c;
> >       struct dx_tail *t;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is there a missing bounds
> check on count against limit here?
>
> Looking at the implementation of ext4_dx_csum_verify():
>
>         limit =3D le16_to_cpu(c->limit);
>         count =3D le16_to_cpu(c->count);
>         if (count_offset + (limit * sizeof(struct dx_entry)) >
>             EXT4_BLOCK_SIZE(inode->i_sb) - sizeof(struct dx_tail)) {
>                 warn_no_space_for_csum(inode);
>                 return 0;
>         }
>         t =3D (struct dx_tail *)(((struct dx_entry *)c) + limit);
>
>         if (t->dt_checksum !=3D ext4_dx_csum(inode, dirent, count_offset,
>                                             count, t))
>
> The code verifies that limit fits within the block boundaries, but fails =
to
> ensure that count <=3D limit.
>
> Could a maliciously crafted filesystem image provide an artificially larg=
e
> count?
>
> If count is unverified, ext4_dx_csum() might calculate a region size that
> crosses page boundaries into unmapped memory, potentially causing a crash
> during checksum verification.
>
> This issue also appears to be present in ext4_dx_csum_set().
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526233608.76=
00-1-ablagodarenko@thelustrecollective.com?part=3D1
