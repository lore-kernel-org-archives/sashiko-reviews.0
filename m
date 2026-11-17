Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939818;
	b=M3dixMbFKx+O/4XQVQ6uK9z9wNKsKke9SWZwfBuH8o9r8nF7uJBJnyGFeezl1O3q93g/
	 MzQDscijAc0w0nxQEA8UUvDMgtuapZlZSjeBwShVn29KrHe/f/VQRiBY7Dzk7xMmUMC8F
	 re8m+32ZXOds3kcF0pVapFHkV6DdR6l//hUB4Z1KY2q+nJeVdBVn1KW4KNLCuw2q3S9J+
	 r/tEghiIsJ3Enie3qe5Lw/sOI4/yO8b4eVOgO2xgsc1dGWcQ4t90riiGcLk44ZzYfjcRm
	 KcIDu/Pv2PiJqKPdubuflhWZq2HCMkaD1Qoklj2DDdwGHj8mtOYQMj/OsQgaDigITGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HzWKenQn9WhmPU6V5OUgtiFs+SCuy+G/69gWaeerzA8=;
	b=0EJTaTQXez4Dl1pjFFss7dqY2Hk6CFvEQwpeZd8Xw0IGm+wT94WrbSRhKUtL4QDyituP
	 QyKKrB10HwEtjKVBxK9O+RouXvUE+KG4NMc6OLEsulYA8FmpRMN9UKmsrC/BJJaZMkjBU
	 35QEIuN1UfdZM3EChIqLGERLbT6wzFh61Vn/onVu01JPCWsK+NLmJuJ1dx8BIIlpBiMyH
	 ikjZvdBidpPUbmd+mTLd+6r2W4tgHhNJp2wwELlqr6sOkzsWd75/uDrawUTasewBsuTXF
	 X3Rz/rkyxuopdWeOd344/w4yVmBPYztPbPrNH2D6ilgKivhGZ+vG8I1DW3yaVJORDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=amR3Fvo4;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833C4606A32C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 18:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833C4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=amR3Fvo4
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-381f65e4e4bso324478eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794939817; x=1795544617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzWKenQn9WhmPU6V5OUgtiFs+SCuy+G/69gWaeerzA8=;
        b=amR3Fvo4zEKP+Pi1WlHzW8rrztwhBPxBm2VZvejYBODoge+w9kfW7Olegqacye3ktK
         Wu2P5C5vzzCdO0+T0T9mNK5DI+TZoZAKE2fwVybKGwRUQhexHiaTGZSIvL5D7NxDx5B0
         +9mURlmzJ8wqkWRKZsRgvQBolGQ7qFqAagmnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939817; x=1795544617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzWKenQn9WhmPU6V5OUgtiFs+SCuy+G/69gWaeerzA8=;
        b=Z+erxero3Gu70swpKwsk4eGCmsBB4c20PiYicE6FyERCh0PcEP0dmPkdHeYkG4aXH3
         nLsttFADkha4j1v10DoT8/R1jMxiOtBEdM1wpAvNCyQ24bSWTT1OSwwu2OtaTn6zPEcZ
         064oD0uXOTaahZ444c+J9QndQ9jQXwqVT53Etz9gkbFot5OSdm7Rp1XZAXl7houePjG7
         XDcPSuHKL2x4iM0Okn4Aeuhi5F0boGDcYk/6iI2h18HU2xK7WsjtMgNr18qFi/hY2Zup
         6liXFDx4bkwWZBZVSPaldB+IdGfkcaWV2e/hAXw9Dvz44h5Inwa8HiHTMPuH1Hz/+xMd
         ljDw==
X-Forwarded-Encrypted: i=1; AL+hErHur6OivYeWmlqvaVoPvBNyOfkMHiPBIDErtNkcJ4GvD+N2FzTzOxnx3UUsK40v7yf57rwflOWSMoZAljo9EiU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8xx9MnkeBCvJc2Aivys6jeQ+fi+kVi8XPZ8bkD+2aqLL4njerL
	KnCGuSeiDYFE+1R9VkA3SFKa29NOjb95Z41rAJZagH9uBHx8Nr2dPvFJW9aXHArV7oSOZfBhmLr
	9EKw=
X-Gm-Gg: AZFdTZfcd/bCA4nb6qO93blHmzGrBZYnRaUS9Jb4UFZPf4l9NO6lYqmRPQBbp/wd8dO
	OVMjAhRZcrPbDN19cJcl8wJPPZdGmvNa3Bpjl4lZ+AzxsUGRcZZin0pePbSno2Pl+MYnU9bPSBe
	hcjPsmEE6LQgOutFebyDcfppW1S1IPYndJMabjvOcUkwq+Zx6xSkcWhdRQnaXJ8zyADIa4wz5kK
	V9bhdRwQ1UwW2/1yfxVlRHwYuCaIJnRyC3KEtM5itGCY6p8hnQAy98SGybDEf9Ciq45VLgfyrQS
	iAdHyyVUHEJM8yIzilojz78KhlxES/8+I20BCuZYAJunlQ1RQDqQ8aeqtJblxPLhzIouWWZhG4+
	sBMVwCCrQj8hFFbK1RZlGxlj8kTUXiNLYRl8s2kI0QaototviPWmPCUJ7qn/vJEJegug2Sn6+ye
	FwctIRHU++cLvuX2pkmce0Ofi3ez6BDj23WfOpqdKv/Oquirlin4VGGPqoHpOP0efNNUKLbjXBD
	n6KOze+T2t96RxiKNKeOrtUlFLaVRVF100BhlKNTudongVoBg840j8F0PL/v2i3zxRGYBcuelch
	KXIxkvjpT/3/RbXDvO2EjptKyuzhRapGc9dhB/qduNCs1tM+NIgXF2b4j61lSOqYSx6C
X-Received: by 2002:a05:7300:d186:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-3827fe78136mr207819eec.10.1794939817500;
        Tue, 17 Nov 2026 10:23:37 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3795378c2fesm45544467eec.1.2026.11.17.10.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 10:23:36 -0800 (PST)
Date: Tue, 17 Nov 2026 10:23:35 -0800
From: Brian Norris <briannorris@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: 'select' GENERIC_TRACER, not 'depends'
Message-ID: <avybp3O2zxcLozKB@google.com>
References: <20261116144652.1.Iecb63200dd245f62032a3b1f60ae78cc48868094@changeid>
 <sashiko-outbox-217828@kernel.org>
 <20261117085552.0e4ef272@gandalf.local.home>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117085552.0e4ef272@gandalf.local.home>

On Tue, Nov 17, 2026 at 08:55:52AM -0500, Steven Rostedt wrote:
> On Mon, 16 Nov 2026 22:58:01 +0000
> sashiko-bot@kernel.org wrote:
> 
> > [Severity: Low]
> > Should FTRACE_STARTUP_TEST depend on TRACING (or select TRACING) instead
> > of selecting GENERIC_TRACER?
> > 
> > GENERIC_TRACER is meant only for full tracer options so that
> > ENABLE_DEFAULT_TRACERS is hidden when a full tracer is enabled:
> > 
> > kernel/trace/Kconfig:
> >     # All tracer options should select GENERIC_TRACER. For those options that are
> >     # enabled by all tracers (context switch and event tracer) they select TRACING.
> >     ...
> >     config ENABLE_DEFAULT_TRACERS
> >     	bool "Trace process context switches and events"
> >     	depends on !GENERIC_TRACER
> >     	select TRACING
> > 
> > Because FTRACE_STARTUP_TEST is a test option rather than a tracer, having
> > it select GENERIC_TRACER disables and hides ENABLE_DEFAULT_TRACERS when no
> > full tracer is configured, and implicitly pulls in TRACING even when all
> > tracers are disabled.
> 
> Actually, the selftests should depend on TRACING and not GENERIC_TRACER. It
> may have been that the self tests were added before the trace events.
> 
> But it should not "select" a config. The selftest are only to be selected
> if there is something to test.

OK, I can respin with 'depends on TRACING'.

However, I think the Kconfig setup for kernel/trace/ is still a bit
haphazard. For example, it's reasonably common to want EVENT_TRACING but
not the more invasive tracing (like FUNCTION_TRACER; and therefore no
GENERIC_TRACER) -- this is how all Android kernels are built, for one.

But there's no user-configurable way to enable EVENT_TRACING. We only
get it implicitly if something else inadvertently selects 'FTRACE'
(which selects EVENT_TRACING). For Android, that's CONFIG_KPROBES and
CONFIG_HIST_TRIGGERS.

...or is that what ENABLE_DEFAULT_TRACERS is? Its name doesn't really
suggest that, and it's mutually exclusive witih many other tracers, so
it's a bit awkward making choices, as the whole system appears much less
orthogonal than expected.

Anyway, my point is that it's not exactly straightforward to enable the
features you want and get the tests you want.

I've appended a diff that seems a bit more user-friendly to me. It
makes it more explicit in the menu how event-tracing is forced-on by
many other tracers, but is user-configurable when it's not forced. I can
formally submit it (in 2 patches) if you'd like.

Brian

--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -198,6 +198,7 @@ config TRACING
 config GENERIC_TRACER
 	bool
 	select TRACING
+	select ENABLE_DEFAULT_TRACERS
 
 #
 # Minimum requirements an architecture has to meet for us to
@@ -595,7 +596,6 @@ config MMIOTRACE
 
 config ENABLE_DEFAULT_TRACERS
 	bool "Trace process context switches and events"
-	depends on !GENERIC_TRACER
 	select TRACING
 	help
 	  This tracer hooks to various trace points in the kernel,
@@ -1135,7 +1135,7 @@ config FTRACE_SELFTEST
 
 config FTRACE_STARTUP_TEST
 	bool "Perform a startup test on ftrace"
-	depends on GENERIC_TRACER
+	depends on TRACING
 	select FTRACE_SELFTEST
 	help
 	  This option performs a series of startup tests on ftrace. On bootup
