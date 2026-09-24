Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B27489863
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256595; cv=none; b=UgA59XiEs+g1aT7Cdg9W7uq1DIjZ1mvRzLyV45Axz1cuujb2t7L5i3PMqoLZ2rIgsW2yx/Noh+djQ0vZ/uS6y+gMOJbRE4gXXcf1rhYL/n/46OV+YRSbM9HXJaz6HjAJXTLU+pB7GUISEuvqpYWqW01YNff2nfdAKq44H9MSdac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256595; c=relaxed/simple;
	bh=b6+s+j2E+PamgZmztaZFx+a2tmmlK+zV8zH9cUia+64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyJVM5/CdqzJWfX7/uqtKUfLi9NmPStZn6ZpTTil2FCj8jMCWStGYI71AiO1RWi9kXN8jEdzPwSgK/WZTNmQzcBih/VnXeCSCEQk6ZH4bwcNoaHVkGo6Z5x0Bryym6sTsfY7UHTw0oWAV3sQ/msNG1sgC/eZbRB6y2ofzBQ/Ab0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWX5mUBE; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWX5mUBE"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so1574810f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790256581; x=1790861381; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LQQKLzXJaAQsQHa2KS7tADnjrxkQ8I/GwCwJ8DG8zts=;
        b=PWX5mUBEK3TK4WcEnU3PG4yu3k3gtnIyBcwPGg2PuzsH7XYzN/VC5zP8P418CG8Y/Y
         fcl3aaOzpdBERTfTYjt7Yj0XyQm0I29Grm0VMxxnlEnFocfYQg0matkqkmAHDS6eWGoR
         tV8N3eJNPxf6T27374PupCB5dwEKpv93KM339u0zw1orGL4EtM/RZWv2gfeojqAS5aKo
         XUJPu15ezRUv09SQIpMBgg8oonwSAutl6dqx778h0ApT1J/uBltuS2dHuZM6i8GQ8nK4
         Q879fve480zYWM0zoodJ2/CxKzi9Y7BS4iSmKXuz5p5xeMOtxgHNmk74/Ue/3/eHVof1
         pjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256581; x=1790861381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LQQKLzXJaAQsQHa2KS7tADnjrxkQ8I/GwCwJ8DG8zts=;
        b=YPqoICB09gkA+k2pnimBozH4ssHvT3X1vvHpKTvJAsEdZcEZePDifQ8G38+1LO0s0B
         HdcErFH3YhEp8KqZk7akniuYO4qRJNinOPZGe6x5XSi4UIY5L9Q4z7T5SyoO8+TJVY/g
         vnXYkRQ59Qex3EChvHOhKx96ddKuj23+SExjOe40qLv+i/OmMGdGOEjNlhy+q+T6Q6Oc
         I1wHZZi5EfD/GQHn09R00rjQXxGsqNWuiTXYulZAjyZEc0futJLBnT0WX+sdKMtFp6jk
         cto+B/bzTraWkxjHQNbkkc3Wo9txJlmYTdmARNwOdnAkOE1HYeaIIE4ad+x3FtNSsUpw
         PiHw==
X-Gm-Message-State: AFuF++leKA++SeRmyBX2l92e8Fyq1nXbE6op5b8fQPYrvMB638t2UYji
	T0gGY96YZeX0RgfSLxRh1RGKMBhgLxH0wn4IlM/EJ6Bw40LhL7TAKzdpDM5B2384AP0nbSGOTzE
	6SJj76A==
X-Gm-Gg: AYBFou3q4is4Yf4iiwRqhQhiTwyIVHfowwzg3eNcKvoeZT9BdYBZ1NK8sLJEnFjzAds
	BDmeMKoGlEyKGWYdfIGxFx9xuHpvQXzui4NiItmE2GY+N+qw3jtTOwoJA0ff9P9Vk1aTQe9+Y+M
	hhA772YAoaWI3Y2xZl4nba+Tce58qR69bU+XIL1jhwGEsXa1FY7JRZGlVFp5EahuULvOO9/LPc6
	EDHjNnKzkR2rFxLdfejItdge7pTRNQmwk6++RI+4ZqyiRpY2QyB6tgzFp9h1DrX4m/ycZo3vSuS
	3w0ml6lNnOlrRO4i/nlm/tz3qjkPF4FiDCFCc/eJTx9uSZbSbdXGwGVldu2aj8VMaMJ4XC7ThFm
	O51f+R3UquwrRv+gyFoo+AbfMuMOjZ/9KvSrW8ltgtjvzQRkI1jkA4HbO8ZdO4DwGiHYY48oFQH
	k7o2+Fs1CbSeHxVQuYYjv515aSWxpAZmAl3G7UrErZiGS/96o9dRnfUfcPir8ob/BxZVpt8UKK0
	N27J/zMiznZuONv0gwdyNYgNiCwbO5FBHeH2JPQ5C0=
X-Received: by 2002:a05:6000:2512:b0:487:da0:df33 with SMTP id ffacd0b85a97d-488716b7498mr3963942f8f.3.1790256580199;
        Thu, 24 Sep 2026 06:29:40 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684862a3sm13572566f8f.7.2026.09.24.06.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:29:39 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:29:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 16/18] tracing/remotes: Add trace_remote cmdline
 options
Message-ID: <arUlwHtTyvlMDxUP@google.com>
References: <20260817135517.3919534-1-vdonnefort@google.com>
 <20260817135517.3919534-17-vdonnefort@google.com>
 <20260817141252.4FD471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817141252.4FD471F00A3A@smtp.kernel.org>

On Mon, Aug 17, 2026 at 02:12:51PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `dump_on_panic` command-line option sets `remote->panic_on = true` but fails to dynamically register the panic handler if the trace buffer is already loaded.
> --
> 
> --- Patch [16]: [PATCH v6 16/18] tracing/remotes: Add trace_remote cmdline options ---
> commit 16551de261e3bdeffe51c1a5227c6a115ddbe725
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: Add trace_remote cmdline options
>     
> This commit introduces command-line options for trace remotes, allowing
> configuration of features like dump_on_panic, dmesg, buf_size, and poll,
> as well as enabling specific trace events automatically on boot.
> 
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > index 204d5bef7a8c4..34847463d9e43 100644
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> 
> [ ... ]
> 
> > @@ -1170,6 +1172,126 @@ static int poll_ms_show(struct seq_file *s, void *unused)
> > +static void trace_remote_apply_cmdline_opts(struct trace_remote *remote, char *cmdline)
> > +{
> > +	bool dmesg_on = false;
> > +	char *opt;
> > +	int ret;
> > +
> > +	while ((opt = strsep(&cmdline, "^"))) {
> > +		if (!*opt)
> > +			continue;
> > +
> > +		if (!strcmp(opt, "dump_on_panic")) {
> > +			remote->panic_on = true;
> 
> [Severity: Medium]
> If the trace remote was configured across multiple command line arguments, and
> an earlier argument already enabled events (which loads the trace buffer via
> trace_remote_enable_tracing()), will setting remote->panic_on = true here
> fail to register the panic notifier?
> 
> Since this doesn't call trace_remote_panic_load() if the buffer is already
> loaded, it appears the panic handler might never be registered under this
> configuration pattern.

Interesting. I will fix that

> 
> > +		} else if (!strcmp(opt, "dmesg")) {
> > +			dmesg_on = true;
> > +		} else if (!strncmp(opt, "buf_size=", 9)) {
> > +			/* buf_size can only be applied if the buffer is unloaded */
> > +			if (trace_remote_loaded(remote))
> > +				pr_warn("Cannot apply buf_size after events are enabled\n");
> > +			else
> > +				remote->trace_buffer_size = memparse(opt + 9, NULL);
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817135517.3919534-1-vdonnefort@google.com?part=16

-- 
Vincent
