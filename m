Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616884;
	b=gRWSKRLNihUWQ5HNWgLj6wEskHBGiiK1u8pcudSpPQx+1j8lkKoaYcl/wpV0vl/YKqfG
	 e9YucY2+qtaAwJt/Jg8nuWLgXeIeqBxfLpt7Mm51i3bbuHN5kVg33KtDqczCPtibGP/Fw
	 xQY7V9fvRkaCTooE6d2K5JczhmWmlHzyQeY6HN9Goxc8zGVocTWOgFaaysjWne5yhOdCm
	 eAjPN0lRDB7Ct4OzOLnEMCW9EgYbSyo5UZe5hvvE3dth2WA97lX6OtjvIA9M8yPif7/sU
	 +qTxcvSAy473rSpXsFdZUjGhM1TNgOMcAW9ALDpoaL6GWDmpFZRviXyAslePfxH1quA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616884;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Spam-Status:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=UuGSEIer+lttMFzkYvmA6Ig4E8zspvMFk8zDOK8jpbI=;
	b=065yMoxjgc0jYW9TXLtNgv2AXZfbQIJh7+l07hsWzW8AHxqSw1+rWsi0xyzDEme8sSn9
	 hgidp/h/bqoTg8Y259j5nIN40BuNjuz0fxw14a8x2oWYlYYAE0cBrP6ow9l44ms0UDQw7
	 g5kFcEahI9kV1hV66DEkoAxD3tAFtNYCRs94HDjK+/mgYxDj9xT5nsPEDXR+rj308/llb
	 /AVRPt8vumJMOh2vCxUzBKOle26TZchAO3Q6IJCr4yO2k444FfxGqHjtg6HeuwkQoenUW
	 6f2Hbwb1SZJo/2MYDvIy6m7upkSU34nT0IsddlYKQ2X106YH3wwAJTErMTDmbG8r7nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=yIgvt3OF;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4D606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 14:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=yIgvt3OF
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 3912D160E73;
	Wed, 25 Nov 2026 14:28:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 984C920011;
	Wed, 25 Nov 2026 14:28:00 +0000 (UTC)
Date: Wed, 25 Nov 2026 09:27:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Avi Weiss" <thnkslprpt@gmail.com>,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Restore custom event creation selector
Message-ID: <20261125092759.687dca28@gandalf.local.home>
In-Reply-To: <sashiko-outbox-225150@kernel.org>
References: <20261120122837.1597798-2-thnkslprpt@gmail.com>
	<sashiko-outbox-225150@kernel.org>
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
X-Stat-Signature: hsriou9n5nzzrz69c1o8nxf15nughaoi
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 984C920011
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18GCb6sOnEXLcg7O4BgQEPhjk7yUFODuPc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=UuGSEIer+lttMFzkYvmA6Ig4E8zspvMFk8zDOK8jpbI=; b=yIgvt3OFezTSRGb4dLPKMEr/jR93/J+PZtLIwpV62pBRIN2Ily9WlPOv8d7HK5Hkdt7gbEol0D4OQGEwO03c5pm9WSW4C5NPPbsmiIk912Wu0bwpsFrDVv4VVOW340IiwNIE1tekrgG1xE1V+p7b0GoAIIVOG+IC8O3sThJ1nSw=
X-HE-Tag: 1795616880-628015
X-HE-Meta: U2FsdGVkX19FPi4j3ugQ3/6KHEYxSd5uEjSbIah0aDhpNuQc7baZ1OknyjnA3V2rKlc+vFWauGZ2eeGmt/w7mbnE7YUAgIKWUorVdLpsSdPe+fDX5PI6w5quy7qmUHb73WgQh9JDk5JQrFwwEqIDFbgNt9kwLqaTWuQc1nrAg1QceP75iESL1Lhd4KFif0eobw4Lan26/kWyLwQCC9tgJUW/93X0HbELTW8yyV4HjUqkxi/WXZzP85SwWJx+00MXt0pYhnHpqtUBM36cYFqZU6gygyAaJbwJ7fSyo9XUTc7TM7ZLtp5o4relcDZ15oGJ2tHZvIS8cdllH7tgmYsQkOU6OveNQNAb

On Fri, 20 Nov 2026 12:37:24 +0000
sashiko-bot@kernel.org wrote:

> [Severity: Medium]
> Does including a second custom event header under CREATE_CUSTOM_TRACE_EVENTS
> now fail to compile with a redefinition of str__custom__trace_system_name?
> 
> Each inclusion of include/trace/define_custom_trace.h includes
> include/trace/trace_custom_events.h, which sets TRACE_SYSTEM to custom and
> includes include/trace/stages/init.h:
> 
> include/trace/trace_custom_events.h:
> #undef TRACE_SYSTEM
> #define TRACE_SYSTEM custom
> 
> #ifndef TRACE_SYSTEM_VAR
> #define TRACE_SYSTEM_VAR TRACE_SYSTEM
> #endif
> 
> /* The init stage creates the system string and enum mappings */
> 
> #include "stages/init.h"
> 
> include/trace/stages/init.h then invokes TRACE_MAKE_SYSTEM_STR() to emit
> static const char str__custom__trace_system_name[] = "custom"; on every
> pass, because all custom event headers share the custom TRACE_SYSTEM and
> the definition is not guarded against multiple inclusions in the same
> translation unit.

So basically what Sashiko is saying, having two custom headers defined by
the same C file still will not work.

Have you tested your patch? Does it work with multiple custom header files?

-- Steve
