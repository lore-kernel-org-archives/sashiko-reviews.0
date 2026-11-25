Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573218;
	b=JpBw7ILiy4xvEPgi2DWn/u8IWXI45TtQFULECEiJKzTab77Ht+TgwYReF0L2twNOodZO
	 oqeqXrikDdlyiCeWhDXWqUkRBEZPfH8qWF+rjB2jJn74V6DmTJ8c0tGMpaOv0pv2yXQkb
	 kGRBP3i7n6ZIPk2GF3PZK8k0vhJdwJZ+iSPjQCBugmU+IyPGQniEdE5CE/bqRMOrKcwf/
	 OWDVhnJ8cxfDdL6gZztyEW9sIsf2HExT+aCnlvTv8vepX1ffUPGHfHkmaqJ8Yk768PumM
	 pMlH3opO3v9i0KnJkIxrrYI9Rg8Sd+QwNUt0d/DpXrT2q/H9Kz5NmHgJN4LmcQDKX4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573218;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=enKPMmqaMAv6kvmuMKSozHDoIEDFjVm3+Lzr77Y2kYY=;
	b=Gh3p7iOwFAMfvyn1PHFnybUGoGMaHrrb2eubROzK05cS/AhY4sJE1E0QDi0ZpiXqvfl9
	 imz6HVRPC8aZ9GnT1QPZV5XpkSXxb9wdpZDBqJzhZ7bgBe+eiqM1ACulRxX4enKr1NKVG
	 JiB5ia3YT89D2ScVnpfbeEiWTUzC+rdwSPJGu2RqB2AcQTvuF5kXSVrzx731JAkRnwICC
	 /2RebqWyAeZ+b3WkDF+ThXQ/5OlI2cJJZ7eqId918UhAjrBTGrn7Yhl0GqeWoVTHJVBSD
	 8EXae555joWiLIC1htlmljREUw83V7g5OwY0jIpd+5YddkYTPhWQbkXllXdRAP7z4pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b="a/QGKTCi";
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308D606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 02:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4308D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=a/QGKTCi
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id E002E40DA9;
	Wed, 25 Nov 2026 02:20:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 329842000F;
	Wed, 25 Nov 2026 02:20:14 +0000 (UTC)
Date: Tue, 24 Nov 2026 21:20:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Wenwu Hou" <hwenwur@gmail.com>,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing/hwlat: Bind the sampler kthread instead of
 setting its affinity
Message-ID: <20261124212011.5862dca6@robin>
In-Reply-To: <sashiko-outbox-208125@kernel.org>
References: <20261111020755.1422284-1-hwenwur@gmail.com>
	<sashiko-outbox-208125@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 9aymca8cnk8gmc8nqkwpauuw7b3ak6w4
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 329842000F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+w4dfy2t6tdovpNuDHUYW978Ct6dRYiis=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=enKPMmqaMAv6kvmuMKSozHDoIEDFjVm3+Lzr77Y2kYY=; b=a/QGKTCi/eEncmcduv7rYyuzdEN0a+tTmIztCPy7qJcfukQguLSwlVm+8DbtLa9snfYlLzIMjKuJUnJnAWWxeFcQZzx8YtKJBQzX0wBy1CoZiRQwIEULO1ArN99HwX2WbxHvbmhK4yt6AHeudcOcFe2H1gOxIzF3XmCclyYs8aw=
X-HE-Tag: 1795573214-240266
X-HE-Meta: U2FsdGVkX19Di/CUmryauWIiw3uK/QJ52CfoIVYe5LCfrqBceTm5jXLRC/OR6Qrk+7NEgyyvoWcJ0jlP/E5glsBW8UdtCMT0kP9HKANLoY7uAuWWIW0tckt7F8BsMrKQUBHlZucTB11JL7YVQZ1jMbRfYnQzHT4hLE0hBVfx14H4UV+FufGwb9ZXeiVhy1KMDYtwDG9loCsNbNnwS/PckLUMWixWdw9y7otEHX/cSc8Gl6VGTol+3lnJ6SYNisHMFp6Fu7AoVU8KoRS0i2QOhguG81cBlY0OCNcG4PkHCSEaNhKhfp4Hgc5je+b13YNw5frbYBpP10SITxWXo5jWVYNQi3l3RIwN

On Wed, 11 Nov 2026 02:54:09 +0000
sashiko-bot@kernel.org wrote:

> [Severity: Medium]
> Does leaving PF_NO_SETAFFINITY set on hwlatd prevent userspace from
> changing its CPU affinity or moving it into a cgroup?
> 
> kthread_bind_mask() sets PF_NO_SETAFFINITY, which kthread() only checks on
> initial wake-up before calling kthread_fn().  Because kthread_fn() never
> clears the flag, sched_setaffinity() and cgroup_attach_permissions()
> reject hwlatd with -EINVAL in both round-robin and none modes.  That also
> makes the user-affinity override check in move_to_next_cpu() unreachable
> from sched_setaffinity():
> 
> kernel/trace/trace_hwlat.c:move_to_next_cpu() {
> 	/*
> 	 * If for some reason the user modifies the CPU affinity
> 	 * of this thread, then stop migrating for the duration
> 	 * of the current test.
> 	 */
> 	if (!cpumask_equal(current_mask, current->cpus_ptr))
> 		goto change_mode;
>     ...
> }
> 
> Clearing PF_NO_SETAFFINITY in kthread_fn() once the thread has started, as
> done in 4998e7fda149 ("tracing/osnoise: Switch from PF_NO_SETAFFINITY to
> migrate_disable"), would avoid this regression while still skipping
> kthread_affine_node() on the initial wake-up.

I agree with Sashiko. Please update and send a new version.

Thanks,

-- Steve
