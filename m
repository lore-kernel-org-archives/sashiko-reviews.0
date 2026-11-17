Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923762;
	b=Szgj5LFgU7CnVQevp4+nd8GUaSz17VwmHQksxNtIsF1QnPDQ67i5BU1OynDqVGCkW6Bb
	 DMMKLB0jQwq40wWTnb5qRoDWn9TvdXk/HhSR4y1GHVq8IDPP7p6nIEwHIZJuULBaelPaC
	 UgW3ad7U/r4th1EWQTMaO6OVYN5FwkS9jc7FK5h7l42IG7HmscyI5YUEyRmZl1E3PKtiU
	 yQJdTBGHzzGo7WXv1isHzJkJx0a8ys2NZe8YxN4vbKuk5KgPHxEsPTSvBdqKo319rgwt9
	 OdZKU8Z+UpOdx5gYeCNykG3DMaWlWRyM0/dKm1NfjfL8EL9Ww92cDGt8aA+G3Rvsn9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923762;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=zzBP/1lFP689iQiTx26pfYuVR9uMTcLu2GlrvrlpORo=;
	b=WNQp8a1IULcm1Jo1Gw8y5zGLCK9OQ1TkOsE8SJSqC5PHb+QxaURpUK4JdyzVUhGHhiKV
	 vkzLnQjCyovJzKAMJgCpAfi/fSpjiRgMg3CR5bsZBiZ8aRHWrgUzzshPJoHHw8Hoqblmb
	 o+vxSGSxBbNGmFIVWmvEXnwu5dW5I9Xt10FJ5i8QfQP7XK9wxAJTjRfCvfrKqEDnD8KeI
	 g0X+NYHiTci3sr/dTRtsjCuQN6MiguE2loL4la+kmKDXLgJsTmQglTPr8H4oUuf/yLgTn
	 j6TRmeEPsuuyGf0XOG5do1kuJQrHABh9E8BZqgjsD/rFIbxKc9IrcQpr2vMiP8rNGLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=M19GYHaF;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E25606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E25606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=M19GYHaF
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 237241A0457;
	Tue, 17 Nov 2026 13:55:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 75D5720022;
	Tue, 17 Nov 2026 13:55:53 +0000 (UTC)
Date: Tue, 17 Nov 2026 08:55:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Brian Norris"
 <briannorris@chromium.org>, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: 'select' GENERIC_TRACER, not 'depends'
Message-ID: <20261117085552.0e4ef272@gandalf.local.home>
In-Reply-To: <sashiko-outbox-217828@kernel.org>
References: <20261116144652.1.Iecb63200dd245f62032a3b1f60ae78cc48868094@changeid>
	<sashiko-outbox-217828@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 75D5720022
X-Stat-Signature: segihranqx61rpith8nob1ptgkmwgkbp
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+GYMpIqJozyOvIGiaQhChZ+p+RFrwgeAM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=zzBP/1lFP689iQiTx26pfYuVR9uMTcLu2GlrvrlpORo=; b=M19GYHaFrcVke/Z2rDO5WG5fxjC5tsgUpZyNaZeEgTLEAn8xY7NhoXiLuGSgW4GZZPiLoW5o6cD9n2rMFcCYNIUofkSL28K9qtyYG6Zf5mu0P1vMpCH1ZmFQzsSzp7y1geTNp31LLmTpG6gHOR4ZwS3cI71/Ux1xur6JOdQTqdQ=
X-HE-Tag: 1794923753-243280
X-HE-Meta: U2FsdGVkX1+Ir0A/HL7utVfV6e6ZMWglgs1V/OtpQJ4Ez6eND5lhuK6b+BGW7nl5sjAzqLwlKuM3Rw3+PsAknKXuvVQ9VLRoYe6kOvsLbWy/RNop74Uv62UvsIqF8DmrWzwMjP578ijQ2k/ARQfZcd576z2W8UBQ4pA258aJYlpiT0W4vtrx5EFjxuIG41chwtFYmt9jmV4l9CgWSogqMgEkpuGCG60YeNwqEJgrUqzgUmzAquvzqFAK/5aOER4UUBrma5xZ8bBMQxDX3FlxcEtsjV02kl029clNiEF3iy5hpwEXg8S7Dd81YR+fXIKvwkyo7BWTk10P2vMGleb+6fLfkb55yYBR

On Mon, 16 Nov 2026 22:58:01 +0000
sashiko-bot@kernel.org wrote:

> [Severity: Low]
> Should FTRACE_STARTUP_TEST depend on TRACING (or select TRACING) instead
> of selecting GENERIC_TRACER?
> 
> GENERIC_TRACER is meant only for full tracer options so that
> ENABLE_DEFAULT_TRACERS is hidden when a full tracer is enabled:
> 
> kernel/trace/Kconfig:
>     # All tracer options should select GENERIC_TRACER. For those options that are
>     # enabled by all tracers (context switch and event tracer) they select TRACING.
>     ...
>     config ENABLE_DEFAULT_TRACERS
>     	bool "Trace process context switches and events"
>     	depends on !GENERIC_TRACER
>     	select TRACING
> 
> Because FTRACE_STARTUP_TEST is a test option rather than a tracer, having
> it select GENERIC_TRACER disables and hides ENABLE_DEFAULT_TRACERS when no
> full tracer is configured, and implicitly pulls in TRACING even when all
> tracers are disabled.

Actually, the selftests should depend on TRACING and not GENERIC_TRACER. It
may have been that the self tests were added before the trace events.

But it should not "select" a config. The selftest are only to be selected
if there is something to test.

-- Steve
