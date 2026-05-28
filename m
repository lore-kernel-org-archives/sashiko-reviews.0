Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD11FFC48
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 00:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779929394; cv=none; b=fjlrFJZnyXV9f7FZK1UvW0fsHDq5WuhpN+x6IyMDtN+LPLr7zR5l6iZ87n1MbMom/gtzEqv+cuq+yl+Lt5i8pOMnlnu5q8OjQ2HdtttriwY58L/ZzjsCrFHDqYgUJo2rDYvYOoQWFlncT8KzVSVJj0HmuDY7gJGYpyj47ocfQao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779929394; c=relaxed/simple;
	bh=QRfVt/hYHCLqbSkeXW+CuJI83At8XX+vSUVvVNuyeFc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fZv5PjwZRjV0+RU+b2eWf9yCt5VFwppxSzCUSjmq/QjF9BCB9HZ4EaS2kT0VzJDY8Oq/Jb7wpS2IJiwSg7dP6bAMq7vSLj8+lehYcVZXcVY5Cg9YFjMsjW9mRUMGx8/L5lI1uxVBGzYOYkR2BVK7zfwZuVSaZASQmJP2mSUi1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2CXiMpn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2CXiMpn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2be75f658f3so67263025ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 17:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779929390; x=1780534190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9aRo1QYU538O5SIsAWbjFU2Nq0lYt45JSxAzbDD8aZI=;
        b=f2CXiMpnDXtfphQNfdcufPrQdN7sgx4S8n2oPaaWmCnxcbTfdMTIBXhcra4vb+39+u
         S7gk4UXbyxAwZBJh9obkoFmCUkuzNiEv0d5dSHlaVvJqHEPGMQlF3Yq+ZXZyWBi6uVwy
         2x89n7Aezi4VQ2NeULW/HDIFutzmlFug0cYbUZqMT82OB6MWJJb+ycx8RhQoWcAm3EMF
         4uCCrfXxCVwO0XqSxH07TWa8ptyBDG4yeLp9x7KTftd9DrnVb/nXdtUUm+yj9hGrNLAb
         3RtgvjDkSxg17oy+O0Duykt/t48M5XAbffx8uyR2t8kabDYWB3aqadBH0n0ytArCeoTr
         3Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779929390; x=1780534190;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aRo1QYU538O5SIsAWbjFU2Nq0lYt45JSxAzbDD8aZI=;
        b=jL14x4sNo0BkMgdjVST6rJUELwlkFIgjCFLDG7CS3beHzIvRydtuf32570oJzsjOae
         0LilHRFSYmqxSwEHbiCYXKt73msSIQRWnKQvODIuiC7v7q2xbK7YnS4CDiufowEEOWQC
         0JOGLhwnLtiISApfBE7Wat17p92FOz8bN+ufqIlk6X/2bIXMs7rjdsF4s16dre+dkzZ+
         +RrKRXhu2YG+KFykK36pnekwRyjiQMQ/3NRoIvkVUV78JHA8KY+a6TVt5jFLRtKR8ovm
         f86vi7RknSkz01aTSJMQUYbWUjCIH8csc5ANk3q/zuhxT+qP/qKqp6gM2aheoPMeR0Gw
         GVuA==
X-Gm-Message-State: AOJu0YycnwLJ5opIiFEOjF6tZmADs+2qK7yQYLrSDO/RAp1s7kcDjYcR
	RDUuwxc/aulwbTOD8vtf2T+ZpX9+cJlZF2xUUmGWk6urA3bHUspTove8c3a4Yxab
X-Gm-Gg: Acq92OHQpxU42VAOUL+gRU+cgh6iMQ/ICKPfkameT5r2u/hMPXilhaTecSDXpI6xR+/
	tkszI0dyrpLLestlg6z2VZkSXsy/xlBoCKOQvCztLHiJ1FifiE4mVu5Umkl0rfPfI7FMg7cXBuY
	0MYuLNW3AOgfB8WaQpOOLmpL8UsRbmIfEocSBumxY9QrD0xC8lPa82GHAbeg/80UftsLoUUfqnu
	LC6Jj9BaHaTus2WsKBpMA4n2yuAiHIvprD/AElvxagnlis7p40jdauLNWu6a7kU8VrDM7HR0VCk
	nggZsQojWAmPQ/7nMOdVochPGrY4y4jVz4f7yMSQ084ZWwD9PAcsGZCjooOmpII5/E2Ecc4d9St
	NE0lZy4DPKIHEFyR5DqvmSPhBvJfypz5MwJYEK2g12Uol/SJnb6ujGBKGY/UHFOwipbDjs74vwI
	LXRxf4mxtNOKtm8FHKygumpzZe37gMkQ29l0TieRnbc7f0dZFUpjiLHLnAUSQWBbtEkWtJkGiN
X-Received: by 2002:a17:903:2348:b0:2bd:3bff:432 with SMTP id d9443c01a7336-2beb074f535mr277723275ad.25.1779929390377;
        Wed, 27 May 2026 17:49:50 -0700 (PDT)
Received: from ehlo.thunderbird.net ([203.105.74.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm170100275ad.52.2026.05.27.17.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 17:49:49 -0700 (PDT)
Date: Thu, 28 May 2026 09:49:49 +0900
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org
CC: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: Re: [PATCH v10 4/4] HID: hid-msi: Add Rumble Intensity Attributes
User-Agent: Thunderbird for Android
In-Reply-To: <20260528004340.2C3D91F00A3A@smtp.kernel.org>
References: <20260527222122.10620-5-derekjohn.clark@gmail.com> <20260528004340.2C3D91F00A3A@smtp.kernel.org>
Message-ID: <8DE0A307-A10C-47DE-864C-19CE8B73F7B1@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 28, 2026 9:43:39 AM GMT+09:00, sashiko-bot@kernel=2Eorg wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
>New issues:
>- [Medium] Missing functional implementation for rumble intensity feature=
=2E
>
>Pre-existing issues:
>- [High] Race condition during device teardown leading to Use-After-Free =
of drvdata=2E
>--
>
>commit 902919289c1cf51c111590532df6640b717c3236
>Author: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>
>HID: hid-msi: Add Rumble Intensity Attributes
>
>Adds intensity adjustment for the left and right rumble motors=2E The pat=
ch=20
>introduces the data structures and driver variables for this feature=2E
>
>>     Claude was used during the reverse-engineering data gathering for t=
his
>>     feature done by Zhouwang Huang=2E As the code had already been affe=
cted,
>>     I used Claude to create the initial framing for the feature, then d=
id
>>     manual cleanup of the _show and _store functions afterwards to fix =
bugs
>>     and keep the coding style consistent=2E Claude was also used as an =
initial
>>     reviewer of this patch=2E
>
>[Severity: Medium]
>Are the _show and _store functions missing from this patch?
>
>The commit message mentions manual cleanup of these functions, but the di=
ff
>only introduces the data structures (like struct claw_rumble_report and
>rumble_addr) without any sysfs attributes or functional implementation=2E
>

=2E=2E=2E What the heck=2E=20

This must have somehow dropped during rebase and I didn't notice=2E=20

I suppose I'll send a v11 tomorrow=2E Sorry for all the noise=2E

- Derek

>> diff --git a/drivers/hid/hid-msi=2Ec b/drivers/hid/hid-msi=2Ec
>> index 96710d80543d4=2E=2E17b0707ecd46d 100644
>> --- a/drivers/hid/hid-msi=2Ec
>> +++ b/drivers/hid/hid-msi=2Ec
>[ =2E=2E=2E ]
>> @@ -332,8 +343,12 @@ struct claw_drvdata {
>>  	enum claw_gamepad_mode_index gamepad_mode;
>>  	u8 m1_codes[CLAW_KEYS_MAX];
>>  	u8 m2_codes[CLAW_KEYS_MAX];
>> -	spinlock_t mode_lock; /* Lock for mode data read/write */
>> +	u8 rumble_intensity_right;
>> +	u8 rumble_intensity_left;
>>  	const u16 *bmap_addr;
>> +	spinlock_t rumble_lock; /* lock for rumble_intensity read/write */
>> +	spinlock_t mode_lock; /* Lock for mode data read/write */
>
>[Severity: High]
>This is a pre-existing issue, but can the device teardown in claw_remove(=
)
>cause a use-after-free of this drvdata structure?
>
>In claw_remove(), cancel_delayed_work_sync(&drvdata->rgb_queue) is called
>before led_classdev_multicolor_unregister(&drvdata->led_mc)=2E
>
>If a concurrent sysfs write triggers claw_led_brightness_set(), it checks
>rgb_registered under a lock but calls mod_delayed_work() after unlocking=
=2E
>
>If preempted between these steps, claw_remove() could set the flag to fal=
se,
>cancel the workqueue, and then block in led_classdev_multicolor_unregiste=
r()
>waiting for the sysfs operation to finish:
>
>CPU1                                CPU2
>claw_led_brightness_set()
>  scoped_guard(=2E=2E=2E) {
>    if (!smp_load_acquire(=2E=2E=2E))
>      return;
>  }
>  // preempted
>
>                                    claw_remove()
>                                      smp_store_release(=2E=2E=2E, false)=
;
>                                      cancel_delayed_work_sync(=2E=2E=2E)=
;
>                                      led_classdev_multicolor_unregister(=
=2E=2E=2E);
>                                      // blocks waiting for CPU1
>
>  mod_delayed_work(=2E=2E=2E);
>  // finishes, CPU2 unblocks
>
>                                      hid_hw_close(hdev);
>                                      // drvdata is freed
>
>When the sysfs thread resumes, it schedules the delayed work on the freed
>drvdata=2E
>
>Should the LED subsystem be unregistered before cancelling the associated
>workqueues to flush active sysfs writes?
>
>> +	bool rumble_support;
>>  	bool gp_registered;
>>  	bool bmap_support;
>>
>

