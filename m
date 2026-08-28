Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030523515C5
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932907; cv=none; b=aQ6qqFsibqu/k74SHRFyDXVE+2mrM0IkEw+TLoTv3/e6rsQWWjeN16kIvNoY/d6Ah1ertRU87epEMNpf324Nop2r15roaJG/RfPXA0EgfwLsPWJo1xbsJx5FlWCxpVQm8vVklhSRZ9zQ6I3az7/EOx2YGlwc3uCmRvsflGrYArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932907; c=relaxed/simple;
	bh=UuWnHtXL8N/w/Q5WNTbDJxeFR+DQc7c1YtM6Y9NEeTw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ovp8WLmZzTDDDsKDDoVCgkCKHkOqVXUbngHGKpJfvDW+RiVQtk5cbQ3oPmLZmvmbhkZUGqt6jWeUiDr5sqMRaheru+CGSOGojucm9tNchBBuPRk6JhngtPGr53UG4Qv+NuQe+JlHz6LJG/fO6q+1uUj3e9YMa7oDrB29vYrafd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hZZO/tuq; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hZZO/tuq"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15f4732dfaso105928566b.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 09:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787932904; x=1788537704; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rbwr+K5nPn6tIRCwsto5KEIPiqdePxzLIo1QhD83FDw=;
        b=hZZO/tuqOaC5BZZ/Ue/DdKohKdxNaJas+bhFlU7MJYa37BARax7wN1CJhOK/VvnX8B
         nQMzTub4TVagPLz2zxkRVuoxguqCVmIgVCwSzwv2GSyCHAD+BiAT0hz7jUsJ7Lh5WPg5
         TTgc3Rm2DmDmGYJSblwmXsnz/P7whE6Fe8pBPSgSg0m7xO9u9a18ivcVRHpsNqjaTA0+
         ujkcLAV1DDAXaWEwSDH/xXG6oJ9oUn+WEAbh1VqUznMCDnkMeKcnPWERlpRR9phWj7h4
         FPimTN0Ot8fpFtBbAA/MJQBudzIqcMCKjdMjnxdpVcn9LeMs4A6lse6R7VOR5KhQsDvD
         /J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932904; x=1788537704;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbwr+K5nPn6tIRCwsto5KEIPiqdePxzLIo1QhD83FDw=;
        b=IZEzY9AuWpm7ezKyKlcCISFy0lVcWaeoipBqX702S/khUkBCUecBUs+W7+kCX4Tsrj
         3yEWi0jhJYRWcuderKnNbI5fM7BQemSOMM3/YuG7nftaNEU9oLLjbqDA5HQypJiHLP7P
         8g0/iU41iVJYSKdrJCdkeaaTRzljvc/YEdOIKkZRX2pnTJtJlaVgBFWU06Yi7m6nLP60
         SJnPzQNFbaKw6Z8rbXMMAGFZ/CSUE5jbg6WVgVms/TkY+0dYaX0YLymE7w00UaonfbTT
         5EcSVEtOwws0nGll7vyxxPY47y1zADiRtWqnWr9xlpz48w5RCnP/nRC9KOnxKjqiGncU
         3u5Q==
X-Gm-Message-State: AFuF++kKH/S7etP0E50meQyo0HxoK9PRHP2yUljfY/sLohz8XZNtUhrN
	fsk7tV5ngcvTjwvvUXwyIeEkR7QPBYIOf2rVvjnaawaGuALeLkevh4NzLi9AKvyuky6Xd4GjmoV
	7WFuliEpoDciI+XjnZSzySNvzdhbKd3NXVRQ4jvh4EE3dnV91xM5R6nhyu6Jds1uDGTQHjBRU6A
	hYdlbALUoiypvVH4m941tVnEVQFgaiMpMuj7w81GbgncDQFYJrzCSdiRF3gOgKyv5M
X-Received: from edj18.prod.google.com ([2002:a05:6402:3252:b0:6a0:9689:91c0])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:455a:b0:6a3:f74d:6a47 with SMTP id 4fb4d7f45d1cf-6a60d157efamr5227378a12.0.1787932903626;
 Fri, 28 Aug 2026 09:01:43 -0700 (PDT)
Date: Fri, 28 Aug 2026 16:01:43 +0000
In-Reply-To: <20260821144335.1BE1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260821142414.150892-1-djeffery@redhat.com> <20260821142414.150892-3-djeffery@redhat.com>
 <20260821144335.1BE1F1F000E9@smtp.kernel.org>
Message-ID: <9huzh5kez120.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH 2/9] driver core: prevent device_add() during system shutdown
From: tarunsahu@google.com
To: sashiko-reviews@lists.linux.dev, David Jeffery <djeffery@redhat.com>
Cc: linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Race condition in device_add() abort path during system shutdown=
 leading to Use-After-Free.
> --
>
> --- Patch [2]: [PATCH 2/9] driver core: prevent device_add() during syste=
m shutdown ---
> commit 17748fb46ccfdb0adadd634adbfe70a9fd601b9a
> Author: Tarun Sahu <tarunsahu@google.com>
>
> driver core: prevent device_add() during system shutdown
>
> This commit adds system state checks to device_add() to prevent new
> devices from being added while the system is halting, powering off, or
> restarting. It re-checks the state under devices_kset->list_lock to
> avoid a TOCTOU race window with device_shutdown().
>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
> [ ... ]
>> @@ -3699,6 +3720,18 @@ int device_add(struct device *dev)
>>  		goto Error;
>>  	}
>> =20
>> +	/*
>> +	 * Check system_state again under list_lock to prevent a TOCTOU race
>> +	 * where device_shutdown() runs concurrently and misses this device.
>> +	 */
>> +	spin_lock(&devices_kset->list_lock);
>> +	if (unlikely(system_is_shutting_down())) {
>> +		spin_unlock(&devices_kset->list_lock);
>> +		error =3D -ESHUTDOWN;
>> +		goto ShutdownError;
>
> [Severity: High]
> Does this error path introduce a use-after-free race with device_shutdown=
()?
>
> If device_add() successfully links the device to devices_kset->list via
> kobject_add(), device_shutdown() could concurrently run and pull the
> newly added device from the list:
>
> device_shutdown() {
>     ...
>     spin_lock(&devices_kset->list_lock);
>     ...
>     dev =3D list_entry(devices_kset->list.prev, struct device, kobj.entry=
);
>     ...
>     list_del_init(&dev->kobj.entry);
>     spin_unlock(&devices_kset->list_lock);
>     ...
> }
>
> If device_add() then resumes, acquires the list lock, and sees
> system_is_shutting_down(), it will jump to ShutdownError and return
> -ESHUTDOWN.
>
> The caller of device_add() will typically treat this as a failure and
> free the device and its associated private data. Meanwhile,
> device_shutdown() is already outside the lock and actively executing the
> shutdown callbacks on that exact same device:
>
> device_shutdown() {
>     ...
>     if (dev->bus && dev->bus->shutdown) {
>         ...
>         dev->bus->shutdown(dev);
>     }
>     ...
> }
>
> Can this lead to device_shutdown() accessing freed device memory?

We can make device_add and device_shutdown synchronise like

+device_block_adding();
+wait_for_device_add();

calling these two in device_shutdown similiarly we have for probing.

~Tarun

>
>> +	}
>> +	spin_unlock(&devices_kset->list_lock);
>> +
>>  	/* notify platform of device entry */
>>  	device_platform_notify(dev);
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821142414.15=
0892-1-djeffery@redhat.com?part=3D2
