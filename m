Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53803932C9
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307430; cv=none; b=NzX3f3ydIDWBB3SEBi3zCY7Yn7+PmCB+0zF970SAQHyi/HssgEXF3lQTCFXbJvWoF2rTDzvFU9UzsQ51zWIR97ysLqPIBofVzDImX3eACyO2ukQL01I/bEnw79PNn2fNGp6wUgscJ6pcsHJCUGK9oNHwgHYV8SFiRVWXhke/3d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307430; c=relaxed/simple;
	bh=jSwSdNW/mUN/ccv9oig3tDz6DMWrYNSJnxiWh6KgFag=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rbpOcxqJ1XaviDHCd5GKtaYEDk+qOKnzr2WvtlMHYjLeY4fDxCs7K/CrwMtZBBjaAQZROHpUsnMZfYXl53/56G8hwLy7UvJifZ91eRH1sG1ED4vVYInQFsxJdL4js8pbKkbXa+6G7oG6CphPjKEq10HmSVaFKU4jyz/ZLyJv2d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opynUAEQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opynUAEQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c197e7e4e94so160273966b.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 03:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307417; x=1787912217; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jSwSdNW/mUN/ccv9oig3tDz6DMWrYNSJnxiWh6KgFag=;
        b=opynUAEQngsrDykcMgBKP0HurFse4c6WL1ejJFR9S0YvxelQcbgpPoPcQhlw2tOMK5
         i3BnNcUfVShiYcHR2UL79ppn3b1OFvwTUO7OJweKtBLhJB0kqO7BtbIDUwKZ9QRNvewR
         lWm+qFC5P3vxg0bfBxYJB30PaOFnyR9MGm8SfERK3EF7Y+Jq+XqQP4NoPdgTNt8fdF3D
         mmCrrMEtwK3rUDdJXXIgMl9WpyihFpoN6ihBazgRwelwNxeES1H1ZCjLTWjLOp6rHvB7
         NKB4i11THwDL0RHfAGB0Kn9EDP5F4E4QPMsOPTs23nuTb9bHamNESFlLB6jw8gpd/RCx
         NjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307417; x=1787912217;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSwSdNW/mUN/ccv9oig3tDz6DMWrYNSJnxiWh6KgFag=;
        b=iiEiR5rdLXMyM83s4Bqiz8OUgjTKa3ikiWJTrvJrSpWAzTpoVj1J9dICorZqz28qCU
         z3w7JyZavi7jTGXQqbtlA5ROBieUV/vaNm3BP46RC88mUi2gKbYP0+RnMATN/Td56SY7
         EHNh4A34Zv6uUTqsNyPiJ3Loc3vtbyGoc+fHBdW3j6SKmxdm/q8f2bMotpmbUMGCVWyj
         BSGto+gcklsr6IXgbRytrI4WcweREq6KLGAqs3CRFiXMQPrpYuf1OB1tlNhaCCeydqKq
         Onh4DUak0iuI/QWtLBWUsM9BvFeyGmBFzbeyx7+jwKRUY/F/5l4I3w+fm6gcVzP/rEAO
         Gq8g==
X-Gm-Message-State: AFuF++lsqXl+8hXAfH8GQ8mzk0lUkYyNLSkuo9W0ZE7mAzr5TATVPtCz
	cBz+4V3tI+JgRvmWtBLOgToTZYJGZ7XDSHEhQQkIHC5/y8onSXqCEoHRY3Wx0Q==
X-Gm-Gg: AR+sD10ESBy6RqXWuoBPWRXQX7u8J4WzGA9hwNA+823pEGSTsM+Sr/haffVvbq6r63Y
	982f9kx4lIavEFYG/iDmuASzEZvg3eo37J4X9d2smthfQiAoJQwLi2UarCz13plC0SUREQJIJx/
	oVux1QskE2PYvKyw4Ekcgrqxlef/jBzy5cffsg+UXydUhcbbKGXBTNtXRHU5eYKcSzllrOJcHsF
	5CbNlx44pn6FAvMfppMWvw6VtM6OEcDW4E/+ZUBoZ25QwCD+L0iOkDzT5KtO/8GCIm3cUETw7uA
	XN2vqToUBkDLYofUIPHbiV0wkgZz3wFopWOaAR8f9Q7vvC1Sy8xOMqgWb88nhjAidxCrfMD+jTB
	u90CY6MrmDlcXNz88CJcrT/m5P/TG4wHJoZhR5lxyUk+aXCDkcoZORa+md7X7ed2ZTeIel5yef1
	QV+Ri75qELcgaXwb/V/kZK0+6xMrcd1iLEECk3CSDUTUfUhtFtoDF8cORK8pycsBLnnY6skJBrQ
	5g=
X-Received: by 2002:a17:907:80e:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c246a6055bdmr558273666b.11.1787307416248;
        Fri, 21 Aug 2026 03:16:56 -0700 (PDT)
Received: from localhost ([2001:4bb8:104:2029:f763:df3e:9cca:dd59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df465sm380833866b.48.2026.08.21.03.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:16:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 12:16:54 +0200
Message-Id: <DKUJLMZSZJWP.UTXGLF6UTJ2N@gmail.com>
Subject: Re: [PATCH] hwmon: chipcap2: serialize access to low/high_alarm
 indicators
Cc: <linux-hwmon@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Guenter Roeck" <linux@roeck-us.net>,
 "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260821-chipcap2_locks-v1-1-1d8ccabfc1b2@gmail.com>
 <20260821093706.D1EB11F000E9@smtp.kernel.org>
In-Reply-To: <20260821093706.D1EB11F000E9@smtp.kernel.org>

Some extra homework, but the issues are real and I am open to tackle
them all.

On Fri Aug 21, 2026 at 11:37 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [Low] The driver implements custom locks for interrupt synchronization =
instead of using the hwmon subsystem's mandated locking API.
>
> Pre-existing issues:
> - [High] The threaded interrupt handlers pass the wrong channel index to =
hwmon_notify_event(), causing the sysfs notification to fail silently.
> - [High] Threaded IRQs are requested before the hwmon device is fully reg=
istered, leading to a Use-After-Free (UAF) during driver teardown.
> - [High] The driver permanently times out on all measurements if the regu=
lator is already enabled at boot or if a previous disable failed.
> --
>
> --- Patch [1]: [PATCH] hwmon: chipcap2: serialize access to low/high_alar=
m indicators ---
> commit f294324394a3b551fc4139386f0f74282d1fdb24
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> hwmon: chipcap2: serialize access to low/high_alarm indicators
>
> This patch adds per-interrupt mutexes to protect low_alarm and high_alarm
> accesses from threaded interrupt handlers and sysfs, fixing a potential r=
ace
> condition that could lead to missed events.
>
> Link: https://lore.kernel.org/linux-hwmon/20260625162114.417EA1F000E9@smt=
p.kernel.org/
>
> Note: This review is provided in a free-form summary format without direc=
t
> inline patch quoting due to recitation restrictions.
>
> [Severity: Low]
> Is it correct to introduce custom per-alarm mutexes for interrupt
> synchronization here? Looking at the hwmon subsystem guidelines, drivers
> should use the mandated locking API via hwmon_lock(dev) and hwmon_unlock(=
dev)
> instead of defining and using custom locks like low_alarm_lock and
> high_alarm_lock in struct cc2_rh_alarm_info and cc2_low_interrupt().
>

I used two mutexes to decouple the alarms as they are independent, so
actions taken for any of them is not delayed by the other. On the other
hand, that delay will be very short, so I am open to use hwmon_lock(dev)
if it is preferred in this case too.

> [Severity: High]
> This isn't a bug introduced by this patch, but does the threaded interrup=
t
> handler pass the correct channel index to hwmon_notify_event()?
>
> In cc2_low_interrupt(), hwmon_notify_event() receives CC2_CHAN_HUMIDITY
> (which is 1). The hwmon core adds this to the humidity base index (1),
> looking for humidity2_min_alarm.
>
> However, the driver only registers one humidity channel (index 0), which =
is
> created as humidity1_min_alarm. Will this cause the sysfs notification to
> fail silently when an alarm fires?
>

This is a real issue. I will remove the enum with the channel definition
because it is only used here and pass 0 instead (there is only one
humidity channel).

> [Severity: High]
> This is a pre-existing issue, but is there a teardown ordering problem wi=
th
> devres in cc2_probe()?
>
> The threaded IRQs are requested via cc2_request_ready_irq() before
> devm_hwmon_device_register_with_info() is called. During devres unbind,
> resources are released in LIFO order, meaning the hwmon device is
> unregistered and freed while the IRQs are still active.
>
> Concurrent sysfs reads during unbind could re-enable process_irqs. If an
> interrupt fires during this window, could it dereference the freed
> cc2->hwmon pointer, resulting in a use-after-free?
>

I will analyze this in more detail and get back with the results.

> [Severity: High]
> This isn't a bug introduced by this patch, but does the driver permanentl=
y
> time out on measurements if the regulator is already enabled?
>
> In cc2_enable(), if regulator_is_enabled() returns true (e.g., for an
> always-on DT regulator), the function returns 0 immediately without setti=
ng
> data->process_irqs =3D true.
>
> As a result, cc2_ready_interrupt() will ignore all interrupts, and the
> measurement wait will unconditionally time out. Should data->process_irqs
> be set even if the regulator is already enabled?


I will analyze this in more detail and get back with the results.

Best regards,
Javier
