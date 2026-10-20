Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792463913;
	b=xCL48UeNyqv1S3WOvif0670dgDpw36B6WEtQL+sI2+kIN6PeiEn4/QzUagBAJccwY+0t
	 YwFNpWp/HkjwvV9EWHaqMt0PTqRRZ9VdJaIu7Xs7icZ0ye5557c1JILq5HwOJ5B8JR365
	 6US45gf3dfF8G2J7BOa3jd1Fwk9kIgt0z7lSAtA2ErzbLGSs1mqydGqWrpzXtxQcPBHhf
	 KQIYOw0W91hyrEHvqWxAgev1NNUaTtKSy9AllojXIQd3oDooAVKlC+m+gD0mCQa/UNSH9
	 +yAYkycw3EX3bqgR/xRfM6Wfxt1qbDh9lpP7fW+AIiUCrzCizuhy6IUrCM/+rR0/Y+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=J107/MG0L9BEY7GdpFiHh99WJPRAIbD1LGDJrGM5+YY=;
	b=TrMLtcyxAPd24Fd9W1t146vO/kUQ+s1TdtnHlTCHPfGcwW1K1c24CAe5MjcsU04AzVPv
	 fnILo1RUli/HEndH5Jll0LipRwUYExg1n/9yz3ajUf4/kFMxdhxJo0dVzIjATGOxzMLRc
	 f7JIn/e86ChKWlGx0E30D+1OFp6ZD5YxWi1A98LXnrGgjiKqRrchOatYdaz4AY2eLM9D9
	 u+qRb9/8oP7F/Jtzi5jq45GvSA40oy1XQEWSD1AnsoURs5P4Mx8ULwlXwPOYHOYuO15Zx
	 A9Fzgyd7Mc1DFRdQb+kFdcmbO1UHdfvh8f++5GPBb9vAhmYoc2DgFtsZJOydZ8ZXcCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHQ4ADZF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B42606A319
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 02:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B42606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHQ4ADZF
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso336739a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 19:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792463912; cv=none;
        d=google.com; s=arc-20260327;
        b=bJJWd9cSAucjLfYDAvUUurdS3ayeaW3gQk7Wmo+PO0esjzJnTDtIE/TRn+Tw65VX/6
         xkUcXLNTEmJtUgEK2+rsFAPSOrojuX1VsiL9VLXms8BHpVFlSw722a3JAU/O/EnxrZXL
         7Gc4gv6hdXM66jDOwSOlZox2ZhenjX1UnilqwzOOLSlY8147cDHXG5qMMYQCTkyM4NaI
         t6rvrsf7kgCi8bOr51x6W9OLb096dMu69eIcw6bc3rqMWu3eEhTAi5ugcGGf9sli1wVO
         AX3nChgY0fB5GkwajpSf+QwG/xkiNk8og9pUGgZt/gQ/Bh4RMr5h8USjXMQUCRJ20IZ+
         U15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J107/MG0L9BEY7GdpFiHh99WJPRAIbD1LGDJrGM5+YY=;
        fh=OrnvA1a4t3/HPwWwQh2a6uxugalKSabxDHPY5ooI2bY=;
        b=K0lrDruE4Mj3kCPpqOkdxxVO4INVii9faLipR7vUQLqVF4hxXvm8T+1cie0Wikm0oq
         LbIAxaa/7iSyOibLdLGv6CiolJPbZfDN7Km5qStLmLbPBAs9VmuEpPI1j7xB047n1jxB
         x0GjRv1P8zEIfU2Lt+NpAbtxI/bOtqImvUkpf/9zNfXlbUo7+AFrQvrR1kfSgqp/J2i/
         yrIVSPecrFaVu4ssv/MFWCQTY2/9bMI9i5xm3WNzGjpK5Ac/TzTLryrd7y9p/fm6NmNl
         MC5Sgt/TyAXA69bMiLPBDs6X0wUcculJLpusgRUPZhlRFFdMAG17UHxt3Tps9ewxTkX6
         TJwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792463912; x=1793068712; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J107/MG0L9BEY7GdpFiHh99WJPRAIbD1LGDJrGM5+YY=;
        b=cHQ4ADZFPz+6djfDlcNvfXXwGacCLSNdKlFV7hwe6Ky/SlUgQNy37GdAah1DuaGDoB
         +wdkU1w6wqo7F9z8AB79XumLHGxBeolbzzs6AVuKocqYQunlJKO47Z2/a+f2b6L8wizA
         FZYrozPwz9HOEEpYqDvrhn7kOLOS4Nts9/TYtygON5M16cWeBw48m5wPfuyFawlC9GWn
         LxRmhx46rGbjFhOHmivuFGG10nsgs/nxxEJJbk0TAN+aw0Da4MQ6Y/9n1vPQCUVK97+G
         GhSN/8EmubtgBl/1tEB1xLaPlfjQXcM5UnwyFDbFuVeyrfW+lk0wta3Gy52cDSIZu3pw
         bKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463912; x=1793068712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J107/MG0L9BEY7GdpFiHh99WJPRAIbD1LGDJrGM5+YY=;
        b=x16dhEtpG/YWPcfswqDHfjGOrc+uqM/OJ18VqCSQLo+OlXf5sam/IOEHyFJCAyOKZ5
         oyzR7QljE+rVXjtuON1w4UzDGiJJWkyy7kzg1Sp5NS4gE0dV4EhPy8Rp6ZNMLvTlzJqH
         /pUEeUqz2ZkNobctDR2xDyxVErfOizQQJvIDwgRGyHUvIwY959hnVI5AnXUEaYyQcOU+
         1QB3L3sSMeYLLCA6EUCeNopjTMsb+EOvuAMSrPRJ5qOx6cp2JyUKf/Fm1SaXvzJwJvgI
         jdCmu53Ahizae65o0fGF3oKs2+9y1eOtbRni76KQ8mK3uswK9xm0S+LGfmgVdzouJ+Ox
         +MZA==
X-Gm-Message-State: AFq9FYIQyfnWv/T6ROyX1b6AxwByb/L2YN31mFZoBH7HHZ3X9wBtw1Po
	lw/BgYhDAPUwyYaHlRj+wBB58ro5CrvPj8xoEiJVYVghPtLsTcSCY1uuzVt+sdHiAhWByJSp6QV
	hVtOIfmyTouHum2/bNnB/E3KhHuQnAKkSOzepVCMZP2UZ
X-Gm-Gg: AYBFou0S/gJMhB0xtA+bLkXQqZtpBA7nTF+u0uMHKVS89oG0hEGJHqfRgjlDzykVPg8
	ghBD0FA2XAsd8uw2rZpiNyALVfACmrNMd//cH3iYU73mAyRMRM6A5jeKHbsxpxbNTNlrdzhkdoS
	Ks7u920NiuIu/yj6NgpNsqk8C/qLbAgh8Rl45tNlv39Mv6DW8el+zx2PZAE+Y5jkEUJbteWzM4n
	UzDFA1M64uM0DoBAOT/Ose5T7yOy6B6vA7m2bq/IKjF3DPQZH/7YSm/7ge7roQkvRIzRU2u0aPZ
	IwxHIpl7H9katBxkA+b/p67g7YqmIX6VJ6RmUlqpiTjPrJviKx4Mbz+b
X-Received: by 2002:a17:907:3d88:b0:c3e:2224:1b86 with SMTP id
 a640c23a62f3a-c4600c89846mr67586966b.2.1792463911282; Mon, 19 Oct 2026
 19:38:31 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CANypQFbjcxXjiigMCCyErN=DSEh3ZG3NMWRpq=Hic8KJ76cwew@mail.gmail.com>
 <20261019154732.3149351-1-r772577952@gmail.com> <sashiko-outbox-177895@kernel.org>
In-Reply-To: <sashiko-outbox-177895@kernel.org>
From: Jiaming Zhang <r772577952@gmail.com>
Date: Tue, 20 Oct 2026 10:37:53 +0800
X-Gm-Features: AclHuK9xTanrMKXcVDbtbv6P_5_f8RZwLrGbJctlpOoiias_DybYkbAsP2WAebM
Message-ID: <CANypQFaOY76j6xGSCVo1bJjK8PAbLr8kyTjFB0_xevMmn6LAxg@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: validate the block count of a local quota file
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8820=E6=97=A5=E5=91=
=A8=E4=BA=8C 00:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] ocfs2: dqi_chunks =3D=3D 0 allowed in ocfs2_local_check_info=
() causes OOB access
> - [High] ocfs2: missing i_size check for dqi_blocks in ocfs2_local_check_=
info()
> --
>
> commit 683dd402ce6eafeb214c5ae727da2f3410641b65
> Author: Jiaming Zhang <r772577952@gmail.com>
>
> ocfs2: validate the block count of a local quota file
>
> This commit adds ocfs2_local_check_info() to validate that dqi_blocks and
> dqi_chunks in the local quota file header are consistent at mount time,
> preventing out-of-bounds bitmap writes when extending the quota file.
>
> > diff --git a/fs/ocfs2/quota_local.c b/fs/ocfs2/quota_local.c
> > index f55810c59b1b1..bad913d8bc4f9 100644
> > --- a/fs/ocfs2/quota_local.c
> > +++ b/fs/ocfs2/quota_local.c
> > @@ -678,6 +678,30 @@ int ocfs2_finish_quota_recovery(struct ocfs2_super=
 *osb,
> >       return status;
> >  }
> >
> > +/* Check that dqi_blocks agrees with dqi_chunks in local quota file in=
fo */
> > +static int ocfs2_local_check_info(struct super_block *sb, struct inode=
 *lqinode,
> > +                               struct ocfs2_mem_dqinfo *oinfo)
> > +{
> > +     u64 hdr_blk;
> > +
> > +     if (!oinfo->dqi_chunks) {
> > +             if (oinfo->dqi_blocks =3D=3D ol_quota_chunk_block(sb, 0))
> > +                     return 0;
>
> [Severity: Critical]
> Is it safe for ocfs2_local_check_info() to allow dqi_chunks =3D=3D 0 when
> dqi_blocks =3D=3D 1?
>
> When dqi_chunks is 0, ocfs2_load_local_quota_bitmaps() leaves
> oinfo->dqi_chunk empty. Later, when a new dquot is allocated via
> ocfs2_create_local_dquot() -> ocfs2_extend_local_quota_file(), it takes t=
he
> empty list branch:
>
> fs/ocfs2/quota_local.c:ocfs2_extend_local_quota_file() {
>         if (list_empty(&oinfo->dqi_chunk))
>                 return ocfs2_local_quota_add_chunk(sb, type, offset);
> }
>
> In ocfs2_local_quota_add_chunk(), the new chunk is added to the empty
> oinfo->dqi_chunk list and qc_num is computed from the previous entry:
>
> fs/ocfs2/quota_local.c:ocfs2_local_quota_add_chunk() {
>         list_add_tail(&chunk->qc_chunk, &oinfo->dqi_chunk);
>         chunk->qc_num =3D list_entry(chunk->qc_chunk.prev,
>                                    struct ocfs2_quota_chunk,
>                                    qc_chunk)->qc_num + 1;
> }
>
> Because oinfo->dqi_chunk was empty before list_add_tail(),
> chunk->qc_chunk.prev points to the list head &oinfo->dqi_chunk inside
> struct ocfs2_mem_dqinfo rather than a struct ocfs2_quota_chunk. This read=
s
> the adjacent field in struct ocfs2_mem_dqinfo (oinfo->dqi_gqinode) into
> chunk->qc_num instead of setting chunk->qc_num to 0.
>
> On subsequent operations in ocfs2_find_free_entry(),
> ocfs2_extend_local_quota_file(), and ocfs2_local_free_info(), computing:
>
>         chunk_blocks =3D oinfo->dqi_blocks -
>                         ol_quota_chunk_block(sb, chunk->qc_num) - 1;
>
> with the corrupted chunk->qc_num wraps chunk_blocks around, leading to
> out-of-bounds bitmap reads and the same out-of-bounds bitmap write in
> olq_alloc_dquot() (*offset =3D chunk_blocks * epb).
>

This issue looks to have been fixed by my previous patch [1].

[1] https://lore.kernel.org/lkml/20260914034940.4070970-1-r772577952@gmail.=
com/

> > +     } else {
> > +             /* Same as ol_quota_chunk_block(), but in 64 bits */
> > +             hdr_blk =3D 1 + (u64)(ol_chunk_blocks(sb) + 1) *
> > +                           (oinfo->dqi_chunks - 1);
> > +             if (oinfo->dqi_blocks > hdr_blk &&
> > +                 oinfo->dqi_blocks - hdr_blk - 1 <=3D ol_chunk_blocks(=
sb))
> > +                     return 0;
> > +     }
>
> [Severity: High]
> Should ocfs2_local_check_info() also verify that oinfo->dqi_blocks matche=
s
> the block count of lqinode (for example, against
> i_size_read(lqinode) >> sb->s_blocksize_bits)?
>
> During mount, ocfs2_load_local_quota_bitmaps() only reads the chunk heade=
r
> blocks at ol_quota_chunk_block(sb, i). If a crafted image has dqi_chunks =
=3D 1
> and dqi_blocks =3D 10, but lqinode only has 2 blocks allocated
> (i_size =3D=3D 2 * sb->s_blocksize), ocfs2_local_check_info() and mount b=
oth
> succeed because block 1 is within i_size.
>
> When a new quota entry is later allocated and no free entry is found,
> ocfs2_extend_local_quota_file() extends lqinode at i_size_read(lqinode),
> and then looks up logical block oinfo->dqi_blocks:
>
> fs/ocfs2/quota_local.c:ocfs2_extend_local_quota_file() {
>         status =3D ocfs2_extend_no_holes(lqinode, NULL,
>                                        i_size_read(lqinode) + sb->s_block=
size,
>                                        i_size_read(lqinode));
>         ...
>         status =3D ocfs2_simple_size_update(lqinode, oinfo->dqi_lqi_bh,
>                                           i_size_read(lqinode) + sb->s_bl=
ocksize);
>         ...
>         /* Get buffer from the just added block */
>         status =3D ocfs2_extent_map_get_blocks(lqinode, oinfo->dqi_blocks=
,
>                                              &p_blkno, NULL, NULL);
>         if (status < 0) {
>                 mlog_errno(status);
>                 goto out;
>         }
>         bh =3D sb_getblk(sb, p_blkno);
> }
>
> Because oinfo->dqi_blocks is still beyond the newly extended i_size,
> ocfs2_extent_map_get_blocks() treats the unallocated logical block as a
> hole and returns 0 with p_blkno =3D=3D 0. ocfs2_extend_local_quota_file()=
 (and
> similarly ocfs2_local_quota_add_chunk()) then calls sb_getblk(sb, 0),
> zeroes the buffer, and journals it, corrupting physical block 0 of the
> block device.
>
> [ ... ]
>

Sounds reasonable, will be fixed in the v2.


> >
> >       /* We crashed when using local quota file? */
> >       if (!(oinfo->dqi_flags & OLQF_CLEAN)) {
> >               rec =3D OCFS2_SB(sb)->quota_rec;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019154732.31=
49351-1-r772577952@gmail.com?part=3D1
