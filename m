Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421393;
	b=Moc/5PsZ0Fk+BuEMe8NJXHYWdfPvs+FqZn910De3zJhEbPnkTsGHOc6Br4OQVwNfsYLq
	 1CfR4L4TB/SLYmRwwmpxSU5rN3EAUDJK+Oj9VX2OLwaLWi9mV/WEsRwKFwWARZI6f7BUm
	 OVqLfIHivGJEroLKJ8a/VYcuaGGLHB9cppKhszm1ClCtfSltg9Ly7HouakSwGGiWwzoQc
	 6oQVpOreg9F/1Nu5YJKKbD1FrOs+Z/o4l0RmcrKmhA3FaoJvKQFHJ6wO+rH+951tCAK4J
	 ijfrBfp4OU3wMNJmNVVDUG8sDfB9/H/I574KcBc0YWx4tiRhoIvqfh78Vgdz7I18wxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bvg45x/n+Rzi5fKhi8+zOb3+1W6kRDRHRptiIt9H8zc=;
	b=Gpznz0c2/oTSGWKHo535D0j1Voh06QhA4NBKBVG4MsF5E43Y57VU+XVU2pTskzCwd7RB
	 EifBrQIen4fIwq7lJHhl4d0WIpQP1BdympsN7Us24k92jkqslDxLaPxgUcgjcfuHd8+G7
	 m9eUbiRToRWURp+UOERgI8EwBBiyJfhPkmsAYari/AuBCeebgfYc8bHCSy5YjiHIZM40c
	 jeMqVWwlEBl5+24tWxXJyxujB7khYHo3uqw3KrT1OQtsi5uggGYeCZzJRXSjIjC9zxBpD
	 Miufn3fPuFt2qYFIIgnzbXSQFj5vPpoBzDoCnIzlTT3TuS59ueXD9qSKkT67jjaM6rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qy3zhkjm;
	arc=none smtp.remote-ip=74.125.231.132
Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B15606A89B
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 18:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B15606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qy3zhkjm
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-70073621339so1502532eaf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421391; x=1795026191; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvg45x/n+Rzi5fKhi8+zOb3+1W6kRDRHRptiIt9H8zc=;
        b=Qy3zhkjmGjd4SJA5RwIaruHYSbm+nKNhdJyCDBs7kt0QAMLNr+u+oKCacD5v9fQoi1
         RlGYOs5E6icw6EeEwBTlYBu1Yn8TiwVcE/w1Hb78ah4psC+pZRY46OIvh0Vb55hVPSMY
         SIL8hemRPtG4/NWJ6rMWp+qVqw7FkSncsGA4rkTUGVBHfeUK6ZsjXTVQZGDNVSuhIHZU
         hOFPFCJCiZsL/F8S6x1y4k+w4HK+WvBFwKGg15mV9KKtdmLELltVSiZU22cDxs6u4IxZ
         CGwEzrKliX+gDiY6FaUHu2VkpxpwTQnTUwI78sfrdee0zFZJBVS7F6n/JbB3HWgJ2i1e
         C6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421391; x=1795026191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvg45x/n+Rzi5fKhi8+zOb3+1W6kRDRHRptiIt9H8zc=;
        b=qa4I1sRMne7KrBwvjiPeGRwrW64IRU9Ap/QJW0XFO++v9zri5Y+d2lkpYUlZKrxkWY
         lxqPW7FCliuCvOvRUQ9dnFhb5O3cRj6Qq7hfeaFcxYUfsW/XkrISa8OHwIX9Lx0jPiBO
         lnFr5cRoaRA0T2NE4kB7Z9jc/4S7KwtcpPW1Cgb85KKCGPTNtDBm+9Gpkvhme6YTNuZ8
         ikMM9PejrvtKYsAWoZ2chub67Q176Yyvof9dalgeb2uvZzfuKidzzKkRviD7xxXxXbS/
         EUIif4MQHmwCFSlwuRBkf5O9q8DMhLMMqkucBzgSPbY44UsnGVm7HnEoe7g9Bsqi9s0f
         Id2A==
X-Gm-Message-State: APuU4Z/m9Cr7ibytzK1qYSwd9VmknbmpHSxVrZOqD/bjCs/LF9srPDu/
	Lf26AEQUzkWEnmvWRPbvw8HTp5xXdL5i3Qw5spZXA3atnNnvZ07jrUne99WqOhGAcSA=
X-Gm-Gg: AYBFou0e9YafB7KPIEYqUIloiRDEZFm3XlCBWFubMz6z45MELZ8HO03CL5DeVlR+NT/
	S2O3DDyLw+9gsvAGGfb0jr+ZsUSZGHKMjpNB2RUM2SGMlrQ+f5PZ1jAVNqY90UO1mBuFYL2xc3D
	yG9LrsouGIxrn0JPG/l6fqN0/VIjirhNk9V9ezTkGKO1xJ6NHGJec1DzUJB97+KYn5usvgmWqhN
	H46cnM6rJP346qxDXI1muq8bn+SJJVKHczSNWhMDQfoHVBQlCIfwklUBEjV2owkok2PM6DeK71M
	LGrKVDfm+1GEVrhAqhHTk5mRXDGLoKpsKSBMRZAhccPN55NpvZ8DM9G74r5+9NsV/Jxu9PNw/Zl
	wTzl8D/drJtwyq906CmWDUHUC44RumWFLhBACarX+WAjren0UnWpX+nxxhJJws+mFuxewpMZNOA
	QMQsj2c4PvbNq4MxfnlhmeXB361PwEz3g+dPiHRUp9Y0sKkPkcBYnOm/JuVQDaQu7Kl7yumHXT6
	Wm+UsoIY7zENW68TyNgLXwJRbiru78S0ykNA3lvSWUWska2Pwj11GcVT4HLLPQdKfQwm9skyJWX
	LCZ6Y6ahcQogyrzE/4Fg6v5igjwFhU8MuC2ExN/A4pSyqgriWgqxVuH2Yid/9C21VldlsRlULba
	cX2KuCkfGvClIfabURDvY
X-Received: by 2002:a05:6820:1629:b0:70d:9be9:5351 with SMTP id 006d021491bc7-71917892b23mr1816153eaf.36.1794421390391;
        Wed, 11 Nov 2026 10:23:10 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a6f2a264sm4474546eaf.1.2026.11.11.10.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:23:09 -0800 (PST)
Message-ID: <4d50f769-07a7-4990-9158-f508a6e53c38@gmail.com>
Date: Wed, 11 Nov 2026 12:23:09 -0600
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Wait for the firmware's interrupts
 before stopping it
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20261110-rbrue-suez-upstreaming-pvr-fw-irq-handshake-v1-1-8872686d14d0@gmail.com>
 <sashiko-outbox-208095@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-208095@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 8:33 PM, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> In 727538a4bbff ("drm/imagination: Implement power management"),
> pvr_power_fw_disable() was an unimplemented stub returning -ENODEV and
> pvr_power_device_suspend() only disabled clocks.  Should the Fixes: tag
> point to cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure
> and META FW support"), which introduced pvr_fw_stop() and wired up
> pvr_power_fw_disable() in runtime suspend (or 74ef7844dd8c
> ("drm/imagination: Disable interrupts before suspending the GPU"), which
> added the disable_irq() call before pvr_fw_stop())?
>
>
> [Severity: Medium]
> Can pvr_dev->fw_irq_count fall behind osdata->interrupt_count when
> pvr_fw_irq_clear() is called outside pvr_device_irq_thread_handler(), such
> as during a soft reset in pvr_power_reset()?
>
> drivers/gpu/drm/imagination/pvr_power.c:pvr_power_reset() {
>      ...
> 		err = pvr_power_fw_disable(pvr_dev, hard_reset, false);
> 		if (!err) {
> 			if (hard_reset) {
>      ...
> 			} else {
> 				/* Clear the FW faulted flags. */
> 				pvr_dev->fw_dev.fwif_sysdata->hwr_state_flags &=
> 					~(ROGUE_FWIF_HWR_FW_FAULT |
> 					  ROGUE_FWIF_HWR_RESTART_REQUESTED);
> 			}
>
> 			pvr_fw_irq_clear(pvr_dev);
>
> 			err = pvr_power_fw_enable(pvr_dev, false);
> 		}
>      ...
> }
>
> On a soft reset (hard_reset == false), pvr_fw_hard_reset() is not called,
> so osdata->interrupt_count keeps its non-zero values while
> disable_irq_nosync() is in effect.  If the firmware raises another
> interrupt after pvr_device_irq_thread_handler() sampled
> osdata->interrupt_count (or while pvr_power_fw_disable() sends the idle
> and power-off requests), pvr_fw_irq_clear() in pvr_power_reset() clears
> the pending hardware interrupt without updating pvr_dev->fw_irq_count.
> Because the hardware status bit is cleared, pvr_device_irq_thread_handler()
> will not run for that interrupt, and the next runtime suspend will see
> osdata->interrupt_count[i] != pvr_dev->fw_irq_count[i] in
> pvr_power_wait_for_fw_irqs(), stalling for the full 1-second
> POWER_SYNC_TIMEOUT_US and logging a false warning.  The same can happen at
> boot when pvr_device_irq_init() calls pvr_fw_irq_clear() after
> pvr_device_gpu_init() has already started the firmware.
>

I always manage to trigger Sashiko bot with drm/imagination changes :D

Both of these are correct. I'll fix in v2 -- the host's copy of the 
firmware interrupt count will be taken inside pvr_fw_irq_clear(), so 
every clear updates it (IRQ thread, probe, pvr_power_reset()).

I'll wait a little bit for human review if there's anything else I missed.

Thanks,
Ryan Brue
