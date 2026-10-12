Received: from host3.o27bbn.ondsl.gr (host3.o27bbn.ondsl.gr [79.129.74.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E1E3EDE6C
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.129.74.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803494; cv=none; b=bZHsW2NFZLMsznbWT4zCVmjgjkKmiACWGVHIwS0bzwitL06wexAZc+o1FOjrfVysE+6kWKCBrbT4RPtKeT0gdusdRPryqto3Xlpil0KdRsIOTolC6AudXhMGmOhwHPPRtA3niJjmv4SI2JQH40mD65ITeL3IRZBEkW48pIqQreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803494; c=relaxed/simple;
	bh=s/nbx3qbIU4IiDZU3Yebh2f0jNKVyPUGAepgCs/yc7k=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=n8gtR6PocB4ro7IaTDqGKJElgYJlK5+128UBE3UXcr3Xvv4zcanbU63YD9UFE4y3guasziFqz8WYreqyh7MEmzR5QvNAMAEeUATxKNz6vrOXVhtRHK7ZNEIVK9LqmJVTvDdDnmd/i8VFBVWJGilSjWqBT6ayuV9MR9/jJ+wvhq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=e-psn.eu; spf=pass smtp.mailfrom=e-psn.eu; dkim=pass (2048-bit key) header.d=e-psn.eu header.i=@e-psn.eu header.b=pdjVKaMB; arc=none smtp.client-ip=79.129.74.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=e-psn.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=e-psn.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=e-psn.eu header.i=@e-psn.eu header.b="pdjVKaMB"
Received: from mail.e-psn.eu (cluster-localnode [10.200.210.1])
	by mail.e-psn.eu (Postfix) with ESMTPA id 3033E3842BC7;
	Mon, 12 Oct 2026 11:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=e-psn.eu; s=default;
	t=1791803488; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fh4+TCDGqb+p1deMexiH2CF0uJZ6hXG1cZ+wkTnl+Y=;
	b=pdjVKaMBO6v6SiMg+NTkQeeIgnNkJbnkmmOhm3vl0u96JAclj74hMaB+S7HOn7eb2EgJ/S
	t+evWk5VoTUmJvRkYNRGEQ+Dqm+IbgdmI6aYL/aqgghicFK2AONfhn6HOp8gmQ/x1aLJpI
	D9UphRF+Z1319a7sNsHODZjKfG9qc69FVE8JbcD/ThtZl6i6OYdr8KKZ5U0GOH23IJFKiU
	qQIEgND9Ghfbg6AWvKwnKUX8f3AG2HvxB/JkNciahhzPYnc5uMtClWC4VohNNgd4oULoVE
	YJTkh9gDut6rbxmkjAJuWhG7LKVZpeo9JnaMmm3ZOBBng/HJ1O+AtuJTXMJ3kQ==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 14:11:28 +0300
From: Constantinos Chalkias <cch@e-psn.eu>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/hwmon: refresh Battlemage thermal telemetry under
 force-wake
Reply-To: cch@e-psn.eu
Mail-Reply-To: cch@e-psn.eu
In-Reply-To: <sashiko-outbox-168001@kernel.org>
References: <20261012104245.2108030-1-cch@e-psn.eu>
 <sashiko-outbox-168001@kernel.org>
Message-ID: <4f2e9bd1da1964bb014e5b3fa4fe83eb@e-psn.eu>
X-Sender: cch@e-psn.eu
Organization: E-PSN
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Flag-Threshold: 6

Thanks for catching this.
On the B70 I observed two distinct symptoms after a sustained workload:
- package/VRAM temperature values could remain stale while the physical 
blower stayed elevated even after the device had returned to idle;
- fan1_input could independently report implausibly low or zero RPM 
while the physical blower was still running fast.
This patch only addresses the temperature MMIO path. Holding XE_FW_GT 
for a short settling interval before the temperature read causes the 
temperature telemetry to refresh and, in my testing, the physical blower 
then settles normally as well.
The REG_FAN_SPEED path remains a separate direct MMIO read and can still 
show unreliable values, so the current patch should not be read as 
fixing fan RPM telemetry itself.
I can reword the commit message in a v2 to make that distinction 
explicit, and investigate the fan telemetry path separately.

On 2026-10-12 13:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential 
> issue(s) to consider:
> - [Medium] drm/xe: fan telemetry lacks Battlemage thermal force-wake 
> workaround
> --
> 
> commit a9faaf30cbf789280ad52add1cf188270e8ccad9
> Author: Constantinos Chalkias <cch@e-psn.eu>
> 
> drm/xe/hwmon: refresh Battlemage thermal telemetry under force-wake
> 
> This commit works around stale thermal telemetry on Battlemage by
> acquiring the GT force-wake domain and waiting 500-1000 us before
> reading temperature registers.
> 
>> drm/xe/hwmon: refresh Battlemage thermal telemetry under force-wake
>> 
>> On Battlemage, thermal telemetry can remain stale after the GT returns
>> to RC6 following sustained workloads.
>> 
>> On an Intel Arc Pro B70, package and VRAM temperature telemetry may 
>> stop
>> refreshing after a long inference workload. Fan telemetry can also
>> become invalid while the physical blower remains elevated.
> 
> [Severity: Medium]
> The commit message states that fan telemetry can become invalid, but 
> the
> patch only applies the force-wake and delay workaround to temperature 
> and
> VRAM channels via xe_hwmon_temp_mmio_read().
> 
> Does xe_hwmon_fan_input_read() also need this workaround? Currently, it
> continues to read REG_FAN_SPEED directly via xe_mmio_read32() without
> acquiring force-wake or delaying:
> 
> drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_fan_input_read() {
>     ...
> 	mutex_lock(&hwmon->hwmon_lock);
> 
> 	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_FAN_SPEED, 
> channel));
> 	time_now = get_jiffies_64();
>     ...
> }
> 
> Will fan telemetry still remain susceptible to staleness on Battlemage
> without the workaround?
