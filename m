Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549896DCE1
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 03:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012442; cv=none; b=Vu9iAuwuvH9leXDC9If18grPjVGCJOTLg3t1ziGZgVSi//rgRxg7W/KPaeA09lFR4S66zKSRPDYcFi9CtpjNIIAhj6AyrqsKpfQhQTdVYRmlCgnRHdKl5utA49dosVPpfm2BiyUByl+LSpSp6yakqrRG/VtFiEWrc1R9eplE2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012442; c=relaxed/simple;
	bh=w0hXkS0gDV/Qa9U7kB3ZgrCtnB1Cu08cWQhKqDWWXjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RN9Sn3QOjFXVzrpwnyUd6MhT0WsLm7L+snluzAhyJdwjUxjz3ENWVYQSDOaCgnSAUDhCOGA8qh+yGflxlpd0TnCL60KsbCqbWT+9FYUGy0aznLlg7hTfQARC8NL2vYilbshcCgRQWyj7vZ6rGKN9b1Q1EeKBiwVgz7n+HCtFEQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOWDuNDh; arc=none smtp.client-ip=74.125.231.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOWDuNDh"
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-6b136fad4b3so1710344eaf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 20:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789012440; x=1789617240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MphXScIlea9Ch/HqYCopSdk5l+/MgVBRqofI+uB1fjg=;
        b=gOWDuNDhg8r8xvpfg+jg1nOM2zaXtsek1zO+hNExIg3nEfitUsvPJNRTVlK0jbyi2S
         ppOAVk1pBZ0HVWTgOqDtSEkK5ccTFG7xHNwKRglZmfas/2rYYh3E7qcb8XkhRIwarL51
         L0czsqVlYyIW2R0c1gYmB2sIZeOVJ74bvvpWeMqXnavhWFVl+P6FVE+TvgqE7GvjQ9p9
         h74NZSY3y/R46RIRR/blBXjVGoCuiE8DahLOv5bws5kpRwovBfRwaO3NCyKRvj/v6mGR
         qBvmYjD0pfbv1/t/9/CtYt38whH0EXCGuson0AGtbbxc7y92fT/+rQq9HNae+vQUYLuE
         qg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789012440; x=1789617240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MphXScIlea9Ch/HqYCopSdk5l+/MgVBRqofI+uB1fjg=;
        b=IqXR+hMNWfv3FjKffiwb/PhQQE07dxu41TwYnfxJZ7PyvAkRS24EQMOrZl1XgfPXqz
         GGdAItxUj1zkWfCspyVpWRqy5AXc6H6NepvG6rK3zwS1xbP9gYx4YfKPAdkcp9PzEJN1
         eUjHjlb70+s8JfvOm+ZkSiuBEdenRBEVdUS/oXJ76OAQt4925AtCCBaknddpeDg92eGw
         aLcbQdv6rb7sR9lf7mAU4TQXBv7JFSSTAgUtx02wdP3fPMvg+IaOcctHI/Hv0goWgZ6/
         XzSn2531Mk+AJ5tphsQH77TkS53FajYEWpsN24x/T8gDIi4WgKzLLVtsQRRs/I7/Ca+R
         4F3Q==
X-Gm-Message-State: AFuF++m2AukxB5vzcltNXkQ3ezbn+0Sm7xTTs5pCk/hCU4lFiylORYJP
	4IfiWahPaIkstMv7E257RWlZ8RngP9mBqsPUi03dHvlYWAlVv/mDhHJPyJpkQ4ICe2U=
X-Gm-Gg: AYBFou1+S1FANVsUg5kBKFu09f56FNCOyVXDgpM4VCEtgAslK2UKup4yAYv01Gggg2t
	/9ufq+mGENq+J0ZZZZA1zu4qJiyrBnrq1gRy7IRMehOGrqeXBJQb6vqH2dynNeoFN1oRgG6avtQ
	zkPAs0yUJWGmprgNe7QWVQ3buYBn3SzytK89kU3V3aFNiwrRAjSyM7NC1n4ljQmRrUO9jO/xNrV
	Infa7kKVXoa/GuSMB2BAlAeVdR0vSvDDiDMyNm/KozllzPCJRMnsRpXFnBZLnUKbG+UTxKZPxcZ
	FyTrpB9nDwAR8TL80mGBQGqTsR2hNHM2oCNIKpNCuJ4D2mzPozuVVpoutQBoGBBm0QJxuOW188l
	BzfyspTZklzE4O7phgTowrlkj2JcMvJ2nDWCiYuJAJxepojfjw+l5ngkWYTNGOlMiOUXVAk6GQc
	rGgDgZuckUgmIuYCfjka6Ed7AgkJn/faXdjZ5qlWS63uLFMvQrtxIx+G/NAgZRX42JtwawBDSaD
	FEDHvgzidqWqNOMHH5QhfG3gq8=
X-Received: by 2002:a05:6820:81cc:b0:6b1:9f9d:7a00 with SMTP id 006d021491bc7-6bee25409d4mr5533822eaf.5.1789012439997;
        Wed, 09 Sep 2026 20:53:59 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475543fcaa9sm15753624fac.7.2026.09.09.20.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 20:53:59 -0700 (PDT)
Message-ID: <31087903-ac71-4561-aa6c-00abdb309fe0@gmail.com>
Date: Wed, 9 Sep 2026 22:53:57 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: suspend the GPU for system sleep, not
 just runtime PM
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260909-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v1-1-f45847bc951b@gmail.com>
 <20260909192653.C24201F000FF@smtp.kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260909192653.C24201F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/9/26 2:26 PM, sashiko-bot@kernel.org wrote:

> [Severity: High]
> Does delegating system suspend to pm_runtime_force_suspend() cause the system
> sleep to abort if the device is lost or unplugged?
>
> If the GPU crashes and is marked lost via drm_dev_unplug(), the PM core calls
> the .suspend callback, which delegates to pvr_power_device_suspend():
>
> drivers/gpu/drm/imagination/pvr_power.c:pvr_power_device_suspend()
> 	if (!drm_dev_enter(drm_dev, &idx))
> 		return -EIO;
>
> Since the device is unplugged, drm_dev_enter() fails, and the function returns
> -EIO. Will this permanently break system suspend for the entire system until
> reboot, since the PM core aborts system suspend if any device's .suspend
> callback returns an error?
>
> [ ... ]
Yes, this is a real regression in v1. Thanks for catching it. The chain is:

   pvr_device_lost() sets pvr_dev->lost and calls drm_dev_unplug(), which
   sets dev->unplugged (drm_drv.c);
   drm_dev_enter() then returns false;
   pvr_power_device_suspend() returns -EIO (pvr_power.c);
   pm_runtime_force_suspend() propagates it -- "if (ret) goto err;", and
   the error path is pm_runtime_enable(dev); return ret; (runtime.c);
   the PM core aborts the system suspend.

pm_runtime_force_suspend() only reaches the callback if the device is 
runtime-active, and a lost device cannot runtime-suspend either, for the 
same -EIO. As a result, it stays active and every subsequent system 
suspend fails the same way. All that can fix it at that point is a 
reboot or a rebind.

v2 wraps the force helpers and returns 0 early when the device is 
already unplugged, because at that point there's nothing left to power 
down. I test drm_dev_is_unplugged() rather than pvr_dev->lost so the 
guard matches the exact condition the -EIO comes from, therefore also 
covering an unplug arriving by any other path.

I verified v2 on my Amazon Fire HD 10 (2017) tablet, with no patch as 
the control. The same kernel, same config, same tree, with the only 
different being this patch applied and powervr.ko rebuilt and swapped (I 
have the module as =m, so no reflash was needed; vermagic identical). 
The control failed, and the v2 patch worked.

The test pins the GPU runtime-active -- the condition that fails -- then
system-suspends for 35 s and touches the GPU.

With the patch:

   runtime_status before suspend: active
   state write rc=0, uptime 606.04 -> 642.39
   runtime_status after resume: active
   vulkaninfo --summary: rc=0, deviceName = PowerVR Rogue GX6250

Without it, the same run, GPU working beforehand (rc=0, same deviceName) 
and the suspend itself succeeding (uptime 52.62 -> 87.82):

   VERDICT: FAIL -- GPU op still running after 100s
   pid 2862 state: D

and the kernel's hung-task detector produced two stacks, from two 
different ioctls, both wedged in the same place:

   pvr_power_reset+0x64/0x534 [powervr]
   pvr_mmu_flush_exec+0xec/0x18c [powervr]
   pvr_mmu_op_context_destroy+0x58/0x1ec [powervr]
   pvr_vm_bind_op_fini+0xa4/0xd0 [powervr]
   pvr_vm_unmap_obj_locked+0x1f4/0x260 [powervr]
   pvr_vm_unmap+0x5c/0x90 [powervr]
   pvr_ioctl_vm_unmap+0x50/0x80 [powervr]
   drm_ioctl_kernel+0xec/0x13c [drm]
   drm_ioctl+0x254/0x3c4 [drm]

   pvr_power_reset+0x64/0x534 [powervr]
   pvr_mmu_flush_exec+0xec/0x18c [powervr]
   pvr_submit_jobs+0x838/0xa60 [powervr]
   pvr_ioctl_submit_jobs+0x6c/0x19c [powervr]
   drm_ioctl_kernel+0xec/0x13c [drm]
   drm_ioctl+0x254/0x3c4 [drm]

That's the chain from the commit message, and it also answers your 
question about the deadlock: both stacks are under drm_ioctl, so 
pvr_power_reset() is calling drm_dev_unplug() from inside the very SRCU 
read section the ioctl holds. The box needed a reboot afterwards, and 
the reboot itself was slow because the D-state task cannot be killed.

One note on this: this is a check-then-act, and kernel workqueues are 
not frozen during dpm_suspend, so the watchdog worker could in principle 
lose the device between the test and the callback. The window is small 
and the consequence is one failed suspend rather than a permanent one, 
but it is not zero. The alternative is to stop 
pvr_power_device_suspend() reporting failure for hardware that is gone, 
which removes the race and is arguably more correct for the runtime path 
too -- but it changes existing behaviour, so I didn't fold it into this 
fix. I can do it that way instead if it's preferred, just let me know in 
v2.
> [Severity: High]
> This isn't a bug introduced by this patch, but does failing to suspend leave
> the GPU watchdog permanently disabled?
Confirmed, pvr_power_fw_disable() does 
cancel_delayed_work_sync(&watchdog.work) and then returns early if 
pvr_power_request_idle() fails, without requeueing. The only requeue is 
the queue_delayed_work() in pvr_power_fw_enable(), on the resume path, 
and the PM core doesn't call resume for a device whose suspend failed. 
So the watchdog stays cancelled and a firmware hang later on would go 
undetected.

It's pre-existing, but my patch adds a new way to reach it through 
system sleep, so I mentioned it in the v2 commit message. I can also 
send a separate patch restarting the watchdog on that error path, if 
that's wanted.

---

Everything else seems to be pre-existing and probably not worth 
addressing in my v2.

For the v2, I'm not including sarah.walker@imgtec.com and 
donald.robson@imgtec.com -- the sends to them bounced. b4 --auto-to-cc 
included them, but I'll just remove them for v2.

I'll also Cc Chen-Yu Tsai, Icenowy Zheng, and YoungJoon Lee, who are 
also working on the same GPU and are much more experienced with this 
hardware than I am :) I have an Amazon Fire HD 10 with the same GPU, but 
I believe they are working on Chromebooks.

Thanks again,
Ryan


