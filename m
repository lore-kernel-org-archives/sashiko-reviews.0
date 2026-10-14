Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B01C84AB
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981229; cv=pass; b=djOpSK6ugcw3sg7NU89mwZpxM7IcOtb5Ax5yccefcNOmG6VgQoKEABtweTH2u4x82Boyh1lCHYm7/9a7OVrryqApXY0DBnvhsk7MtzdhQmFACjL50v5qvDpfA8ecOygpBcBlBF/+kbPN61LUDGHJdsNnWSedBXA3a9VGqx6NNbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981229; c=relaxed/simple;
	bh=5LQu2scU6Wzy7H+0+F4mLdz9KrGpX5VTW+VuvPiHq2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRS+CtGK7MD6eGti4WaTI3580ySg6ucpYrW7NFV3vUG0zVpLkvzwmcVbzXlhq6rd2WHM91Y6fQ+mK26Xbua9OBJX4Jy/SRjbhvANUbEqj9ORr3uveF7uPvGB4yanlJK9LJPsGjzhqgCHLX17nZLY8K7lbNyf0zF7JD+YbOlSyOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=ITzHfcpy; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="ITzHfcpy"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e38b61974so71419766b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 05:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791981225; cv=none;
        d=google.com; s=arc-20260327;
        b=iG7C6ouGyMwjiStTbrXSdV2aem6pfXLWtsz9M5HfVCtxQODTl06xjazuQFNewzkudH
         5Ee3XHnE69RxgOkgoIBFDTJY1iGBMqBoHXuv+C0eRqdTJx4I8iOhe66xcpvxshz8FgyS
         Am1cPHWntFgBMyrND315GSRMApFKo0AgLfzqK8NcFu8EF0Q2C+NW+MLjwqmp+O0uxN/d
         t6IKqsP5WlpODcF1jAx7nTMmtgmvmI1mCSdZv2SS04VkFv1UTc/YMbmex4PsJwInYXTV
         OFVcrPdcL9RuhM5MwPV/QSYwYZ3x925TLRMfjNhf7Hm8cf67A0ZVMwKPhhmMdFSMpxvp
         sRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xc6OYIsIblBkxyIfP1OcMrgJAKJXZ0gf3E+YejrIirI=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=B1vatt0ENCnMsrEh1L8K7ql/smHPNH1Le5HQOjQRnad5oQw2Yd2ZEMT6Yd5H3xvats
         VvVXMpIVNlO547LJUXKfDJtvFrC5gR55018IYaTTR5G61nUKk//1BBRgBTJGccWtS1Qf
         cHG18Jd5hngkG9ENveXL0GyyXmhYLwQyA/HI7fAEbOzPxCUDVqL3SxMqR+lOtO3NLh+x
         ERDNoC/Qah7pyNmV6Uxdhw7twaHN+EdEPbcRPdA0QufHSxwff7PpX2qTN7MbX9YKkRnQ
         Q8KsxN+oXLIXIqieeEkbzae4fJ0pK5AVUrZl3NlievZeO8K9VdQwPY3Fw6fyCWatrJQu
         S/nw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1791981225; x=1792586025; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xc6OYIsIblBkxyIfP1OcMrgJAKJXZ0gf3E+YejrIirI=;
        b=ITzHfcpy+LcY1RF5rblVooeOhR7h49U3ONNqC1+F+9q31+tPYMcF8SzbdplUlrLwC/
         6IsSGRYP0RkZq+nqulmwYML/CuUN3u1dTaugrt1HT2czbdC4OgoyxYLARp0s1BKz1/DB
         ii6xDfemCIuu5CjcV1TiHlXAq6wGAVPMjOlhazzy1LjuqrbCmBV0AqUxZ/JmDSSoE32N
         1VYWZJLqhHq3rybIt05ei1Pm6NePaGnNCpBOl5jehb9uYrf363Ybd9U3Pp6OyraHLPCX
         N4NHmuDNb8zB0JCoewq6y/mBamG8qvQyKHEx5g9TAO7Zk9wlM61IoKVtec6h7BW+iE2K
         IV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981225; x=1792586025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xc6OYIsIblBkxyIfP1OcMrgJAKJXZ0gf3E+YejrIirI=;
        b=ORCoM238skmk77uCUVxR9zx2pchkNFlyNkNHNh5/hwh1ppj7myHB+JjhjMfNxb0w2o
         HNRYQW1NcDFi2IkIIhtA8ny3UUc5vsTQ9tkFtq770c+Qqz66dh9BW1WIBO2yM6aX1L9R
         rnPmG9zL+mcqG71JETCR2FOWwS3vVFKOOfXvZr0EBjo791b6EyxWxJEFnKfqdty16IWr
         WTXzBnofJj2evkKEUt3XxRcNVnHUjQK/XlhLaCV4DLyebBTCP2Bfu2T51CKu8qJOqDVS
         ZFH72bheVXulzU9iSr/PjHtNCh8YvVS6k4584eB//0ASTj946qhodO42EAEu/e9gCn0X
         8F8A==
X-Gm-Message-State: AFq9FYKFwl3AOv/pYBgECPHA20OeWaA9hh9aBzzfb1/9mx8yd0HmcoQP
	xrsoyCxYPl6Oux74JWXe5KB/mYa14n5Ub7ESaR1p2ZM3kW9rTYxHWlPnovpnSx88Cfaie3akNli
	DDJpiHVbcmM5vHjNfqYWz3jQyUEYlQwQHf9SM41lQ5ffQUazmNOGBhWYPZw==
X-Gm-Gg: AYBFou1q/PePwFGlBviNT7BGxroQGTCC/QS2HU/30V3bH/C/r8zFQWlGE6ycj5KmZvf
	h/iKyBXA8qVlkWmwv0T6SDPtndwZ+mbVsV2jNa2rDz7qOD5mMDC3957ICmNJACqM/7k0n3+sqLN
	oME2Qdpi1sI0MGiJemjDFubSjeeJYGFsoeypKbHGuRn3ewJCEQiAinnWmKWXazljMRoKkwV+SVK
	5Ws8kQGJ0jmAtMAKgl6Rc8ZTIX0SZWLqRArYqoZbyWe4CrjMdHpNyayGtG5LUUXhKR66jlcZJPC
	/gFHov4bKNm3Umwl9OoNGb5jwklq2ryqJRSkcaJ/FG+utamgg4xxlrUAerIVM5ZPmA==
X-Received: by 2002:a17:906:c10b:b0:c29:5172:c532 with SMTP id
 a640c23a62f3a-c31a9f90cf0mr1591771666b.4.1791981225241; Wed, 14 Oct 2026
 05:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014114830.615589-1-jinpu.wang@ionos.com> <sashiko-outbox-171234@kernel.org>
In-Reply-To: <sashiko-outbox-171234@kernel.org>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Wed, 14 Oct 2026 14:33:34 +0200
X-Gm-Features: AclHuK-VUY2tO56miFi14QNouGTHw5CYl_-Mcn4FjH6FftaHezCVW9gFtUZ8ChM
Message-ID: <CAMGffEk1GDMquLszFvDC-KPn1827QjA-J9rVoKoHQm_H3Su3FA@mail.gmail.com>
Subject: Re: [PATCH] md: allow growing logical_block_size on a running array
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 2:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] md: Unbalanced mutex unlock on mddev_lock() failure in lbs_store=
()
This one is fixed in
https://lore.kernel.org/linux-raid/20261013141241.2257621-1-yukuai@kernel.o=
rg/T/#u
> - [High] md: TOCTOU race in lbs_store() bypasses opener check and deadloc=
ks via queue freeze
Second is valid, seems no simple solution, safer to lbs change when
array is inactive. I will drop the patch
> --
>
> commit 4267b7426d911d22ecfdc4aa203d879ce4f9a759
> Author: Jack Wang <jinpu.wang@cloud.ionos.com>
>
>     md: allow growing logical_block_size on a running array
>
>     Growing logical_block_size on a running array required stopping it
>     first. Handle it directly in lbs_store(), similar to
>     mddev_set_closing_and_sync_blockdev(): under open_mutex, refuse with
>     -EBUSY if the array is closing or has openers, otherwise apply the
>     bigger LBS.
>
> > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > index 680b34a63cb3d..c885d405bf466 100644
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
>
> [ ... ]
>
> > @@ -6026,8 +6026,36 @@ lbs_store(struct mddev *mddev, const char *buf, =
size_t len)
> >       if (mddev->pers) {
>
> [Severity: High]
> Since this check of mddev->pers is performed locklessly, can a concurrent
> thread starting the array race with it?
>
> If mddev->pers is null, we fall through to the bottom path and block on
> mddev_lock(mddev). Concurrently, another thread executing do_md_run() cou=
ld
> acquire reconfig_mutex, set mddev->pers to non-null, start the array, and
> release the lock.
>
> When lbs_store() wakes up and acquires reconfig_mutex, it does not re-ver=
ify
> mddev->pers or check atomic_read(&mddev->openers) > 0 before calling
> mddev_set_logical_block_size():
>
> drivers/md/md.c:lbs_store() {
>     ...
>         if (mddev->pers) {
>         ...
>                 return len;
>         }
>
>         err =3D mddev_lock(mddev);
>         if (err)
>                 goto unlock;
>
>         err =3D mddev_set_logical_block_size(mddev, lbs);
>     ...
> }
>
> Does this blindly apply a new logical block size to a running array with
> active openers? Furthermore, since mddev_set_logical_block_size() invokes
> queue_limits_commit_update_frozen() which waits for all active I/O to dra=
in
> while holding reconfig_mutex, could this deadlock if active I/O completio=
n
> requires reconfig_mutex?
>
> [Severity: High]
> If mddev_lock() fails (e.g., interrupted by a signal, returning -EINTR),
> does it jump to an unbalanced unlock?
>
> drivers/md/md.c:lbs_store() {
>     ...
>         err =3D mddev_lock(mddev);
>         if (err)
>                 goto unlock;
>
>         err =3D mddev_set_logical_block_size(mddev, lbs);
>
> unlock:
>         mddev_unlock(mddev);
>         return err ?: len;
> }
>
> Because mddev_lock() failed, reconfig_mutex was not acquired, but the unl=
ock
> label unconditionally calls mddev_unlock(mddev) to release it. Could this
> attempt to unlock an unheld mutex and trigger a lockdep splat or kernel
> panic?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014114830.61=
5589-1-jinpu.wang@ionos.com?part=3D1
