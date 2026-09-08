Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D930C152
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 04:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842710; cv=pass; b=rhkMgZj7x6wlzomMEYI72OJlcn0adwGlI92iGRYtVeDl23A1O/lvwVcAFDjXvwSinZZIhOw+LEJTHWzrqaGazwCYXXkSy1uUyos3PdDSOl4bsXcZPzaoGm7KVWgfF3gOavspFtMNEn2UDB2YEzKMPk/bqRc4p7BbcRkea8DLa7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842710; c=relaxed/simple;
	bh=BhoqelLA0SZQhL3W8H9XntAdaEDx8LHDQuj/4lBDOfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nu9/zB25YW4UGEDad06S3czIPjRU0wLHYxnNzty9qVrd4rwXfVxKqbWKFoeyqM2mSoBpOsSSde+J0KSMg+B+K80UYlfn46vqbhqmKN5tiboykCTNFxK/GEIzpQ0MpAFmMrVAf85eQE5ExrTwfrs2J3nEz48rJ9PEe5oPJliZzyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=F6gW9AcY; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="F6gW9AcY"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c250848d119so45418766b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 21:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788842706; cv=none;
        d=google.com; s=arc-20260327;
        b=O6W07WMuvWv7nAIwHQGyTUoXERDHeCttGwwU1KZBluFNuW8vnkHdGMT5DUMkCc7Hj7
         DmFQwkVU+rm2O7GJh23ZfH1mO1IOn8ErfDWuLPx0vTVxzdDdpkNX8VpbvHCfJWUs6HrM
         rS8z84htaRaXFIudYjmsc/DeKmNgPUv48dnravK/5Sh+mw96OGBVkqFh2qNwz2fZHht4
         /5YjWRBWD02ASogkC39HnSg0p4vAciyQ3QhFqs9X9BCgll44ozU6udWSSHNDiZVYdg/R
         pJDaAOZj61Uo6IqseirHcrmy25cbOznjHyja0UdUerpWTE6rLNshEL848JWbrTDuLh94
         zq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3rHo9ESoHXNd0UzaMM9hjklUasOY59724tGJSkfHmbc=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=SHmNECqXCmrkC0GEllgQ7pvLwUKRo9sIjtckzvoUIutfXc+Pyu2kEuJVQ2+eoo9m88
         gNamQmITk6jOogJXFDW6sFqqCZAWH3VOAEcOjafbP5goXrY8aXwMdjfUTBy0Vwi/LlCN
         ElXnk/4c6T9yGfLJbi1ylOzBGFBUTSWyqloQB52e5y7CKgRKGfVFz7givdGLUSIpu/Qr
         7HLrVZkNI9mralvqamgeP8mNG/m+AfUchr7PGt9kPa54fmmm445d4XrL3e8WjdwY1zJ2
         dHu8hlZP0qgTTmjyJxw2mb96fXol/T3CevrZKucr5Rr083U6qR9MfumK8gIT0DhjK8OC
         mn3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1788842706; x=1789447506; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rHo9ESoHXNd0UzaMM9hjklUasOY59724tGJSkfHmbc=;
        b=F6gW9AcYyFxVpCYY21jQDvFH3wtcPaCwc+0rR64ranjw7bZ8AInFQxC578FNDUBw9e
         0VvuNlTpzMDLk/Af0OSI8c1P/Tb+GyDVNeTtcoO2ObbAFUAa47TuS666FjvpCO6ZVuPv
         /Qo85mdWISU8cGPH51gavS6t944F3Pb39z40BIzFZLVw3A8Pm5R9b2cwQeVsOkKMCTXb
         miNsntTcZ06BRk9AH3ChM/Vrc48GBDxAVaYjE1FuDOYU3TsHosl5AzTRIWL2+rRf3PPS
         5GqWBdBVERajJy2slXvTlXZRmh5UBrCruZb2YhJsmtUlqfoudIP1XqBCwvo0DtG87fS2
         mE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842706; x=1789447506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rHo9ESoHXNd0UzaMM9hjklUasOY59724tGJSkfHmbc=;
        b=VeZXwNwS1LkCAliPfkehM5ZQ2D39Y4ZxDjCWsAxpSMABppApbeFEsDjsUBnack3weE
         2iNGPOqESvmLz3p6Jbn86WzX4iDzQ9+UeOTz6u8zmFTjqxM3eLgfv2dDnii1XLph9zzq
         C/91/Aa6JBPCwSDvfb163pkIO5+pHLutywwfy19ebNrD+Duq/+0XebDjRwmIOw0ppXK7
         CVDl50yTiF2L52mx/1iF7iq4JsutAmG6N7vwRIOlR09gzisJnyIhWe+77K1LT2/qvVya
         llmv5YF8iZLLZQ9enc6C+xh1+imMdQZ8ghlsmMkz4CIdm4npVKAClA6IFPFvSUszE2uz
         ldZg==
X-Gm-Message-State: AFuF++ltllu4N4K643PS7sGtpqfm+i8zF/tJekLIIFM6zXDmknKU6jqZ
	dAAokzmGdt7pkbiEb3nDDxGniMzNzGcBi0Fzva7/DztfsENhmm071l60oXq74f6/i45fP/M3KOR
	tnObV0bLV5JiMQsdwVevJ5Ts2JkzqJhpNh9PuoIjWJOjQkGVsdgrqqT/QlA==
X-Gm-Gg: AYBFou3RHoddxiZD03CMjOJ/83Nq3WFmSje5oGSBVzaOFDT9yZmPlJmWFalLmo+mFem
	NPsRaQbc/ppR8Uy23fAvzlacGN+1zIIT7sL6e/9OshNe5jG+zC1k7DD+Aa0R/OEKZpA2IzaLSy4
	ueS1gAErtH87LBQTv88s173UNebPRzEnBkNTfl6p4YuFS+Oqmfb/WO2idRpSC8IsftwWH0qjOCz
	yTaTjQRSBfta0IvpHaxjnaZ+yKpIziW5bEH8ytSvYrFU9wc6sP5szq3GcUpJHUw/HVaiJKAuLe1
	2AylCMIKhAlle0sXgFoSl05Nsa03aSlFxtr36eN/mkjB5W4bxcAPGK2hgGxbS2065/u91m4eljo
	gDK0lzYC2XgEa
X-Received: by 2002:a17:907:94d3:b0:c16:1290:11a7 with SMTP id
 a640c23a62f3a-c2624f0a534mr748736666b.1.1788842706538; Mon, 07 Sep 2026
 21:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907133929.1081540-1-jinpu.wang@ionos.com>
 <20260907133929.1081540-7-jinpu.wang@ionos.com> <20260907140031.C781F1F00A3D@smtp.kernel.org>
In-Reply-To: <20260907140031.C781F1F00A3D@smtp.kernel.org>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Tue, 8 Sep 2026 06:44:53 +0200
X-Gm-Features: AcwNN1UH1ToXGgiVaFhNPIYJsuOQ1CTBIOsRe4-FrEnGV7uGBHzzhpDdaajZFSs
Message-ID: <CAMGffE=pibzgtDnYSLXP08=PAv0OPth4u4v4juQb6iyvXF5hXQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] md: take q->limits_lock before locking and suspending
 the array
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 4:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] queue_limits_commit_update() return value is ignored and calle=
d unconditionally on error paths instead of queue_limits_cancel_update()
>
Will fix in newer version
> Pre-existing issues:
> - [High] ABBA deadlock between q->limits_lock and mddev_suspend in level_=
store()

Yes, there is a plan: thread a queue_limits through ->run() in all
five personalities so level_store() owns the update, the way
md_ioctl() now does. I left it out because it's ~40 lines across
raid0/1/5/10/linear and orthogonal to the deadlock being fixed here.
I'll post it as a follow-up. Worth noting the hang you describe is
reachable today without this series, since queue_limits_set() freezes
the queue while level_store() has the array suspended =E2=80=94 the freeze
then waits for I/O that mddev->suspended is holding back, no second
task needed.
> --
>
> commit ecb6e260e45c52011fdf103645ad33814409ccd9
> Author: Jack Wang <jinpu.wang@cloud.ionos.com>
>
> md: take q->limits_lock before locking and suspending the array
>
> This commit updates the block layer limits locking order for MD devices t=
o
> prevent a deadlock when writing queue limits attributes during disk opera=
tions.
> It takes the limits update before locking and suspending the array, passi=
ng it
> down into personality stacks.
>
> > Two callers still take the lock inside reconfig_mutex, both with the
> > array suspended: ->start_reshape() from action_store(), which suspends
> > before flushing sync_work so the update cannot be held across it, and
> > raid*_run() -> queue_limits_set() from level_store(), which already
> > hangs on its own because it freezes the queue while suspended.
>
> [Severity: High]
> This is a pre-existing issue, but is there a plan to address the ABBA
> deadlock in level_store()? When the array is suspended and locked, normal
> I/O parks on the queue usage counter. Concurrently, a udev sysfs write ca=
n
> take q->limits_lock and wait in blk_mq_freeze_queue() for the counter to
> drain, while level_store() holds the suspend lock and waits for
> q->limits_lock via pers->run() -> queue_limits_set(), causing a system
> hang.
>
> > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
> > @@ -3780,15 +3783,37 @@ rdev_attr_store(struct kobject *kobj, struct at=
tribute *attr,
> [ ... ]
> >       rv =3D suspend ? mddev_suspend_and_lock(mddev) : mddev_lock(mddev=
);
> >       if (!rv) {
> >               if (rdev->mddev =3D=3D NULL)
> >                       rv =3D -ENODEV;
> >               else
> > -                     rv =3D entry->store(rdev, page, length, NULL);
> > +                     rv =3D entry->store(rdev, page, length, limp);
> > +             /* apply the limits before the array takes I/O again */
> > +             if (limp) {
> > +                     queue_limits_commit_update(q, limp);
> > +                     limp =3D NULL;
> > +             }
>
> [Severity: Medium]
> Are we missing a check for the return value of queue_limits_commit_update=
()
> here? If the block layer rejects the new limits because blk_validate_limi=
ts()
> fails, the return value is ignored. This could allow the array to proceed
> using the new disk with old limits, risking I/O errors if requests exceed
> the disk's hardware limits.
>
> >               suspend ? mddev_unlock_and_resume(mddev) : mddev_unlock(m=
ddev);
> >       }
> >
> > +     if (limp)
> > +             queue_limits_commit_update(q, limp);
> > +
>
> [Severity: Medium]
> Does this code incorrectly call queue_limits_commit_update() unconditiona=
lly
> on error paths? If mddev_suspend_and_lock() or mddev_lock() failed, rv wi=
ll
> be non-zero but limp will still be set. In this situation, the code will
> commit unchanged limits instead of cancelling them via
> queue_limits_cancel_update().
>
> [ ... ]
> > @@ -8618,6 +8673,9 @@ static int md_ioctl(struct block_device *bdev, bl=
k_mode_t mode,
> >           err !=3D -EINVAL)
> >               mddev->hold_active =3D 0;
> >
> > +     if (limp)
> > +             queue_limits_commit_update(q, limp);
> > +
>
> [Severity: Medium]
> Similar to the rdev_attr_store() issue above, should this use
> queue_limits_cancel_update() on error paths? If an inner ioctl command
> fails, this will erroneously commit the unchanged limits rather than
> cancelling the update.
>
> [ ... ]
> > @@ -10419,6 +10497,8 @@ static void md_start_sync(struct work_struct *w=
s)
> >        *     https://bugzilla.kernel.org/show_bug.cgi?id=3D218200
> >        * Therefore, use __mddev_resume(mddev, false).
> >        */
> > +     if (limp)
> > +             queue_limits_commit_update(q, limp);
>
> [Severity: Medium]
> Does this safely handle limit validation failures when adding spares? The
> return value is ignored, which could leave the array with outdated limits=
 if
> the limits fail to stack correctly.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907133929.10=
81540-1-jinpu.wang@ionos.com?part=3D6
