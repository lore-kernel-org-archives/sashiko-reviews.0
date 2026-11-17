Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947757;
	b=r2G+CDlgK89SYTMA4eMttUrF5JRFRsgmzX0sWzJ35O8XeQj/s4Y62oPTRjOjidUx+1m+
	 diIgrPWlHBAJFDPvv81FEhCM6BePrnpgTqdmffvWxaRsYP98LN9Sg5MMErRqjfx3Al3x6
	 XVIFDWsA1UjwTmcZXVRbegdHSIZ/XiyIya49wTUgzx+wiIUjo+HkHJX7a3nTU7DebIb7h
	 wdcyB1f7vmlRIyRCdY8uXhGuHZOI09oE6PyzbrjNRDTg2J1jtQdRgoz5fTQQijVSM4e4e
	 J7E2Dj6HmpVQ8sP1LnWwVG/odXLwHZvpWI/on3mLn11HuWnL7qh0/Y9YYnYSFfbbt1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qU/707wsLwghguzg9u1/2onlRZx6ZVh35wJOTps23pA=;
	b=02zy5swBCCfrsaif/IQI9P0XHEup9WS4QmtONtRaWeEK5Qql752qGb84D2y4Dc5Yiw6S
	 icOj0mipfUHAzLKepZ/RKKhFwQXGSJ/j7vz+W5hm5qrUCZIcNedm6XcJz8vO8zpe+PmWz
	 o8XxzG9+8N4e0y2lVXBI/VqRXr4ji6bN7Pht2v5wCLwMHDaKMo8qA06A0K9Aj1aKyGggg
	 qCxw+RMlJroh0UGbKH4fbHBBLFPsaEsZkoQ32OwhVXZr5UnRSLoBepNo1Qkr4vLSgltsN
	 JCKS7rIvWQYTB4ITdlNxLgElfOpzRLjvOY4LrLXgJowWShLM+g7fuocg2adBjPXSuZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NOxXwOu0;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA438606A32A
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 20:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA438606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NOxXwOu0
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-862b3938d98so97654a34.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 12:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794947755; x=1795552555; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qU/707wsLwghguzg9u1/2onlRZx6ZVh35wJOTps23pA=;
        b=NOxXwOu0+aOQxTE2Q6EzG9Me/ROYbnWno52lRKAXDm1vIfdc8nOFKeTSkUgw4P44GT
         rD+u+PDkJV0BqtagCcsNJ0zv52yv7Ric1mKJoa63X9Nra/kZ07bUOudVq5N/G0Udg4vL
         3DctNrcuvKGVwp55dRn6h2zudPwmvSjDSPEUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947755; x=1795552555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU/707wsLwghguzg9u1/2onlRZx6ZVh35wJOTps23pA=;
        b=1Bpvi4ngfGowloSa7V43/4dGWQGdQhkipAnTaZX+j88Bj0spLsXMckJkw+CbkDLmgY
         S5tw7RS+pSzF6whsAyuLrZph6Fg7vD/W/LbyXSA/u1STl1laHSmmAqyedK6b+thmvVhV
         ZgWmU7Wg9ytqlvAYdP4uES1aH3THSVfziNt8xRllSjg8kPxu+sXd9Vs9Z5xlNve2qO8U
         7Y0GhwZ3K1RfZQ8oXql2lYWl+DUNkNQVUSoDVvoQiLoGHuiBcpPNkKZTFC1T+QUjgNY5
         cpLLa8nPbRb8WieTuQk2yqQV5j333hqCjkxt4twyN4R2ns3uhV7akpSKpPQNcT1w2dqc
         aEeQ==
X-Forwarded-Encrypted: i=1; AL+hErE9ULd637AkJPxWVelWmqb/V8iya2BNrS56oTPMduH42Bcfanqwt3mfRHTC/t+P00osB32jt8eXmZ9gRQLeuSA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+RWBv5O4nH9DDo7BRfyVSWDEq7JG6+IlljCO7MBggijrIWJjDz
	7lPG3fAFLTULGLUhwjC+i3tdOJNRP1ZCtnSc7DSatxsxDvV4dUlLMIH5SrPM0VsIZHaB+1xzaD1
	rVC4=
X-Gm-Gg: AYBFou23PQ11+pWdEIOXbqyZDPnOvsFOawcFesvs7Fpw8/nJL9rDFtwhlnK5SEwYTOI
	dHOeY/cG8cvdWfcPgTmJtpS8NtsBaM+C566bX1OUKix6kHfVoGl+Pl6+Z2s4HfMseds3g9QHNPs
	uFGNswjnpJdz1jU0BXhDp/yk/AOKeQDAzXXLYziDO2E+UVYvDg0MGqtaKOQlwBv2Ngoutw/nfeM
	G6HRuGggVsuKfpf1vQM+WgOXWIABoILmHcZJzruDo1to0w5VGszLsKIOw4l/QmTANqcWQ5SChrK
	7b4R6Imi0aIGtu7OZ7JI7fw42ZJqs9aAJdHkUaB/SnaK9ZbX6wB38YCEKAH0l7aZlrnP5sQ19e4
	/0ex9pMQfFYGXmBDIXwVt6HCEZ5/NVKbePj+kvbTdEgTOr2vGrqeRFzpflca8RuqDnGxJx7HATg
	+S4xYJZnmjwM5h6z5t2t2BtlqsQ8s29NAze3RpAZ6ecNiJDYoDz3rWeggfeCyy6uamqArq2zbm4
	FOxhXoBj1T38glNKAdjZYa3iGphuWAubszVvOBii+J18o51IcGaTheGtKMNIuiYS20M1QmxMEz4
	q9gce0CPl98zJM0IjdlUZxjG5hwPindg7jOimvQc5MyDgYY14FRWUm/ebZtNc4VAPjHz
X-Received: by 2002:a05:7022:2205:b0:1b3:a9c0:6a3e with SMTP id a92af1059eb24-1b543c26e95mr931425c88.29.1794947744502;
        Tue, 17 Nov 2026 12:35:44 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-382a63059e3sm651691eec.5.2026.11.17.12.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:35:43 -0800 (PST)
Date: Tue, 17 Nov 2026 12:35:41 -0800
From: Brian Norris <briannorris@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: 'select' GENERIC_TRACER, not 'depends'
Message-ID: <avy6nTb0ccqNNnOo@google.com>
References: <20261116144652.1.Iecb63200dd245f62032a3b1f60ae78cc48868094@changeid>
 <sashiko-outbox-217828@kernel.org>
 <20261117085552.0e4ef272@gandalf.local.home>
 <avybp3O2zxcLozKB@google.com>
 <20261117142203.72235895@gandalf.local.home>
 <20261117142310.4f440b3f@gandalf.local.home>
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
In-Reply-To: <20261117142310.4f440b3f@gandalf.local.home>

On Tue, Nov 17, 2026 at 02:23:10PM -0500, Steven Rostedt wrote:
> On Tue, 17 Nov 2026 14:22:03 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> As it doesn't need to be visible let's still have:

What's wrong with visible? Hiding it is part of the confusion, because
it disappears when you select something else, even though it's still
effectively enabled.

Personally, I think it would be nicer if we could eliminate the separate
ENABLE_DEFAULT_TRACERS (or ENABLE_EVENTS or whatever you want to call
it) and make CONFIG_EVENT_TRACING:

1) user-configurable and
2) 'select'ed (or otherwise forced to =y) when something else truly
   requires it

That would make it clearer what's happening, IMO.

But I'm not sure off the top of my head what the best way to do that in
Kconfig is, without introducing odd circular dependencies or other
issues, and I also don't know how much more time I want to spend on it.

I'm open to ideas, or I'll let it sit/marinate until I have more time.

Brian

> 
> > config ENABLE_EVENTS
> > 	bool "Enable trace events"
> 	depends on !GENERIC_TRACER
> 	select TRACING
> > 	help
> > 	 Select this to enable trace events through out the kernel such as
> > 	 scheduling, irq, kmalloc that can record to the tracefs ring
> > 	 buffer data from within the subsystems the events exist in.
> 
> 
> -- Steve
