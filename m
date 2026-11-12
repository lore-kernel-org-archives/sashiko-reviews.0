Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489355;
	b=NgLE3j6beFc65GceZTFse3kbEg0J1RmrbneLSm7Ix24d0pSj+DiWoCO6p/R5RcCn9CKv
	 KeT/OSgJSArl8mtdST0JlsXx1wrG7rOVjIUTSpjGZVmj+TfUHc0IBbGEkYPJEosbtIAmO
	 PJefLWwsHyN1tXS2HZTutjmeCoDNCcFJsKlurJUbya1BSzjcsecWkiSMxnNemSNyZUjpC
	 jJ72OR/Y3lcYKbmCtRGgrTN6e4525mri83Rv0T6MM44KyORWy4qYG1JjAX+FYojNmoe3B
	 JA+LOr6RoIM3QWM9gHIqVrFtDh+uFj24dtmCmoRzYcFzkg9Rfo+bXgSK/vzdGhtXrIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jAZcQQUpnQ9GKTr7ms5g7gJOwcuBaJvlyqVQ5mDpxJQ=;
	b=pFnET6pXAPB8lXCE1+W875Mi+GPc8ZQsjZ6Myh260R3JBQdBNlh7xEYSGZggvH9ZBsyq
	 XH3kVR/6oW3wAWZDMNDUb9BPjsK1xl6S00oFUBhcv4PB1maBbwAqpe290KHIhaRC3v5jS
	 zigMdkmPEyDnoqSQjcfmg2m/ZAl/eQtKKdjaYci59w7nYwTWuhZvVzxx1Muv6eeq8FVFh
	 7y7TqP+yyF+tMqTUCvinme9SW4F/jbWKpSe1TiVu0/VR2yBZNZ34V8IL+GbLz6Vm4yZZF
	 x9Up+pfCtTsMN4TVn9XqfDV1UtMlwjqHo+lfU/cm2rtCiay4IwdUWRRnX632kFb2Z6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhCK65fP;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A709A606A32A
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 13:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A709A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhCK65fP
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so37515295e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 05:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489353; x=1795094153; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAZcQQUpnQ9GKTr7ms5g7gJOwcuBaJvlyqVQ5mDpxJQ=;
        b=vhCK65fPMvAkTIO9rtrSchECShINw74+4ZSJZqDoOvWcXYs2pPO3uCDvQE2IaTUoAS
         1f3eiTrLuGHSdI3OP8kMkcCjoLvuNQzvXY7M8WIGSSyGcQwznq2y6NYHULsWw2wxqlJm
         LP6u4aG1b9MGsT+neNoYAhq7gY7+JbpUPX+8b1KYf1zzsy8ICw0yoLsqCz4Rw0OKKxkC
         E3JFeW6bYouVG1l+9tPWYQ1mZDtJyqmZvGVj5p1EFmLU+ZmGNz2eroNqPyJ1sVldOzlf
         loBtAMO/gxuX/vwbES4wSXfUAlAuniOrWuuiHiSbTl4sg6VOteAf6kRDzbEeEHAPnsG2
         N7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489353; x=1795094153;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAZcQQUpnQ9GKTr7ms5g7gJOwcuBaJvlyqVQ5mDpxJQ=;
        b=To0zodZisvy5Qdow7IXvyHkl+z4YFafwr7NdNdhAFGhg7MAxIFDxTxmUaGDKkBM1GQ
         Iz4RasAc0ikpZbzM+Xt6wrSL28ygexH3rf8mvnKPE8iKykPx/U9N3LXgT706D1OpnHW7
         m/xFsT4g3beOh1zcJelHwww51fZvQ9+JcbyF+EJNE8v7l6ZzZdWDyynpjjiVsSD8nSdx
         S0DhdCNDA2Bzj8jlbsTn2HtYML735Gwq16DSYKl4/CE0TgkwZ9cT6GovIcRWE9Gj6EKF
         AcEmVhQzA7PR57/akDepS9ohY9TPjbjaeWlvV2/thhALHYgxKfh4AeHWgnHniLu0xQVy
         KuFA==
X-Gm-Message-State: APuU4Z80d0qJBhUgZ+k70C23rW1ByqFXDzvkAGIvGyKOfX0XswMVhO8g
	h45OBrkyHRTcvqvxdEsIJ+LuKg4cI+n5x56XZ3ft4fgx7XRC6mawVYX0BA1Ctw==
X-Gm-Gg: AYBFou2RdV29v6pe90IaIDSujw6us1aZpAniBi7ceo3BODDMzXTFh2n6jigt26A63id
	BJKgW4WW5OCnapgmDFyKPe3ZTL43SkGwX1T84tE1m1CQaC115MfGjvJ6GlNNiCwfUChv00dTAS1
	7sh3UNly7e3rTHMeIydCb6N38Gt9627/HbGycbog++1tfo5Dw0RpbWN+DMAQA++C+ATPtiDNkYA
	ELVQ/qxdBET1qrfk7Hc1gy18sXzY6nzfsIYzy57VDMj9moMaLLdN6zmg74Bv5oryFwlMzO28Qnw
	hSw4i5CLnhQHXzj5vx0G9rmeRXwz5azd+c4t/dr6wLxXoPZ7D4K43lnCYRaDUqfdgS5iBpSy8EQ
	Lfbu3FWlG6tJ6VVmNj2AE4/kJ3Q/TiQBaX/ApWaQUn8663o9LBpqZqQNrKnOMZyyhztFp7qYq/H
	wrEX0rrOXIiRT829uhKVB8xmwg/Ka6JvaH0D4Ga3NIBYnpVFf3niMTzVoIbBwjQDlGNgDmevoAi
	LNIH8qfEZEVuUeyQ0bPQOz6g/tbuCS3Rr2hWnyuC5pKcw6t9wmjwdiMi/J1vLdJwd0+m/kBVUSq
	0Vn6Std+xZCR2fvc0uHFgOHCdyTDyghyDhhDfauTYEkMTtuUW6B2IHbHWU+6+E47Lza7ovM3UEL
	SHyQAko+O
X-Received: by 2002:a05:600c:810c:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ba09364b9emr102437525e9.6.1794489352840;
        Thu, 12 Nov 2026 05:15:52 -0800 (PST)
Received: from Abds-MacBook-Air.local ([195.72.110.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm74401895e9.12.2026.11.12.05.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:15:52 -0800 (PST)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Subject: Re: [PATCH] md: make mddev_get() fail until md_alloc() has finished
In-Reply-To: <sashiko-outbox-211074@kernel.org>
References: <20261112114958.2244-1-abd.masalkhi@gmail.com>
 <sashiko-outbox-211074@kernel.org>
Date: Thu, 12 Nov 2026 14:15:51 +0100
Message-ID: <m2tslm1988.fsf@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Kuai,

On Thu, Nov 12, 2026 at 12:13 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] md: premature KOBJ_ADD uevent in add_disk() while mddev_get()
>   fails
> - [Low] md: stale reconfig_mutex lock and comment in md_alloc()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Medium] md: kernfs_node memory leak in mddev_unlock() [1]
> --
>
> commit 2ddaaecbff58458e8c38353164498300daf7d131
> Author: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
>
> md: make mddev_get() fail until md_alloc() has finished
>
> This commit adds an mddev->sysfs_live flag set under all_mddevs_lock after
> kobject_add() succeeds in md_alloc(), and updates mddev_get() to fail unt=
il
> that flag is set.
>
> Link: https://sashiko.dev/#/patchset/20261029202209.1422567-1-abd.masalkh=
i@gmail.com?part=3D4
>
>> diff --git a/drivers/md/md.c b/drivers/md/md.c
>> index 03e35386a8028..47118e9d1a656 100644
>> --- a/drivers/md/md.c
>> +++ b/drivers/md/md.c
>> @@ -641,7 +641,7 @@ static inline struct mddev *mddev_get(struct mddev *=
mddev)
>>  {
>>  	lockdep_assert_held(&all_mddevs_lock);
>>=20=20
>> -	if (test_bit(MD_DELETED, &mddev->flags))
>> +	if (test_bit(MD_DELETED, &mddev->flags) || !mddev->sysfs_live)
>>  		return NULL;
>>  	atomic_inc(&mddev->active);
>>  	return mddev;
>> @@ -6432,10 +6432,16 @@ struct mddev *md_alloc(dev_t dev, char *name)
>>  		return ERR_PTR(error);
>>  	}
>>=20=20
>> -	kobject_uevent(&mddev->kobj, KOBJ_ADD);
>>  	mddev->sysfs_state =3D sysfs_get_dirent_safe(mddev->kobj.sd, "array_st=
ate");
>>  	mddev->sysfs_level =3D sysfs_get_dirent_safe(mddev->kobj.sd, "level");
>
> [Severity: Medium]
> This problem wasn't introduced by this patch, but when
> legacy_async_del_gendisk is disabled, does mddev_unlock() leak
> mddev->sysfs_state and mddev->sysfs_level [1]?
>
> md_kobj_release() only calls sysfs_put() on mddev->sysfs_state and
> mddev->sysfs_level when legacy_async_del_gendisk is true, and the
> !legacy_async_del_gendisk teardown path in mddev_unlock() deletes
> mddev->kobj and mddev->gendisk without releasing those kernfs_node
> references:
>
> drivers/md/md.c:md_kobj_release() {
> 	if (legacy_async_del_gendisk) {
> 		if (mddev->sysfs_state)
> 			sysfs_put(mddev->sysfs_state);
> 		if (mddev->sysfs_level)
> 			sysfs_put(mddev->sysfs_level);
> 		del_gendisk(mddev->gendisk);
> 	}
> 	put_disk(mddev->gendisk);
> }
>
>> +
>> +	spin_lock(&all_mddevs_lock);
>> +	mddev->sysfs_live =3D true;
>> +	spin_unlock(&all_mddevs_lock);
>> +
>> +	kobject_uevent(&mddev->kobj, KOBJ_ADD);
>>  	mutex_unlock(&disks_mutex);
>> +
>>  	return mddev;
>>=20=20
>>  out_put_disk:
>
> [Severity: Medium]
> Does making mddev_get() fail until mddev->sysfs_live is set cause a
> regression where udevd or concurrent openers fail with -ENODEV in md_open=
()
> and -EBUSY on md/ sysfs attributes right after add_disk() announces the
> disk?
>
> kobject_uevent(&mddev->kobj, KOBJ_ADD) is dropped by dev_uevent_filter()
> because mddev->kobj has ktype &md_ktype rather than &device_ktype.  The
> KOBJ_ADD uevent that actually reaches user space is sent earlier inside
> add_disk() -> add_disk_final() -> disk_uevent(disk, KOBJ_ADD), right after
> bdev_add() publishes the block device inode while mddev->sysfs_live is
> still false:
>
> CPU0                              CPU1 (udevd / opener)
> md_alloc()
>   add_disk(disk)
>     add_disk_final(disk)
>       bdev_add(...)
>       disk_uevent(disk, KOBJ_ADD)
>                                   blkdev_get_no_open()
>                                   md_open()
>                                     mddev_find()
>                                       mddev_get() -> NULL  <-- -ENODEV
>   kobject_add(&mddev->kobj, ...)
>   mddev->sysfs_live =3D true
>

I missed this case. Do you have a suggestion for a better fix, or should
I just drop this patch?

> [Severity: Low]
> Since mddev_get() now returns NULL until mddev->sysfs_live is set after
> mddev_unlock(mddev), md_open() can no longer succeed while reconfig_mutex
> is held across add_disk() and kobject_add() from commit d1472ca2ca5d ("md:
> don't hand out the array before md_alloc() has added mddev->kobj").
>
> drivers/md/md.c:md_alloc() {
> 	/*
> 	 * add_disk() makes the array openable before mddev->kobj exists.
> 	 * Hold reconfig_mutex until kobject_add() is done so that ioctls
> 	 * issued in between wait instead of using an uninitialised kobj.
> 	 */
> 	mddev_lock_nointr(mddev);
> 	error =3D add_disk(disk);
>     ...
> 	error =3D kobject_add(&mddev->kobj, &disk_to_dev(disk)->kobj, "%s", "md"=
);
> 	mddev_unlock(mddev);
> }
>
> Does this make the comment and reconfig_mutex critical section in
> md_alloc() obsolete, as well as the commit message's first paragraph
> claiming that ioctls such as ADD_NEW_DISK can run before kobject_add()
> completes?
>
> [1] https://sashiko.dev/#/bug/linux-460ea5ed-96ea-49a0-8383-cfa84f28520b
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112114958.22=
44-1-abd.masalkhi@gmail.com?part=3D1

--=20
Best Regards,
Abd-Alrhman
