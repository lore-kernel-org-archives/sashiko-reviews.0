Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011077;
	b=iy/b9gv67UZR5/8iHzFzgLttZ/jl57li7IlqiVwG8V7T2kIk71uiPAEG1Poc8fno7UAy
	 98S6Sdeq1w44KRc4tAzMxO26rISBStmzGkmhk5yOBTRvXIUnb7rRb/0JCwbgYjum3DGHT
	 RFi0cRCgfOg7M9tlIPnNptINFHy4AzaRBi1BEsZFQcSK5OuQYQH46/XwYakHUtuVuM1NZ
	 1LsoCdFh7WYd1ph5gxj0ofvNbDmIuV6k49E0QJ5/FAv6jywWcPP4owFYwaSTNVVF7LWFv
	 7mazfy3JUnV9n7mGomNK2VskHx2O1i9ZzRiP3T7YyVVOIbI281vZyYqAHjDC2pfr7/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011077;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=ZIcVPPdd1ul3QLvQ9/6HmRta6O+OVRN79c1UOyY9zsc=;
	b=n4Pgq4xojyozkOZpWXpPj+g8I8ZlFQHTzmXMmHXpooP7cvGmWNCjDKMwnH6VQ/5/0nUO
	 swsuFINfwZnb9/pOV09jesCbVsPzdDl9TOL69pWxHUz0eqsDOvo+1f+eUZazcqQtvIZQF
	 vccTGo8Lw+Adj7EZYbkup9A7Ed0fpyQ6bNsHqHzDmvyCtqxMXicy4FxHGPaF9d0SxBccW
	 pJ26gyFUHGV97jzrFb03BrvQPAUroKzO+92cEjQQ79i3ujOFHqT0m87SSLtrrlqr7aPNF
	 lY/Bf4MW32IHogVfO/aSZqRQw6LQRplOLMFjPqTfyPGhWmJpMeIMNRla/AjweUOgFzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=w0ULYOG2;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450F60A2606
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 14:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0450F60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=w0ULYOG2
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 64CA0120777;
	Wed, 18 Nov 2026 14:11:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 958663B;
	Wed, 18 Nov 2026 14:11:12 +0000 (UTC)
Date: Wed, 18 Nov 2026 09:11:10 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: 'select' GENERIC_TRACER, not 'depends'
Message-ID: <20261118091110.4b7db7da@gandalf.local.home>
In-Reply-To: <undine-1794963487554690675-818c80e274af2040@undined.local>
References: <20261116144652.1.Iecb63200dd245f62032a3b1f60ae78cc48868094@changeid>
	<sashiko-outbox-217828@kernel.org>
	<20261117085552.0e4ef272@gandalf.local.home>
	<avybp3O2zxcLozKB@google.com>
	<20261117142203.72235895@gandalf.local.home>
	<20261117142310.4f440b3f@gandalf.local.home>
	<undine-1794963487554690675-818c80e274af2040@undined.local>
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
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 958663B
X-Stat-Signature: f59t838u8jo639pqxwbdu6n4f7e9kj5k
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18JpwyJ8CSB5WMkhwY9eikviK8wuaI1678=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=ZIcVPPdd1ul3QLvQ9/6HmRta6O+OVRN79c1UOyY9zsc=; b=w0ULYOG2ZIX1Km3FvFSzv9++ZoZ07iw3qKJtjXfp8AYm2GrJiVzsI7kd5r9qJhKjfnXtFASV2vGRc2r/VRgS2qA0NAzoJETQZF05sPyuYiWpzoqR7m0dIooTTGs2Mg9thzMRR7OG7X6ZXqxgKGdojfv2wQ/dS7PsuF0UrP48Mvo=
X-HE-Tag: 1795011072-286018
X-HE-Meta: U2FsdGVkX19GDo1ZgRRKfMiS3Bqso7z/WGEq8EdpWz4UApNb7io3eAkJr9ojEgBck8G9g/XWGOxM/61rFGTXFM1RaevEy9s4SMBnoQRhQpzn1wJRVWRao5Q6/w6Mxmtd1RZEjMcbvzvi1qMT3IvJ9ZQkLop/Io+laoeVeg7p1uH+Wllp3oLzK9noKpEvxBWtCsya+RjoTPUmKHgCUZSLVhRzEwsMx3Y40wwPAw/ZaylzYX7fThGEIwaLulKHB3WoHn0QKldgfV4jQWFJ5kNQHzQh8dyZuuMCslSEnFXAPb39j33jIhO5h1nLU35bFhgFgagFBR9yaRU5tkHcB4uEIAS1pVExvUoNlRpAQybwVEaAJeR+3JN7w0M5I1I0uo7VKHCwgyXZA8pyCYUTvJYV/Q==

On Wed, 18 Nov 2026 09:58:07 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> On Tue, 17 Nov 2026 14:23:10 -0500, Steven Rostedt <rostedt@goodmis.org> wrote:
> > On Tue, 17 Nov 2026 14:22:03 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > 
> > As it doesn't need to be visible let's still have:
> > 
> >   
> > > config ENABLE_EVENTS
> > > 	bool "Enable trace events"  
> > 	depends on !GENERIC_TRACER
> > 	select TRACING  
> 
> I don't like these changes. I think TRACING should be kept "depends on"
> for this.
> 
> If a proper hierarchical structure of dependencies is in place,
> visibility may seem unimportant. (especially, "!GENERIC_TRACER" may
> just hide the option instead of indicating "Trace events are enabled")

The GENERIC_TRACER meant everything but the "nop" tracer.

That is, everything in the available_tracers:

 ~# cat /sys/kernel/tracing/available_tracers 
timerlat osnoise hwlat blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup preemptirqsoff preemptoff irqsoff function


> 
> FTRACE ("Tracing" menu)
>  L_ FUNCTION_TRACER
>  |   L_ FUNCTION_TRACER_SELFTESTS
>  |   L_ FUNCTION_GRAPH_TRACER
>  |   ...
>  L_ TRACE_EVENTS (can be hidden)
>  |   L_ SYSCALL_EVENTS
>  |   L_ KPROBE_EVENTS
>  |   L_ HIST_TRIGGERS
>  |   ...
>  L_ GENERIC_TRACER
>  |   L_ IRQSOFF_TRACER
>  |   L_ SYSCALL_TRACER (selects TRACE_EVENTS and SYSCALL_EVENTS)
>  L_ TRACE_OPTIONS(can be hidden)
>      L_ SNAPSHOT
>      L_ ...
>      L_ 
> 
> Maybe something like above?

It would be:

  FTRACE
   L_ GENERIC_TRACER
   |   L_ FUNCTION_TRACER
   |   L_ FUNCTION_GRAPH_TRACER
   |   L_ PREEMPTIRQSOFF_TRACER
   |   L_ HWLAT_TRACER
   |   L_ OSNOISE_TRACER
   |   L_ MMIO_TRACER
   |   [..]
   |
   L_ TRACE_EVENTS
       L_ SYSCALL_EVENTS
       L_ KPROBE_EVENTS
       L_ HIST_TRIGGERS


As the Generic tracers always enable trace events, but the trace events do
not enable the tracers.

I think we can start to separate ftrace and fgraph from the tracers too,
but that will take more than just modifying the config files. That is,
ftrace is the function hook mechanism and and fgraph is the return side.
Neither are dependent on the tracers, but the tracers are dependent on them.

-- Steve
