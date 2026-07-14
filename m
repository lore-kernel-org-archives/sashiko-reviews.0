Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB91DD0EF
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 01:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783992621; cv=none; b=YgOtWb6NY2S+7coNQZTwD9/fEgvTT/eJlmFAY1otCX6Z0agMqW5EA+8a/xCq4aOt16D27c8qU5/V8APuR430ldTI5dFa4mfYEwsoxs5g9zWIAsDKeHsv9gypTbkMF3WyCMFg+DL4qQkmm2iVBTq7Jc610D6jGtlbUgwdHeVSsXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783992621; c=relaxed/simple;
	bh=a9DWazs9/MC5PYLQ/mCaTV4MuuSwH8woy8xm/jWnw8c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dJ2UPwEr9Vym9U8i8P3kmo78ZB/AIjSNgqBvWApsU1WWThfYHmKim7yEJLS5S3WN4Rr5A0nEq10kE+GlWiKpPDtBSd7H5aBQLfFBRtiMtDo2Q/sCO7I/D0NCxPAYlkQEhDtuvIE8kaEu/5FxSJL9sAL1U4UKWsWAPpGwSMdXfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sa649bsz; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sa649bsz"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6984787eeddso3735033a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 18:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783992618; x=1784597418; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YKrB3Ft0I68hztrro83NH+VbLgEvLq/HYPor88aI49c=;
        b=Sa649bszhMgBKfr0UNIza7ycpOAQen13nVKqtoKXs5sSlWtndnGw95B6kI/HUpcRmQ
         hq8SCfnw3vSDTBdiAQJOkN6j2VoaArvtu1XEKr0BZWT8Z4wbsHEevsne8GsR8he2v3/u
         wLq6mLC+mk5Qk79pYkHJUmUh5EjWrOO5ZIYpY8iH7jgSXKoQZbGQcX9O6Mkxxx5SgfMl
         PY63Knv57yUahC6ivknvsr1mVA5PnALRRuwh6yksMD6IbWX6WKReD+Vx92FQjrVxNqXL
         PicPSHy/ygKicYP4n+pVCwJKbdfIkAYjYsATqlYFiwHk332TdtVI8LqulyZDehpx2/cI
         uyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783992618; x=1784597418;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKrB3Ft0I68hztrro83NH+VbLgEvLq/HYPor88aI49c=;
        b=keuOlYtWs8xTMQZzgIXok0y8fYTW3+UO7ESSG634eegQNoHux6aH1QT17/S4kCAofm
         o2uhp20jhZsid2J8R3dbKg4BRdea6RRSVfU5iNJb9qVXrI3d9hWAunw2aUjBZVwSMm7w
         vBxQfu57cblnoFwzUj/01p4peRhL1wLFBOoTPvTdf0MHKK3wIIj7zhtPnF63srF/NHcT
         Yu3Im/yEIylETgKm4z4pyY4BlUHsbciBOynN9bW0VBksb9G8Yl7rAIs7JJHMBcfKzxXx
         2FUuL9DwVEmqQW9iVS8e4weLHSxtzbkB/9CWypCMbNGHVfuVhcOOV60OgLiRYw6l7yMG
         bdSw==
X-Gm-Message-State: AOJu0Yzw9pPhTRltbKH3/fpgE2oMQZjkYfneOAgChsXn/04Yb8zoaQcf
	51Wdby2Y3rIpKFSkvGhAyB+X7M4FloavhWXS1YQq5MWaIMYjkI/ab615Ep+GyiDtbUZlwajNsXj
	+BnPTK/rXcCDzgQIpyd0TafenGQ86pvHjrpA+z7KWg+isRLoFW+2skOyjZuSf0P3GfMJeUrv1Ng
	13qMxtD/Gm6rygL8V2+cm2TLCPzfgdTQvCAGZJt6GqM15V67Hs78NiJItD18CDjswb
X-Received: from ede14-n1.prod.google.com ([2002:a05:6402:20ce:10b0:698:572e:ccfe])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:940f:b0:c16:242a:4722 with SMTP id a640c23a62f3a-c16679ee252mr12031666b.22.1783992617943;
 Mon, 13 Jul 2026 18:30:17 -0700 (PDT)
Date: Tue, 14 Jul 2026 01:30:16 +0000
In-Reply-To: <20260701141145.52A611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701135015.81937-1-djeffery@redhat.com> <20260701135015.81937-4-djeffery@redhat.com>
 <20260701141145.52A611F000E9@smtp.kernel.org>
Message-ID: <9huzech6xsrb.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH 3/5] driver core: async device shutdown infrastructure
From: tarunsahu@google.com
To: sashiko-reviews@lists.linux.dev, David Jeffery <djeffery@redhat.com>
Cc: linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


Hello,

These most of the errors are due to the device_add concurrently can add
the device and device_shutdown can access it. One of the reason I think
a device_add will be triggered while being shutdown is inserting the
physical PCI device or USB stick etc.

But During shutdown, addition of a new device is not valid. So we can
add a check something like

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 76ba02c26aa5..c3795fa1cc26 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3650,6 +3650,13 @@ int device_add(struct device *dev)
        if (!dev)
                goto done;

+       if (unlikely(system_state =3D=3D SYSTEM_HALT ||
+                    system_state =3D=3D SYSTEM_POWER_OFF ||
+                    system_state =3D=3D SYSTEM_RESTART)) {
+               error =3D -ESHUTDOWN;
+               goto done;
+       }
+
        if (!dev->p) {
                error =3D device_private_init(dev);
                if (error)

We can also partially resolve the races partially by removing the manual
kfree(dev->p) from device_add() error path. As put_device free it
anyway when reference to devices reaches to 0. So if device_shutdown
path takes reference, dev->p will not be released. And few races will be
taken care of. But this will not resolve the deadlock and other races
like the above change.

removing the kfree(dev->p) from device_add can be a independent patch.
like:

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..76ba02c26aa5 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2614,6 +2614,7 @@ static void device_release(struct kobject *kobj)
        struct device *dev =3D kobj_to_dev(kobj);
        struct device_private *p =3D dev->p;

+       dev->p =3D NULL;
        /*
         * Some platform devices are driven without driver attached
         * and managed resources may have been acquired.  Make sure
@@ -3824,8 +3825,6 @@ int device_add(struct device *dev)
 parent_error:
        put_device(parent);
 name_error:
-       kfree(dev->p);
-       dev->p =3D NULL;
        goto done;
 }
 EXPORT_SYMBOL_GPL(device_add);


~Tarun


sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Modifying the core.async_shutdown module parameter during shutdo=
wn causes synchronous suppliers to skip waiting for asynchronous consumers.
> - [High] Unregistered consumer devices will cause a NULL pointer derefere=
nce during async shutdown dependency waiting.
> - [High] Adding a new device with async shutdown enabled while its synchr=
onous supplier is being processed leads to an unresolvable deadlock.
> - [High] Dereferencing `dev->p->dead` without NULL checks causes a crash =
if a concurrent `device_add()` fails.
> --
>
> commit cf98cdf76df805443cc885868cb3d9e13da5501c
> Author: David Jeffery <djeffery@redhat.com>
>
> driver core: async device shutdown infrastructure
>
> This commit allows devices to opt into asynchronous shutdown, executing i=
n
> parallel with unrelated devices after their dependencies shut down. Synch=
ronous
> shutdown devices will wait for their asynchronous dependencies. The featu=
re is
> enabled by default and can be toggled via the core.async_shutdown paramet=
er.
>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
> [ ... ]
>> +static bool wants_async_shutdown(struct device *dev)
>> +{
>> +	return async_shutdown && dev_async_shutdown(dev);
>> +}
>> +
>> +static int wait_for_device_shutdown(struct device *dev, void *data)
>> +{
>> +	bool async =3D *(bool *)data;
>> +
>> +	if (async || wants_async_shutdown(dev))
>> +		wait_for_completion(&dev->p->complete);
>> +
>> +	return 0;
>> +}
>
> [Severity: High]
> If a user-space process toggles the 0644 core.async_shutdown sysfs parame=
ter
> from 1 to 0 during shutdown, could this cause synchronous suppliers to sk=
ip
> waiting for their asynchronous consumers?
>
> If start_async_shutdown_devices() schedules an async consumer, and then t=
he
> parameter is toggled before the sync loop processes its supplier, the cal=
l to
> wants_async_shutdown(dev) here would evaluate to false.=20
>
> This would skip the wait_for_completion(), potentially causing the suppli=
er
> (e.g., a PCI bus) to shut down while its consumer is still active.
>
> [Severity: High]
> Could this result in a NULL pointer dereference if the consumer is not ye=
t
> registered?
>
> The device_link_add() function allows creating links to consumer devices =
that
> haven't been registered yet, meaning their dev->p is NULL because
> device_private_init() hasn't run.
>
> If wait_for_shutdown_dependencies() is called from the async pool, where =
the
> async argument is forced to true, the wait_for_completion() will
> unconditionally evaluate &dev->p->complete, crashing on the NULL pointer.
>
> [ ... ]
>> +static void __shutdown_one_device(struct device *dev)
>>  {
>>  	if (dev->p->dead)
>>  		return;
>
> [Severity: High]
> Could this cause a NULL pointer dereference if a concurrent device_add() =
fails?
>
> If a concurrent device_add() fails after calling kobject_add(), its error=
 path
> calls kobject_del() and then frees and nullifies dev->p. Evaluating
> dev->p->dead without checking if dev->p is valid could crash here.
>
> [ ... ]
>> +static void start_async_shutdown_devices(void)
>> +{
>> +	struct device *dev, *next, *ndev, *needs_put =3D NULL;
> [ ... ]
>> +			needs_put =3D ndev;
>> +			spin_lock(&devices_kset->list_lock);
>> +			/*
>> +			 * If the next device has been marked dead while the
>> +			 * spinlock was released, it may no longer be on the
>> +			 * devices_kset list. Restart the list walk to be safe
>> +			 */
>> +			if (ndev && ndev->p->dead)
>> +				goto restart;
>
> [Severity: High]
> Could ndev->p be NULL if a concurrent device_add() fails?
>
> If start_async_shutdown_devices() obtains a reference to next via
> get_device(), and concurrently device_add() fails and clears dev->p,
> reacquiring the lock and evaluating ndev->p->dead here could result in a =
NULL
> pointer dereference.
>
> [ ... ]
>>  void device_shutdown(void)
>>  {
> [ ... ]
>> -		shutdown_one_device(dev);
>> +		if (!wants_async_shutdown(dev) || !shutdown_device_async(dev)) {
>> +			wait_for_shutdown_dependencies(dev, false);
>> +			shutdown_one_device(dev);
>> +		}
>> =20
>>  		spin_lock(&devices_kset->list_lock);
>>  	}
>>  	spin_unlock(&devices_kset->list_lock);
>
> [Severity: High]
> Can this sequence lead to an unresolvable deadlock if a new device is add=
ed
> concurrently?
>
> If a new device 'C' with DEV_FLAG_ASYNC_SHUTDOWN is added via hotplug
> after its synchronous supplier 'S' has already been popped from
> devices_kset by this loop, 'C' is appended to devices_kset.
>
> 'S' will call wait_for_shutdown_dependencies() and find 'C', blocking on
> wait_for_completion(&C->p->complete) because wants_async_shutdown(C) is t=
rue.
>
> Since 'C' was added after start_async_shutdown_devices() ran, it is not
> running in the async pool. Because the sync loop is blocked on 'S', it wi=
ll
> never reach 'C' to start it, deadlocking the shutdown process permanently=
.
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701135015.81=
937-1-djeffery@redhat.com?part=3D3
