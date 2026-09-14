Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B0B4BEE44
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 06:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367501; cv=pass; b=TX2tWrdbanlJhj4nurTAZV2WYeP3cuwTHx5LsGTj1USZ3WrkiiPu7M8d6/ZySFsrD2FGLIZ43kGFLnVjtEBbCVn0ILEt7AmI/EsyybNdCjqK9jwd/iLPiNVRqEn9zdTxGtz+iK5qsI0//l7oLLqoCzJW4L+AiaQZ/hdD6ffTz+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367501; c=relaxed/simple;
	bh=V22Zgc/BmnQdYwcgJWNR4GTRkr0CMXB3OWtLmKtj1zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJlWC8gSFnh/E3bkW8mZczrNIkbjCDvOVhDxqpvBQG9FiES6dqKTmHxyPZ2U43uYTVbm1kuKmzRfjeMj2Up8IzC1jNOxCMpUlNpydBe1x5efZjoQiWbmklAHf5zZJGdVtuqDfAbL6QUzsmdMc0141k0mHQZhHbrqdUMHsYbKb3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Klek4B9j; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Klek4B9j"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a9d30c8752so1763893a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 23:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789367498; cv=none;
        d=google.com; s=arc-20260327;
        b=oe6HPSg4aYTfPgZbDQU0qm3emocU0/vl3AgPbwdJJeSq0/xVFP/c7U7MuBRCY1auEc
         2JCsSjFIXGfLlrPOIdATzbSkm6GPOX9B9Lo/DbOSv8zm19YmrHkfEf7r2u+5I62yKenc
         2b9Pp1llSngTGkuz2tXudXTPuWHGSDZQRzwHAt2aDofKXxLT3vi1B6OIWsXE7DLgIYG4
         PAlexKu/XuXReIuOWkGn4hBCnXb+YG7hXdGeR3To5jUQGtcFhumG8gyqswBuM5hXBLf2
         LM6icJGw00Dlg1sQXRHFJ3UVhylhT1ALsivM8gj4ma5kqJIpF+W3Igyi2cYtlKPz2Nvy
         GTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H1k8hbN7xc9rcGijhISE2nL9V09F7ReNGDz7FxIc72Y=;
        fh=OrnvA1a4t3/HPwWwQh2a6uxugalKSabxDHPY5ooI2bY=;
        b=X2PWWpbG0Zgn0iDDFFv0cR4o1qfscJbH1IGXU8WgfosW4kCZH5TzZqZjdhFHg+Rywx
         AdKsP9aZYnrBYrVy7FkYYcmqB3yYI6P2WFN6GFl+jboqcyJKU+LhpuoF2oK/45XJ8aUJ
         LkeVzLRXs1yE6BOo77bB8RtpJf6czma4c3anI/0fTHaoS5PzTnO8l+1dL7qdB9lBpnvE
         4Z7AwhT0aako+GW3Ll9zHIlGQCJnd4ks33oI3iF2rfuCHmU2VNHnzzh6uV1RVIN20Dd6
         l0h4xAwXPyMBywY8q1dDm8mZcyTKH5jfRzVygO2+6Iu3Czz0BIett6t+937ST5TbR8zu
         sHyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789367498; x=1789972298; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H1k8hbN7xc9rcGijhISE2nL9V09F7ReNGDz7FxIc72Y=;
        b=Klek4B9jOqaZbbZpcqN/YThpjYxFbjfvo/ir8jNS8+7kj3GT+V78KGnTzGQR8+qKpQ
         IhUkLhnn1r+Vq8R+87T0CWgAAEwx8lkPSFNCriDPU0Mscl+FfmkQjJOiUzMdeYJyvTrq
         S+yEMUtoYzewkjLQEzexEOScho+9xhVCOM1IWtnhHyPfifXuqb0BHowvTL2qOEl14+Sk
         DeCO54GUgmJwbSJ00LBaG8Nv8ajmOTKCeyewX7UYMrt99yw3LWR/8rAIwNWUXoZQeBxH
         6BR7ukEWb/+neJHgofkoKYJgGiavop6xMg9N8kSYjQuFCTsBvMRpW8TJHgBN1dYBoUUD
         l+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367498; x=1789972298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1k8hbN7xc9rcGijhISE2nL9V09F7ReNGDz7FxIc72Y=;
        b=Gk7wQiaaW+8Sm/RHMMC87rIAqdEk9PhA107BAfuVAR36zrZzEWm9UPi6FHg9lFZ42L
         o+ZrxGELmA6ICJ4SRYsF3QxVepnPZWTz4t6UTdprwCYFrX9YDtFKyhpiUCtv2r/DuX8I
         PCdd5JtnYoj3iJUfDLeIKv2PvCHivoCzCYyA38HgOCrGah9/t7NAoqXFwAWijb+5xOdA
         +i3WEbLs9uEHXNmJN52+XV2v2hgA0EAb+zAtkWxRMN3n38O9xvLN/Qi4V+Yp1Wu+7S9L
         M6WaXBy9TuiSGAPbWDmasEfKUUZM0LyZ4zrAY9biDv3nyqamly78JwEE+V+InC4USaAf
         MtfA==
X-Gm-Message-State: AFuF++klRvNvUgsxFiJ3gc6hNNi0wr2FwtaXRnvOw2bwbKbaoE2DUN7s
	pLzRovhtNQPqlWuoh6RovA/kqfkPjLfIUzMfZqfrqxIpvwYImq27v8Df3YhaJxNze2ZMgh9wViw
	7BGFksz4zDUjH6CYimF0TheuS7m1LOXo+f+cmtC0=
X-Gm-Gg: AYBFou1q9Yyl7DnliLwfgNZjcoxfWZ2gzZ77nX1oteqp6pA8soRSQyW7I1q/Zt8iebU
	Ft27TN0386xNGDcJXJjNAg6ufDo2IRmf7npXM+rmkrCCKBpVDhbXL3Wy72hZ/quznXrkPy3kEXA
	c38aun6KvcnyTitM10ZufCJheBCnAH+XB9kbaHUCvFBUUnYtVBLVkq35hnPPjdAtMa309vb25vb
	DRKbEkeA5ywQaEyk27rvYzgIzyCgB16M673tuCp6argHQ4xQObjGyv0LDrsL9ODwX3V/wUXF0pe
	bjq209VPCZ3jO6EKI9v78nqYpbgzC8StiJSbmqUsZeMD3PcDCpbBuSqwag==
X-Received: by 2002:a17:907:3e0e:b0:c29:5a76:72be with SMTP id
 a640c23a62f3a-c29b8731942mr66489666b.24.1789367497811; Sun, 13 Sep 2026
 23:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANypQFZ05tpth0Xc33gmP6jgPnkY4VuezyHcsajV-SqCsmN_gg@mail.gmail.com>
 <20260914034940.4070970-1-r772577952@gmail.com> <20260914040138.4F9E91F000FF@smtp.kernel.org>
In-Reply-To: <20260914040138.4F9E91F000FF@smtp.kernel.org>
From: Jiaming Zhang <r772577952@gmail.com>
Date: Mon, 14 Sep 2026 14:30:59 +0800
X-Gm-Features: AcwNN1XFb8F5qkILaFwO0oEm98biqcBPeylXE_DGiWpW2XO3wq86dlueovM_LKI
Message-ID: <CANypQFZfAsx=DHa4QXc6qA4aYqbobVL0-8cr2tMRD2wCdyJQjA@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: fix chunk number of the first chunk in a local
 quota file
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8814=E6=97=A5=E5=91=
=A8=E4=B8=80 12:01=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Integer overflow in `ol_dqblk_off` causes kernel memory corrupti=
on when handling large quota files.
> --
>
> commit 2099765d5af01f1f5c3b09601279d4461b5e883e
> Author: Jiaming Zhang <r772577952@gmail.com>
>
> ocfs2: fix chunk number of the first chunk in a local quota file
>
> This commit fixes a bug where the first chunk of an empty local quota fil=
e
> receives a bad chunk number due to an invalid list head dereference. By
> checking if the list is empty before reading the previous entry, it corre=
ctly
> assigns chunk number 0.
>
> Closes: https://lore.kernel.org/lkml/CANypQFZ05tpth0Xc33gmP6jgPnkY4VuezyH=
csajV-SqCsmN_gg@mail.gmail.com/
>
> > diff --git a/fs/ocfs2/quota_local.c b/fs/ocfs2/quota_local.c
> > index a2b276bcd0a87..eec0bffc77b0b 100644
> > --- a/fs/ocfs2/quota_local.c
> > +++ b/fs/ocfs2/quota_local.c
> > @@ -1075,10 +1075,13 @@ static struct ocfs2_quota_chunk *ocfs2_local_qu=
ota_add_chunk(
> [ ... ]
> > +     if (list_empty(&oinfo->dqi_chunk))
> > +             chunk->qc_num =3D 0;
> > +     else
> > +             chunk->qc_num =3D list_entry(oinfo->dqi_chunk.prev,
> > +                                        struct ocfs2_quota_chunk,
> > +                                        qc_chunk)->qc_num + 1;
> >       list_add_tail(&chunk->qc_chunk, &oinfo->dqi_chunk);
> > -     chunk->qc_num =3D list_entry(chunk->qc_chunk.prev,
> > -                                struct ocfs2_quota_chunk,
> > -                                qc_chunk)->qc_num + 1;
> >       chunk->qc_headerbh =3D bh;
>
> [Severity: High]
> This is a pre-existing issue, but while this patch fixes the uninitialize=
d
> variable that immediately triggered the overflow, does the underlying
> structural math bug remain exposed if the quota file naturally grows larg=
e?
>
> Looking at ol_dqblk_off() in fs/ocfs2/quota_local.c:
>
> static inline unsigned int ol_dqblk_off(struct super_block *sb, int c, in=
t off)
> {
>         ...
>         return (ol_dqblk_block(sb, c, off) << sb->s_blocksize_bits) +
>                ol_dqblk_block_off(sb, c, off);
> }
>
> The left operand is a 32-bit unsigned int. If a local quota file naturall=
y
> grows beyond 4GB (e.g., when a user creates files spanning over 126 milli=
on
> unique UIDs or GIDs), the quota block number exceeds 1,048,575. Shifting =
it
> left by the typical block size bits truncates the upper bits and wraps th=
e
> offset.
>
> This truncated offset is then used in ol_dqblk_chunk_off():
>
> static inline int ol_dqblk_chunk_off(struct super_block *sb, int c, int o=
ff)
> {
>         ...
>         return ((off >> sb->s_blocksize_bits) - ol_quota_chunk_block(sb, =
c) - 1)
>                * epb + ol_dqblk_block_off(sb, c, off) /
>                sizeof(struct ocfs2_local_disk_dqblk);
> }
>
> Subtracting the true, un-wrapped large chunk block number from the
> truncated/wrapped block number yields a massive negative index.
>
> This massive negative index is ultimately passed to ocfs2_clear_bit_unali=
gned()
> in ocfs2_local_release_dquot():
>
>         ocfs2_clear_bit_unaligned(offset, dchunk->dqc_bitmap);
>
> Can this lead to an out-of-bounds backward write into kernel memory when
> handling very large quota files?

This is a pre-existing issue that is out of the scope of this patch.

To fix the issue pointed out by sashiko-bot, the return value of
ol_dqblk_block() can be cast to loff_t before it is shifted left in
ol_dqblk_off().  I can send a separate patch for it if this solution
is acceptable.

Best Regards,
Jiaming Zhang
