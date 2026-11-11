Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794405401;
	b=M/rVRNl1wtdX6AveFMQidZxKoiAQztb0u+XU8Ujb123dD6/B5A1RweQjybD50/RKCu0b
	 aP37fPZkoqtMY+x0ewALy56/9px/T//da/lvZp8rWvpn73P3n7ODouxrm2HIVs9oH4/Aa
	 gTEze31zvGGxPqDCe6DkWr2YcjaTSZMVBdimC28YTnrJyrfc01FX0310JgAvTetyq7/lJ
	 64sMPUcUF9srbS+eldAthpcZvFNnh8v0Q4C/2tuGq4+i4eJkrCPn9QDk8nluR6CeujgE6
	 EtNUQkFVDXYutlQINGUWWKlzGXkH6DvKZAYmjycQ/lB9moB5A099eolLMqbueymu8ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=oRF2guphEyqLr1O9h9fq+s+FW78qBgZ0/k6wviHnruU=;
	b=r58HGgL4AfDUL9w280genlNIssRIoM2ewMXPWGy9ZuuR/4lB3tM18X1i/UNEpIwNHGhA
	 sktsJJmcPAVJ9jbqjaBhlBGDcxfQdenZBEcYytbA7X3Oq+VMNc5O5mRZESpQFxqh1PsL6
	 YUKI8yfL4GvichKEBVzfRPao9qpR5OQKnK7rr3JjYa1ImY65i+YWNhuWedm444/dDEXmc
	 k4PKOTo1CdTvssyLwIB1l6MHGbFaeSla8rQK5x6F7gJ45piJcstd6EYodUEEacvqNZqO2
	 K7Bum+W2cTF0td4yx5Ko+sy/PDtp0DEFH0OS3SdJ/pSX5pH8fZrHooF77C7ir5LMjmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y9pYz1F6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B68606A33F
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 13:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B68606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y9pYz1F6
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so31716505e9.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 05:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794405399; cv=none;
        d=google.com; s=arc-20260327;
        b=Iw6yh8y26K6FDPuoE/RtVLMLZqrcdinIBO+jNPaKmHHZn7r06vhv4FnsCbhROdQNb7
         Poo7+XDFWaxXIglu/VFc+cxbIdIOzvqN5uneiHDKhggxXAzYJPYDy6qVC6CWXjJg4/6r
         ijI1ClRMoJv4yaNgmg8VUSgAzFEfVAOHPcWy+4ZeY70vi1Qbrq0wepxLoGdDSE9k8QMc
         stwm4DIEJ3aGQLNvyBjlYsQe5KpC5vPR5lUb0XoA8zsFASy2Fg62qpMng2rZUxA0mZvH
         gyacd2EjnR/7n7DipRfGVjDRRTbMce+TAaYzXBw1hPJPjeVHB6qwjuzrS3mBjZA3a7NA
         G2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oRF2guphEyqLr1O9h9fq+s+FW78qBgZ0/k6wviHnruU=;
        fh=Yu0Dfym12co158fxrW/f55mYiC0mlWJv2B2E0RkxqOs=;
        b=nW3RB21KEMnIhXkBGx8/u1L+Fu4RWdAPqnZNpxFbkpujPAjJyiwTWZvebJjQrbeOQd
         vClHeyzuMxa+iPWz+BTBNRtym1qe+oeqGMksOJsMZf6UhI2Ioqg1lcSi81AbRK1eM58g
         yWRAORGXl785aniLYyikJR8ysJlzNl57dasGsMPZJX8eGHMkxdNCUy5Lt4G/ptN1r8+i
         WCEAbfRbWMLHz+fiSHXH9DiWRfTYe1ZBV/fcNPU5w4rkDem+PhTiOsvheA76aunPfF4g
         Rtaxy7ACyE7/PXAeU4FNV4b6ci72MoS9e/U4f6nHpuxr/QNmM+KOPHmuJjwV6vxWDrnt
         qpsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794405399; x=1795010199; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRF2guphEyqLr1O9h9fq+s+FW78qBgZ0/k6wviHnruU=;
        b=Y9pYz1F69ntzW31kyyqgzvmrG4K74iytoCtLuwu07XHU4eSjnf0mGcNVztPFiFq+g/
         aP4Zsrr2kSw81kuwlrNeKzGPTxFboA1QkqTUmCYqyB9sgUG3w4/dVbHP31tWo+Jrojye
         4A5T6gWM9bow2aYVUuIr994/6baUgwxEmwZ541UMa/eBqLG9rSQNBkKryNYoLc2FWhok
         PHkbvSdke7aGMnvA6nIXOspUvyWLuRdrK65Y+szvSN/WXjcYtaU2WMRi+f8JKHkbrlpJ
         B9VSYDfrQ7VXlYeFvErr6U87WAYoEoXKz9JqOzQQrxLCNikKiTVgyxHpTq1Cfv5NCezt
         yD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405399; x=1795010199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRF2guphEyqLr1O9h9fq+s+FW78qBgZ0/k6wviHnruU=;
        b=QYK+5ipraFmf5Lxw4u/ieuKSmrK9606aARCrt0LgfxpQAzFEBT8BxjKGcQkGzWs8ef
         zJjf6MTxJlkN68CY0P51ywyaYVYwuQaqQM++hkjKZY6QeXxSvuX3e8VTY0MbctrtpAlw
         NcyLYVmACZG3K9vr2VpsPNO3OQitteqSuLTwQjACK8DUCGrvD0U52WhMKtGICtEFL7qS
         2yLhw5uemgU91L9gYtJTA2VdC2zdABTppftajtvhu0GbvsR8/KO8tlpf2W++Kpuh/cJu
         1E6u7b3Q/43DCLgtirwwXeXyotksMeH7EFCe8f5LTrG9Oz8Yjazhs+w1EBKSdLwu1yH0
         hdLA==
X-Gm-Message-State: APuU4Z8SsQa7BjNnQqupmDe9yGBFdtro8pxVlEyuSRic3FYp/trsE6TI
	2k5AZKZZ9/qXPLoFz43rCplZmUYi0X44Y7LF+g4p9OulwcV+X2fgbrPTBUolHNlZ6VOdNoozJBl
	vvUtCCCsvI1C2etASm1+1M84jvDMIg1Y=
X-Gm-Gg: AYBFou0CDJTZ0Fn3nqFlYVRdRrJRKMGhtNM+przjQjj6Wa8X+pykMczoBRfFmTgkdW+
	dtl8uawpeh6SIjOVouI+vS8d0xadnXhF+7TqzujfSh32GiViQamyRAfEgayXd3h93rSFwBXmp20
	7bLENBAP55RbLlG55fYU1HJCaMaraTeMXK/OFupPUwaSHNmNqUDEGBwS872W4uNOduIpNsfyyMm
	bKGmL8Ac9L4HLhQv3OaWOAFq4bjsJAXmE9zTHpQYYTVqYZgTaf6kwGfaHxHZ0cMm6EIQFEzo5kS
	AxbTrNB1nQ1h98pAubqwGlP2enq45HXYkJLb4r9NXjiXQf7tu3+FlXYWSta2iOO/UR7K1/r2k/P
	Y3+cj+ZbjwalciKLkAmkEIfXnxMaE5iNc2uqB65jaGbmrj0lq5JeH6EZL+88=
X-Received: by 2002:a05:600c:3485:b0:4a5:a5ca:de1d with SMTP id
 5b1f17b1804b1-4ba093a9321mr49991515e9.30.1794405398960; Wed, 11 Nov 2026
 05:56:38 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-6-2f44f64f0b66@kernel.org> <sashiko-outbox-191225@kernel.org>
 <CAKFNMombDWkJ=m+CjMy7qnd_yy-vZ9c-EE7R95HKKkcy-M0+SQ@mail.gmail.com> <20261110-deformation-knabe-geltung-3bb7600eaead@brauner>
In-Reply-To: <20261110-deformation-knabe-geltung-3bb7600eaead@brauner>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Wed, 11 Nov 2026 22:56:21 +0900
X-Gm-Features: AclHuK-kg_k64kD5D3ppXkSngFLDCk2NlJ0a-lNWh9VMpnIyjECtxc1ueGN5wqg
Message-ID: <CAKFNMomUbm3JUBy2GthZwAuFZWh5TSb7i0+g8u1qv1aRviqdaw@mail.gmail.com>
Subject: Re: [PATCH v2 06/34] nilfs2: don't set SB_RDONLY after filesystem errors
To: Christian Brauner <brauner@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Karl Mehltretter <kmehltretter@gmail.com>, dsterba@suse.cz, tytso@mit.edu, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 6:56=E2=80=AFAM Christian Brauner wrote:
>
> On Wed, Nov 04, 2026 at 02:32:10AM +0900, Ryusuke Konishi wrote:
> > Sashiko's point here has a valid aspect.
> >
> > This inconsistency can be resolved by inserting the following handling
> > logic if sb_emergency_ro(s) is true:
> >
> >        } else if (!ctx->cno) {
> >                 if (nilfs_tree_is_busy(s->s_root)) {
> >                         if (sb_emergency_ro(s)) {
> >                                 if (!(fc->sb_flags & SB_RDONLY)) {
> >                                         err =3D -EROFS;
> >                                         goto failed_super;
> >                                 } else {
> >                                         s->s_flags |=3D SB_RDONLY;
> >                                 }
>
> Meh, I'd not set SB_RDONLY there. Because it changes the read-only state
> outside of reconfigure_super() which is precisely what this series gets
> rid of.
>
> The superblock can be frozen at that point, e.g., when the error hit
> while it was frozen, and then thaw_super() leaves s_writers locked again:
>
>   mount /dev/sda /mnt
>   fsfreeze -f /mnt
>   <error>                       -> sb_set_emergency_ro()
>   mount -o ro /dev/sda /mnt2    -> SB_RDONLY on the frozen superblock
>   fsfreeze -u /mnt              -> s_writers stay locked
>
> It also turns the superblock read-only underneath the existing
> read-write mount without sb_prepare_remount_readonly().
>
> The busy-tree branch does what get_tree_bdev() does for every other
> block device filesystem. A second read-only mount fails with EBUSY and a
> second read-write mount gets the superblock and every write fails with
> EROFS. That's what ext4 does since commit d3476f3dad4a ("ext4: don't set
> SB_RDONLY after filesystem errors").
>
> If we want the second read-only mount to work I think we should do it
> for get_tree_bdev() and nilfs2 alike and treat the emergency state as
> read-only in the comparison without touching s_flags:
>
>         if ((bool)(fc->sb_flags & SB_RDONLY) !=3D
>             (sb_rdonly(s) || sb_emergency_ro(s))) {
>
> But I'd do that on top.

Thanks for the detailed explanation and the concrete scenario with
fsfreeze; that
makes complete sense.

While the "s->s_flags |=3D SB_RDONLY" assignment in my example could simply=
 be
dropped, your approach of treating it directly in the comparison looks bett=
er
as it is more conservative and natural.

I also agree with aligning this secondary mount behavior across get_tree_bd=
ev()
and nilfs2 alike in a separate follow-up series on top.

So, I am completely fine with keeping the current v2 patch as-is for this p=
art.

Thanks,
Ryusuke Konishi
